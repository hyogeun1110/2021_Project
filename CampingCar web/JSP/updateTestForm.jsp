<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,java.io.*"%>
<%
  request.setCharacterEncoding("utf-8");

  String rr_id = request.getParameter("rr_id"); 
%>
<style>
  .top{     
        width: 100%;
        height: 60px;
    }
    .squ{
        border: 0px;
        height: 400px;
        width: 500px;
        position: relative;
        top: 75px;
        left: 535px;
        border-radius: 10px;
        background-color: white;
    }
</style>
<%
  Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
try {
      String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
		String dbId="f5";
		String dbPass="1234";
  
		Class.forName("oracle.jdbc.driver.OracleDriver"); 
		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );

%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>레코드 수정</title>
<link rel="stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
<link rel = "stylesheet" href="css/style.css">
</head>
<body style="background-image: url('img/color1.jpg');">
  <div class="top">
    <img  src="img/F5.png" style="width:90px; height:70px; position:relative; top:20px;left: -700px; z-index: 3;" onclick="location='Main.jsp'"> 
 </div>
<div class="squ">
  <form method="post" action="updateTestPro.jsp">
    <%
    String sql = "select rr_id , rr_comment from REPAIR_REQUEST where rr_id=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,rr_id);
    rs = pstmt.executeQuery();

    while(rs.next()){
      String rr_id1 = rs.getString("rr_id");
      String rr_com = rs.getString("rr_comment");
      %>
    <br>
    <div style="position: relative;right: 200px;bottom: 15px;">
      <label style="font-size:14px; font-weight: 400;">번호 :</label>
      <input type="text" name="rr_id" style="width: 35px;border: 0px; font-size: 14px;font-weight: 400;" value="<%=rr_id1%>" readonly>
    </div>
    <br>
        <label>수리내용 변경</label>
    <br>
    <br>
        <input type="text" name="rr_com" id="id" value="<%=rr_com%>" maxlength="50" style="width: 250px;height: 180px;" required>
    <br>
    <br>
    <br>
        <input type="submit" class="btn btn-outline-primary" value="변경">
  </form>
</div>  
<% } 
} catch (Exception e) {
    e.printStackTrace();
    } finally {
    try {
    if (rs != null) {
       rs.close();
    }
    if (pstmt != null) {
       pstmt.close();
    }
    if (conn != null) {
       conn.close();
    }
    } catch (Exception e) {
    e.printStackTrace();
    }
    }
    %>
</body>
</html>