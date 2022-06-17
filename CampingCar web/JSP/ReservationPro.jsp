<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
   
   <%  
      request.setCharacterEncoding("utf-8");
   
  String CS_ID = request.getParameter("CS_ID");
    String CP_NAME = request.getParameter("CP_NAME");
   String CP_NUM = request.getParameter("CP_NUM");
   String CP_COST = request.getParameter("CP_COST");
   String datepicker1 = request.getParameter("datepicker1");
   String datepicker2 = request.getParameter("datepicker2");
   String d1 = request.getParameter("d1");
   String d2 = request.getParameter("d2");
   String k = request.getParameter("k");
  
      
         
      String id = (String)session.getAttribute("id");
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
         
         String sql= "insert into CAMPCAR_USE (CPU_ID, CPU_USESTART, CPU_USEEND, CPU_USEDAY ,CPU_COST, CS_LICENSE, CP_NUM, RES_STATE) values (?,TO_DATE(?,'yyyy-mm-dd'),TO_DATE(?,'yyyy-mm-dd'),?,?,?,?,'예약')";
   
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1,k);
         pstmt.setString(2,datepicker1);
         pstmt.setString(3,datepicker2);
         pstmt.setString(4,d1);
         pstmt.setString(5,d2);
         pstmt.setString(6,id);
         pstmt.setString(7,CP_NUM);
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
    alert("예약이 완료되었습니다.");}, 200);

  </script>