<%-- 
    Document   : golongan
    Created on : Jan 10, 2020, 9:43:35 AM
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
<a href="tambah_gol.jsp" class="btn btn-success mb-2 mt-2">Tambah</a>
            <% 
                try{         
                    String Host = "jdbc:mysql://localhost:3306/dbgajiwebjava";
                    Connection connection=null;
                    Statement statement = null;
                    ResultSet rs = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection(Host,"root","");
                    statement = connection.createStatement();
                    String data = "select * from golongan";
                    rs = statement.executeQuery(data);
            %>
            <table class="table">
                <tr>
                    <th> Nomor Golongan </th>
                    <th> Nama Golongan </th>
                    <th> Masuk </th>
                    <th> Gajih Pokok </th>
                    <th>Aksi</th>
                </tr>
                <% 
                    while(rs.next()){
                %>
                <tr>
                    <td><%=rs.getString("nogol") %> </td>
                    <td><%=rs.getString("namagol") %> </td>
                    <td><%=rs.getString("msk") %> </td>
                    <td><%=rs.getString("gapok") %> </td>
                    <td><a href="update_gol.jsp?u=<%=rs.getString("nogol") %>" class="btn btn-warning">Edit</a>
                        <a href="delete_gol.jsp?d=<%=rs.getString("nogol") %>" class="btn btn-danger">Hapus</a>
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
