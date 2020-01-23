<%-- 
    Document   : delete_gaji
    Created on : Jan 11, 2020, 9:51:26 PM
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
            String a = request.getParameter("a");
            try{
               Class.forName("com.mysql.jdbc.Driver").newInstance();
               Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbgajiwebjava", "root","");
               Statement st = conn.createStatement();
               st.executeUpdate("delete from gaji where Nobukti='"+a+"'");
               response.sendRedirect("gaji.jsp");
            }catch (Exception e){
                System.out.println("Koneksi gagal");
            }
        %>
    </body>