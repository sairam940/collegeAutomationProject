<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
</head>
<body>
     <div id="header" >
			 <b>Mississippi State University</b>
		</div>
    <div id="horizontal">
		<%--<a href="#">Home</a> --%>
        <a href="Default.aspx">Home</a>
        <a href="Library_Books.aspx">Library</a>	
		</div>
     
    
    <form id="form1" runat="server">
        <br />
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
        <br />
        <div style="background-color:darkblue;font-size:medium;width:auto;color:white" >Student Details</div>
    <br /><br />
<asp:Panel ID="pnlLeft" runat="server" style="float: left; width:44%; display: inline;">
    <div>
    <%--<asp:Label ID="lblHello"  runat="server"></asp:Label>
    <asp:Label ID="lblstudentid"  runat="server"></asp:Label>--%>
    <asp:Label ID="lblFirstNamelabel" Text="First Name:" runat="server"></asp:Label>
    <asp:Label ID="lblFirstName" runat="server"></asp:Label>
    <br /><br/>
    </div>
        <div>
    <asp:Label ID="lbllastnamelabel" Text="Last Name:" runat="server"></asp:Label>
    <asp:Label ID="lbllastname" runat="server"></asp:Label>
    <br/><br/>
    </div>
    </asp:Panel>
<asp:Panel ID="pnlRight" runat="server" style="float:left; display: inline;">
        <div>
    <asp:Label ID="lblemailadresslabel" Text="Email Address:" runat="server"></asp:Label>
    <asp:Label ID="lblemailaddress" runat="server"></asp:Label>
    <br/><br/>
    </div>
        <div>
    <asp:Label ID="lblcontactnumberlabel" Text="Contact Number:" runat="server"></asp:Label>
    <asp:Label ID="lblcontactnumber" runat="server"></asp:Label>
     <br/><br/>
    </div>
  </asp:Panel> 

 <asp:Panel ID="Panel1" runat="server" style="float: left; width:40%; display: inline;">
 <div style="background-color:darkblue;font-size:medium;width:auto;color:white" >Enrollment</div>  
     <div>
        <asp:Label ID="lblDepartment" Text="Select Department" runat="server"></asp:Label>
        </div>
        <div>
            <asp:DropDownList ID="ddldepartment" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddldepartment_SelectedIndexChanged">      
        </asp:DropDownList>
        </div>
        <br />
        <div>
        <asp:Label ID="lblCourses" Text="Select Course" runat="server"></asp:Label>
        </div>
        <div>
            <asp:DropDownList ID="ddlCourse" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlcourse_SelectedIndexChanged" >      
        </asp:DropDownList>
        </div>
        <br /><br />
        <div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" Font-Names="Arial" Font-Size="11 pt" OnPageIndexChanging="OnPaging" DataKeyNames="SubjectCode,SubjectName" >
<Columns>
    <asp:templatefield HeaderText="Select" ItemStyle-Width="50">
    <itemtemplate>
        <asp:checkbox ID="cbSelectSubject" runat="server"></asp:checkbox>
    </itemtemplate>
</asp:templatefield>
    <asp:BoundField DataField="SubjectCode" HeaderText="Subject Code" />
    <asp:BoundField DataField="SubjectName" HeaderText="Subject Name" />
</Columns>
    </asp:GridView>
  </div>  
      <div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        <asp:Button ID="btnEnroll" Text="Enroll" runat="server" OnClick="btnEnroll_Click"></asp:Button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <asp:Button ID="btnDeEnroll" Text="Withdraw" OnClick="btnDeEnroll_Click" runat="server"></asp:Button>
            </div>
 </asp:Panel> 
 <asp:Panel ID="Panel2" runat="server" style="float: left; width:60%; display: inline">
     <div style="background-color:darkblue;font-size:medium;width:auto;color:white" >Subjects already Enrolled</div>
     <br /><br /><br /><br /><br /><br /><br />
      <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" Font-Names="Arial" Font-Size="11 pt" OnPageIndexChanging="OnPaging" DataKeyNames="SubjectCode,SubjectName" >
<Columns>
    <asp:BoundField DataField="SubjectCode" HeaderText="Subject Code" />
    <asp:BoundField DataField="SubjectName" HeaderText="Subject Name" />
</Columns>
    </asp:GridView>
</asp:Panel>

    </form>
</body>
</html>
