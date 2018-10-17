<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Library_Student.aspx.cs" Inherits="Library_Student" %>

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
        <a href="Courses_Offerred.aspx">Courses Offered</a>
        <a href="Placement.aspx">Placement</a>
        <a href="Contact_Us.aspx">Contact us</a>
         <a href="Admin_Login.aspx">Admin</a>	
		</div>
        <br /><br /><br />
    <div>
    <asp:Label ID="lblSearchBy" Text="Search By" runat="server" ></asp:Label>
        <asp:DropDownList ID="ddlSearchBy" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSearchBy_SelectedIndexChanged">
            <asp:ListItem Value="Select">  </asp:ListItem>
             <asp:ListItem Value="Department"> Department </asp:ListItem>
                  <asp:ListItem Value="BookCode">Book Code </asp:ListItem>       
        </asp:DropDownList>
        </div>
        <br />
        <br />
        <div>
        <asp:Label ID="lblDepartment" Text="Department" runat="server"></asp:Label>
        </div>
        <div>
            <asp:DropDownList ID="ddldepartment" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddldepartment_SelectedIndexChanged">      
                 <asp:ListItem Value="ALL"> ALL </asp:ListItem>
        </asp:DropDownList>
        </div>
         <div>
        <asp:Label ID="lblBookCode" Text="Book Code" runat="server"></asp:Label>
        <asp:TextBox ID="txtBookCode" Text="" runat="server"></asp:TextBox>
             <br />
             <br />
    <asp:Button ID="btnBookCodeSearch" Text="Search" runat="server" OnClick="btnBookCodeSearch_Click"></asp:Button>
    <asp:Button ID="btnBookCodeClearFields" Text="Clear Fields" runat="server" OnClick="btnBookCodeClearFields_Click"></asp:Button>

    </div>
<div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" Font-Names="Arial" Font-Size="11 pt" OnPageIndexChanging="OnPaging" DataKeyNames="BookCode,BookAvailability" >
<Columns>
    <asp:templatefield HeaderText="Select">
    <itemtemplate>
        <asp:checkbox ID="cbSelect" runat="server"></asp:checkbox>
    </itemtemplate>
</asp:templatefield>
    <asp:BoundField DataField="BookCode" HeaderText="Book Code" />
    <asp:BoundField DataField="BookName" HeaderText="Book Name" />
    <asp:BoundField DataField="BookAvailability" HeaderText="Book Availability" />
</Columns>
    </asp:GridView>
</div>
       <%-- <div>
<asp:Label ID="lblStudentID" Text="Enter your Student ID" runat="server"></asp:Label>
 <asp:TextBox ID="txtStudentID" Text="" runat="server"></asp:TextBox>
 <asp:button ID="btnTake" runat="server"
Text="Take" OnClick="btnTake_Click"></asp:button>
            <asp:button ID="btnReturn" runat="server"
Text="Return" OnClick="btnReturn_Click"></asp:button>
        </div>--%>
    </form>
</body>
</html>
