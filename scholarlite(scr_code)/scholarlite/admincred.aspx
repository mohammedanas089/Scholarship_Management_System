<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="admincred.aspx.cs" Inherits="admincred" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 15%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <div class="signdiv">
        <h1 class="signhead">
            <img alt="" class="auto-style2" src="img/admin-with-cogwheels.png" />Admin Login
        </h1>
        <asp:Label runat="server" CssClass="signlbl">Admin ID</asp:Label><br /><asp:TextBox ID="TextBox1" CssClass="signtxt" runat="server"></asp:TextBox>
        <br />
    <asp:Label CssClass="signlbl" runat="server">Password</asp:Label><br /><asp:TextBox ID="TextBox2" CssClass="signtxt" runat="server" TextMode="Password"></asp:TextBox>
        <br />
    <asp:Button CssClass="signbut" ID="Button3" runat="server" OnClick="Button3_Click" Text="LogIn" />

    </div>
</asp:Content>

