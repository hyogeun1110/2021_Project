<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%  
	request.setCharacterEncoding("utf-8");
	int cId=Integer.parseInt(request.getParameter("cId"));		

	Connection conn = null;
	PreparedStatement pstmt = null;

	try{
		String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
		String dbId="f5";
		String dbPass="1234";
  
		Class.forName("oracle.jdbc.driver.OracleDriver"); 
		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );
		
		String sql= "update company set C_STATE='사용' where c_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,cId);
		pstmt.executeUpdate();
		//out.println("삭제에 성공하였습니다.");
		response.sendRedirect("managingCompany_selectnope.jsp");
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