<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Mississippi State University</title>
	<meta http-equiv="Content-Type" content="text/html;charset=iso-8859-1" />
	<link rel="stylesheet" type="text/css" href="images/style.css" />
</head>
<body>
    <div id="header" >
			 <b>Mississippi State University</b>
		</div>
    <div id="horizontal">
		<%--<a href="#">Home</a> --%>
        <a href="AboutUs.aspx">About Us</a>
        <a href="History.aspx">History</a>
        <a href="Campus.aspx">Campus</a>
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
        
    <div>
        <div id="heading"><b>Student Login</b></div>
        <br />
     </div>
        <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Click this link to register <a href="Registration.aspx"><b>Registration</b></a>
        </div>    
    <div >
    <asp:Label ID="lblUserName" Text="Enter User Name" runat="server"></asp:Label>
    <asp:TextBox ID="txtUserName" Text="" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator runat="server" id="reqUserName" controltovalidate="txtUserName" errormessage="Please enter your User name!" />
    <br /><br />
    </div>
        <div >
    <asp:Label ID="lblStudentID" Text="Enter Student ID" runat="server"></asp:Label>
    <asp:TextBox ID="txtStudentID" Text="" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" id="reqStudentID" controltovalidate="txtStudentID" errormessage="Please enter your StudentID!" />
    <br /><br />
    </div>
        <div>
    <asp:Label ID="lblPassword" Text="Enter Password" runat="server"></asp:Label>
    <asp:TextBox ID="txtPassword" Text="" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" id="reqPassword" controltovalidate="txtPassword" errormessage="Please enter your Password" />
            <br />
        <br />
    
        <div>
        <asp:Button ID="btnLogin" Text="Login" runat="server" OnClick="btnLogin_Click"></asp:Button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <asp:Button ID="btnClearFields" Text="clearfields" OnClick="btnClearFields_Click" runat="server"></asp:Button>
            </div>
    </div>
    </form>
</body>
</html>
