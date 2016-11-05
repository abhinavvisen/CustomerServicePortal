<html>

<jsp:useBean id="customer" class="cs.Customer" scope="session"/>

<%@ page import="java.sql.*"%>

<style>
h2{color:navy;font:700 20pt arial}
h4 {color:brwon;font:700 11pt verdana}
td {font:10pt verdana}
a {font:12pt verdana;color:navy}

</style>

<body bgcolor="wheat">
<center>

<body bgcolor="wheat">
<center>
<div style="color:white;background-color:maroon;font:700 25pt arial;letter-spacing:5pt">
Customer Support System
</div>


<h2>List Of Pending Complaints</h2>
</div>
<%
  
  // get rows from tables
  Connection con = customer.getConnection();
  PreparedStatement ps = con.prepareStatement("select devtype ,serialno,complaint,to_char(dc,'dd-mm-yy') dc from complaints  where custname = ? ");
  ps.setString(1, customer.getCustname());

  ResultSet rs = ps.executeQuery();

  if ( !rs.next()) 
  {
      out.println("<h4>Sorry! No complaints found!</h4> <a href=home.jsp>Go Back </a>");
      rs.close();
      ps.close();
      con.close();
      return;
  }

   

%>

<table width=100% border=1>
<tr>
<th>Device
<th>SerialNO
<th>Complaint
<th>Comp. Date
</tr>




<%
  do
  {
    out.println("<tr><td>" + rs.getString("devtype") + "<td>" + rs.getString("serialno") +
               "<td>" + rs.getString("complaint") + "<td>" + rs.getString("dc") + "</tr>");
  }
  while ( rs.next());

  rs.close();
  ps.close();
  con.close();
  
%>

</table>   
<p> 

<a href="home.jsp">Go Back </a>
  

</center>
</body>
</html>   

