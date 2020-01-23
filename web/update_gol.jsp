<%-- 
    Document   : update_gol
    Created on : Jan 10, 2020, 1:06:24 PM
    Author     : 11970
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.swing.JOptionPane" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
        <div class="alert alert-primary" role="alert">
        Update Data
        </div>
        <form action="" method="post">
            <% 
                try{         
                    String Host = "jdbc:mysql://localhost:3306/dbgajiwebjava";
                    Connection connection=null;
                    Statement statement = null;
                    ResultSet rs = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection(Host,"root","");
                    statement = connection.createStatement();
                    String num = request.getParameter("u");
                    String data = "select * from golongan where nogol='"+num+"'";
                    rs = statement.executeQuery(data);
                    while(rs.next()){
                    
            %>
            <div class="container">
                <div class="input-group">
                    <label class="mr-2"> No Golongan </label>
                    <input type="text" name="nogol" class="form-control" value="<%=rs.getString("nogol")%>">
                </div>
                <br>
                <div class="input-group">
                    <label class="mr-2"> Nama Golongan </label>
                    <input type="text" name="namagol" class="form-control" value="<%=rs.getString("namagol")%>">
                </div>
                <br>
                <div class="input-group">
                    <label class="mr-2"> Masa Kerja</label>
                    <input type="text" name="msk" class="form-control" value="<%=rs.getString("msk")%>">
                </div>
                <br>
                <div class="input-group">
                    <label class="mr-2"> Gaji Pokok </label>
                    <input type="text" name="gapok" class="form-control" value="<%=rs.getString("gapok")%>">
                </div>
                <br>
                <button class="btn btn-primary" type="submit">Save</button>
                <a href="golongan.jsp" class="btn btn-info">Kembali</a>
                <% 
                }
                rs.close();
                statement.close();
                }catch(Exception ex){
                    System.out.println("koneksi error");
                }
            %>
            </div>
        </form>
    </body>
</html>
<%
    String a = request.getParameter("nogol");
    String b = request.getParameter("namagol");
    String c = request.getParameter("msk");
    String d = request.getParameter("gapok");
//    membuat variable untuk koneksi ke database
    
    String url="jdbc:mysql://localhost:3306/dbgajiwebjava";
    Connection conn = null;
    PreparedStatement ps = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
//    int updateQuery=0;
    if (a!=null && b!=null && c!=null && d!=null ){
//        if(a!="" && b!="" && c!="" && d!="" ){
//            try{
                conn=DriverManager.getConnection(url, "root", "");
                  String query = "update golongan set namagol=?, msk=?, gapok=? where nogol='"+a+"'";
                ps = conn.prepareStatement(query);
                ps.setString(1, b);
                ps.setString(2, c);
                ps.setString(3, d);
                ps.executeUpdate();
                response.sendRedirect("golongan.jsp");
//                updateQuery=ps.executeUpdate();
//                if(updateQuery!=0){
//                    JOptionPane.showMessageDialog(null, "Data Berhasil ditambahkan!");
//                    response.sendRedirect("index.jsp");
//                }
//            }
//            catch(Exception ex){
//                System.out.println("Koneksi Bermasalah");
//            }
//            finally{
//                ps.close();
//                conn.close();
//          }
//        }
    }
%>