<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%  
	request.setCharacterEncoding("utf-8");

  String cName=request.getParameter("name");	
  int cId=Integer.parseInt(request.getParameter("id"));	
  String cAddress=request.getParameter("address");	
  String cTelephone=request.getParameter("tel");	
  String cPersonname=request.getParameter("personname");	
  String cPersonmail=request.getParameter("personmail");	
    String img = request.getParameter("img");		
 
  StringBuilder imgPath = new StringBuilder(); // stringBuilder 생성
  imgPath.append("img/");
  imgPath.append(img);
  img = imgPath.toString();
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

	try{
		String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
		String dbId="f5";
		String dbPass="1234";

		Class.forName("oracle.jdbc.driver.OracleDriver"); 
		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );
		
		String sql = "insert into company (c_name, c_address, c_telephone, c_personname, c_personmail, c_id, C_IMAGES) values (?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		

		pstmt.setString(1,cName);
        pstmt.setString(2,cAddress);
        pstmt.setString(3,cTelephone);
        pstmt.setString(4,cPersonname);
        pstmt.setString(5,cPersonmail);
		pstmt.setInt(6,cId);
		pstmt.setString(7,img);
		pstmt.executeUpdate();

  		response.sendRedirect("managingCompany_select.jsp"); //목록 페이지로 이동

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