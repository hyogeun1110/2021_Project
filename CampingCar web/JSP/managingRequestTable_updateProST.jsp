<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	//ST는 그냥 정보 수정만
  request.setCharacterEncoding("utf-8");
  int RR_ID = Integer.parseInt(request.getParameter("RR_ID"));	
  String CP_NUM = request.getParameter("CP_NUM");	
  String RRSTATE_START = request.getParameter("RRSTATE_START");	
  int RR_COST = Integer.parseInt(request.getParameter("RR_COST"));	
  String RR_PAYDAY = request.getParameter("RR_PAYDAY");	
  String RR_ETCCOMMENT = request.getParameter("RR_ETCCOMMENT");	
  String pst = request.getParameter("pst");	
  
	Connection conn = null;
	PreparedStatement pstmt = null;

	//try에서 update 실행
	try{
		String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
		String dbId="f5";
		String dbPass="1234";

		Class.forName("oracle.jdbc.driver.OracleDriver"); 
		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );
	
		String sql = "update RR_LIST set  RR_ETCCOMMENT=?,RR_PAYDAY=?,RR_COST=?  where RR_ID=? AND RRSTATE=?";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,RR_ETCCOMMENT);
		pstmt.setString(2,RR_PAYDAY);
		pstmt.setInt(3,RR_COST);
		pstmt.setInt(4,RR_ID);
		pstmt.setString(5,pst);
		pstmt.executeUpdate();

		response.sendRedirect("managingRequest_select.jsp"); //목록 페이지로 이동

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
