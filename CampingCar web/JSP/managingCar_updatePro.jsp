<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%  
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");	
	String type = request.getParameter("type");	
	String num = request.getParameter("num");	
	String date = request.getParameter("date");	
	int count = Integer.parseInt(request.getParameter("count"));	
	String info = request.getParameter("info");	
	int cost = Integer.parseInt(request.getParameter("cost"));	

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
	try{
		String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
		String dbId="f5";
		String dbPass="1234";
  
		Class.forName("oracle.jdbc.driver.OracleDriver"); 
		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );
		
		String sql= "update campcar set cp_name=?, cp_type=?, cp_count=?, cp_info=?, cp_cost=? where cp_num=?";

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,name);
		pstmt.setString(2,type);
		pstmt.setInt(3,count);
		pstmt.setString(4,info);
		pstmt.setInt(5,cost);
		pstmt.setString(6,num);
		pstmt.executeUpdate();

		response.sendRedirect("managingCar_select.jsp");

  }catch(Exception e){ 
	  out.print("오류가 발생하였습니다. 다시 시도해 주시기 바랍니다");
	  e.printStackTrace();
  }finally{
	  if(pstmt != null) 
		 try{pstmt.close();}catch(SQLException sqle){}
	  if(conn != null) 
		 try{conn.close();}catch(SQLException sqle){}
  }
%>
</div>
<script>
// setTimeout(function(){
// 	location.href = 'selectTest.jsp';
// }, 2000);
</script>
</body>
</html>