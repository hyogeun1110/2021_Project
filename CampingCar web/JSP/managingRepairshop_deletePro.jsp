<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%  
	request.setCharacterEncoding("utf-8");
	int RS_ID=Integer.parseInt(request.getParameter("id"));		

	Connection conn = null;
	PreparedStatement pstmt = null;

	try{
		String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
		String dbId="f5";
		String dbPass="1234";
  
		Class.forName("oracle.jdbc.driver.OracleDriver"); 
		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );
		
		String sql= "update REPAIRSHOP set RS_STATE='미사용' where RS_ID=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,RS_ID);
		pstmt.executeUpdate();
		out.println("삭제에 성공하였습니다.");

		response.sendRedirect("managingRepairshop_select.jsp"); //목록 페이지로 이동
  }catch(Exception e){ 
	  out.println("삭제에 실패하였습니다. 다시 시도해주세요.");
	  e.printStackTrace();
  }finally{
	  if(pstmt != null) 
		 try{pstmt.close();}catch(SQLException sqle){}
	  if(conn != null) 
		 try{conn.close();}catch(SQLException sqle){}
  }
%>
