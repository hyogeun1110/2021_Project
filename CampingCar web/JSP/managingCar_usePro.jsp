<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%  
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try{
		String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
		String dbId="f5";
		String dbPass="1234";
  
		Class.forName("oracle.jdbc.driver.OracleDriver"); 
		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );
		
		String sql= "update campcar set CP_STATE='사용' where cp_num=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,num);
		pstmt.executeUpdate();
		response.sendRedirect("managingCar_selectnope.jsp");
  }catch(Exception e){ 
	  e.printStackTrace();
	  out.print("차량 삭제에 실패하였습니다");
  }finally{
	  if(rs != null) 
		 try{rs.close();}catch(SQLException sqle){}
	  if(pstmt != null) 
		 try{pstmt.close();}catch(SQLException sqle){}
	  if(conn != null) 
		 try{conn.close();}catch(SQLException sqle){}
  }
%>
