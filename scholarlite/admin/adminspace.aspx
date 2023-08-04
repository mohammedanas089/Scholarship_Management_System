<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="adminspace.aspx.cs" Inherits="admin_adminspace" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
        <asp:Button ID="Button1" runat="server" Text="Allow Application Page" OnClick="Button1_Click" CssClass="btn" /> <br /> <br /><asp:Button ID="Button2" CssClass="btn" runat="server" Text="Restrict Application Page" OnClick="Button2_Click" style="height: 29px" />
        
</asp:Content>

