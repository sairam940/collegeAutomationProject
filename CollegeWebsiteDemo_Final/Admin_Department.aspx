<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Department.aspx.cs" Inherits="Admin_Department" %>

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
        <%--<a href="Admin_Department.aspx">Department Management</a>--%>
        <a href="Admin_Course_And_Subject.aspx">Course Management</a>
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
        <div id="heading"><b>Department Details</b></div>
        <br /><br /><br /><br/>
    <div style="background-color:darkblue;font-size:medium;width:auto;color:white" >Department Details</div>
    <br /><br />
<asp:Panel ID="pnlLeft" runat="server" style="float: left; width:43%; display: inline;">
    <div>
    <asp:GridView ID="gvDepartment" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" Font-Names="Arial" Font-Size="11 pt" OnPageIndexChanging="OnPaging">
<Columns>
 <asp:templatefield HeaderText="Select" ItemStyle-Width="50">
    <itemtemplate>
        <asp:checkbox ID="cbSelectDepartment" runat="server"></asp:checkbox>
    </itemtemplate>
</asp:templatefield>

<asp:TemplateField HeaderText="Department Code" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:TextBox ID="txtgvDepartmentCode" runat="server" Text='<%# Eval("DepartmentCode") %>' />
            </ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Department Name" ItemStyle-Width="250">
            <ItemTemplate>
                <asp:TextBox ID="txtgvDepartmentName" runat="server"  Text='<%# Eval("DepartmentName") %>'  Width="250"/>
            </ItemTemplate>
</asp:TemplateField>
  
</Columns>
    </asp:GridView>
</div>
      <div>
          <br /><br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <asp:button ID="btnDepartmentUpdate" runat="server"
Text="Update Department" OnClick="btnDepartmentUpdate_Click"></asp:button>
          &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:button ID="btnDepartmentDelete" runat="server"
Text="Delete Department" OnClick="btnDepartmentDelete_Click"></asp:button>
        </div>
</asp:Panel>

<asp:Panel ID="pnlRight" runat="server" style="float:left; display: inline;">
             <div>
    <asp:Label ID="lblinsDepartmentCode" Text="Enter Department Code" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtinsDepartmentCode" Text="" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" id="reqinsDepartmentCode" controltovalidate="txtinsDepartmentCode" errormessage="Please enter the Department Code" Enabled="false"/>
    <br /><br />
    </div> 
     <div>
    <asp:Label ID="lblinsDepartmentName" Text="Enter Department Name" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtinsDepartmentName" Text="" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" id="reqinsDepartmentName" controltovalidate="txtinsDepartmentName" errormessage="Please enter the Department Name" Enabled="false"/>
    <br /><br />
    </div>  
     <div>
<asp:button ID="btnDepartmentInsert" runat="server" Text="Insert" OnClick="btnDepartmentInsert_Click"></asp:button>
         &nbsp;&nbsp;&nbsp;&nbsp;
<asp:button ID="btnDepartmentClearFields" runat="server" Text="Clear Fields" OnClick="btnDepartmentClearFields_Click"></asp:button>
</div>
</asp:Panel>  
    </form>
</body>
</html>
