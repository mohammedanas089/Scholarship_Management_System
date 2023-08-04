<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.master" AutoEventWireup="true" CodeFile="type.aspx.cs" Inherits="type" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style36 {
            font-weight: bold;
        }
        .auto-style37 {
            width: 772px;
        }
        .auto-style38 {
            width: 772px;
            text-align: right;
        }
    .auto-style41 {
        width: 748px;
        color: #FFFFFF;
        text-decoration: none;
        text-align: right;
            height: 51px;
            font-size: large;
            background-color: #188A5A;
        }
    .auto-style42 {
        text-align: center;
        font-size: x-large;
    }
    .auto-style43 {
        text-align: left;
        font-size: large;
    }
    .auto-style44 {
        color: #000000;
        text-decoration: none;
        text-align: center;
    }
    .auto-style45 {
        text-decoration: underline;
    }
        .auto-style46 {
            width: 748px;
            text-align: right;
        }
        .auto-style47 {
            height: 51px;
            background-color: #188A5A;
        }
        .auto-style48 {
            background-color: #188A5A;
        }
        .auto-style49 {
            width: 748px;
            text-align: right;
            color: #FFFFFF;
            font-size: large;
            background-color: #188A5A;
        }
        .auto-style50 {
            font-size: medium;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
        <table class="auto-style23">
            <tr>
                <td class="auto-style44" colspan="2"><strong><span class="auto-style3">NOTE:</span> </strong>1) Application form which is incomplete or with false information will be rejected.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 2) ISSUING &amp; SUBMISSION OF APPLICATION FORM <span class="auto-style45"><strong>DOES NOT</strong></span> GUARANTEE AWARD OF SCHOLARSHIP.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style41">Click here to Apply as Freasher:</td>
                <td class="auto-style47"><strong>    
        &nbsp;&nbsp;    
        <asp:Button ID="Button1" runat="server" Text="Apply as Fresher" OnClick="Button1_Click" CssClass="auto-style36" Width="202px" Height="35px" />
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style49">Enter your Scholarship ID to Renew Scholarship:</td>
                <td class="auto-style48">
        <asp:TextBox ID="TextBox1" runat="server" Height="31px" Width="176px"></asp:TextBox>
                    <strong>&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Apply for Renewal" OnClick="Button2_Click" CssClass="auto-style36" Height="35px" Width="197px" />
        
    
                    </strong></td>
            </tr>
            <tr>
                <td class="auto-style46">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style42" colspan="2"><strong>ENCLOSE THE FOLLOWING DOCUMENTS</strong></td>
            </tr>
            <tr>
                <td class="auto-style43" colspan="2">1) A Letter from the Application in His / Her own handwriting justifying the need for Scholarship.<br />
                    2) Mark Sheet of (a)S.S.L.C (b)P.U.C (c)Degree(All Semesters)<br />
                    3) Fee structure / Demand note from the college.<br />
                    4) Proof of Residence (Rent Receipt / Aadhaar Card / College ID Card etc.) Xerox Copies.<br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <span class="auto-style50">*If there are any enquiries and trouble with appling or sanctioning of scholarship please contact the Al-Ameen Scholarship office for further information.</span></td>
            </tr>
        </table>
        
    
</asp:Content>

