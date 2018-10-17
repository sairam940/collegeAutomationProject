<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin_Login_Library_Page.aspx.cs" Inherits="Admin_Login_Library_Page" %>

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
        <a href="Admin_Department.aspx">Department Management</a>
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
        <asp:Panel ID="pnlLeft" runat="server" style="float: left; width:40%; display: inline;">
    <div>
        
        <br /><br /><br />
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <asp:Label ID="lblSearchBy" Text="Search By" runat="server" ></asp:Label>
        <asp:DropDownList ID="ddlSearchBy" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSearchBy_SelectedIndexChanged">
            <asp:ListItem Value="Select">  </asp:ListItem>
             <asp:ListItem Value="Department"> Department </asp:ListItem>
                  <asp:ListItem Value="BookCode">Book Code </asp:ListItem>       
        </asp:DropDownList>
        </div>
        <br />
        <br />
        <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblDepartment" Text="Department" runat="server"></asp:Label>
        
            <asp:DropDownList ID="ddldepartment" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddldepartment_SelectedIndexChanged">      
                 <asp:ListItem Value="ALL"> ALL </asp:ListItem>
        </asp:DropDownList>
        </div>
         <div>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <asp:Label ID="lblBookCode" Text="Book Code" runat="server"></asp:Label>
        <asp:TextBox ID="txtBookCode" Text="" runat="server"></asp:TextBox>
             <br />
             <br />
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <asp:Button ID="btnBookCodeSearch" Text="Search" runat="server" OnClick="btnBookCodeSearch_Click"></asp:Button>
    <asp:Button ID="btnBookCodeClearFields" Text="Clear Fields" runat="server" OnClick="btnBookCodeClearFields_Click"></asp:Button>

    </div>
<div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" Font-Names="Arial" Font-Size="11 pt" OnPageIndexChanging="OnPaging" DataKeyNames="BookCode" >
<Columns>

    <asp:templatefield HeaderText="Select">
    <itemtemplate>
        <asp:checkbox ID="cbSelect" runat="server"></asp:checkbox>
    </itemtemplate>
</asp:templatefield>

<asp:TemplateField HeaderText="Book Code" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:TextBox ID="txtgvBookCode" runat="server" Text='<%# Eval("BookCode") %>' />
            </ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Book Name" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:TextBox ID="txtgvBookName" runat="server" Text='<%# Eval("BookName") %>' />
            </ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Book Availability" ItemStyle-Width="150">
            <ItemTemplate>
                <asp:TextBox ID="txtgvBookAvailability" runat="server" Text='<%# Eval("BookAvailability") %>' />
            </ItemTemplate>
</asp:TemplateField>
   <%-- <asp:BoundField DataField="BookCode" HeaderText="Book Code" />
    <asp:BoundField DataField="BookName" HeaderText="Book Name" />
    <asp:BoundField DataField="BookAvailability" HeaderText="Book Availability" />--%>
</Columns>
    </asp:GridView>
</div>
            <br /><br />
        <div>
 <asp:button ID="btnUpdate" runat="server"
Text="Update" OnClick="btnUpdate_Click"></asp:button>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:button ID="btnDelete" runat="server"
Text="Delete" OnClick="btnDelete_Click"></asp:button>
        </div>
    </asp:Panel>
        <asp:Panel ID="pnlRight" runat="server" style="float:left; display: inline;">
<div>
    <br /><br />
    <p><b>Insert Books:</b></p>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <asp:Label ID="lblinsBookCode" Text="Enter Book Code" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtinsBookCode" Text="" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" id="reqinsbookcode" controltovalidate="txtinsBookCode" errormessage="Please enter the book Code" Enabled="false"/>
    <br /><br />
    </div>

        <div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;         <asp:Label ID="lblinsDepartment" Text="Select Department" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlinsdepartment" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlinsdepartment_SelectedIndexChanged">      
        </asp:DropDownList>
            <br /><br />
        </div>
       
<div>
    
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <asp:Label ID="lblinsBookName" Text="Enter Book Name" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtinsBookName" Text="" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" id="reqinsBookName" controltovalidate="txtinsBookName" errormessage="Please enter the book name" Enabled="false"/>
    </div>
        <br /><br />
<div>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <asp:Label ID="lblinsBookAvailability" Text="Enter the number of books available" runat="server"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtinsBookAvailability" Text="" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" id="reqinsBookAvailability" controltovalidate="txtinsBookAvailability" errormessage="Please enter the number of books available" Enabled="false"/>
    <br /><br />
    </div>
<div>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <asp:Label ID="lblinsmaxBookAvailability" Text="Enter the maximum number of books available" runat="server"></asp:Label>
        
    <asp:TextBox ID="txtinsmaxBookAvailability" Text="" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" id="reqinsmaxBookAvailability" controltovalidate="txtinsmaxBookAvailability" errormessage="Please enter the maximum number of books available" Enabled="false"/>
    <br /><br />
    </div>
        <div>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:button ID="btnInsert" runat="server" Text="Insert" OnClick="btnInsert_Click"></asp:button>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:button ID="btnClearFields" runat="server" Text="Clear Fields" OnClick="btnClearInsertFields_Click"></asp:button>
</div>
  </asp:Panel>
    </form>
</body>
</html>
 <script src="../Javascript/Admin_Library_Page.js?" type="text/javascript"></script>
