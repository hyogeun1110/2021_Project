<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<% 

   String rid1 = request.getParameter("rId");
   String id = "";
   id = (String)session.getAttribute("id");
   Connection conn = null;
   PreparedStatement stmt = null;
   ResultSet rs = null;
   
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약내역</title>
<link rel = "stylesheet" href="css/style.css">
</head>
<style>
   .a1{
      background-image:url('F5.png');
      background-size:90px 70px;
      background-repeat: no-repeat;
   }
   .f5{
      width:90px; 
      height:70px;
      position: relative;
      top:5px;
      left:10px;
      z-index:10;
   }
   .t1{
      
      position: relative; 
      top:55px;
      bottom : 50px;

   }
   .b1{
      font:20;

   }
   .top{     
        width: 100%;
        height: 60px;
    }
</style>
<body style="background-image: url('img/color1.jpg');">
     
<div class="top">
   <img  src="img/F5.png" style="width:90px; height:70px; position:relative; left:-690px; top:20px; z-index: 3;" onclick="location='Main.jsp'"> 
</div>

<br><br><br>
   <%
      try {
      String uid = "F5";
      String pwd = "1234";
      String url = "jdbc:oracle:thin:@localhost:1521:XE";
      Class.forName("oracle.jdbc.driver.OracleDriver");
      conn = DriverManager.getConnection(url, uid, pwd);

      String sql = "select cpu.cpu_id, cp.cp_num, cp.cp_name from campcar cp, campcar_use cpu where cpu.cs_license = ? and cpu.cp_num = cp.cp_num";   
      stmt = conn.prepareStatement(sql);
      stmt.setString(1,id);
      rs = stmt.executeQuery();
   %>
   
   <table class="t1" align = "center"; style = " border:0px ;border-radius: 10px; background-color: white;">
      <b style="font-size:24px ;position: relative; left: 680px; top: 10px;">예약내역 확인</b>
      <tr height="50px;">
         <th width="100px;">예약번호</th>
         <th width="100px;">차량번호</th>
         <th width="100px;">모델명</th>
         <th width="100px;">수리신청</th>
      </tr>
      <%
         while (rs.next()) {
            String cpu_id1=rs.getString("cpu_id");
            String num1=rs.getString("cp_num");
            String name1=rs.getString("cp_name");
      %>
      <tr height="50px;">
         <td width="100px;" align="center"><%=cpu_id1%></td>
         <td width="100px;" align="center"><%=num1%></td>
         <td width="100px;" align="center"><%=name1%></td>
         <td width="100px;" align="center"><button type = "button" onClick="location.href='repair2.jsp?rId=<%=rid1%>&cpu_id1=<%=cpu_id1%>'">신청하기</button></td>
      </tr>
   

   <%
      }
   } catch (Exception e) {
   e.printStackTrace();
   } finally {
   try {
   if (rs != null) {
      rs.close();
   }
   if (stmt != null) {
      stmt.close();
   }
   if (conn != null) {
      conn.close();
   }
   } catch (Exception e) {
   e.printStackTrace();
   }
   }
   %>

   </table>
</body>
</html>