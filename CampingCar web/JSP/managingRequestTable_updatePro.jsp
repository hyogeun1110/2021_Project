<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
  request.setCharacterEncoding("utf-8");
  int RR_ID = Integer.parseInt(request.getParameter("RR_ID"));	
  String CP_NUM = request.getParameter("CP_NUM");	
  String RRSTATE_START = request.getParameter("RRSTATE_START");	
  int RR_COST = Integer.parseInt(request.getParameter("RR_COST"));	
  String RR_PAYDAY = request.getParameter("RR_PAYDAY");	
  String RR_ETCCOMMENT = request.getParameter("RR_ETCCOMMENT");	
  //String RRSTATE_END = request.getParameter("RRSTATE_END");	
  String st = request.getParameter("st");	
  String pst = request.getParameter("pst");	

  StringBuilder stt = new StringBuilder(); // stringBuilder 생성
  stt.append(pst);
  stt.append("-");
  String stPast = stt.toString();
  
	Connection conn = null;
	PreparedStatement pstmt = null;

	//try에서 update 실행
	try{
		String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
		String dbId="f5";
		String dbPass="1234";

		Class.forName("oracle.jdbc.driver.OracleDriver"); 
		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );
	
		String sql = "update RR_LIST set  RR_ETCCOMMENT=?,RRSTATE=?, RRSTATE_END=to_date(sysdate,'yy-mm-dd')-1  where RR_ID=? AND RRSTATE=?";
		//정비번호와 현 상태를 가져와 그 데이터를 수정
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,RR_ETCCOMMENT);
		pstmt.setString(2,stPast);
		pstmt.setInt(3,RR_ID);
		pstmt.setString(4,pst);
		pstmt.executeUpdate();

		if(RR_PAYDAY.equals("9999-12-30")){ //바꾸려는 데이터의  입금기한이 없을경우 
			out.print("if true");
		
			sql = "INSERT INTO RR_LIST(RR_ID, RRSTATE, RRSTATE_END, RR_COST, RR_PAYDAY, RR_ETCCOMMENT) VALUES (?,?,'9999-12-30',?,'9999-12-30',?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,RR_ID);
			pstmt.setString(2,st);
			pstmt.setInt(3,RR_COST);
			pstmt.setString(4,RR_ETCCOMMENT);
			pstmt.executeUpdate();
		}else{ 								// 바꾸려는 데이터의 입금기한이 존재할 경우 (decode,case when같은 것을 쓰고싶엇으나 insert에 안됨)
			out.print("if false");
			sql = "INSERT INTO RR_LIST(RR_ID, RRSTATE, RRSTATE_END, RR_COST, RR_PAYDAY, RR_ETCCOMMENT) VALUES (?,?,'9999-12-30',?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,RR_ID);
			pstmt.setString(2,st);
			pstmt.setInt(3,RR_COST);
			pstmt.setString(4,RR_PAYDAY);
			pstmt.setString(5,RR_ETCCOMMENT);
			
			pstmt.executeUpdate();
		}
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
