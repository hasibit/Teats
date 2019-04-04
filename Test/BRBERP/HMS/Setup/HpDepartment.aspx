<%@ Page Title="" Language="C#" MasterPageFile="~/HMS/MP/HmsAdmin.Master" AutoEventWireup="true" CodeBehind="HpDepartment.aspx.cs" Inherits="BRBERP.HMS.Setup.HpDepartment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">

    <div class="card">
        <div class="card-header">
            <h3>Department</h3>
        </div>
        <div class="col-lg-12">
            <div class="row">
                <div class="col-md-4 offset-8">
                    <input type="button" class="btn btn-primary addButton" data-toggle="modal" data-target="#myModalAdd" name="btnAdd" id="btnAdd" value="Add New Department" />
                </div>
            </div>
        </div>
    </div>

    <%--DataTable--%>

    <div class="card">
        <div class="card-header">
            <h3>Department List</h3>
        </div>
        <div class="card-body">
            <table id="data_table" class="table">
                <thead>
                    <tr>
                        <th>DepartmentID</th>
                        <th>DepartmentName</th>
                        <th>Status</th>
                        <th>Action</th>
                        <th>Action</th>
                        <th>&nbsp;</th>
                    </tr>
                </thead>

                <tbody>
                    <% for (var data = 0; data < dt.Rows.Count; data++)
                       { %>
                    <tr class="gradeA odd" role="row">
                        <td class="sorting_1"><%=dt.Rows[data]["DepartmentID"]%></td>
                        <td><%=dt.Rows[data]["DepartmentName"]%></td>
                        <td><%=dt.Rows[data]["Status"]%></td>
                        <td>

                            <input type="button" class="btn btn-primary editButton" data-id="<%=dt.Rows[data]["DepartmentID"] %>" data-toggle="modal" data-target="#myModalAdd" name="submitButton" id="btnEdit" value="Edit" />
                        </td>
                        <td>
                            <input type="button" class="btn btn-primary deleteButton" data-id="<%=dt.Rows[data]["DepartmentID"] %>" data-toggle="modal" data-target="#myModalAdd" name="submitButton" id="btnDelete" value="Delete" />

                        </td>
                        <td></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
    


    <%--For Modal Popup Add--%>

    <div class="modal fade mt-0 mb-0" id="myModalAdd" tabindex="-1" role="dialog" aria-labelledby="fullwindowModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="fullwindowModalLabel">User Information</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <div class="panel-body">
                        <div class="row">
                            <div class="form-group col-lg-8">
                                <label>Department Name</label>(*)
                                        <input type="text" name="DeptName" id="DeptName" class="form-control" required="required" />
                            </div>
                            <br />

                            <div class="form-group col-lg-6">
                                <label>Status</label>(*)<br />
                                <label class="radio-inline">
                                    <input type="radio" checked="" value="A" id="Active" name="Active" />
                                    Active
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" value="I" id="Inactive" name="Inactive" />
                                    Inactive
                                </label>
                            </div>

                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" class="close">Close</button>
                    <button type="button" class="btn btn-primary" name="submitButton" id="btnSave" style="display: block">Save</button>
                    <button type="button" class="btn btn-primary" name="submitButton" id="btnUpdate" style="display: none;">Update</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">

    <%--For Modal Popup--%>
    <script type="text/javascript">
        $(function () {
            //$(document).ready(function () {
            //    getDetails();
            //});

            $("#btnSave").click(function () {

                $("#btnSave").show();
                $("#btnUpdate").hide();

                if ($('#btnSave').closest('form')[0].checkValidity()) {

                    var objadd = {};
                    objadd.DepartmentName = $("#DeptName").val();
                    objadd.Status = $("#Active").val();
                    objadd.CreateDate = new Date();
                    $.ajax({
                        type: "POST",
                        url: "HpDepartment.aspx/SaveData",
                        data: '{objAdd: ' + JSON.stringify(objadd) + '}',
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function () {
                            if (confirm("Are you sure you want to change !") == true) {

                                alert("Data Saved successfully");

                                $('#myModalAdd').modal('hide');
                            } else {
                                alert("User has been added successfully.");
                            }
                            getDetails();
                        },
                        error: function () {
                            alert("You have canceled the changes");
                        }
                    });
                }
                else {
                    alert("Please fill up (*) fields.");
                }
                return false;

            });

            $("#myModalAdd").on("hidden.bs.modal", function () {
                $("#btnSave").show();
                $("#btnUpdate").hide();
            });

            function getDetails() {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "HpDepartment.aspx/GetData",
                    data: {},
                    dataType: "json",
                    success: function (data) {
                        $('#data_Tables tbody').remove();
                        //console.log(data.d);
                        for (var i = 0; i < data.d.length; i++) {
                            $("#data_Tables").append(
                                "<tr><td>" + data.d[i].DepartmentID + "</td><td>" + data.d[i].DepartmentName + "</td>" +
                                "<td>" + data.d[i].Status + "</td>" +
                                "<td>" + "<input type='button' class='btn btn-primary editButton' data-id='" + data.d[i].DepartmentID + "' data-toggle='modal' data-target='#myModal' name='submitButton' id='btnEdit' value='Edit' />" + "</td>" +
                                "<td><input type='button' class='btn btn-primary deleteButton' data-id='" + data.d[i].DepartmentID + "' name='submitButton' id='btnDelete' value='Delete'/> </td><td></td></tr>");
                        }
                    },
                    error: function () {
                        alert("Error while Showing update data");
                    }
                });
            }

            $(document).on("click", ".deleteButton", function () {
                var id = $(this).attr("data-id");
                $.ajax({
                    type: "Post",
                    contentType: "application/json; charset=utf-8",
                    url: "HpDepartment.aspx/Remove",
                    data: '{id: ' + id + '}',
                    dataType: "json",
                    success: function () {
                        if (confirm("Are you sure you want to delete !") == true) {
                            alert("Data Deleted successfully");
                        } else {
                            alert("You have canceled the changes");
                        }
                        //alert("Data Updated successfully");
                        getDetails();
                    },
                    error: function (data) {
                        alert("Error while Updating data of :" + id);
                    }
                });


            });
            $(document).on("click", ".editButton", function () {

                $("#btnSave").hide();
                $("#btnUpdate").show();

                $('#myModalAdd').modal('show');
                var id = $(this).attr("data-id");
                console.log(id);
                $("#btnUpdate").attr("edit-id", id);
                //alert(id);  //getting the row id 
                $.ajax({
                    type: "Post",
                    contentType: "application/json; charset=utf-8",
                    url: "HpDepartment.aspx/EditData",
                    data: '{id: ' + id + '}',
                    dataType: "json",
                    success: function (data) {
                        var empDetails = $.parseJSON(data.d);
                        $.each(empDetails,
                            function (index, value) {
                                //console.log(v.Fname);
                                $("#DeptName").val(value.DepartmentName);
                                $("#Active").val(value.Status);
                            });
                        //$("#FirstName1").val(empDetails.Fname);
                        //$("#LastName1").val(empDetails.Lname);
                        //empDetails.Fname;
                        //console.log(empDetails.Fname);
                    },
                    error: function () {
                        alert("Error while retrieving data of :" + id);
                    }
                });
            });

            $("#btnUpdate").click(function () {
                if ($('#btnSave').closest('form')[0].checkValidity()) {
                    var id = $(this).attr("edit-id");
                    var objUpd = {};
                    objUpd.DepartmentName = $("#DeptName").val();
                    objUpd.Status = $("#Active").val();
                    objUpd.UpdateDate = new Date();
                    $.ajax({
                        type: "Post",
                        contentType: "application/json; charset=utf-8",
                        url: "HpDepartment.aspx/UpdateData",
                        data: '{objUpd: ' + JSON.stringify(objUpd) + ', id : ' + id + '}',
                        //JSON.stringify({ objEmployee: user, eid: id }),
                        //'{objEmployee: ' + JSON.stringify(user) + ', eid : + ' + id + '}',
                        dataType: "json",
                        success: function (data) {
                            if (confirm("Are you sure you want to change !") == true) {

                                $("#btnSave").show();
                                $("#btnUpdate").hide();

                                alert("Data Updated successfully");

                                $('#myModalAdd').modal('hide');
                            } else {
                                alert("You have canceled the changes");
                            }
                            //alert("Data Updated successfully");
                            getDetails();
                        },
                        error: function (data) {
                            alert("Error while Updating data of :" + id);
                        }
                    });
                } else {
                    alert("Please fill up (*) fields.");
                }
            });

        });

    </script>

</asp:Content>
