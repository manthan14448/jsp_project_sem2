<%-- 
    Document   : viewPage
    Created on : 24 Apr, 2022, 8:52:02 PM
    Author     : root
--%>

<%@page import="java.util.Base64"%>
<%@page import="javax.swing.ImageIcon"%>
<%@page import="java.awt.Image"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.stream.Stream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! public String name;
    public String pic;%>

<%
    String email = request.getParameter("email");
    Blob b1;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chatapp", "root", "");
        Statement stmt = con.createStatement();
        ResultSet r1 = stmt.executeQuery("select * from users where email='" + email + "' limit 1;");
        r1.next();
        name = r1.getString("fname");
        Blob image = r1.getBlob("img");
        byte[] imagedata = image.getBytes(1, (int) image.length());
        String EncodeImage = Base64.getEncoder().encodeToString(imagedata);
        String pic = "data:image/jpg:base64," + EncodeImage;
        session.setAttribute("user_Name", name);
        session.setAttribute("user_Email", email);

    } catch (Exception e) {
    }
%>
<html>
    <head>
        <link rel="stylesheet" href="./userstyle.css">
        <link rel="stylesheet" href="./style1.css">
        <script  src="./script.js"></script>
        <style>
            .overlaystyle {
                background: #FF6767;
                background: -webkit-linear-gradient(to right, #FF4B2B, #FF6767);
                background: linear-gradient(to right, #FF4B2B, #FF6767);
                background-repeat: no-repeat;
                background-size: cover;
                background-position: 0 0;
                color: #FFFFFF;
                position: relative;
                transform: translateX(0);
                transition: transform 0.6s ease-in-out;
            }
        </style>

    </head>
    <body class="overlaystyle" style="margin: auto;">
        <div class="wrapper">
            <section class="users">
                <header>
                    <div class="content">
                        <img src="<%=pic%>" alt="">
                        <div class="details">
                            <span><%=name%></span>
                            <span><%=email%></span>

                        </div>
                    </div>
                    <a style="margin-top:-30px;margin-left: -20p;padding:justify;" class="logout" href="logout.jsp?Email=<%=email%>">Logout</a>
                </header>
                <center><div style="color:black;">Start chatting</div></center>
                <div class="users-list">
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chatapp", "root", "");
                        Statement stmt = con.createStatement();
                        ResultSet r2 = stmt.executeQuery("select fname,email,status from users where status='Activated' and not email='" + session.getAttribute("user_Email") + "';");
                        while (r2.next()) {
                            String Name = r2.getString("fname");
                            String Email = r2.getString("email");

                            out.print("<a href='chat.jsp?email=" + Email + "'>");
                            out.print(" <div class='content'>");
                            out.print("<img src='php/images/1650193370IMG_20220305_104040.jpg' alt=''>");
                            out.print("<div class='details'>");
                            out.print("<span>" + Name + " </span>");
                            out.print("<p>" + Email + "</p>");
                            out.print("</div>");
                            out.print("</div>");
                            out.print("<div class='status-dot offline'><i class='fas fa-circle'></i></div>");
                            out.print("</a>");
                        }
                    %>
                </div>
            </section>
        </div>
    </body>
</html>