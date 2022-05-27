<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/Common/Admin/OrganizationView.master" AutoEventWireup="true" CodeBehind="Sample.aspx.cs" Inherits="MalayanEventHub.Layouts.Common.Admin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head2" runat="server">
    <link rel="stylesheet" href="Styles/MasterStyleSheet.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="form-body">
        <p class="header">Review Event</p>
        <div class="form-section">
            <div id="category-section" class="sub-header" onclick="toggleFormSections(this)">
                <p style="width: 90%;">Event Details</p>
                <p id="category-section-indicator" style="float: right; margin-right: 15px;">-</p>
            </div>
            <div id="category-section-fields" class="form-fields">
                <div class="form-field">
                    <p>FieldName:</p>
                    <asp:TextBox ID="TextBoxField" runat="server" CssClass="text-boxs"></asp:TextBox>
                </div>
                <div class="form-field">
                    <p>FieldName2:</p>
                    <asp:TextBox ID="TextBoxField2" runat="server" CssClass="text-boxs"></asp:TextBox>
                </div>
            </div>
        </div>
        <div class="form-section">
            <div id="test-section" class="sub-header" onclick="toggleFormSections(this)">
                <p style="width: 90%;">Event Details</p>
                <p id="test-section-indicator" style="float: right; margin-right: 15px;">-</p>
            </div>
            <div id="test-section-fields" class="form-fields">
                <div class="form-field">
                    <p>FieldName:</p>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="text-boxs"></asp:TextBox>
                </div>
                <div class="form-field">
                    <p>FieldName2:</p>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="text-boxs"></asp:TextBox>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function toggleFormSections(e) {
            var objectCaller = document.getElementById(e.id + "-fields");
            var objectCallerIndicator = document.getElementById(e.id + "-indicator");

            //set action
            objectCaller.classList.toggle("hide");
            if (objectCallerIndicator.innerText == "+") {
                objectCallerIndicator.innerText = "-";
            }
            else if (objectCallerIndicator.innerText == "-") {
                objectCallerIndicator.innerText = "+";
            }

        }
    </script>
</asp:Content>
