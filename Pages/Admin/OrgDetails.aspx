﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Common/Admin/OrganizationView.master" AutoEventWireup="true" CodeBehind="OrgDetails.aspx.cs" Inherits="MalayanEventHub.Layouts.Common.Admin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
    <link href="../../Styles/Admin/StyleSheetOrgDetails.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            font-size: 28px;
            font-weight: 400;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="main-container">
        <div class="image-container">
            <img src="../../Images/hawk.png" class="imageStyle"/>
        </div>
        <!--Org name-->
        <div>
            <h4 class="auto-style1">About organization name</h4>
        </div>
        <!--description org name-->
        <div class="description-style">
            <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            </p>
        </div>
        <!--Key members container-->
        <div class="memberTitle-style">
            Key Members
        </div>
        <!--List of members-->
        <div class="list-container">
            <div class="adviser-container">
                <p style="font-size: 28px">Marvin Allen N. Requintina</p>
                Adviser
            </div>
            <div class="side-container">
                 <div style="width: 50%">
                    <p style="font-size: 28px">Angela Mae N. Requintina </p>
                    President
                </div>
                 <div style="width: 50%">
                    <p style="font-size: 28px">Mark Angelo N. Requintina </p>
                    Vice-President
                </div>
            </div>
            <div class="side-container">
                <div style="width: 50%">
                    <p style="font-size: 28px">Don T. Requintina </p>
                    Secretary
                </div>
                <div style="width: 50%">
                    <p style="font-size: 28px">Zenaida N. Requintina </p>
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
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                </div>

            </div>
            <!--right container-->
            <div style="width: 50%; font-size: 28px;margin-left: 20px ">
                Vision
                <div class="mv-desc">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
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
