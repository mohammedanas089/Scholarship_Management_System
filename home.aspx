<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style36 {
            width: 1124px;
            height: 300px;
        }
        .auto-style37 {
            width: 847px;
        }
        .auto-style38 {
            text-decoration: underline;
        }
        .auto-style41 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="auto-style23">
        <tr style="height:300px;">
            <td >
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
    <asp:Timer ID="Timer1" runat="server" Interval="2000" OnTick="Timer1_Tick">

    </asp:Timer><center>
    <asp:Image ID="Image1" runat="server" /></center>
</ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <br />
  
    <br />
  
    <span class="auto-style3"><strong>Al-Ameen Arts,Science and Commerce College, Affiliated to Banglore Central University, Reaccredited by NAAC with &#39;A&#39; Grade. (The institution, having state-of-the-art infrastructure and committed to quality and excellence).<br />
    <br />
    </strong></span>
  
    <br />
  
<div style="background-image: none; background-position: center center; background-repeat: repeat; background-attachment: fixed; background-color: #CCCCCC;"><br /><br />

    <center>

    <table class="auto-style36" style="background-color: #FFFFFF; border-style: groove">
        <tr>
            <td class="auto-style37">
                <div class="notify-layer-head" style="box-sizing: border-box; color: rgb(51, 51, 51); font-family: Lato, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
                    <h2 class="auto-style38" style="box-sizing: border-box; font-family: Raleway, sans-serif; font-weight: 400; line-height: 1.1; color: rgb(0, 0, 0); margin-top: 20px; margin-bottom: 10px; font-size: 30px;">Dr. MUMTAZ AHMED KHAN</h2>
                    <p class="auto-style38" style="box-sizing: border-box; margin: 0px 0px 10px; font-family: Lato, sans-serif !important;">
                        Founder of Al-Ameen Movement</p>
                </div>
                <div class="notify-layer-content" style="box-sizing: border-box; color: rgb(51, 51, 51); font-family: Lato, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
                    <div class="notification-content-text" style="box-sizing: border-box;">
                        <h3 class="auto-style38" style="box-sizing: border-box; font-family: Lato, sans-serif !important; font-weight: 500; line-height: 1.1; color: inherit; margin-top: 20px; margin-bottom: 10px; font-size: 24px;">Tribute to Doctor Sab— Father of Al-Ameen Movement</h3>
                        <p style="box-sizing: border-box; margin: 0px 0px 10px; font-family: Lato, sans-serif !important; font-size: 16px; font-weight: normal; line-height: 1.6; text-align: justify;">
                            On 6 th September, 1935, ‘Allah willed’ that a soul should be born in the coastal district of Tiruchinapally to light the torch of education in Bangalore and spread its radiance across the country. Indeed, ‘it happened’ through the birth of Mumtaz Ahmed Khan, who, lovingly came to be known as Doctor Sab to occupy his due place in the hearts of Bangaloreans later to become Baba-E-Taleem to be reckoned with many luminaries in the realm of education. He envisaged education as the chief tool of character building vis-à-vis nation building, which Almighty Allah fructified through AL-AMEEN EDUCATIONAL MOVEMENT.</p>
                    </div>
                </div>
            </td>
            <td>
                <asp:Image ID="Image3" runat="server" ImageUrl="~/img/dr-403x403.jpg" />
            </td>
        </tr>
    </table></center>

    
    <br /><br />
</div>
    <div>
        <center>

            <br />
            <br />

            <asp:HyperLink ID="HyperLink26" runat="server" ImageUrl="~/img/facebook-qrcode.jpg" NavigateUrl="https://www.facebook.com/alameendegreecollege"></asp:HyperLink>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink27" runat="server" ImageUrl="~/img/instagram-qrcode.jpg" NavigateUrl="https://www.instagram.com/alameen_degree/"></asp:HyperLink>

            <br />
            <br />

        </center>
    </div>

</asp:Content>

