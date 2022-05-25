<%@ Page Title="" Language="C#" MasterPageFile="~/Layouts/UserView.Master" AutoEventWireup="true" CodeBehind="Organizations.aspx.cs" Inherits="MalayanEventHub.Layouts.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        *{
            box-sizing: border-box;
            font-family: 'Lato', sans-serif;
        }

        html, body{
            display: flex;
            justify-content: center;
            align-items: center;
            background: #222;
        }


        .wrapper{
            display: flex;
            width: 310px;
            height: 307px;
            justify-content: space-around;
        }

        .card {
            width: 310px;
            height: 307px;
            padding: 2rem 1rem;
            background: #fff;
            position: relative;
            display: flex;
            align-items: flex-end;
            box-shadow: 0px 7px 10px rgba(0,0,0,0.5);
            transition: 0.5s ease-in-out;
        }

        .card:before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            display: block;
            width: 100%;
            height: 100%;
            background: linear-gradient(to bottom, rgba(0,112,238,0.07860644257703087) 0%, rgba(28,58,99,1) 100%);
            z-index: 2;
            transition: 0.5s all;
            opacity: 0;
        }

        .card:hover:before{
            opacity: 1;
        }

        .card img{
            width: 100%;
            height: 100%;
            object-fit: cover;
            position: absolute;
            top: 0;
            left: 0;
        }

        .card .info{
            z-index: 3;
            color: #fff;
            opacity: 0;
            transform: translateY(30px);
            transition: 0.5s all;
            height: 100%;
            width: 100%;
            justify-content: center;
        }

        .card:hover .info{
            opacity: 1;
            transform: translateY(0px);
        }


        .card .info .btn{
            height: 30px;
            width: 200px;
            text-decoration: none;
            padding: 0.5rem 1rem;
            background: #fff;
            color: #000;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.4s ease-in-out;
            text-align: center;
            display: block;
            margin-top: 20px;
            margin-left: auto;
            margin-right: auto;
        }

        .card .info .btn:hover{
            box-shadow: 0px 7px 10px rgba(0,0,0,0.5);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="wrapper">
             <div class="card">
                 <img src="ImagesLogo/1.png" />
                 <div class="info">
                     <a href="#" class="btn">VIOLATIONS</a>
                     <a href="#" class="btn">DETAILS</a>
                     <a href="#" class="btn">REQUEST</a>
                 </div>
             </div>
        </div>

    </div>

</asp:Content>
