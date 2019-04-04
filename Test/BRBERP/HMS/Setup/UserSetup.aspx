<%@ Page Title="" Language="C#" MasterPageFile="~/HMS/MP/HmsAdmin.Master" AutoEventWireup="true" CodeBehind="UserSetup.aspx.cs" Inherits="BRBERP.HMS.Setup.UserSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">

    <div class="card">
        <div class="card-header">
            <h3>New Joining Form</h3>
        </div>
        <div class="col-lg-12">

            <div class="row">
                <div class="col-md-3 offset-9">
                    <input type="button" class="btn btn-primary addButton" data-toggle="modal" data-target="#myModalAdd" name="btnAdd" id="btnAdd" value="Add New User" />
                </div>
            </div>
        </div>

        <%--DataTable--%>
        <div class="col-lg-12">

            <%--DataTable--%>
            <div class="card">
                <div class="card-header">
                    <h3>Data Table</h3>
                </div>
                <div class="card-body">
                    <table id="data_table" class="table">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email Id</th>
                                <th>Mobile(H)</th>
                                <th>Telephone</th>
                                <th>Birth Date</th>
                                <th>Birth Date</th>
                                <th>Action</th>
                                <th>Action</th>
                                <th></th>
                                <%--<th class="nosort">Action</th>--%>
                            </tr>
                        </thead>

                        <tbody>
                            <% for (var data = 0; data < dt.Rows.Count; data++)
                               { %>
                            <tr class="gradeA odd" role="row">
                                <td class="sorting_1"><%=dt.Rows[data]["FName"]%>  <%=dt.Rows[data]["LName"]%></td>
                                <td><%=dt.Rows[data]["EMail"]%></td>
                                <td><%=dt.Rows[data]["Telephone"]%></td>
                                <td><%=dt.Rows[data]["Mobile"]%></td>
                                <td><%=dt.Rows[data]["DOJ"]%></td>
                                <td><%=dt.Rows[data]["DOB"]%></td>
                                <td>
                                    <input type="button" class="btn btn-primary editButton" data-id="<%=dt.Rows[data]["EmpId"] %>" data-toggle="modal" data-target="#myModal" name="submitButton" id="btnEdit" value="Edit" /></td>
                                <td>
                                    <input type="button" class="btn btn-primary deleteButton" data-id="<%=dt.Rows[data]["EmpId"] %>" name="submitButton" id="btnDelete" value="Delete" /></td>
                                <td></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>



    <%--For Modal Popup Add--%>

    <div class="modal fade full-window-modal" id="myModalAdd" tabindex="-1" role="dialog" aria-labelledby="fullwindowModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="fullwindowModalLabel">User Information</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <div class="panel-body">
                        <div class="row">
                            <div class="form-group col-lg-4">
                                <label>First Name</label>(*)
                                        <input type="text" name="FirstName" id="FirstName" class="form-control" required="required" />
                            </div>

                            <div class="form-group col-lg-4">
                                <label>Middle Name</label>(*)
                                        <input type="text" name="MiddleName" id="MiddleName" class="form-control" placeholder="Kumar" required="required" />
                            </div>
                            <div class="form-group col-lg-4 ">
                                <label>Surname</label>(*)
                                        <input type="text" name="Surname" id="Surname" class="form-control" placeholder="Gupta" required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-4">
                                <label>Gender</label>(*)
                                        <label class="radio-inline">
                                            <input type="radio" checked="" value="Male" id="Male" name="Gender" />
                                            Male

                                        </label>
                                <label class="radio-inline">
                                    <input type="radio" value="Female" id="Female" name="Gender" />
                                    Female.
                                </label>
                            </div>

                            <div class="clearfix"></div>
                            <div class="form-group col-lg-4">
                                <label>Email ID</label>
                                <input type="email" name="EmailId" id="EmailId" class="form-control" placeholder="abc@someone.com" required="" />
                            </div>
                            <div class="form-group col-lg-4">
                                <label>Date of Birth </label>
                                <input type="date" name="Dob" id="Dob" min="1920-01-02" class="form-control datepicker" required="" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-4">
                                <label>MaritalStatus</label>
                                <select name="MaritalStatus" id="MaritalStatus" class="form-control" required="">
                                    <option value="" disabled="disabled">-- Select -- </option>
                                    <option value="Single">Single</option>
                                    <option value="Married">Married</option>
                                </select>
                            </div>

                            <div class="form-group col-lg-4">
                                <label>Hobbies</label>
                                <input type="text" name="Hobbies" id="Hobbies" class="form-control" placeholder="Football, Cricket etc." />
                            </div>

                            <div class="form-group col-lg-4">
                                <label>Home Telephone</label>
                                <input type="text" name="TelephoneNo" id="TelephoneNo" class="form-control" placeholder="1234567890" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-4">
                                <label>Mobile</label>
                                <input type="tel" name="MobileNo" id="MobileNo" class="form-control" required="" placeholder="0987654321" />
                            </div>
                            <div class="form-group col-lg-4">
                                <label>Residential Address</label>
                                <textarea rows="2" name="ResidentialAddress" id="ResidentialAddress" class="form-control" required=""></textarea>
                            </div>

                            <div class="form-group col-lg-4 ">
                                <label>Pin Code</label>
                                <input type="text" name="PinCode" id="PinCode" class="form-control" placeholder="999999" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-lg-4">
                                <label>State</label>
                                <select name="State" id="State" class="form-control" required="">
                                    <option value="" disabled="disabled">-- Select -- </option>
                                    <option value="Maharashtra">Maharastra</option>
                                    <option value="Bihar">Bihar</option>
                                    <option value="Delhi">UP</option>
                                    <option value="Odisha">Odisha</option>
                                    <option value="Odisha">AP</option>
                                </select>
                            </div>
                            <div class="form-group col-lg-4">
                                <label>Nationality</label>
                                <input type="text" name="title" id="Nationality" class="form-control" placeholder="Indian" required="" />
                            </div>
                            <div class="form-group col-lg-4">
                                <label>Date of Joining</label>
                                <input type="date" name="Doj" id="Doj" class="form-control datepicker" required="" />
                            </div>
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



    <%--For Modal Popup Edit--%>
    <%--<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="myModal">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h2 class="modal-title" id="myModalLabel">Modal title</h2>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="form-group col-lg-4">
                                        <label>First Name</label>
                                        <input type="text" name="FirstName" id="FirstName1" class="form-control" placeholder="Ajay" required="" />
                                    </div>

                                    <div class="form-group col-lg-4">
                                        <label>Middle Name</label>
                                        <input type="text" name="MiddleName" id="MiddleName1" class="form-control" placeholder="Kumar" required="" />
                                    </div>
                                    <div class="form-group col-lg-4 ">
                                        <label>Surname</label>
                                        <input type="text" name="Surname" id="Surname1" class="form-control" placeholder="Gupta" required="" />
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="row">
                                    <div class="form-group col-lg-4">
                                        <label>Gender</label>
                                        <label class="radio-inline">
                                            <input type="radio" checked="" value="Male" id="Male1" name="Gender" />
                                            Male

                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" value="Female" id="Female1" name="Gender" />
                                            Female.
                                        </label>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="form-group col-lg-6">
                                        <label>Email ID</label>
                                        <input type="email" readonly="readonly" name="EmailId" id="EmailId1" class="form-control" placeholder="abc@someone.com" required="" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-lg-6">
                                        <label>Date of Birth </label>
                                        <input type="date" name="Dob" id="Dob1" min="1920-01-02" class="form-control datepicker" required="" />
                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label>MaritalStatus</label>
                                        <select name="MaritalStatus" id="MaritalStatus1" class="form-control" required="">
                                            <option value="" disabled="disabled">-- Select -- </option>
                                            <option value="Single">Single</option>
                                            <option value="Married">Married</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label>Hobbies</label>
                                        <input type="text" name="Hobbies" id="Hobbies1" class="form-control" placeholder="Football, Cricket etc." />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-lg-6">
                                        <label>Home Telephone</label>
                                        <input type="text" name="TelephoneNo" id="TelephoneNo1" class="form-control" placeholder="1234567890" />
                                    </div>
                                    <div class="form-group col-lg-6">
                                        <label>Mobile</label>
                                        <input type="tel" name="MobileNo" id="MobileNo1" class="form-control" required="" placeholder="0987654321" />
                                    </div>
                                </div>
                                <div class="form-group col-lg-12">
                                    <label>Residential Address</label>
                                    <textarea rows="2" name="ResidentialAddress" id="ResidentialAddress1" class="form-control" required=""></textarea>
                                </div>
                                <div class="form-group col-lg-6 ">
                                    <label>Pin Code</label>
                                    <input type="text" name="PinCode" id="PinCode1" class="form-control" placeholder="999999" />
                                </div>
                                <div class="form-group col-lg-6">
                                    <label>State</label>
                                    <select name="State" id="State1" class="form-control" required="">
                                        <option value="" disabled="disabled">-- Select -- </option>
                                        <option value="Maharashtra">Maharastra</option>
                                        <option value="Bihar">Bihar</option>
                                        <option value="Delhi">UP</option>
                                        <option value="Odisha">Odisha</option>
                                        <option value="Odisha">AP</option>
                                    </select>
                                </div>
                                <div class="form-group col-lg-6">
                                    <label>Nationality</label>
                                    <input type="text" name="title" id="Nationality1" class="form-control" placeholder="Indian" required="" />
                                </div>
                                <div class="form-group col-lg-6">
                                    <label>Date of Joining</label>
                                    <input type="date" name="Doj" id="Doj1" class="form-control datepicker" required="" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" id="btnUpdate" class="btn btn-primary" edit-id="" data-dismiss="modal">Save changes</button>
                    </div>
                </div>
            </div>--%>



    <%--For Modal Popup--%>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://cdn.jsdelivr.net/json2/0.1/json2.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#btnSave").click(function () {

                $("#btnSave").show();
                $("#btnUpdate").hide();

                if ($('#btnSave').closest('form')[0].checkValidity()) {

                    var user = {};
                    user.FName = $("#FirstName").val();
                    user.LName = $("#Surname").val();
                    user.MName = $("#MiddleName").val();
                    user.Gender = $("#Male").val();
                    user.Email = $("#EmailId").val();
                    user.Dob = $("#Dob").val();
                    user.MaritalStatus = $("#MaritalStatus").val();
                    user.Hobbies = $("#Hobbies").val();
                    user.HomeMobile = $("#TelephoneNo").val();
                    user.OfficeMobile = $("#MobileNo").val();
                    user.Address = $("#ResidentialAddress").val();
                    user.Pincode = $("#PinCode").val();
                    user.State = $("#State").val();
                    user.Nationality = $("#Nationality").val();
                    user.Doj = $("#Doj").val();
                    user.CreatedDateTime = new Date();
                    user.ModifiedDateTime = new Date();
                    $.ajax({
                        type: "POST",
                        url: "UserSetup.aspx/SaveUser",
                        data: '{objEmployee: ' + JSON.stringify(user) + '}',
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

            $('#myModalAdd').on('close', function () {
                debugger;
                        $("#btnSave").show();
                        $("#btnUpdate").hide(); 
                    });

            function getDetails() {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: "UserSetup.aspx/GetData",
                    data: {},
                    dataType: "json",
                    success: function (data) {
                        $('#data_Tables tbody').remove();
                        //console.log(data.d);
                        for (var i = 0; i < data.d.length; i++) {
                            $("#data_Tables").append(
                                "<tr><td>" + data.d[i].FName + "</td><td>" + data.d[i].Email + "</td>" +
                                "<td>" + data.d[i].HomeMobile + "</td>" + "<td>" + data.d[i].OfficeMobile + "</td>" +
                                "<td>" + data.d[i].Doj + "</td>" + "<td>" + data.d[i].Dob + "</td>" +
                                "<td>" + "<input type='button' class='btn btn-primary editButton' data-id='" + data.d[i].EmpId + "' data-toggle='modal' data-target='#myModal' name='submitButton' id='btnEdit' value='Edit' />" + "</td>" +
                                "<td><input type='button' class='btn btn-primary deleteButton' data-id='" + data.d[i].EmpId + "' name='submitButton' id='btnDelete' value='Delete'/> </td><td></td></tr>");
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
                    url: "UserSetup.aspx/Remove",
                    data: '{eid: ' + id + '}',
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
                    url: "UserSetup.aspx/EditData",
                    data: '{eid: ' + id + '}',
                    dataType: "json",
                    success: function (data) {
                        var empDetails = $.parseJSON(data.d);
                        $.each(empDetails,
                            function (index, value) {
                                //console.log(v.Fname);
                                $("#FirstName").val(value.Fname);
                                $("#MiddleName").val(value.Mname);
                                $("#Surname").val(value.Lname);
                                $("#EmailId").val(value.EMail);
                                $("#Dob").val(value.DOB);
                                $("#MaritalStatus").val(value.MaritalStatus);
                                $("#Hobbies").val(value.Hobbies);
                                $("#TelephoneNo").val(value.Telephone);
                                $("#MobileNo").val(value.Mobile);
                                $("#ResidentialAddress").val(value.Address);
                                $("#PinCode").val(value.PinCode);
                                $("#State").val(value.State);
                                $("#Nationality").val(value.Nationality);
                                $("#Doj").val(value.DOJ);
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
                    var user = {};
                    user.FName = $("#FirstName").val();
                    user.LName = $("#Surname").val();
                    user.MName = $("#MiddleName").val();
                    user.Gender = $("#Male").val();
                    user.Email = $("#EmailId").val();
                    user.Dob = $("#Dob").val();
                    user.MaritalStatus = $("#MaritalStatus").val();
                    user.Hobbies = $("#Hobbies").val();
                    user.HomeMobile = $("#TelephoneNo").val();
                    user.OfficeMobile = $("#MobileNo").val();
                    user.Address = $("#ResidentialAddress").val();
                    user.Pincode = $("#PinCode").val();
                    user.State = $("#State").val();
                    user.Nationality = $("#Nationality").val();
                    user.Doj = $("#Doj").val();
                    user.ModifiedDateTime = new Date();
                    $.ajax({
                        type: "Post",
                        contentType: "application/json; charset=utf-8",
                        url: "UserSetup.aspx/UpdateData",
                        data: '{objEmployee: ' + JSON.stringify(user) + ', eid : ' + id + '}',
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

    <%--<script src="../Content/js/jquery.dataTables.js"></script>--%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
