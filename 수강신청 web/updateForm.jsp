<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
  %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>정보 수정</title>
<link rel="stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
<style>
  .top{
    margin-top: 20px;
    outline: 1px solid #9F9F9F;
    width: 1000px;
    height: 100px;
    display: table;
    background-color: #eed8cb;
    background-image:url('2.png');
    background-size: 80px 80px;
    background-repeat: no-repeat;
    background-position: 10px;
}
div{
    text-align: center;
}
.container{
    width: 1000px;
    margin: 0 auto;
}
.container div{
     text-align: center;
     display: table;
}
.container div span{
    display: table-cell;
    vertical-align: middle;
}
.topSP{
    font-weight: 900;
    font-size: 40px;
}
.bottom{
    margin-top: 20px;
    margin-bottom: 20px;
    outline: 1px solid #9F9F9F;
    width: 1000px;
    height: 100px;
    background-color: #5D5D5D;
    color: #fff;
}
.middle{
    margin-top: 20px;
    width: 1000px;
    height: 500px;
    position: relative;       
}
.middle-left{
    outline: 1px solid #9F9F9F;
    position: absolute;
    top: 0px;
    width: 170px;
    height: 500px;
}
.middle-right{
    position: absolute;
    top: 0px;
    left: 190px;
    width: 810px;
    height: 500px;
    background-image:url('1.jpg');
    background-size: 810px 500px;
}
.btn1{
    width: 170px;
    height: 50px;
    color: #9F9F9F;
    border-radius: 0%;
    border: 1px;
    outline: 1px;
    outline-color: black;
}
.table{
  opacity: 0.8;
  font-weight: 800;
}
</style>
</head>
<body>
<div class="container">
  <div class="top" role="alert">
       <span class="topSP">나의 정보</span>
  </div>
  <div class="middle">
      <div class="middle-left">
          <button type="button" class="btn1 btn-secondary">전공 (필수)</button>
          <button type="button" class="btn1 btn-secondary">전공 (선택)</button>
          <button type="button" class="btn1 btn-secondary">교양 (필수)</button>
          <button type="button" class="btn1 btn-secondary" autofocus>교양 (선택)</button>
      </div>
      <div class="middle-right">
        <form method="post" action="updatePro.jsp">      
          <%  
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

  try{
	String jdbcUrl = "jdbc:mysql://localhost:3306/ysu";
    String dbId = "ysu";
    String dbPass = "1234";
	 
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	
	String sql = "select passwd,name,mail,phone,mainsub from member2 where id=?";
	pstmt = conn.prepareStatement(sql);
  pstmt.setString(1,id);

	rs = pstmt.executeQuery();
    
	String passwd=rs.getString("passwd");
  String name=rs.getString("name");
  String mail=rs.getString("mail");
  String phone=rs.getString("phone");
  String mainS=rs.getString("mainsub");
%>   

            <input type="text" class="form-control" name="id" id="id" value="<%=id%>" maxlength="50" readonly>

            <input type="password" class="form-control" name="passwd" id="passwd" placeholder="비밀번호 입력" maxlength="16" required>

            <input type="text" class="form-control" name="name" id="name" value="<%=name%>" maxlength="10" required>

            <input type="text" class="form-control" name="mail" id="mail" value="<%=mail%>" maxlength="22" required>

            <input type="text" class="form-control" name="phone" id="phone" value="<%=phone%>" maxlength="11" required>

            <input type="text" class="form-control" name="mainS" id="mainS" value="<%=mainS%>" maxlength="15" required>

            <input type="submit" class="btn btn-primary" value="변경">
        </form>
      <%
    }catch(Exception e){ 
      e.printStackTrace();
     }finally{
      if(rs != null) 
        try{rs.close();}catch(SQLException sqle){}
      if(pstmt != null) 
        try{pstmt.close();}catch(SQLException sqle){}
      if(conn != null) 
        try{conn.close();}catch(SQLException sqle){}
     }
   %>

</div>
</div>
    <div class="bottom">
        <p align="left"></br>&nbsp ooooo TEL : 123-456-7890 </br>
            &nbsp www.ooo.com
        </p>
    </div>
</div>
</body>
</html>