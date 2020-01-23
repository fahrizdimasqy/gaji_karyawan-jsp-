<%-- 
    Document   : gaji
    Created on : Jan 11, 2020, 8:05:09 PM
    Author     : 11970
--%>
<%@page import="javax.swing.JOptionPane" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<html>
    <%@include file="header.jsp" %>
<a href="tambah_gaji.jsp" class="btn btn-success mb-2 mt-2">Tambah</a>
            <% 
                try{         
                    String Host = "jdbc:mysql://localhost:3306/dbgajiwebjava";
                    Connection connection=null;
                    Statement statement = null;
                    ResultSet rs = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection(Host,"root","");
                    statement = connection.createStatement();
                    String data = "select * from gaji";
                    rs = statement.executeQuery(data);
            %>
            <table class="table">
                <tr>
                    <th> No Bukti </th>
                    <th> Tanggal Gaji </th>
                    <th> NIP </th>
                    <th> No Golonga </th>
                    <th> Potongan </th>
                    <th> Tunjangan </th>
                    <th> Keterangan </th>
                    <th> Aksi </th>
                </tr>
                <% 
                    while(rs.next()){
                %>
                <tr>
                    <td><%=rs.getString("nobukti") %> </td>
                    <td><%=rs.getString("tglgaji") %> </td>
                    <td><%=rs.getString("nip") %> </td>
                    <td><%=rs.getString("nogol") %> </td>
                    <td><%=rs.getString("potongan") %> </td>
                    <td><%=rs.getString("tunjangan") %> </td>
                    <td><%=rs.getString("keterangan") %> </td>
                    <td><a href="update_gaji.jsp?u=<%=rs.getString("nobukti") %>" class="btn btn-warning">Edit</a>
                        <a href="delete_gaji.jsp?a=<%=rs.getString("nobukti") %>" class="btn btn-danger">Hapus</a>
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
                <%@include file="footer.jsp" %>
    </body>
</html>

