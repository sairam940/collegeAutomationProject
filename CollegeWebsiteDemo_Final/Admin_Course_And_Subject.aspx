<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Course_And_Subject.aspx.cs" Inherits="Admin_Course_And_Subject" %>

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
        <a href="Admin.aspx">Admin Home</a>
        <a href="Admin_Registration.aspx">Registration Management</a>
        <a href="Admin_Login_Library_Page.aspx">Library Management</a>
        <a href="Admin_Department.aspx">Department Management</a>
        <%--<a href="Admin_Course_And_Subject.aspx">Course Management</a>--%>
        <a href="Admin_Subject.aspx">Subject Management</a>
        <a href="Admin_Faculty_Registration.aspx">Faculty Management</a>
    </div>
        <div>
            
            
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnLogout" Text="Logout" runat="server" OnClick="btnLogout_Click"></asp:Button>
        </div>
     <div id="heading"><b>Course Details</b></div>
        <br /><br /><br /><br/>
    <div style="background-color:darkblue;font-size:medium;width:auto;color:white" >Course Details</div>
    <br /><br />
<asp:Panel ID="pnlLeft" runat="server" style="float: left; width:40%; display: inline;">
    <div>
    <asp:GridView ID="gvCoursegrid" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" Font-Names="Arial" Font-Size="11 pt" OnPageIndexChanging="OnPaging">
<Columns>
 <asp:templatefield HeaderText="Select" ItemStyle-Width="50">
    <itemtemplate>
        <asp:checkbox ID="cbSelectCourse" runat="server"></asp:checkbox>
    </itemtemplate>
</asp:templatefield>

<asp:TemplateField HeaderText="Course Code" ItemStyle-Width="70">
            <ItemTemplate>
                <asp:TextBox ID="txtgvCourseCode" runat="server" Text='<%# Eval("CourseCode") %>'  Width="70"/>
            </ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Course Type" ItemStyle-Width="100">
            <ItemTemplate>
                <asp:TextBox ID="txtgvCourseType" runat="server"  Text='<%# Eval("CourseType") %>'  Width="100"/>
            </ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Course Name" ItemStyle-Width="250">
            <ItemTemplate>
                <asp:TextBox ID="txtgvCourseName" runat="server"  Text='<%# Eval("CourseName") %>'  Width="250"/>
            </ItemTemplate>
</asp:TemplateField>
  
</Columns>
    </asp:GridView>
</div>
      <div>
        <br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <asp:button ID="btnCourseUpdate" runat="server"
Text="Update Course" OnClick="btnCourseUpdate_Click"></asp:button>
          &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:button ID="btnCourseDelete" runat="server"
Text="Delete Course" OnClick="btnCourseDelete_Click"></asp:button>
        </div>
</asp:Panel>

<asp:Panel ID="pnlRight" runat="server" style="float:left; display: inline;">
             <div>
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblinsCourseCode" Text="Enter Course Code" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtinsCourseCode" Text="" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" id="reqinsCourseCode" controltovalidate="txtinsCourseCode" errormessage="Please enter the Course Code" Enabled="false"/>
    <br /><br />
    </div> 
    <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblinsCourseType" Text="Enter Course Type" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtinsCourseType" Text="" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" id="reqinsCoursType" controltovalidate="txtinsCourseType" errormessage="Please enter the Course Type" Enabled="false"/>
    <br /><br />
    </div>
    <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblDepartment" Text="Select a Department" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddldepartment" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddldepartment_SelectedIndexChanged">      
                 <asp:ListItem Value="Select"> Select</asp:ListItem>
        </asp:DropDownList>
        <br /><br />
        </div> 
     <div>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblinsCourseName" Text="Enter Course Name" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtinsCourseName" Text="" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" id="reqinsCourseName" controltovalidate="txtinsCourseName" errormessage="Please enter the Course Name" Enabled="false"/>
    <br /><br />
    </div>  
     <div>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:button ID="btnCourseInsert" runat="server" Text="Insert" OnClick="btnCourseInsert_Click"></asp:button>
         &nbsp;&nbsp;&nbsp;&nbsp;
<asp:button ID="btnCourseClearFields" runat="server" Text="Clear Fields" OnClick="btnCourseClearFields_Click"></asp:button>
</div>
</asp:Panel> 
    </form>
</body>
</html>
