<%-- 
    Document   : logout
    Created on : 24 Apr, 2022, 10:07:44 PM
    Author     : root
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="2; url='/project'"/>
              <title>JSP Page</title>
              </head>
              <body>
              <%
                  String email = request.getParameter("Email");
                  session.invalidate();
                  try {
                      Class.forName("com.mysql.jdbc.Driver");
                      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chatapp", "root", "");
                      Statement stmt = con.createStatement();
                      stmt.executeUpdate("update users set status='Deactivated' where email='" + email + "'");
                      //  stmt.executeQuery("select status from users where email='" + email + "' limit 1;");
                  } catch (Exception e) {
                  }
                  
              %>
              <center><h2 style="color:blueviolet;">Thank You<br>for Visiting</h2></center>
</body>
</html>
