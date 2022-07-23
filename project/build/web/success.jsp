<%@page import="org.apache.tomcat.jni.FileInfo"%>
<%@page import="java.io.InputStream"%>
<%@page import="sun.security.util.Password"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.awt.image.DataBufferByte"%>
<%@page import="java.awt.image.WritableRaster"%>
<%@page import="java.awt.Image"%>
<%@page import="java.net.URL"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%
    String name = (String) request.getParameter("name");
    String email = (String) request.getParameter("email");
    String img = (String) request.getParameter("imagurl");
    session.setAttribute("user", email);
    if (session.getAttribute("user") == null) {
        response.sendRedirect("index.jsp");
    }
    session.setAttribute("user", email);
    if (session.getAttribute("user") == null) {
        response.sendRedirect("index.jsp");
    }
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chatapp", "root", "");
        Statement stmt = con.createStatement();
        ResultSet r1 = stmt.executeQuery("select fname from users where email='" + email + "' limit 1;");
        if (r1.next()) {
            out.print("alady present");
            stmt.executeUpdate("update users set status='Activated' where email='" + email + "'");
            response.sendRedirect("viewPage.jsp?email=" + email);
        } else {
            PreparedStatement pstm = con.prepareStatement("INSERT INTO users(fname, email, password, img, status) VALUES (?,?,?,?,?)");
            pstm.setString(1, name);
            pstm.setString(2, email);
            pstm.setString(3, "No Need");

            pstm.setString(4, img);
            pstm.setString(5, "Activated");
            pstm.execute();
            response.sendRedirect("viewPage.jsp?email=" + email);
        }
    } catch (Exception e) {

    }
%>
