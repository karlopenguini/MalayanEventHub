<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/OrganizerView.Master" AutoEventWireup="true" CodeBehind="OrganizationRegistration.aspx.cs" Inherits="MalayanEventHub.Layouts.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="organization_re.css">
    <style>
        body {
            font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }
        
        /* Flexbox wrapper than contains a flexbox item that is another flexbox container */
        .wrapper { 
            margin: auto;
            display:flex;
            flex-direction: column;
            align-items: flex-start;
            width: 600px;
        }

        /* Form title properties */
        #title {
            font-size: 25px;
            margin-top: 50px;
        }

        /* Flexbox container inside wrapper that contains form controls */
        .form {
            display: flex;
            flex-direction: column;
            justify-content: space-around;
            align-items: flex-start;
            align-self: center;

            margin-bottom: 25px;
            padding: 5px;
        }

        .form div {
            margin:5px;
        }

        /* Rounded Text Boxes */
        .textbox {
            font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            border-radius: 10px;
            border-width: 1px;
            border-color: black;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper">
        <div id="title">Register Organization</div>
        <div class="form">
            <div>
                <asp:Label ID="lblName" runat="server" Text="Organization Name"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txtName" runat="server" Width="500px" class ="textbox"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lblLogo" runat="server" Text="Logo"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txtLogo" runat="server" Width="500px" class ="textbox"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lblAcronym" runat="server" Text="Organization Acronym"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txtAcronym" runat="server" Width="500px" class ="textbox"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lblType" runat="server" Text="Type"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txtType" runat="server" Width="500px" class ="textbox"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lblContact" runat="server" Text="Contact"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txtContact" runat="server" Width="500px" class ="textbox"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lblMission" runat="server" Text="Mission"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txtMission" runat="server" Width="500px" Height="120px" class ="textbox" style="overflow:auto; resize:none; " TextMode="MultiLine"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lblVision" runat="server" Text="Vision"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txtVision" runat="server" Width="500px" Height="120px" class ="textbox" style="overflow:auto; resize:none;" TextMode="MultiLine"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lblCollege" runat="server" Text="College"></asp:Label>
            </div>
            <div>
                <asp:DropDownList ID="ddlCollege" runat="server" Width ="100px"></asp:DropDownList>
            </div>
            <div>
                <asp:Label ID="lblAdviserNum" runat="server" Text="Adviser Employee Number"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txtAdviseNum" runat="server" Width="500px" class ="textbox"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lblVicePresNum" runat="server" Text="Vice President Student Number"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txtVicePresNum" runat="server" Width="500px" class ="textbox"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lblMembers" runat="server" Text="Members"></asp:Label>
            </div>
            <div>
                <asp:TextBox ID="txtMembers" runat="server" Width="500px" Height="120px" class ="textbox" style="overflow:auto; resize:none;" ></asp:TextBox>
            </div>
            <di style = "margin: 15px auto">
                <asp:Button ID="btnRegister" runat="server" Text="Register" style="border-radius: 50px; border-width: 1px; border-color: black;"/>
            </di>
        </div>
    </div>
</asp:Content>
