<%-- 
    Document   : tambah
    Created on : Jan 9, 2020, 2:33:55 PM
    Author     : 11970
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.swing.JOptionPane" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
        <div class="alert alert-primary" role="alert">
        Tambah Data
        </div>
        <form action="" method="post">
            <div class="container">
                <div class="input-group">
                    <label class="mr-2"> NIP </label>
                    <input type="text" name="nip" class="form-control">
                </div>
                <br>
                <div class="input-group">
                    <label class="mr-2"> Nama </label>
                    <input type="text" name="nama" class="form-control">
                </div>
                <br>
                <div class="input-group">
                    <label class="mr-2"> Alamat </label>
                    <input type="text" name="alamat" class="form-control">
                </div>
                <br>
                <div class="input-group">
                    <label class="mr-2"> Jenis Kelamain </label>
                    <input type="radio"value="Laki-Laki" name="jk"> Laki-Laki
                    <input type="radio"value="Perempuan" name="jk" class="ml-4"> Perempuan
                </div>
                <br>
                <button class="btn btn-primary" type="submit">Save</button>
                <a href="pegawai.jsp" class="btn btn-info">Kembali</a>
            </div>
        </form>
    </body>
</html>
<%
    String a = request.getParameter("nip");
    String b = request.getParameter("nama");
    String c = request.getParameter("alamat");
    String d = request.getParameter("jk");
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
                String query = "insert into pegawai(nip, nama, alamat, jk) values(?,?,?,?)";
                ps = conn.prepareStatement(query);
                ps.setString(1, a);
                ps.setString(2, b);
                ps.setString(3, c);
                ps.setString(4, d);
                ps.executeUpdate();
                response.sendRedirect("pegawai.jsp");
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
