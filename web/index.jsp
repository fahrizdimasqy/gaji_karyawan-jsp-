<%-- 
    Document   : login
    Created on : Jan 10, 2020, 9:32:01 AM
    Author     : 11970
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
   <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
     <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-m-10">
                <form method="post" action="">
                    <div class="card border-primary mb-3" style="">  
                        <div class="card-header bg-primary text-white">Login</div>
                        <div class="card-body text-primary">
                             <div class="form-group">
                                <label for="exampleInputEmail1">Username</label>
                                <input type="text" name="username" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Username">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                              </div>
                              <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                              </div>
                              <button type="submit" class="btn btn-primary">Submit</button>
                         </div>
                    </div>
              </form>
            </div>
        </div>
       </div>
    </body>
</html>
<%
String userid = request.getParameter("username");
String pwd = request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbgajiwebjava", "root","");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from login where username='" +userid+ "' and password='" +pwd+ "' ");
if (rs.next()){
    session.setAttribute("userid",userid);
    System.out.println("welcome"+userid);
//    System.out.println("welcome"+userid);
    response.sendRedirect("pegawai.jsp");
}else{
    System.out.println("username dan password salah");
}
%>
