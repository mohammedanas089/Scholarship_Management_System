<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="adminnote.aspx.cs" Inherits="adminnote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"></asp:TextBox>
    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Send" style="border:none;color:white;background-color:#2196F3;border-radius:3px;padding:5px;" />
    
    
    <asp:GridView ID="GridView1" runat="server"  AllowPaging="True" AllowSorting="True" Width="100%" AutoGenerateColumns="False" DataKeyNames="slno" HorizontalAlign="Left" CellPadding="2"  DataSourceID="SqlDataSource1" GridLines="None" >
        <Columns>
            <asp:CommandField ButtonType="Image" SelectImageUrl="~/img/transparency.png"  ShowSelectButton="True" > <ControlStyle Width="20px" Height="20px" />
            </asp:CommandField>
            <asp:BoundField DataField="slno" HeaderText="slno" InsertVisible="False" ReadOnly="True" SortExpression="slno" />
            <asp:BoundField DataField="note" HeaderText="note" SortExpression="note" />
            <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" ReadOnly="true" />
            <asp:CommandField ButtonType="Image" DeleteImageUrl="~/img/cross.png" EditImageUrl="~/img/edit.png" UpdateImageUrl="~/img/refresh-page-option.png" CancelImageUrl="~/img/closed.png" ShowDeleteButton="True" ShowEditButton="True" >
            <ControlStyle Width="15%" />
            <ItemStyle Width="15%" />
            </asp:CommandField>
        </Columns>
        <HeaderStyle BackColor="WhiteSmoke" ForeColor="#666666" CssClass="gvhead"/>
    <RowStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" Height="50px" />
        <SelectedRowStyle BorderColor="#2196F3" BorderStyle="Dashed" BorderWidth="2px" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [notetbl] " DeleteCommand="delete from [notetbl] where [slno]=@slno" UpdateCommand="update notetbl set note=@note  where slno=@slno"></asp:SqlDataSource>
    
</asp:Content>

