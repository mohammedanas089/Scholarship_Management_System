<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <div class="div">
        <asp:Button ID="Button3" runat="server" Text="Search" CssClass="srch" OnClick="Button3_Click" />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Search Results...."></asp:Label>
    </div>

    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" Width="100%" AutoGenerateColumns="False" DataKeyNames="id" HorizontalAlign="Left" CellPadding="2" GridLines="None" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating1">
        <Columns>
            <asp:CommandField ButtonType="Image" SelectImageUrl="~/img/transparency.png" ShowSelectButton="True">
                <ControlStyle Width="20px" Height="20px" />
            </asp:CommandField>
            <asp:BoundField DataField="id" HeaderText="slno" InsertVisible="False" ReadOnly="True" SortExpression="slno"  />
            <asp:TemplateField HeaderText="First Name">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("name") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtnote" Text='<%# Eval("name") %>' runat="server" CssClass="edit"  style="margin:0px;width:100%;padding:0px;" />
                </EditItemTemplate>
        
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Name">
                <ItemTemplate>
                    <asp:Label Text='<%# Eval("sancamount") %>' runat="server" style="margin:0px;width:100%;padding:0px;" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtdate" Text='<%# Eval("sancamount") %>' runat="server" />
                </EditItemTemplate>
               
            </asp:TemplateField>
            <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/Images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/Images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ImageUrl="~/Images/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/Images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>
                        </EditItemTemplate>
                       
                    </asp:TemplateField>

        </Columns>
        <HeaderStyle BackColor="WhiteSmoke" ForeColor="#666666" CssClass="gvhead" />
        <RowStyle BackColor="White" HorizontalAlign="Left" VerticalAlign="Middle" Wrap="True" Height="50px" />
        <SelectedRowStyle BorderColor="#2196F3" BorderStyle="Dashed" BorderWidth="2px" />
    </asp:GridView>

</asp:Content>

