<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="adminrenew.aspx.cs" Inherits="adminrenew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
     .valid{
            background-color:#BCD7AF;
     }
       .valid:hover {
        background-color: #2196F3;
        color:white;
    }
       .invalid{
         
            background-color:#F5B4A4;
     }
       .invalid:hover {
        background-color: #2196F3;
        color:white;
    }
       .n{
         
            background-color:white;
     }
       .n:hover {
        background-color: #2196F3;
        color:white;
    }
        .auto-style3 {
         width: 100%;
     }
     .auto-style4 {
         width: 338px;
     }
 </style> 
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
    <asp:GridView ID="GridView1"  runat="server" AllowPaging="true" RowStyle-CssClass="grid" AllowSorting="True" AutoGenerateColumns="False" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound" HorizontalAlign="Left" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating1" CellPadding="2" DataKeyNames="id" GridLines="None" OnRowCommand="GridView1_RowCommand1" OnPageIndexChanging="GridView1_PageIndexChanging" OnSorting="GridView1_Sorting" >
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
 <asp:TemplateField ItemStyle-Width="170px" HeaderText="Marks Secured(%)">
                <ItemTemplate>
                <asp:Label runat="server" ID="mark" Text='<%#Eval("pcoursemarks") %>'></asp:Label>    
                </ItemTemplate>

<ItemStyle Width="100px"></ItemStyle>
            </asp:TemplateField>            <asp:BoundField DataField="sslc" HeaderText="SSLC(%)" SortExpression="sslc" />
            <asp:BoundField DataField="pu" HeaderText="PU(%)" SortExpression="pu" />
            <asp:BoundField DataField="institute" HeaderText="Institute" SortExpression="institute" />
<asp:TemplateField ItemStyle-Width="100px" HeaderText="Fee Balance">
                <ItemTemplate>
                <asp:Label runat="server" ID="fee" Text='<%#Eval("balancefee") %>'></asp:Label>    
                </ItemTemplate>

<ItemStyle Width="100px"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField ItemStyle-Width="100px" HeaderText="Income">
                <ItemTemplate>
                <asp:Label runat="server" ID="income" Text='<%#Eval("income") %>'></asp:Label>    
                </ItemTemplate>

<ItemStyle Width="50px"></ItemStyle>
            </asp:TemplateField>            <asp:BoundField DataField="year" HeaderText="Year" SortExpression="year" />
            <asp:BoundField DataField="email" HeaderText="E-mail Address" SortExpression="email" />
            <asp:BoundField DataField="aadhar" HeaderText="Aadhar ID" SortExpression="aadhar" />
            <asp:BoundField DataField="type" HeaderText="Type" SortExpression="type" />
            <asp:BoundField DataField="totalfee" HeaderText="totalfee" SortExpression="totalfee" Visible="false" />
            <asp:BoundField DataField="doc" HeaderText="doc" SortExpression="doc"  Visible="false"/>
            <asp:TemplateField >
                <ItemTemplate>
                    <asp:ImageButton ID="btn" runat="server" ImageUrl="~/img/check.png" CommandName="approve" CommandArgument='<%#Eval("aadhar") %>' Width="55%" />
                   
                    <asp:ImageButton ID="Button1" runat="server" ImageUrl="~/img/pdf.png" CommandName="pdf" CommandArgument='<%#Eval("aadhar") %>' Width="55%" />
                                       <asp:ImageButton ID="Button2" runat="server" ImageUrl="~/img/cross.png" CommandName="deny" CommandArgument='<%#Eval("id") %>' Width="55%" />




                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        
       <EditRowStyle BackColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" BorderStyle="None" />
        <HeaderStyle BackColor="WhiteSmoke" ForeColor="#666666" CssClass="gvhead" />
        <RowStyle  HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True"  />
        <SelectedRowStyle BorderColor="#2196F3" BorderStyle="solid" BorderWidth="3px" />
    </asp:GridView>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>

