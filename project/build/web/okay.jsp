<%-- 
    Document   : okay
    Created on : 25 Apr, 2022, 2:30:10 AM
    Author     : root
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String email = request.getParameter("email");
    String message = request.getParameter("message");
    out.print(message);
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chatapp", "root", "");
    Statement stmt = con.createStatement();
    stmt.execute("INSERT INTO messages(outgoing_msg_id, incoming_msg_id, msg) VALUES ('" + session.getAttribute("user_Email") + "','" + email + "','" + message + "')");
%>
<html>
    <head>
        <meta http-equiv="refresh" content="0; url='chat.jsp?email=<%=email%>'"/>
        <title>JSP Page</title>
    </head>
    <body>
    <center><img src="loading.gif" alt="Computer man" style="margin-left: auto;margin-top: 20%;margin-bottom: auto;
                 margin-right: auto;  width:148px;height:148px;"></center>
</body>
</html>
