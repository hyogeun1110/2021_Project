<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
   
   <%  
      request.setCharacterEncoding("utf-8");
   
      String d5= request.getParameter("d5");
      String CS_LICENSE= request.getParameter("CS_LICENSE");
      String d4= request.getParameter("d4");
      String k= request.getParameter("k");

   
   
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
         
         String sql= "update campcar_use set  CPU_USEDAY = ?, CPU_COST = ? where CPU_ID = ? ";

         pstmt = conn.prepareStatement(sql);
      
         pstmt.setString(1,d4);
         pstmt.setString(2,d5);
         pstmt.setString(3,k);
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
    alert("변경이 완료되었습니다.");},);

  </script>