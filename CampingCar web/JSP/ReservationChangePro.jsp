<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
   
   <%  
   request.setCharacterEncoding("utf-8");

   String d2= request.getParameter("d2");
   //String carSelect= request.getParameter("carSelect1");
   String CS_LICENSE= request.getParameter("CS_LICENSE");
   String datepicker1= request.getParameter("datepicker1");
   String datepicker2= request.getParameter("datepicker2");
   String d1= request.getParameter("d1");
   String k= request.getParameter("k");

   //   String[] carValues = carSelect.split("/");
   //   String carNum = carValues[0]; 
   //   String carName = carValues[1];
   //   String carCost = carValues[2];
   String carNum= request.getParameter("carSelect2");
   
   
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
      ResultSet myRS = null;
   
      try{
         String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
         String dbId="f5";
         String dbPass="1234";
     
         Class.forName("oracle.jdbc.driver.OracleDriver"); 
         conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );
         
         String sql = "select * from CAMPCAR_USE where CPU_USEEND between to_date(?,'yyyy-mm-dd') AND to_date(?,'yyyy-mm-dd') or CPU_USESTART between to_date(?,'yyyy-mm-dd') and to_date(?,'yyyy-mm-dd') and res_state ='예약'";
         pstmt = conn.prepareStatement(sql); 
         pstmt.setString(1,datepicker1);
         pstmt.setString(2,datepicker2);
         pstmt.setString(3,datepicker1);
         pstmt.setString(4,datepicker2);
         myRS = pstmt.executeQuery();
         if(myRS.next()){
         %>
            <script>
               setTimeout(function(){
                  alert("날짜를 변경해주세요");
                  history.back();});
               </script>
            <%

         }

         sql= "update campcar_use set CP_NUM = ?, CPU_USESTART = ?, CPU_USEEND = ? where CPU_ID = ? ";

         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1,carNum);
         pstmt.setString(2,datepicker1);
         pstmt.setString(3,datepicker2);
         pstmt.setString(4,k);
         pstmt.executeUpdate();

          pstmt.close();
          conn.close();
     }catch(Exception e){ 
        e.printStackTrace();
     }
   %>
      <script>

    setTimeout(function(){
    location.href = "ReservationChangeCheck.jsp?k=<%=k%>";
    },);

  </script>