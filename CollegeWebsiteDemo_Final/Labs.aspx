<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Labs.aspx.cs" Inherits="Labs" %>

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
    <div>
    <p>The university has various labs for the Department of Chemical Engineering, Mechanical Engineering and Computer Engineering.</p>
        <p>Pictures of various laboratories are shown.</p>
    </div>
    </form>
</body>
</html>
