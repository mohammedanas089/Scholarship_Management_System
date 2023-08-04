<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.master" AutoEventWireup="true" CodeFile="portal.aspx.cs" Inherits="portal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/vertical-marquee.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style41 {
            width: 1187px;
        }
        .auto-style42 {
            width: 218px;
        }
        .auto-style44 {
            width: 393px;
        }
        .auto-style45 {
            font-size: large;
            width: 291px;
        }
        .auto-style46 {
            text-align: center;
            font-size: xx-large;
            text-decoration: underline;
        }
        .auto-style47 {
            font-size: large;

        }
        .auto-style48 {
            font-size: large;
            height: 24px;
        }
        .auto-style49 {
           
        }
        .auto-style50 {
            width: 291px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table>
        <tr style="width:100%">
            <td class="auto-style41"><center>
                <h2 class="auto-style42" style="box-sizing: border-box; font-family: Raleway, sans-serif; font-weight: 500; line-height: 1.1; color: rgb(68, 68, 68); margin: 0px; font-size: 34px; -webkit-font-smoothing: antialiased; letter-spacing: -1px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;font-variant:small-caps">About Trust</h2></center><br /><br />
                <p style="box-sizing: border-box; margin: 20px 0px; font-size: 18px; letter-spacing: 1px; color: rgb(119, 119, 119); font-family: proxima_novalight, Arial, Helvetica, sans-serif; -webkit-font-smoothing: antialiased; line-height: 1.2; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; orphans: 2; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
                    Al-Ameen Charitable Fund Trust, Bangalore, a charitable organization was founded by the great visionary and philanthropist Dr. Mumtaz Ahmed Khan at Bangalore in1979 with group of leading Muslim personalities. The aim of the Al-Ameen Charitable Fund Trust is to establish educational (General and Professional) institutions and welfare organizations principally for the benefit of Muslim community and other under privileged persons. Bijapur is one of the educationally and economically backward districts of Karnataka where Muslim population is sizable. For this reason the Medical College, Dental College and Nursing School were established at this historical city of the Great Adil Shahies.<br style="box-sizing: border-box; -webkit-font-smoothing: antialiased;" />
                    Al-Ameen Charitable Fund Trust has also various educational institution viz : Primary Schools, High Schools, Junior Colleges, Degree Colleges, College of education, College of Pharmacy, Engineering College, Technical Training Institutes, Scholarship Fund, Law College and Hospitals and orphanages throughout the length and breadth of the country.<br style="box-sizing: border-box; -webkit-font-smoothing: antialiased;" />
                    Today all the institutions of Al-Ameen Charitable Fund Trust reflect a modern hi-tech vision with the spirit of secularism in the field of education to build India as a strong Nation in the world.<br style="box-sizing: border-box; -webkit-font-smoothing: antialiased;" />
                    The following is the new Board of Trustees constituted at its meeting held on 29th November, 2003.</p>
            </td>
            <td style="border:thick groove #C0C0C0;text-align:right;" class="auto-style44"  >
                <center >Events</center> 
                
                    <div class="microsoft marqcontainer" style="border:thin double #C0C0C0;float:right;" align="right" >
                        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" class="marquee" Width="100%" >
                            <ItemTemplate >
                                <p style="text-align:left;font-size:20px"><asp:Label ID="noteLabel" runat="server" Text='<%# Eval("note") %>' /></p>
                                
                              
                                <p style="font-size:10px;text-align:right">updated on:<asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' /></p>
                                
<br />
                            </ItemTemplate>
                        </asp:DataList>
                        </div>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [note], [date] FROM [notetbl]"></asp:SqlDataSource>
                   
                
            </td>
        </tr>
       
    </table>
    <div>

        <table class="auto-style23">
            <tr>
                <td class="auto-style46"><strong><span class="auto-style49">Types of Scholarships Provided:</span></strong></td>
            </tr>
            <tr>
                <td class="auto-style48">Al-Ameem Scholarships relay on Charitable Fund Trusts, these Trusts alloy Scholarships to be provided to a large varity of applicants. Some Scholarships provide by Al-Ameen are listed below: </td>
            </tr>
            <tr>
                <td class="auto-style47"><strong>1) Scholarships for School Students: </strong>Many School students relay on scholarships to go through there educations, here in Al-Ameen we provide students with scholarships that facilitate them. Scholarships can be applied for Schools that are present in bangalore. These Students can specify there needs and all there expectations from this Scholarship and make a formal request for urgency and amount which will be overlooked and obliged by the Al-Ameen Management.<br />
                    <br />
                    <strong>2) Scholarships for Pre-University Students:</strong> Students that require the help of scholarships can apply here and submit there necessary documents to be eligable for the scholarship. Scholarships can be applied for Pre-Universities that are present in bangalore. These Students can specify there needs and all there expectations from this Scholarship and make a formal request for urgency and amount which will be overlooked and obliged by the Al-Ameen Management.<br />
                    <br />
                    <strong>3) Post &amp; Under Graduates:</strong> Students that are persuing there post or under graduations can apply for scholarsip. Scholarships can be applied for Universities that are present in bangalore. These Students can specify there needs and all there expectations from this Scholarship and make a formal request for urgency and amount which will be overlooked and obliged by the Al-Ameen Management.<br />
                    <br />
                    <strong>4) Special Scholarships:</strong> We provide some limited Special scholarships to students that are finicialy week but show excellent perfomance in there academics. We try to encourage those with talent and appling hard work by helping them financialy. To be eligable for this work hard and gain knowledge.</td>
            </tr>
        </table>

    </div><br /><br />
    <table class="auto-style1" style="margin:auto">
        <tr>
            <td class="auto-style45">To Apply for Scholarship Click Here:</td>
     
            <td class="auto-style50">
                
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Apply Scholarship" Height="30px" Width="180px" Font-Bold="True" />

            </td>
        </tr>
    </table>
  
</asp:Content>

