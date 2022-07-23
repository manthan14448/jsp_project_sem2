<%-- 
Document   : sign.jsp
Created on : 25 Apr, 2022, 10:41:45 AM
Author     : root
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String password = (String) request.getParameter("password");
    String email = (String) request.getParameter("email");
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chatapp", "root", "");
        Statement stmt = con.createStatement();
        ResultSet r1 = stmt.executeQuery("select * from users where email='" + email + "' limit 1;");
        if (r1.next()) {
            if (r1.getString("password").equals(password)) {
                session.setAttribute("user", email);
                stmt.executeUpdate("update users set status='Activated' where email='" + email + "'");
                response.sendRedirect("viewPage.jsp?email=" + email);
            } else {
                out.print("<h2>Please Try Again<br><b>" + email + "</b> Password Not Match<h1>");
            }
        } else {
            response.sendRedirect("http://localhost:8080/project");
        }
    } catch (Exception e) {

    }
%>

