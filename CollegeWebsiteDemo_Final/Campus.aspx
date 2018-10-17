<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Campus.aspx.cs" Inherits="Campus" %>

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
        <a href="Labs.aspx">Labs</a>
        <a href="Canteens.aspx">Canteen</a>
        <a href="Classrooms.aspx">Classrooms</a>
        <a href="Playgrounds.aspx">Playgrounds</a>
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
        <asp:Timer ID="Timer1" runat="server" Interval="5000" OnTick="Timer1_Tick"></asp:Timer>
        <asp:Image ID="ImageControl"  Height="300px" Width="1275px" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>

<p><b>Starkville Campus</b></p>

<p>The main campus of Mississippi State University adjoins the city of Starkville, 25 miles west of Columbus and 120 miles northeast of Jackson. Highways 82, 12, and 25 provide easy access to the University. Air service is available through the Golden Triangle Regional Airport located between Starkville and Columbus. The University has its own postal designation and zip code: Mississippi State, MS 39762. The Starkville zip code is 39759.</p>

<p><b>Meridian Campus</b></p>

<p>Mississippi State University-Meridian is a regional, upper-division, degree-granting campus of Mississippi State University (MSU).  Located in east-central Mississippi, the campus is non-residential and provides site-based credit and non-credit coursework.  Courses are taught by highly qualified faculty, who are experts in their fields.  Junior, senior, and graduate-level courses offered at JSU-Meridian enable students to fulfill all or some requirements for bachelor’s, master’s, specialist’s, and doctoral degrees.  Students may also elect to enroll in specific classes for professional or personal growth.</p>
</form>
</body>
</html>
