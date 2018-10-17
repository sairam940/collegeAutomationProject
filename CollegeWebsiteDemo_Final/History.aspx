<%@ Page Language="C#" AutoEventWireup="true" CodeFile="History.aspx.cs" Inherits="History" %>

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
        <asp:Timer ID="Timer1" runat="server" Interval="60000" OnTick="Timer1_Tick"></asp:Timer>
        <asp:Image ID="ImageControl"  Height="300px" Width="1275px" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    <div>
 <p>The university began as The Agricultural and Mechanical College of the State of Mississippi (or Mississippi A&M), one of the national land-grant colleges established after Congress passed the Morrill Act in 1862. It was created by the Mississippi Legislature on February 28, 1878, to fulfill the mission of offering training in "agriculture, horticulture and the mechanical arts ... without excluding other scientific and classical studies, including military tactics."</p>

<p>In 1887 Congress passed the Hatch Act, which provided for the establishment of the Agricultural Experiment Station in 1888. The Cooperative Extension Service was established in 1914 by the Smith-Lever Act. In 1932, the Legislature renamed the university as Mississippi State College.</p>

<p>In 1958 the Legislature renamed the university as Mississippi State University in recognition of its academic development and addition of graduate programs. The Graduate School had been organized (1936), doctoral degree programs had begun (1951), and the College of Arts and Sciences had replaced the General Science School (1956).</p>

<p>JSU also started a joint Ph.D. program in engineering with San Jose State University in California, allowing an increase in research for both universities, as well as enhancing the stature of both engineering colleges.</p>

<p>In March 2009, Mississippi State announced the conclusion of the university's seven-year capital campaign, with more than $462 million received in private gifts and pledges.</p>
    </div>
    </form>
</body>
</html>
