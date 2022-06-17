<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
  request.setCharacterEncoding("utf-8");
  int CPU_ID = Integer.parseInt(request.getParameter("CPU_ID"));	
  String CPU_PAYDATE = request.getParameter("CPU_PAYDATE");	
  String CPU_ETCPAYINFO = request.getParameter("CPU_ETCPAYINFO");	
  String CPU_ETCPAYCOST = request.getParameter("CPU_ETCPAYCOST");	
  
	Connection conn = null;
	PreparedStatement pstmt = null;

	//try에서 update 실행
	try{
		String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
		String dbId="f5";
		String dbPass="1234";

		Class.forName("oracle.jdbc.driver.OracleDriver"); 
		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );
	
		String sql = "update CAMPCAR_USE set  CPU_PAYDATE=?,CPU_ETCPAYINFO=?,CPU_ETCPAYCOST=?  where CPU_ID=?";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,CPU_PAYDATE);
		pstmt.setString(2,CPU_ETCPAYINFO);
		pstmt.setString(3,CPU_ETCPAYCOST);
		pstmt.setInt(4,CPU_ID);
		pstmt.executeUpdate();

		response.sendRedirect("managingReservation_select.jsp"); //목록 페이지로 이동

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
