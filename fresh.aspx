<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="fresh.aspx.cs" Inherits="fresh" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .formsec {
            border-radius: 5px;
            width: 60%;
            margin: auto;
            padding: 10px;
            background-color: rgb(195, 224, 137);
        }

        td {
            padding: 5px;
        }

        label {
            padding-left: 5px;
        }

        input {
            margin-left: 5px;
        }

        .form {
            background-color: rgba(224, 224, 224, 0.897);
        }

        .auto-style8 {
            text-align: center;
        }

        .auto-style9 {
            width: 100%;
        }

        .auto-style10 {
            height: 29px;
        }

        .auto-style11 {
            font-size: x-large;
        }

        .auto-style12 {
            font-size: small;
            color: #CCCCCC;
        }

        .auto-style13 {
            color: #00CC00;
        }

        .auto-style14 {
            width: 47px;
        }
        .auto-style15 {
            height: 30px;
        }
        .auto-style16 {
            height: 31px;
        }
        .auto-style21 {
            width: 195px;
        }
        .auto-style22 {
            width: 195px;
            height: 30px;
        }
        .auto-style23 {
            height: 31px;
            width: 684px;
        }
        .auto-style24 {
            height: 29px;
            width: 684px;
        }
        .auto-style25 {
            width: 684px;
        }
        .auto-style45 {
            width: 240px;
            font-size: x-large;
            text-align: center;
            height: 31px;
        }
        .auto-style46 {
            font-size: large;
            color: #000000;
            text-align: left;
        }
        .auto-style47 {
            color: black;
            border-width: 1px 1px 1px 1px;
            border-radius: 5px;
            line-height: 25px;
            text-decoration: none;
        }
        .auto-style48 {
            width: 159px;
            height: 159px;
        }
    </style>
    <script>
        function validate1(x) {
            if (x == 0) document.getElementById("sslc").style.display = "block";
            else document.getElementById("sslc").style.display = "none";
            return;
        }
        function validate2(x) {
            if (x == 0) document.getElementById("pu").style.display = "block";
            else document.getElementById("pu").style.display = "none";
            return;
        }
    </script>
    <link href="css/form.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    

        <asp:Label ID="Label1" runat="server" Text="rcode" Visible="False"></asp:Label>

        <asp:Label ID="Label2" runat="server" Text="ccode" Visible="False"></asp:Label>

        <asp:Label ID="Label4" runat="server" Text="Label" Visible="False"></asp:Label>


        <asp:Label ID="status" runat="server" Text="Label" Visible="False"></asp:Label>



        <div id="form" runat="server">

            <table class="auto-style9 printform" >
                <tr>
                    <td colspan="3" class="printhead"><h1>AL-AMEEN SCHOLARSHIP TRUST</h1><br />
                        <span>Ground Floor,Administrative Block,Al-Ameen College Campus,Hosur Road,Bangalore-560027</span><br />
                        <span><b>Ph:080 22235626,22278468 Extn.:111 Direct Ph.No.: 080 22116401</b></span><br />
                        <span>Email:alameenscholarship@yahoo.com</span></td>
                </tr>
                <tr>
                    <td colspan="3" class="shead">GENERAL</td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style23">Name : <asp:Label ID="lblname" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style16">Aadhar : <asp:Label ID="lbladhar" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style24" colspan="2">Gender :
                        <asp:Label ID="lblgen" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style10">DOB :
                        <asp:Label ID="lbldob" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style24" colspan="2">Religion :
                        <asp:Label ID="lblrel" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style10">Category :
                        <asp:Label ID="lblcaste" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style24" colspan="2">Father :
                        <asp:Label ID="lblfather" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style10">Mother :
                        <asp:Label ID="lblmother" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style25" colspan="2">Income :
                        <asp:Label ID="lblincome" runat="server"></asp:Label>
                    </td>
                    <td>Occupation : <asp:Label ID="lblocc" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="shead">ACADEMICS</td>
                </tr>
                <tr>
                    <td colspan="3">Institute : <asp:Label ID="lblcol" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style21">Current course :
                        <asp:Label ID="lblcourse" runat="server"></asp:Label>
                    </td>
                    <td colspan="2">Class :
                        <asp:Label ID="lblcourseyear" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style22">Previous course :
                        <asp:Label ID="lblprecourse" runat="server"></asp:Label>
                    </td>
                    <td colspan="2" class="auto-style15">Class :
                        <asp:Label ID="lblprecourseyear" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style25">Fee balance : <asp:Label ID="lblbal" runat="server"></asp:Label>
                    </td>
                    <td>Marks : <asp:Label ID="lblmarks" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style25">SSLC : <asp:Label ID="lblsslc" runat="server"></asp:Label>
                    </td>
                    <td>PU : <asp:Label ID="lblpu" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="shead">BANK</td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style23">Acc name :
                        <asp:Label ID="lblacname" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style16">Acc number :
                        <asp:Label ID="lblaccno" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style25">Bank:
                        <asp:Label ID="lblbank" runat="server"></asp:Label>
                    </td>
                    <td>IFSC :
                        <asp:Label ID="lblifsc" runat="server"></asp:Label>
                        (<asp:Label ID="lblbranch" runat="server"></asp:Label>
                        )</td>
                </tr>
                <tr>
                    <td colspan="3" class="shead">CONTACT</td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style25">E-mail :
                        <asp:Label ID="lblemail" runat="server"></asp:Label>
                    </td>
                    <td>Mobile : <asp:Label ID="lblmob" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">Address :
                        <asp:Label ID="lbldoor" runat="server"></asp:Label>
                        ,<asp:Label ID="lblstreet" runat="server"></asp:Label>
                        ,<asp:Label ID="lblarea" runat="server"></asp:Label>
                        ,<asp:Label ID="lblcity" runat="server"></asp:Label>
                        -<asp:Label ID="lblpin" runat="server"></asp:Label>
                    </td>
                </tr>
                
            </table>
            <div class="foot" style="margin-left:80%;
    margin-top:50px;">
                Applicant Signature
                </div>
        </div>
        <br />

        <div class="freshform">

            <h1>Scholarship Application Form-FRESH</h1>
            <h4>Fill out the form carefully</h4>
            <br />
            <br />
            <asp:Panel ID="Panel4" runat="server">
                <table bgcolor="#FFCDCA" class="style1">
                    <tr>
                        <td class="auto-style45">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/img/cancel-b.png" />
                        </td>
                        <td>All fields&nbsp; needs to be filled.Please try again.</td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="Panel7" runat="server">
                <table bgcolor="#FFCDCA" class="style1">
                    <tr>
                        <td class="auto-style45">
                            <asp:Image ID="Image6" runat="server" ImageUrl="~/img/cancel-b.png" />
                        </td>
                        <td>Enter Income Field Correctly.</td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server">
                <table bgcolor="#FFCDCA" class="style1">
                    <tr>
                        <td class="auto-style45">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/img/cancel-b.png" />
                        </td>
                        <td>Please Enter a valid Aadhar ID.</td>
                    </tr>
                </table>
            </asp:Panel>
            
            <asp:Panel ID="Panel6" runat="server">
                <table bgcolor="#FFCDCA" class="style1">
                    <tr>
                        <td class="auto-style45">
                            <asp:Image ID="Image5" runat="server" ImageUrl="~/img/cancel-b.png" />
                        </td>
                        <td>The Entered Aadhar already exists.</td>
                    </tr>
                </table>
            </asp:Panel>

            <fieldset>
                <legend>General</legend>
                <table>

                    <tr>
                        <td colspan="2">
                            <label for="">Name:</label>
                            *<br>
                            <asp:TextBox ID="nametxt" runat="server" CssClass="txt"></asp:TextBox>
                        </td>
                        <td>
                            <label for="">Gender:</label> *<br />
                            <asp:RadioButtonList ID="rdlgen" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="male">Male</asp:ListItem>
                                <asp:ListItem Value="female">Female</asp:ListItem>
                                <asp:ListItem Value="others">Others</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <label for="">DOB:              <br>
                            <asp:TextBox ID="dobtxt" runat="server" CssClass="txt dob" TextMode="Date"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" cssclass="ddl">
                            <label for="">
                                Religion<br />
                            </label>
                            <asp:DropDownList ID="ddlreligion" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlreligion_SelectedIndexChanged" CssClass="txt ddl">
                            </asp:DropDownList>
                        </td>
                        <td colspan="2">
                            <label for="">Category</label>
                            <asp:DropDownList ID="ddlcaste" runat="server" CssClass="txt">
                            </asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label for="">Father Name:*</label>
                            <asp:TextBox ID="fathertxt" runat="server" CssClass="txt"></asp:TextBox>
                        </td>
                        <td class="">
                            <label for="">Mother Name:</label>
                      
                            <br>
                            <asp:TextBox ID="txtmother" runat="server" CssClass="txt"></asp:TextBox>
                        </td>
                        <td>
                            <label for="">Income:        
                            *<br>
                            <asp:TextBox ID="txtincom" runat="server" CssClass="txt"></asp:TextBox>
                        </td>
                        <td>
                            <label for="">Occupation:              *<br>
                            <asp:TextBox ID="occupationtxt" runat="server" CssClass="txt"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="">Aadhaar:</label>
                            *<br>
                            <asp:TextBox ID="adhartxt" runat="server" CssClass="txt"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <asp:Panel ID="Panel5" runat="server">
                <table bgcolor="#FFCDCA" class="style1">
                    <tr>
                        <td class="auto-style45">
                            <asp:Image ID="Image4" runat="server" ImageUrl="~/img/cancel-b.png" />
                        </td>
                        <td>Please Enter Fee details correctly.</td>
                    </tr>
                </table>
            </asp:Panel>
            <fieldset class="">
                <legend>Academics</legend>
                <table>

                    <tr>
                        <td colspan="3">
                            <label for="">Institute:</label>
                            *<br>
                            <asp:TextBox ID="ddlcol" runat="server" CssClass="txt"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="">
                            <label for="">Annual Fee:</label>
                            *<br>
                            <asp:TextBox ID="feetxt" runat="server" OnTextChanged="TextBox1_TextChanged" CssClass="txt"></asp:TextBox>
                        </td>
                        <td class="">Paid Fee:*<br />
                            <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged" CssClass="txt"></asp:TextBox>
                        </td>
                        <td class="">Balance:<br />
                            <asp:TextBox ID="balancetxt" runat="server" ReadOnly="True" CssClass="txt"> </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Current Course*<br>
                            <asp:DropDownList ID="ddlcourse" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" CssClass="txt">
                            </asp:DropDownList>
                            &nbsp;</td>
                        <td class="">Current Academic Year*<br>
                            <asp:DropDownList ID="ddlcourseyear" runat="server" CssClass="txt">
                            </asp:DropDownList>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="">
                            <label for="">Previous Course:</label>
                            *<br>
                            <asp:DropDownList ID="ddlprecourse" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlprecourse_SelectedIndexChanged" CssClass="txt">
                            </asp:DropDownList>
                            &nbsp;</td>
                        <td class="">
                            <label for="">Previous Academic Year:</label>
                            *<br>
                            <asp:DropDownList ID="ddlprecourseyear" runat="server" CssClass="txt">
                            </asp:DropDownList>
                            &nbsp;
                        </td>
                        <td class="">
                            <label for="">Marks Obtained(in %):</label>
                            *<br>
                            <asp:TextBox ID="markstxt" runat="server" CssClass="txt"></asp:TextBox>
                            &nbsp;</td>
                    </tr>
                </table>
            </fieldset>
            <fieldset class="">
                <legend>Bank</legend>
                <table>
                    <tr>
                        <td>
                            <label for="">Account Name:</label>
                       
                            <br>
                            <asp:TextBox ID="txtaccname" runat="server" CssClass="txt"></asp:TextBox>
                        </td>
                        <td>
                            <label for="">Account NO:        
                            *<br>
                            <asp:TextBox ID="txtaccno" runat="server" CssClass="txt"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="">
                            <label for="">Bank Name:        
                            <br>
                            <asp:TextBox ID="txtbank" runat="server" CssClass="txt"></asp:TextBox>
                        </td>
                        <td class="">
                            <label for="">IFSC:        
                            *<br>
                            <asp:TextBox ID="txtifsc" runat="server" CssClass="txt"></asp:TextBox>
                        </td>
                        <td>
                            <label for="">Branch:        
                            <br>
                            <asp:TextBox ID="txtbranch" runat="server" CssClass="txt"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <asp:Panel ID="Panel3" runat="server">
                <table bgcolor="#FFCDCA" class="style1">
                    <tr>
                        <td class="auto-style45">
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/img/cancel-b.png" />
                        </td>
                        <td>Please Enter a valid E-mail ID/Mobile Number.</td>
                    </tr>
                </table>
            </asp:Panel>
            <fieldset>
                <legend>Additional Information</legend>
                <table>

                    <tr>
                        <td>
                            <label for="">Mobile:</label>
                       
                            <br>
                            <asp:TextBox ID="txtmob" runat="server" CssClass="txt"></asp:TextBox>
                        </td>
                        <td>
                            <label for="">E-mail:             *</label><br>
                            <asp:TextBox ID="emailtxt" runat="server" CssClass="txt"></asp:TextBox>
                        </td>
                        
       
                    </tr>
                    <tr>
                        <td>
                            <label for="">Door No:</label>
                       
                            <br>
                            <asp:TextBox ID="txtdoor" runat="server" CssClass="txt"></asp:TextBox>
                        </td>
                        <td>
                            <label for="">Street: </label>       
                            <br>
                            <asp:TextBox ID="txtstreet" runat="server" CssClass="txt"></asp:TextBox>
                        </td>
                        <td>
                            <label for="">Area:     </label>   
                            <br>
                            <asp:TextBox ID="txtarea" runat="server" CssClass="txt"></asp:TextBox>
                        </td>

                        <td>City:<asp:TextBox ID="txtcity" runat="server" CssClass="txt"></asp:TextBox>
                        </td>
                        <td>Pincode:<br />
                            <asp:TextBox ID="txtpin" runat="server" CssClass="txt"></asp:TextBox>
                        </td>

                    </tr>
                    <tr>
                        <td>Completed SSLC*      <td>
                            <input type="radio" name="sslc" value="yes" onclick="validate1(0)" checked="true" />Yes
                            <input type="radio" name="sslc" value="no" onclick="validate1(1)" />No
                        </td>
                        <td id="sslc">
                            <asp:TextBox ID="sslctxt" runat="server" CssClass="txt"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>Completed PUC*</td>
                        <td>
                            <input type="radio" name="pu" value="yes" onclick="validate2(0)" checked="true" />Yes
                            <input type="radio" name="pu" value="no" onclick="validate2(1)" />No
                        </td>
                        <td id="pu">
                            <asp:TextBox ID="putxt" runat="server" CssClass="txt"></asp:TextBox>
                        </td>
                    </tr>

                </table>

            </fieldset>
        </div>
        <div>
        </div>
        <asp:Panel ID="Panel1" runat="server">
            <div class="auto-style8">

                <br />
                <img src="img/business-and-finance.png" width="7%" /><br />
                <span class="auto-style11"><strong>Verification</strong></span><br />
                <em><span class="auto-style46">We will send you a One Time Password on your E-mail
                    <br />
                </span><span class="auto-style12">
                <br />
                </span></em>
                <br />
                <asp:TextBox ID="TextBox8" runat="server" CssClass="auto-style47" Height="28px" Width="200px"></asp:TextBox>
                <br />
                <br />

                <asp:LinkButton ID="Button3" runat="server" CssClass="otp2" OnClick="Button3_Click" Text="OTP"></asp:LinkButton>
                <asp:LinkButton ID="Button2" CssClass="otp2" OnClick="Button2_Click" Text="Verify" runat="server"></asp:LinkButton>

                <br />

                Didn&#39;t receive the verification OTP?&nbsp;&nbsp; <asp:LinkButton ID="LinkButton1" runat="server" OnClick="Button3_Click">Resend again</asp:LinkButton>

            </div>

        </asp:Panel>
        <div class="auto-style8" style="vertical-align: middle">
            <span class="auto-style13" runat="server" id="v"><strong style="vertical-align: middle">Verified!!!</strong></span><img runat="server" id="tick" src="img/check.png" class="auto-style48" />
        </div>
        <br />
        <div class="freshform" id="docsec" runat="server">
            <fieldset>
                <legend>Documents</legend>
                <table>
                    <tr>
                        <td>A Letter from the Applicant in His/Her own handwriting justifying the need for scholarship</td>
                        <td rowspan="4">
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>Mark Sheets of SSLC,PUC &amp; DEGREE(based on your current studies)</td>
                    </tr>
                    <tr>
                        <td>Fee structure/Demand note from the college</td>
                    </tr>
                    <tr>
                        <td>Proof of Residence(Rent Receipt/Aadhaar/College ID,etc)</td>
                    </tr>
                    <tr>
                        <td colspan="2" class="auto-style30">*Please upload the above documents as a single pdf </td>
                    </tr>
                </table>
            </fieldset>
            
        </div>
        <br />
        <div class="auto-style8">

                <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" Height="29px" Width="87px" />

            </div>
 
</asp:Content>

