<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="reject.aspx.cs" Inherits="admin_reject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="divreason">
        <h1 class="headreason">Reject this application</h1>
    <asp:Label CssClass="lblreason" runat="server">Please Specify the reason to reject this application</asp:Label><asp:TextBox ID="TextBox1" runat="server" CssClass="txtreason" TextMode="MultiLine"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" CssClass="butreason" Text="Reject" OnClick="Button1_Click" />
    </div>
</asp:Content>

