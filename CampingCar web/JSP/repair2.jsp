<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
  request.setCharacterEncoding("utf-8");

  String cpu_id1 = request.getParameter("cpu_id1");
  String rid1 = request.getParameter("rId");

  Connection conn = null;
  PreparedStatement stmt = null;
  ResultSet rs = null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel = "stylesheet" href="css/style.css">
<link rel="stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
<style>
  .top{     
        width: 100%;
        height: 60px;
    }
    .squ{
        border: 0px solid black;
        height: 400px;
        width: 500px;
        position: relative;
        top: 55px;
        left: 350px;
        border-radius: 10px;
        background-color: white;
    }
</style>
</head>
<body style="background-image: url('img/color1.jpg');">
  <div class="top">
    <img  src="img/F5.png" style="width:90px; height:70px; position:relative; top:20px;left: -700px; z-index: 3;" onclick="location='Main.jsp'"> 
 </div>
<%
      try {
      String uid = "F5";
      String pwd = "1234";
      String url = "jdbc:oracle:thin:@localhost:1521:XE";
      Class.forName("oracle.jdbc.driver.OracleDriver");
      conn = DriverManager.getConnection(url, uid, pwd);

      String sql = "select c.cp_name , c.cp_num from campcar c , campcar_use cu where cu.cp_num = c.cp_num and cu.cpu_id = ?";
      stmt = conn.prepareStatement(sql);
      stmt.setString(1,cpu_id1);
      rs = stmt.executeQuery();
      while(rs.next()){
        String num1 = rs.getString("cp_num");
        String name1 = rs.getString("cp_name");
   %>
<div class="squ" style="position: relative;left: 500px;">
  <br>
  <b style="font:12px/24px;position: relative; top: 10px;">예약내역 확인</b>
  <div class="container-fluid">
    <div class="row" style="position: relative;top: 50px; left: 80px;">  
        <form method="post" action="repairPro.jsp?rId=<%=rid1%>">
          <div class="mb-3">
            <input type="text" class="form-control" name="carname" id="carname" value="<%=name1%>" maxlength="50" style="width: 300px;" readonly>
          </div>
          <div class="mb-3">
            <input type="text" class="form-control" name="carnum" id="num" value="<%=num1%>" maxlength="50" style="width: 300px;" readonly>
          </div>
          <div class="mb-3">
            <input type="text" class="form-control mb-3" name="cont" id="cont" placeholder="정비 내역" maxlength="100" style="width: 300px; height: 100px;" required>
          </div>
          <div class="d-grid gap-2 d-md-flex justify-content-md-end" >            
          </div>
          <input type="submit" class="btn btn-primary" style="position: relative;top:30px;left: 120px;" value="신청" arign="right">
        </form>
    </div>
  </div> 
</div>

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

</body>
</html>