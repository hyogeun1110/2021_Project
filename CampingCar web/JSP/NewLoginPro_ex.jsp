<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
   
   <%  
      request.setCharacterEncoding("utf-8");
   
  String id = request.getParameter("id");
   String passwd= request.getParameter("passwd");
   String name = request.getParameter("name"); 
   String num = request.getParameter("num1"); 
   String postnum = request.getParameter("postnum");
   String address1[] = request.getParameterValues("address");
   String email1 = request.getParameter("email");  
   String tail = request.getParameter("emailTail");  
   
   String email = email1 + tail ;
   String address = address1[0] + address1[1] + address1[2] + address1[3];
   %>   
   <!DOCTYPE html>
   <html lang="en">
   <head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>레코드 수정</title>
   <link rel="stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
   <style>
   .str{
      position: relative;
      left: 280px;
      top: 150px;
      font-weight: 900;
      font-size: 40px;
      color :rgb(0, 0, 0);
   }
   </style>
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
         
         String sql= "insert into customer (CS_LICENSE, CS_PASSWD, CS_NAME,CS_TELEPHONE, CS_ADDRESS, CS_MAIL) values (?,?,?,?,?,?)";
   
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1,id);
         pstmt.setString(2,passwd);
         pstmt.setString(3,name);
         pstmt.setString(4,num);
         pstmt.setString(5,address);
         pstmt.setString(6,email);
         pstmt.executeUpdate();
         
         sql= "insert into CU_LIST (CS_LICENSE, JOINDATEEND, JOINSTATE) values (?,TO_DATE('9999-12-31','YYYY-MM-DD'), '가입')";
        
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1,id);
          pstmt.executeUpdate();
          pstmt.close();
          conn.close(); %>
          

          <%
     }catch(Exception e){ 
        e.printStackTrace();
     }
   %>
    <script>

    setTimeout(function(){
    location.href = "Main.jsp";
    alert("회원가입 완료");}, 200);

  </script>