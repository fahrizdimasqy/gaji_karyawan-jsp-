<%-- 
    Document   : update_gaji
    Created on : Jan 11, 2020, 9:34:36 PM
    Author     : 11970
--%>

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
        <div class="container">
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
                    String data = "select * from gaji where Nobukti='"+num+"'";
                    rs = statement.executeQuery(data);
                    while(rs.next()){
                    
            %>
                <div class="form-row">
                  <div class="form-group col-md-12">
                    <label for="inputPassword4">No Bukti</label>
                    <input type="text" name="nobukti" class="form-control" id="inputPassword4" placeholder="Password" value="<%=rs.getString("Nobukti")%>">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputAddress">Tanggal Gaji</label>
                  <input type="text" name="tglgaji" class="form-control" id="inputAddress" placeholder="1234 Main St" value="<%=rs.getString("Tglgaji")%>">
                </div>
                <div class="form-group">
                  <label for="inputAddress2">Nip </label>
                  <input type="text" name="nip" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor" value="<%=rs.getString("Nip")%>">
                </div>
                <div class="form-group">
                  <label for="inputAddress2">No golongan </label>
                  <input type="text" name="nogol" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor" value="<%=rs.getString("Nogol")%>">
                </div>
                <div class="form-group">
                  <label for="inputAddress2">Potongan </label>
                  <input type="text" name="potongan" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor" value="<%=rs.getString("Potongan")%>">
                </div>
                <div class="form-row">
                  <div class="form-group col-md-6">
                    <label for="inputCity">Tunjangan</label>
                    <input type="text" name="tunjangan"  class="form-control" id="inputCity" value="<%=rs.getString("Tunjangan")%>">
                  </div>
                  <div class="form-group col-md-6">
                    <label for="inputState">Keterangan</label>
                    <select id="inputState" class="form-control" name="keterangan" value="<%=rs.getString("Keterangan")%>">
                      <option selected>Choose...</option>
                      <option value="Sudah_Terima">Sudah Terima</option>
                      <option value="Belum_Terima">Belum Terima</option>
                    </select>
                  </div>                  
                <button type="submit" class="btn btn-primary mr-2 mb-5">Tambah</button>
                <a href="gaji.jsp" type="submit" class="btn btn-info mb-5">Kembali</a> 
                 <% 
                }
                rs.close();
                statement.close();
                }catch(Exception ex){
                    System.out.println("koneksi error");
                }
            %>
              </form>
        </div>
    </body>
</html>
<%
    String a1 = request.getParameter("nobukti");
    String a = request.getParameter("tglgaji");;
    String b = request.getParameter("nip");
    String c = request.getParameter("nogol");
    String d = request.getParameter("potongan");
    String e = request.getParameter("tunjangan");
    String f= request.getParameter("keterangan");
//    membuat variable untuk koneksi ke database
    
    String url="jdbc:mysql://localhost:3306/dbgajiwebjava";
    Connection conn = null;
    PreparedStatement ps = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
//    int updateQuery=0;
    if ( a1!=null && a!=null && b!=null && c!=null && d!=null && e!=null && f!=null){
//        if(a!="" && b!="" && c!="" && d!="" ){
//            try{
                conn=DriverManager.getConnection(url, "root", "");
                String query = "update gaji set Potongan=?, Tunjangan=?,Keterangan=? where Nobukti='"+a1+"'";
                ps = conn.prepareStatement(query);
                ps.setString(1, d);
                ps.setString(2, e);
                ps.setString(3, f);
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

