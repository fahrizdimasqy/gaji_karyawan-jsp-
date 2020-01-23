<%-- 
    Document   : delete_gol
    Created on : Jan 10, 2020, 1:25:55 PM
    Author     : 11970
--%>

<%-- 
    Document   : delete
    Created on : Jan 10, 2020, 9:15:27 AM
    Author     : 11970
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.swing.JOptionPane" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String id = request.getParameter("d");
            try{
               Class.forName("com.mysql.jdbc.Driver").newInstance();
               Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbgajiwebjava", "root","");
               Statement st = conn.createStatement();
               st.executeUpdate("delete from golongan where nogol='"+id+"'");
               response.sendRedirect("golongan.jsp");
            }catch (Exception e){
                System.out.println("Koneksi gagal");
            }
        %>
    </body>
</html>

