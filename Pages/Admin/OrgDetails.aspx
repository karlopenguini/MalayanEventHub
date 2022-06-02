<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Common/Admin/OrganizationView.master" AutoEventWireup="true" CodeBehind="OrgDetails.aspx.cs" Inherits="MalayanEventHub.Layouts.Common.Admin.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-size: 28px;
            font-weight: 400;
        }
    </style>
    <link href="../../Styles/Admin/StyleOrgDetails.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="main-container">
        <div class="image-container">
            <asp:Image ID="img_Logo" runat="server" ImageUrl="~/Images/hawk.png"/>
        </div>
        <!--Key members container-->
        <div class="memberTitle-style">
            Key Members
        </div>

        <!--List of members-->
        <div class="list-container">
            <div class="adviser-container">
                <p style="font-size: 28px">
                    <asp:Label ID="lbl_Adviser" runat="server" Text=""></asp:Label>
                </p>
                Adviser
            </div>
            <div class="side-container">
                    <div style="width: 50%">
                    <p style="font-size: 28px">
                        <asp:Label ID="lbl_President" runat="server" Text=""></asp:Label>
                    </p>
                    President
                </div>
                    <div style="width: 50%">
                    <p style="font-size: 28px">
                        <asp:Label ID="lbl_VicePresident" runat="server" Text=""></asp:Label>
                    </p>
                    Vice-President
                </div>
            </div>
            <div class="side-container">
                <div style="width: 50%">
                    <p style="font-size: 28px">
                        <asp:Label ID="lbl_Secretary" runat="server" Text=""></asp:Label>
                    </p>
                    Secretary
                </div>
                <div style="width: 50%">
                    <p style="font-size: 28px">
                        <asp:Label ID="lbl_Treasurer" runat="server" Text=""></asp:Label>
                    </p>
                    Treasurer
                </div>
            </div>
        </div>
        <!--div for mission and vision-->
        <div class="mv-container">
            <!--left container-->
            <div style="width: 50%; font-size: 28px; margin-right: 20px">
                Mission
                <div class="mv-desc">
                    <asp:Label ID="lbl_Mission" runat="server" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."></asp:Label>
                </div>

            </div>
            <!--right container-->
            <div style="width: 50%; font-size: 28px;margin-left: 20px ">
                Vision
                <div class="mv-desc">
                    <asp:Label ID="lbl_Vision" runat="server" Text="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."></asp:Label>
                </div>

            </div>
        </div>
        <!--contact-->
        <div style="font-size: 28px; margin-top: 70px; margin-bottom: 100px">
            Contact us:
            <p style="font-weight: 100">
                https://www.facebook.com/mcl.arc
            </p>
        </div>
    </div>
</asp:Content>
