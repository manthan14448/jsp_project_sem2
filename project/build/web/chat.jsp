<%-- 
    Document   : chat
    Created on : 24 Apr, 2022, 11:41:48 PM
    Author     : root
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String email = request.getParameter("email");
    String name = null;
    Blob b1;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chatapp", "root", "");
        Statement stmt = con.createStatement();
        ResultSet r1 = stmt.executeQuery("select * from users where email='" + email + "' limit 1;");
        r1.next();
        name = r1.getString("fname");

    } catch (Exception e) {
    }
%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Realtime Chat App | CodingNepal</title>
        <link rel="stylesheet" href="style1.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
    </head><body>
        <div class="wrapper">
            <section class="chat-area">
                <header>
                    <a href="viewPage.jsp?email=<%=session.getAttribute("user_Email")%>" class="back-icon" ><i class="fas fa-arrow-left"></i></a>
                    <img src="php/images/1650193297IMG_20220305_104046.jpg" alt="">
                    <div class="details">
                        <span><span><%= name%></span><br><%= email%></span>
                        <p style="color: orange;">Active now</p>
                    </div>
                </header>

                <div class="chat-box">
                    <%try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chatapp", "root", "");
                            Statement stmt = con.createStatement();
                            ResultSet r1 = stmt.executeQuery("select * from messages LEFT JOIN users ON users.email =messages.outgoing_msg_id " + "where (outgoing_msg_id='" + session.getAttribute("user_Email") + "' and incoming_msg_id='" + email + "') or (outgoing_msg_id='" + email + "' and incoming_msg_id='" + session.getAttribute("user_Email") + "') order by msg_id;");

                            while (r1.next()) {
                                if (r1.getString("incoming_msg_id").equals(session.getAttribute("user_Email"))) {
                                    out.write("<div class='chat incoming'> <div class='details'>" + r1.getString("msg") + "</div></div>");
                                } else {
                                    out.write("<div class='chat outgoing'> <div class='details'>" + r1.getString("msg") + "</div></div>");
                                }
                            }

                        } catch (Exception e) {
                        }%>
                </div>

                <form action="okay.jsp" class="typing-area">
                    <input type="text" name="email" value="<%=email%>" hidden/>
                    <input type="text" name="message" class="input-field" placeholder="Type a message here..." autocomplete="off" required>
                    <button type="submit" class="fab fa-telegram-plane"> </button>     

                </form>
            </section>
        </div>

    </body>
</html>