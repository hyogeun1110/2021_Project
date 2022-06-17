<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%  
	request.setCharacterEncoding("utf-8");

  String rsName=request.getParameter("name");	
  int rsId=Integer.parseInt(request.getParameter("id"));	
  String rsAddress=request.getParameter("address");	
  String rsTelephone=request.getParameter("tel");	
  String rsPersonname=request.getParameter("personname");	
  String rsPersonmail=request.getParameter("personmail");	
  //int cIdint = cId);
  out.print(rsId);

%>	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회사 정보 수정</title>
</head>
<body>
<div class="container">
<%
	Connection conn = null;
	PreparedStatement pstmt = null;

	//try에서 update 실행
	try{
		String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
		String dbId="f5";
		String dbPass="1234";

		Class.forName("oracle.jdbc.driver.OracleDriver"); 
		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );
		
		String sql = "update repairshop set RS_NAME=?, RS_ADDRESS=?, RS_TELEPHONE=?, RS_PERSONNAME=?, RS_PERSONMAIL=? where RS_ID=?";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,rsName);
        pstmt.setString(2,rsAddress);
        pstmt.setString(3,rsTelephone);
        pstmt.setString(4,rsPersonname);
        pstmt.setString(5,rsPersonmail);
		pstmt.setInt(6,rsId);
		pstmt.executeUpdate();

		response.sendRedirect("managingRepairshop_select.jsp"); //목록 페이지로 이동

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