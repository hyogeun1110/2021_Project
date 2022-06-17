<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
   
   <%  
      request.setCharacterEncoding("utf-8");
   
   String CPU_ID = request.getParameter("k"); 

   
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
         
         String sql= "update CAMPCAR_USE set Res_State = '예약취소' where CPU_ID = ? ";
   
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1,CPU_ID);
         pstmt.executeUpdate();

          pstmt.close();
          conn.close();
     }catch(Exception e){ 
        e.printStackTrace();
     }
   %>
      <script>
         if (confirm("예약을 취소 하시겠습니까?")) {      
                // 확인 버튼 클릭 시 동작
                alert("예약 취소 되었습니다.");
                location.href = "Main.jsp";
            } else {
                // 취소 버튼 클릭 시 동작
                alert("취소하셨습니다.");
                history.back();
            }
  </script>