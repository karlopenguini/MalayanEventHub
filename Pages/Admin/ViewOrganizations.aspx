<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/AdminView.Master" AutoEventWireup="true" CodeBehind="ViewOrganizations.aspx.cs" Inherits="MalayanEventHub.Layouts.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
    <link href="../../Styles/Admin/StyleSheetViewOrgs.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main">
            <div class="auto-style1">
                <asp:DropDownList ID="ddlCollege" runat="server" AutoPostBack="True">
                    <asp:ListItem>CAS</asp:ListItem>
                    <asp:ListItem>CCIS</asp:ListItem>
                    <asp:ListItem>ETYCB</asp:ListItem>
                    <asp:ListItem>MITL</asp:ListItem>
                    <asp:ListItem>CMET</asp:ListItem>
                </asp:DropDownList>
                <asp:DataList ID="DataList1" runat="server" CellPadding="20" RepeatDirection="Horizontal" RepeatColumns="3">
                    <ItemTemplate>
                        <div class="card">
                            <img src="ImagesLogo/1.png" />
                            <div class="info">
                               <a href="<%# FormatUrl( "OrgDetails.aspx",(int) Eval("organizationID")) %>" class="btn">Details</a>
                            </div>
                        </div>
                    </ItemTemplate>
                    <SeparatorTemplate></SeparatorTemplate>
                </asp:DataList>
            </div>
        </div>
</asp:Content>
