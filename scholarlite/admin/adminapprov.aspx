<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="adminapprov.aspx.cs" Inherits="adminapprov" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            margin-top: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="div">
        <asp:Button ID="Button3" runat="server" Text="Search" CssClass="srch" OnClick="Button3_Click" />
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
    <asp:GridView ID="GridView1" style="font-weight:normal;" runat="server" AllowPaging="True" AllowSorting="True" Width="100%" AutoGenerateColumns="False" RowStyle-CssClass="grid" HorizontalAlign="Left"  OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="2"  DataKeyNames="id" GridLines="None" OnRowCommand="GridView1_RowCommand" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating1" CssClass="auto-style2" OnPageIndexChanging="GridView1_PageIndexChanging" OnSorting="GridView1_Sorting">
    <Columns>
        <asp:CommandField ButtonType="Image" SelectImageUrl="~/img/review.png"  ShowSelectButton="True" > <ControlStyle Width="20px" Height="20px" />
            </asp:CommandField>
         <asp:TemplateField>
            <ItemTemplate>
                <asp:HiddenField ID="HiddenField1" runat="server" 
                    Value='<%# Eval("review") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" SortExpression="id" ItemStyle-Width="100px" ><ItemStyle Width="100px"></ItemStyle></asp:BoundField >
       <asp:TemplateField HeaderText="Student Name" SortExpression="name" ItemStyle-Width="100px" >
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("name") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="n" Text='<%# Eval("name") %>' runat="server" CssClass="edit"  style="margin:0px;width:100%;padding:0px;" />
                </EditItemTemplate>
               
            </asp:TemplateField>
        <asp:TemplateField HeaderText="Father" SortExpression="father" ItemStyle-Width="100px">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("father") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="f" Text='<%# Eval("father") %>' runat="server" CssClass="edit"  style="margin:0px;width:100%;padding:0px;" />
                </EditItemTemplate>
               
            </asp:TemplateField>


        <asp:TemplateField HeaderText="Occupation" SortExpression="occupation" ItemStyle-Width="100px">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("occupation") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="o" Text='<%# Eval("occupation") %>' runat="server" CssClass="edit"  style="margin:0px;width:100%;padding:0px;" />
                </EditItemTemplate>
               
            </asp:TemplateField>


        <asp:BoundField DataField="course" ReadOnly="True" HeaderText="Course" SortExpression="course"   ItemStyle-Width="100px">
<ItemStyle Width="100px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="courseyear" ReadOnly="True" HeaderText="Class/Sem" SortExpression="courseyear"  ItemStyle-Width="100px" >
<ItemStyle Width="100px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="pcourse" ReadOnly="True" HeaderText="Previously Studied" SortExpression="pcourse"  ItemStyle-Width="100px" >
<ItemStyle Width="100px"></ItemStyle>
        </asp:BoundField>


        <asp:TemplateField HeaderText="Completed Class" SortExpression="pcourseyear" ItemStyle-Width="100px">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("pcourseyear") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="p" Text='<%# Eval("pcourseyear") %>' runat="server" CssClass="edit"  style="margin:0px;width:100%;padding:0px;" />
                </EditItemTemplate>
               
            </asp:TemplateField>



        <asp:TemplateField ItemStyle-Width="170px" HeaderText="Marks Secured(%)" SortExpression="pcoursemarks">
                <ItemTemplate>
                <asp:Label runat="server" ID="mark" Text='<%#Eval("pcoursemarks") %>'></asp:Label>    
                </ItemTemplate>
             <EditItemTemplate>
                    <asp:TextBox ID="m" Text='<%# Eval("pcoursemarks") %>' runat="server" CssClass="edit"  style="margin:0px;width:100%;padding:0px;" />
                </EditItemTemplate>
            </asp:TemplateField>





        <asp:TemplateField HeaderText="SSLC(%)" SortExpression="sslc" ItemStyle-Width="170px">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("sslc") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="sslc" Text='<%# Eval("sslc") %>' runat="server" CssClass="edit"  style="margin:0px;width:100%;padding:0px;" />
                </EditItemTemplate>
               
            </asp:TemplateField>


        <asp:TemplateField HeaderText="PU(%)" SortExpression="pu"  ItemStyle-Width="170px">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("pu") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="pu" Text='<%# Eval("pu") %>' runat="server" CssClass="edit"  style="margin:0px;width:100%;padding:0px;" />
                </EditItemTemplate>
               
            </asp:TemplateField>



   

        <asp:TemplateField HeaderText="Institute" SortExpression="institute" ItemStyle-Width="200px">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("institute") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="i" Text='<%# Eval("institute") %>' runat="server" CssClass="edit"  style="margin:0px;width:100%;padding:0px;" />
                </EditItemTemplate>
               
            </asp:TemplateField>



        <asp:TemplateField ItemStyle-Width="100px" HeaderText="Fee Balance">
                <ItemTemplate>
                <asp:Label runat="server" ID="fee"  Text='<%#Eval("balancefee") %>'></asp:Label>    
                </ItemTemplate>
            </asp:TemplateField>



 



        <asp:TemplateField ItemStyle-Width="100px" HeaderText="Income">
                <ItemTemplate>
                <asp:Label runat="server" ID="income" Text='<%#Eval("income") %>'></asp:Label>    
                </ItemTemplate>
            </asp:TemplateField>






        <asp:BoundField DataField="year" HeaderText="Year" ReadOnly="True" SortExpression="year"  ItemStyle-Width="100px" >
<ItemStyle Width="100px"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="email" HeaderText="E-mail Address"  SortExpression="email" Visible="false"  ItemStyle-Width="100px" >
<ItemStyle Width="100px"></ItemStyle>
        </asp:BoundField>
     



        <asp:TemplateField HeaderText="Aadhar ID" SortExpression="aadhar" ItemStyle-Width="100px">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("aadhar") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="a" Text='<%# Eval("aadhar") %>' runat="server" CssClass="edit"  style="margin:0px;width:100%;padding:0px;" />
                </EditItemTemplate>
               
            </asp:TemplateField>




        <asp:BoundField DataField="type" HeaderText="Type" ReadOnly="True" SortExpression="type"  ItemStyle-Width="100px" >
<ItemStyle Width="100px"></ItemStyle>
        </asp:BoundField>
      
        <asp:TemplateField HeaderText="Sanction Amount" SortExpression="sancamount">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("sancamount") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtsancamount" Text='<%# Eval("sancamount") %>' runat="server" CssClass="edit"  style="margin:0px;width:100%;padding:0px;" />
                </EditItemTemplate>
               
            </asp:TemplateField>
<asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/img/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ImageUrl="~/img/refresh-page-option.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/img/closed.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>
                        </EditItemTemplate>
                       
                    </asp:TemplateField>
            <asp:TemplateField>    
                <ItemTemplate>
                    <asp:ImageButton ID="Button2" runat="server" CommandArgument='<%#Eval("id") %>'  ImageUrl="~/img/arrow.png" CommandName="sanction" ToolTip="Cancel" Width="40px" Height="40px" />

                   

                </ItemTemplate>
            </asp:TemplateField>
    </Columns>
        
    <HeaderStyle BackColor="WhiteSmoke" ForeColor="#666666" CssClass="gvhead"/>
    <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" Height="50px" />
        <SelectedRowStyle BorderColor="#2196F3" BorderStyle="solid" BorderWidth="3px" />      
</asp:GridView>
</asp:Content>

