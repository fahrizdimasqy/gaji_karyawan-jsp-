<%-- 
    Document   : index
    Created on : Jan 9, 2020, 2:16:27 PM
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
    <%@include  file="header.jsp" %>
            <a href="tambah.jsp" class="btn btn-success mb-2 mt-2">Tambah</a>
            <% 
                try{         
                    String Host = "jdbc:mysql://localhost:3306/dbgajiwebjava";
                    Connection connection=null;
                    Statement statement = null;
                    ResultSet rs = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection(Host,"root","");
                    statement = connection.createStatement();
                    String data = "select * from pegawai";
                    rs = statement.executeQuery(data);
            %>
            <table class="table">
                <tr>
                    <th> Nip </th>
                    <th> Nama </th>
                    <th> Alamat </th>
                    <th> Jenis Kelamin </th>
                    <th>Aksi</th>
                </tr>
                <% 
                    while(rs.next()){
                %>
                <tr>
                    <td><%=rs.getString("nip") %> </td>
                    <td><%=rs.getString("nama") %> </td>
                    <td><%=rs.getString("alamat") %> </td>
                    <td><%=rs.getString("jk") %> </td>
                    <td><a href="update.jsp?u=<%=rs.getString("nip") %>" class="btn btn-warning">Edit</a>
                        <a href="delete.jsp?d=<%=rs.getString("nip") %>" class="btn btn-danger">Hapus</a>
                    </td>
                </tr>
                <% } %>
            </table>
                <%
                    rs.close();
                    statement.close();
                    connection.close();
                    }catch (Exception ex){
                        System.out.println("koneksi error");
                    }
                %>
                <%@include  file="footer.jsp" %>
    </body>
</html>
