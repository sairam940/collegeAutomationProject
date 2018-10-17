<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Playgrounds.aspx.cs" Inherits="Playgrounds" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div id="header" >
			 <b>Mississippi State University</b>
		</div>
     <div id="horizontal">
		<a href="Default.aspx">Home</a>
        <a href="AboutUs.aspx">About Us</a>
         <a href="History.aspx">History</a>
        <a href="Campus.aspx">Campus</a>
        <a href="Labs.aspx">Labs</a>
        <a href="Canteens.aspx">Canteen</a>
        <a href="Classrooms.aspx">Classrooms</a>
        <a href="Library_Student.aspx">Library</a>
        <a href="Courses_Offerred.aspx">Courses Offered</a>
        <a href="Placement.aspx">Placement</a>
        <a href="Contact_Us.aspx">Contact us</a>
         <a href="Admin_Login.aspx">Admin</a>	
		</div>
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
        <asp:Timer ID="Timer1" runat="server" Interval="6000" OnTick="Timer1_Tick"></asp:Timer>
        <asp:Image ID="ImageControl"  Height="300px" Width="1275px" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <br /><br /><br />
    <div>
    <p>The Golden Eagles have excelled in all areas of athletics. Mississippi has captured national titles twice in football and three times in track and field. In 2011, the Golden Eagle football team finished as the #19 team in the Associated Press (AP) College Poll. The Golden Eagle baseball team are two-time Conference USA champions and have been invited to twelve regional NCAA tournaments and also a trip to the College World Series. The Golden Eagle baseball team has the #3 recruiting class in the country by Baseball America. The Southern Miss basketball team is a one-time champion of the NIT tournament.</p>
    </div>
    </form>
</body>
</html>
