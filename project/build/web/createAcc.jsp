<%-- 
    Document   : createAcc
    Created on : 24 Apr, 2022, 6:56:04 PM
    Author     : root
--%>

<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account</title>
    </head>
    <body>
        <%
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            String cpass = request.getParameter("cpass");
            String img = request.getParameter("images");
            if (name != null && email != null && pass != null && cpass != null) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chatapp", "root", "");
                    Statement stmt = con.createStatement();
                    ResultSet r1 = stmt.executeQuery("select fname from users where email='" + email + "' limit 1;");
                    if (r1.next()) {
                        out.print("Alerady Presented Use another Mail");
                        out.print("alert('Alerady Presented Use another Mail');");
                        response.sendRedirect("http://localhost:8080/project/");
                    } else {
                    
                        PreparedStatement pstm = con.prepareStatement("INSERT INTO users(fname, email, password, img, status) VALUES (?,?,?,?,?)");
                        pstm.setString(1, name);
                        pstm.setString(2, email);
                        pstm.setString(3, pass);
                        InputStream in = new FileInputStream(img);
                        pstm.setBlob(4, in);
                        pstm.setString(5, "Activated");
                        pstm.execute();
                        response.sendRedirect("viewPage.jsp?email=" + email);
                    }
                } catch (Exception e) {
                }
            }
        %>   