<html>

<%@ page import="java.sql.*"%>
<jsp:useBean id="customer"  class="cs.Customer" scope="session" />

<style>
h2{color:navy;font:700 20pt arial}
h4 {color:brwon;font:700 11pt verdana}
td {font:10pt verdana}
a {font:12pt verdana;color:navy}

</style>

<body bgcolor="wheat">
<center>

<div style="color:white;background-color:maroon;font:700 25pt arial;letter-spacing:5pt">
Customer Support System
</div>

<h2>Query Knowledge Base</h2>

<form action="querykb.jsp" method="post" >
<table>
<tr>
<td>
Device Type 
<td>
<select name="devtype">
<option value="all">All Devices
<option value="prn">Printer
<option value="mon">Monitor
<option value="hdd">Hard Disk
<option value="key">Keyboard
</select>
</tr>
<tr>
<td>
Serial No. Contains
<td>
<input type=text name=sno size=30>
</tr>
<tr>
<td >
Complaint Contains
<td>
<input type=text name=complaint size=50>
</tr>

<tr>
<td>
From Date (dd-mon-yy) 
<td>
<input type=text name=fromdate size=10> To date (dd-mon-yy): <input type=text name=todate size=10> 
</tr>
<tr>
<td>
Solution Contains
<td>
<input type=text name=solution size=50 >
</tr>
</table>
<p>

<input type=submit value="Query">
<input type=reset value="Clear All">
<input type=button value="Go Back" onclick='javascript:document.URL="home.jsp"'>
</form>

<%

  // check whether data is passed 
  String devtype = request.getParameter("devtype");
  if( devtype == null) 
     return;

  // process input and displays selected rows

  String sno = request.getParameter("sno");
  String complaint = request.getParameter("complaint");
  String fromdate = request.getParameter("fromdate");
  String todate = request.getParameter("todate");
  String solution = request.getParameter("solution");
  String cond = "1=1";

  if  ( !devtype.equals("all")) 
       cond += " and devtype = '" + devtype + "'";

  if  ( sno.length() > 0 ) 
       cond += " and serialno like '%" + sno + "%'" ;

  if  ( complaint.length() > 0 ) 
       cond += " and upper(complaint) like '%" + complaint.toUpperCase() + "%'" ;

  if  ( fromdate.length() > 0 ) 
       cond += " and dc >= '" + fromdate + "'" ;

  if  ( todate.length() > 0 ) 
       cond += " and dc <= '" + todate + "'" ;

  if  ( solution.length() > 0 ) 
       cond += " and upper(solution)  like '%" + solution.toUpperCase() + "%'" ;

  // get rows from tables
  Connection con = customer.getConnection();
  Statement st  =con.createStatement();

  ResultSet rs = st.executeQuery("select devtype,serialno,complaint,to_char(dc,'dd-mm-yy') dc,solution from completed_complaints where " + cond);
  if ( !rs.next()) 
  {
      out.println("<h4>Sorry! No complaints found!</h4>");
      rs.close();
      st.close();
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
<th>Solution
</tr>




<%
  do
  {
    out.println("<tr><td>" + rs.getString("devtype") + "<td>" + rs.getString("serialno") +
               "<td>" + rs.getString("complaint") + "<td>" + rs.getString("dc") + "<td>" +
               rs.getString("solution") + "</tr>");
  }
  while ( rs.next());

  rs.close();
  st.close();
  con.close();
  
%>

</table>    
  

</center>
</body>
</html>   

