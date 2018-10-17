<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Faculty_Registration.aspx.cs" Inherits="Admin_Faculty_Registration" %>

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
     <div id="heading"><b>Faculty Details</b></div>
        <br /><br /><br /><br/>
    <div style="background-color:darkblue;font-size:medium;width:auto;color:white" >Faculty Details</div>
    <br /><br />
    <asp:Panel ID="pnlLeft" runat="server" style="float: left; width:41%; display: inline;">
    <div>
    <asp:GridView ID="gvFacultygrid" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" Font-Names="Arial" Font-Size="11 pt" OnPageIndexChanging="OnPaging">
<Columns>
 <asp:templatefield HeaderText="Select" ItemStyle-Width="50">
    <itemtemplate>
        <asp:checkbox ID="cbSelectFaculty" runat="server"></asp:checkbox>
    </itemtemplate>
</asp:templatefield>

    <asp:TemplateField HeaderText="Faculty Code" ItemStyle-Width="100">
            <ItemTemplate>
                <asp:TextBox ID="txtgvFacultyCode" runat="server" Text='<%# Eval("FacultyCode") %>'  Width="100"/>
            </ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="First Name" ItemStyle-Width="100">
            <ItemTemplate>
                <asp:TextBox ID="txtgvFirstName" runat="server" Text='<%# Eval("FacultyFirstName") %>'  Width="100"/>
            </ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Last Name" ItemStyle-Width="100">
            <ItemTemplate>
                 <asp:TextBox ID="txtgvLastName" runat="server" Text='<%# Eval("FacultyLastName") %>'  Width="100"/>
            </ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Qualification" ItemStyle-Width="100">
            <ItemTemplate>
        <asp:TextBox ID="txtgvQualification" runat="server" Text='<%# Eval("Qualification") %>'  Width="100"/>
            </ItemTemplate>
</asp:TemplateField>
<asp:TemplateField HeaderText="Designation" ItemStyle-Width="100">
            <ItemTemplate>
                <asp:TextBox ID="txtgvDesignation" runat="server"  Text='<%# Eval("Designation") %>'  Width="100"/>
            </ItemTemplate>
</asp:TemplateField>
  
</Columns>
    </asp:GridView>
</div>
      <div>
        <br /><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <asp:button ID="btnFacultyUpdate" runat="server"
Text="Update Faculty Details" OnClick="btnFacultyUpdate_Click"></asp:button>
          &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:button ID="btnFacultyDelete" runat="server"
Text="Delete Faculty Details" OnClick="btnFacultyDelete_Click"></asp:button>
        </div>
        <br /><br />
         <div>
                 
    <asp:Label ID="lblAssignFacultyCode" Text="Enter Faculty Code" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtAssignFacultyCode" Text="" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" id="reqAssignFacultyCode" controltovalidate="txtAssignFacultyCode" errormessage="Please enter the Faculty Code" Enabled="false"/>
    <br /><br />
    </div>
    <div>
        
        <asp:Label ID="lblSubject" Text="Select a Subject" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlSubject" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSubject_SelectedIndexChanged">      
                 <asp:ListItem Value="Select"> Select</asp:ListItem>
        </asp:DropDownList>
        <br /><br />
        </div> 
    <div>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:button ID="AssignSubject" runat="server" Text="Assign Subject" OnClick="btnAssignSubject_Click"></asp:button>
        </div>  
</asp:Panel>

<asp:Panel ID="pnlRight" runat="server" style="float:left; display: inline;">
     <div>
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblinsFacultyCode" Text="Enter Faculty Code" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtinsFacultyCode" Text="" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" id="reqinsFacultyCode" controltovalidate="txtinsFacultyCode" errormessage="Please enter the Faculty Code" Enabled="false"/>
    <br /><br />
    </div> 
             <div>
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblinsFacultyFirstName" Text="Enter Faculty Name" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtinsFacultyFirstName" Text="" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" id="reqinsFacultyFirstName" controltovalidate="txtinsFacultyFirstName" errormessage="Please enter the First Name" Enabled="false"/>
    <br /><br />
    </div> 
    <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblinsFacultyLastName" Text="Enter Faculty Last Name" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtinsFacultyLastName" Text="" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" id="reqinsFacultyLastName" controltovalidate="txtinsFacultyLastName" errormessage="Please enter the Last Name" Enabled="false"/>
    <br /><br />
    </div>
     <div>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblinsQualification" Text="Enter Qualification" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtinsQualification" Text="" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" id="reqinsQualification" controltovalidate="txtinsQualification" errormessage="Please enter the Qualification" Enabled="false"/>
    <br /><br />
    </div>
     <div>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblinsDesignation" Text="Enter Designation" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtinsDesignation" Text="" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" id="reqinsDesignation" controltovalidate="txtinsDesignation" errormessage="Please enter the Designation" Enabled="false"/>
    <br /><br />
    </div>
     <div>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:button ID="btnFacultyInsert" runat="server" Text="Insert" OnClick="btnFacultyInsert_Click"></asp:button>
         &nbsp;&nbsp;&nbsp;&nbsp;
<asp:button ID="btnFacultyClearFields" runat="server" Text="Clear Fields" OnClick="btnFacultyClearFields_Click"></asp:button>
</div>
    
</asp:Panel>
    </form>
</body>
</html>
