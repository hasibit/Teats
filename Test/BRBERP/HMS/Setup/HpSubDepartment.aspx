<%@ Page Title="" Language="C#" MasterPageFile="~/HMS/MP/HmsAdmin.Master" AutoEventWireup="true" CodeBehind="HpSubDepartment.aspx.cs" Inherits="BRBERP.HMS.Setup.HpSubDepartment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h3>Recent Chat</h3>
                </div>
                <div class="card-body chat-box scrollable" style="height: 300px;">
                    <ul class="chat-list">
                        <li class="chat-item">
                            <div class="chat-img">
                                <img src="img/users/1.jpg" alt="user">
                            </div>
                            <div class="chat-content">
                                <h6 class="font-medium">James Anderson</h6>
                                <div class="box bg-light-info"></div>
                            </div>
                            <div class="chat-time">10:56 am</div>
                        </li>

                    </ul>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
