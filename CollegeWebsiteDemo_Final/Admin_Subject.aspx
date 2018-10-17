<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Subject.aspx.cs" Inherits="Admin_Subject" %>

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
        <a href="Admin_Course_And_Subject.aspx">Course Management</a>
        <%--<a href="Admin_Subject.aspx">Subject Management</a>--%>
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
     <div id="heading"><b>Subject Details</b></div>
        <br /><br /><br /><br/>
    <div style="background-color:darkblue;font-size:medium;width:auto;color:white" >Subject Details</div>
    <br /><br />
<asp:Panel ID="pnlLeft" runat="server" style="float: left; width:44%; display: inline;">
    <div>
    <asp:GridView ID="gvSubjectgrid" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" Font-Names="Arial" Font-Size="11 pt" OnPageIndexChanging="OnPaging">
<Columns>
 <asp:templatefield HeaderText="Select" ItemStyle-Width="50">
    <itemtemplate>
        <asp:checkbox ID="cbSelectSubject" runat="server"></asp:checkbox>
    </itemtemplate>
</asp:templatefield>

<asp:TemplateField HeaderText="Subject Code" ItemStyle-Width="70">
            <ItemTemplate>
                <asp:TextBox ID="txtgvSubjectCode" runat="server" Text='<%# Eval("SubjectCode") %>'  Width="70"/>
            </ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Department" ItemStyle-Width="70">
            <ItemTemplate>
                 <asp:TextBox ID="txtgvDepartmentCode" runat="server" Text='<%# Eval("DepartmentCode") %>'  Width="70"/>
            </ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Course" ItemStyle-Width="70">
            <ItemTemplate>
        <asp:TextBox ID="txtgvCourseCode" runat="server" Text='<%# Eval("CourseCode") %>'  Width="70"/>
            </ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Subject Name" ItemStyle-Width="250">
            <ItemTemplate>
                <asp:TextBox ID="txtgvSubjectName" runat="server"  Text='<%# Eval("SubjectName") %>'  Width="250"/>
            </ItemTemplate>
</asp:TemplateField>
  
</Columns>
    </asp:GridView>
</div>
      <div>
        <br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <asp:button ID="btnSubjectUpdate" runat="server"
Text="Update Course" OnClick="btnSubjectUpdate_Click"></asp:button>
          &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:button ID="btnSubjectDelete" runat="server"
Text="Delete Course" OnClick="btnSubjectDelete_Click"></asp:button>
        </div>
</asp:Panel>

<asp:Panel ID="pnlRight" runat="server" style="float:left; display: inline;">
             <div>
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblinsSubjectCode" Text="Enter Subject Code" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtinsSubjectCode" Text="" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" id="reqinsSubjectCode" controltovalidate="txtinsSubjectCode" errormessage="Please enter the Subject Code" Enabled="false"/>
    <br /><br />
    </div> 
    <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblinsDepartmentCode" Text="Enter Department Code" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtinsDepartmentCode" Text="" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" id="reqinsDepartmentCode" controltovalidate="txtinsDepartmentCode" errormessage="Please enter the Department Code" Enabled="false"/>
    <br /><br />
    </div>
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
    <asp:Label ID="lblinsSubjectName" Text="Enter Subject Name" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtinsSubjectName" Text="" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" id="reqinsSubjectName" controltovalidate="txtinsSubjectName" errormessage="Please enter the Subject Name" Enabled="false"/>
    <br /><br />
    </div>  
     <div>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:button ID="btnSubjectInsert" runat="server" Text="Insert" OnClick="btnSubjectInsert_Click"></asp:button>
         &nbsp;&nbsp;&nbsp;&nbsp;
<asp:button ID="btnSubjectClearFields" runat="server" Text="Clear Fields" OnClick="btnSubjectClearFields_Click"></asp:button>
</div>
</asp:Panel> 
    </form>
</body>
</html>
