<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Courses_Offerred.aspx.cs" Inherits="Courses_Offerred" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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
        <a href="Playgrounds.aspx">Playgrounds</a>
        <a href="Library_Student.aspx">Library</a>
        <a href="Placement.aspx">Placement</a>
        <a href="Contact_Us.aspx">Contact us</a>
         <a href="Admin_Login.aspx">Admin</a>	
		</div>
        <br /><br /><br />
    <div>
        <asp:Label ID="lblDepartment" Text="Select Department" runat="server"></asp:Label>
        </div>
        <div>
            <asp:DropDownList ID="ddldepartment" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddldepartment_SelectedIndexChanged">      
        </asp:DropDownList>
        </div>
        <br /><br /><br />
        <div>
        <asp:Label ID="lblCourses" Text="Select Course" runat="server"></asp:Label>
        </div>
        <div>
            <asp:DropDownList ID="ddlCourse" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlcourse_SelectedIndexChanged" >      
        </asp:DropDownList>
        </div>
        <br /><br />
        <br /><br />
        <div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" Font-Names="Arial" Font-Size="11 pt" OnPageIndexChanging="OnPaging" DataKeyNames="SubjectCode,SubjectName" >
<Columns>
    <asp:BoundField DataField="SubjectCode" HeaderText="Subject Code" />
    <asp:BoundField DataField="SubjectName" HeaderText="Subject Name" />
</Columns>
    </asp:GridView>
  </div>
    </form>
</body>
</html>
