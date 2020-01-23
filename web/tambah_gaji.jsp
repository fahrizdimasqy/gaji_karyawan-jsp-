<%-- 
    Document   : tambah_gaji
    Created on : Jan 11, 2020, 8:11:05 PM
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
        <div class="container">
            <form action="" method="post">
                <div class="form-row">
                  <div class="form-group col-md-12">
                    <label for="inputPassword4">No Bukti</label>
                    <input type="text" name="nobukti" class="form-control" id="inputPassword4" placeholder="Password">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputAddress">Tanggal Gaji</label>
                  <input type="text" name="tglgaji" class="form-control" id="inputAddress" placeholder="1234 Main St">
                </div>
                <div class="form-group">
                  <label for="inputAddress2">Nip </label>
                  <input type="text" name="nip" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
                </div>
                <div class="form-group">
                  <label for="inputAddress2">No golongan </label>
                  <input type="text" name="nogol" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
                </div>
                <div class="form-group">
                  <label for="inputAddress2">Potongan </label>
                  <input type="text" name="potongan" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
                </div>
                <div class="form-row">
                  <div class="form-group col-md-6">
                    <label for="inputCity">Tunjangan</label>
                    <input type="text" name="tunjangan"  class="form-control" id="inputCity">
                  </div>
                  <div class="form-group col-md-6">
                    <label for="inputState">Keterangan</label>
                    <select id="inputState" class="form-control" name="keterangan">
                      <option selected>Choose...</option>
                      <option value="Sudah_Terima">Sudah Terima</option>
                      <option value="Belum_Terima">Belum Terima</option>
                    </select>
                  </div>                  
                <button type="submit" class="btn btn-primary mr-2 mb-5">Tambah</button>
                <a href="gaji.jsp" type="submit" class="btn btn-info mb-5">Kembali</a>
                
              </form>
        </div>
    </body>
</html>
<%
    String a = request.getParameter("nobukti");
    String b = request.getParameter("tglgaji");;
    String c = request.getParameter("nip");
    String d = request.getParameter("nogol");
    String e = request.getParameter("potongan");
    String f = request.getParameter("tunjangan");
    String g = request.getParameter("keterangan");
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
                String query = "insert into gaji(Nobukti, Tglgaji, Nip, Nogol, Potongan, Tunjangan,Keterangan) values(?,?,?,?,?,?,?)";
                ps = conn.prepareStatement(query);
                ps.setString(1, a);
                ps.setString(2, b);
                ps.setString(3, c);
                ps.setString(4, d);
                ps.setString(5, e);
                ps.setString(6, f);
                ps.setString(7, g);
                ps.executeUpdate();
                response.sendRedirect("gaji.jsp");
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
