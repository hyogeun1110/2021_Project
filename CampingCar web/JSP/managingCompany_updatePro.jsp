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
  //int cIdint = cId);


	Connection conn = null;
	PreparedStatement pstmt = null;

	//try에서 update 실행
	try{
		String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
		String dbId="f5";
		String dbPass="1234";

		Class.forName("oracle.jdbc.driver.OracleDriver"); 
		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );
		
		String sql = "update company set C_NAME=?, C_ADDRESS=?, C_TELEPHONE=?, C_PERSONNAME=?, C_PERSONMAIL=? where C_ID=?";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,cName);
        pstmt.setString(2,cAddress);
        pstmt.setString(3,cTelephone);
        pstmt.setString(4,cPersonname);
        pstmt.setString(5,cPersonmail);
		pstmt.setInt(6,cId);
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
