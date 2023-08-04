<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="adminsanction.aspx.cs" Inherits="adminsanction" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="div">
        <asp:Button ID="Button2" runat="server" Text="Search" CssClass="srch" OnClick="Button2_Click" />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Search Results...."></asp:Label>
    </div>

    <br />
    <table class="auto-style3" style="width:50%">
        <tr>
            <td class="auto-style4" >
    <asp:TextBox runat="server" style="resize:none;border-radius:5px;padding:5px;" ID="review"  TextMode="MultiLine" Height="131px" Width="366px"></asp:TextBox></td>
            <td style="margin:20%;"><asp:Button ID="Button4" runat="server" CssClass="butr"  Text="Update Review" OnClick="Button4_Click" Width="103px" />
            </td>
        </tr>
    </table>   
    <asp:GridView  ID="GridView1" runat="server" AllowSorting="True" RowStyle-CssClass="grid" Width="100%" AutoGenerateColumns="False" HorizontalAlign="Left" CellPadding="2" DataKeyNames="id" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"  OnSorting="GridView1_Sorting">
    <Columns>
        <asp:CommandField ButtonType="Image" SelectImageUrl="~/img/review.png"  ShowSelectButton="True" > <ControlStyle Width="20px" Height="20px" />
            </asp:CommandField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:HiddenField ID="HiddenField1" runat="server" 
                    Value='<%# Eval("review") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" SortExpression="id" />
        <asp:BoundField DataField="name" HeaderText="Student Name" SortExpression="name" />
        <asp:BoundField DataField="father" HeaderText="Father" SortExpression="father" />
        <asp:BoundField DataField="occupation" HeaderText="Occupation" SortExpression="occupation" />
        <asp:BoundField DataField="course" HeaderText="Course" SortExpression="course" />
        <asp:BoundField DataField="courseyear" HeaderText="Class/Sem" SortExpression="courseyear" />
        <asp:BoundField DataField="pcourse" HeaderText="Previously Studied" SortExpression="pcourse" />
        <asp:BoundField DataField="pcourseyear" HeaderText="Completed Class" SortExpression="pcourseyear" />
        <asp:BoundField DataField="pcoursemarks" HeaderText="Marks Secured" SortExpression="pcoursemarks" />
        <asp:BoundField DataField="sslc" HeaderText="SSLC(%)" SortExpression="sslc" />
        <asp:BoundField DataField="pu" HeaderText="PU(%)" SortExpression="pu" />
        <asp:BoundField DataField="institute" HeaderText="Institute" SortExpression="institute" />
        <asp:BoundField DataField="balancefee" HeaderText="Fee Balance" SortExpression="balancefee" />
        <asp:BoundField DataField="year" HeaderText="Year" SortExpression="year" />
        <asp:BoundField DataField="email" HeaderText="E-mail Address" SortExpression="email" Visible="false" />
        <asp:BoundField DataField="aadhar" HeaderText="Aadhar ID" SortExpression="aadhar" />
        <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
        <asp:BoundField DataField="sancamount" HeaderText="Sanctioned Amount" SortExpression="type" />
       
      
    </Columns>
        
   <HeaderStyle BackColor="WhiteSmoke" ForeColor="#666666" CssClass="gvhead"/>
    <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" Height="50px" />
        <SelectedRowStyle BorderColor="#2196F3" BorderStyle="Dashed" BorderWidth="2px" />
</asp:GridView>

<br />
    <br />
    <br />
    <div style="margin:auto;" >
    <asp:Button ID="Button1" runat="server" Text="Download Excel" OnClick="Button1_Click" CssClass="xl"/>
      
    &nbsp;&nbsp;
      
    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Convert Fresher to Renew" CssClass="convert" />
</div>
</asp:Content>

