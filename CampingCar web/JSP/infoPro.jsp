<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
   
   <%  
      request.setCharacterEncoding("utf-8");
   
   String id = request.getParameter("id");
   String passwd= request.getParameter("passwd");
   String name = request.getParameter("name"); 
   String num1 = request.getParameter("num1");  
   String address1[] = request.getParameterValues("address"); 
   String email1 = request.getParameter("email");  
   String tail = request.getParameter("emailTail");  
   String address = address1[0] + address1[1] + address1[2] + address1[3];
   String email = email1 + tail ;
   session.setAttribute("NAME",name);
   
   %>   
   <!DOCTYPE html>
   <html lang="en">
   <head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>레코드 수정</title>
   <link rel="stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
   </head>
   <body>
   <div class="container">
   <%
      Connection conn = null;
      PreparedStatement pstmt = null;
      //ResultSet rs = null;
   
      try{
         String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
         String dbId="f5";
         String dbPass="1234";
     
         Class.forName("oracle.jdbc.driver.OracleDriver"); 
         conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );
         
         String sql= "update customer set CS_PASSWD=?,CS_NAME=?,CS_TELEPHONE=?, CS_ADDRESS=?,CS_MAIL=? where CS_LICENSE = ? ";
   
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1,passwd);
         pstmt.setString(2,name);
         pstmt.setString(3,num1);
         pstmt.setString(4,address);
         pstmt.setString(5,email);
         pstmt.setString(6,id);
         pstmt.executeUpdate();

          pstmt.close();
          conn.close();
     }catch(Exception e){ 
        e.printStackTrace();
     }
   %>
      <script>

    setTimeout(function(){
    location.href = "Main.jsp";
    alert("정보수정이 완료되었습니다.");}, 200);

  </script>