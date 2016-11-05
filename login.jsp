<html>
<body bgcolor="wheat">
<center>

<jsp:useBean id="customer" class="cs.Customer" scope="session" />

<jsp:setProperty  name="customer" property="*" />

<%
  if ( !customer.isValid() )
    out.println("<h3>Invalid Login. Click <a href=login.html>here</a> to try again! </h3>");
  else
     response.sendRedirect("home.jsp"); 
%>

</center>
</body>
</html>
     
    
   
