<jps:useBean id="customer" class="cs.Customer"  scope="session" />

<html>
<style>
h3 {color:maroon;font:700 12pt verdana}
h4 {color:brwon;font:700 11pt verdana}
a  {color:navy;font:700 12pt verdana}
</style>

<body bgcolor="wheat">
<center>

<div style="color:white;background-color:maroon;font:700 25pt arial;letter-spacing:5pt">
Customer Support System
</div>

<h3>Customer Name : 
<jsp:getProperty  name="customer" property="custname"/> 
&nbsp;&nbsp;
Current Date Time : 
<%= new java.util.Date().toString() %> 
</h3>
<hr>

<p>
<a href="complaint.html">Add Complaint </a>
<p>
<a href="listcomplaints.jsp">List Complaints </a>
<p>
<a href="querykb.jsp">Query Knowledge Base <a>
<p>
<a href="updateprofile.jsp">Change Customer Profile</a>
<p>
<a href="logout.jsp">Logout <a>
</center>


</body>
</html>   