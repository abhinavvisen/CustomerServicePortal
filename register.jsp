<html>
<body bgcolor="wheat">
<style>
h3 {font:700 12pt verdana;color:maroon}
a  {font:12pt verdana;color:navy}
</style>

<center>

<jsp:useBean id="customer" class="cs.Customer" scope="session" />

<jsp:setProperty  name="customer" property="*" />

<%
 String result = customer.registerUser();

 if ( result == null) 
     response.sendRedirect("home.jsp"); 
 else
     out.println("<h3>Sorry! Registration Failed With Error : <p> " + result + "</h3> <p> <a href=register.html>Try Again </a> ");

%>

</center>
</body>
</html>
     
    
   
