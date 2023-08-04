<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="adminhis.aspx.cs" Inherits="adminhis" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            width: 100%;
        }
        .auto-style8 {
            width: 114px;
            text-align: right;
        }
        .auto-style10 {
            text-align: left;
            width: 310px;
        }
        .auto-style11 {
            text-align: left;
        }
        .auto-style14 {
            width: 109px;
            text-align: right;
        }
        .auto-style15 {
            text-align: right;
        }
        .auto-style16 {
            width: 114px;
            text-align: right;
            font-size: large;
        }
        .auto-style17 {
            width: 109px;
            text-align: right;
            font-size: large;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="cen">
    <asp:Label ID="lblmsg1" runat="server"></asp:Label>
    <br />
    <asp:TextBox ID="TextBox1" runat="server" Height="21px" Width="171px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
    <asp:Button ID="Button1" runat="server" Text="Update" onclick="Button1_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button2" runat="server" Text="Delete" onclick="Button2_Click" />
    <br /><center>
    <asp:GridView ID="GVDisplay" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" CellPadding="4" CellSpacing="2" ForeColor="#333333" GridLines="None" SortedDescendingCellStyle-Height="25px" AllowSorting="True">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
            <asp:BoundField DataField="name" HeaderText="name" 
                SortExpression="name" />
            <asp:BoundField DataField="father" HeaderText="father" 
                SortExpression="father" />
            <asp:BoundField DataField="occupation" HeaderText="occupation" SortExpression="occupation" />
            <asp:BoundField DataField="course" HeaderText="course" 
                SortExpression="course" />
            <asp:BoundField DataField="courseyear" HeaderText="courseyear" 
                SortExpression="courseyear" />
            <asp:BoundField DataField="pcourse" HeaderText="pcourse" SortExpression="pcourse" />
            <asp:BoundField DataField="pcourseyear" HeaderText="pcourseyear" SortExpression="pcourseyear" />
            <asp:BoundField DataField="pcoursemarks" HeaderText="pcoursemarks" SortExpression="pcoursemarks" />
            <asp:BoundField DataField="sslc" HeaderText="sslc" SortExpression="sslc" />
            <asp:BoundField DataField="pu" HeaderText="pu" SortExpression="pu" />
            <asp:BoundField DataField="institute" HeaderText="institute" SortExpression="institute" />
            <asp:BoundField DataField="balancefee" HeaderText="balancefee" SortExpression="balancefee" />
            <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:BoundField DataField="aadhar" HeaderText="aadhar" SortExpression="aadhar" />
            <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
            <asp:BoundField DataField="sancamount" HeaderText="sancamount" SortExpression="sancamount" />
            <asp:BoundField DataField="income" HeaderText="income" SortExpression="income" />
            <asp:BoundField DataField="review" HeaderText="review" SortExpression="review" />
        </Columns>
        
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
        
    </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" 
                SelectCommand="SELECT * FROM [histbl]">
            </asp:SqlDataSource>
        </center>
    <asp:Label ID="lblmsg3" runat="server"></asp:Label>
        <br />
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <div class="auto-style2">
                    <table class="auto-style3">
                        <tr>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style14">&nbsp;</td>
                            <td class="auto-style11">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style16"><strong>Name:</strong></td>
                            <td class="auto-style10">
                                <asp:TextBox ID="TextBox2" runat="server" Height="25px" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Cant be Empty"></asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style17"><strong>Institution:</strong></td>
                            <td class="auto-style11">
                                <asp:TextBox ID="TextBox12" runat="server" Height="25px" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBox12" ErrorMessage="Cant be Empty"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style16"><strong>Fathers name:</strong></td>
                            <td class="auto-style10">
                                <asp:TextBox ID="TextBox3" runat="server" Height="25px" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox3" ErrorMessage="Cant be Empty"></asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style17"><strong>Bal Fees:</strong></td>
                            <td class="auto-style11">
                                <asp:TextBox ID="TextBox13" runat="server" Height="25px" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="TextBox13" ErrorMessage="Cant be Empty"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style16"><strong>Occupation:</strong></td>
                            <td class="auto-style10">
                                <asp:TextBox ID="TextBox4" runat="server" Height="25px" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox4" ErrorMessage="Cant be Empty"></asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style17"><strong>Year:</strong></td>
                            <td class="auto-style11">
                                <asp:TextBox ID="TextBox14" runat="server" Height="25px" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="TextBox14" ErrorMessage="Cant be Empty"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style16"><strong>Current Course:</strong></td>
                            <td class="auto-style10">
                                <asp:TextBox ID="TextBox5" runat="server" Height="25px" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox5" ErrorMessage="Cant be Empty"></asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style17"><strong>Email:</strong></td>
                            <td class="auto-style11">
                                <asp:TextBox ID="TextBox15" runat="server" Height="25px" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ControlToValidate="TextBox15" ErrorMessage="Cant be Empty"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style16"><strong>Course Year:</strong></td>
                            <td class="auto-style10">
                                <asp:TextBox ID="TextBox6" runat="server" Height="25px" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox6" ErrorMessage="Cant be Empty"></asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style17"><strong>Aadhar:</strong></td>
                            <td class="auto-style11">
                                <asp:TextBox ID="TextBox16" runat="server" Height="25px" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="TextBox16" ErrorMessage="Cant be Empty"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style16"><strong>Previous Course:</strong></td>
                            <td class="auto-style10">
                                <asp:TextBox ID="TextBox7" runat="server" Height="25px" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="TextBox7" ErrorMessage="Cant be Empty"></asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style17"><strong>Type:</strong></td>
                            <td class="auto-style11">
                                <asp:TextBox ID="TextBox17" runat="server" Height="25px" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ControlToValidate="TextBox17" ErrorMessage="Cant be Empty"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style16"><strong>Pre Course Year:</strong></td>
                            <td class="auto-style10">
                                <asp:TextBox ID="TextBox8" runat="server" Height="25px" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ControlToValidate="TextBox8" ErrorMessage="Cant be Empty"></asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style17"><strong>Sanctioned Amt:</strong></td>
                            <td class="auto-style11">
                                <asp:TextBox ID="TextBox18" runat="server" Height="25px" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="TextBox18" ErrorMessage="Cant be Empty"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style16"><strong>Pre course Marks:</strong></td>
                            <td class="auto-style10">
                                <asp:TextBox ID="TextBox9" runat="server" Height="25px" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox9" ErrorMessage="Cant be Empty"></asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style17"><strong>Income:</strong></td>
                            <td class="auto-style11">
                                <asp:TextBox ID="TextBox19" runat="server" Height="25px" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="TextBox19" ErrorMessage="Cant be Empty"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style16"><strong>SSLC marks:</strong></td>
                            <td class="auto-style10">
                                <asp:TextBox ID="TextBox10" runat="server" Height="25px" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="TextBox10" ErrorMessage="Cant be Empty"></asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style17"><strong>Review:</strong></td>
                            <td class="auto-style11">
                                <asp:TextBox ID="TextBox20" runat="server" Height="25px" TextMode="MultiLine" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ControlToValidate="TextBox20" ErrorMessage="Cant be Empty"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style16"><strong>PU marks:</strong></td>
                            <td class="auto-style10">
                                <asp:TextBox ID="TextBox11" runat="server" Height="25px" Width="150px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox11" ErrorMessage="Cant be Empty"></asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style14">&nbsp;</td>
                            <td class="auto-style11">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style15" colspan="2">
                                <asp:Label ID="lblmsg2" runat="server"></asp:Label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                            <td class="auto-style11" colspan="2">
                                <br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button3" runat="server" Height="27px" onclick="Button3_Click" Text="Submit" Width="69px" />
                                <br />
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
        </asp:MultiView>

</div>
</asp:Content>

