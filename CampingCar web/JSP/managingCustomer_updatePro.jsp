<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String CS_NAME = request.getParameter("CS_NAME");		
	String CS_TELEPHONE = request.getParameter("CS_TELEPHONE");		
	long CS_LICENSE = Long.parseLong(request.getParameter("CS_LICENSE"));
	String postal = request.getParameter("postalCode");    //우편번호
	String addressHead = request.getParameter("addressHead");		//주소 앞부분
	String addressReference = request.getParameter("addressReference");	//주소 참고
	String addressTail = request.getParameter("addressTail");				//주소 뒷부분
	String emailHead = request.getParameter("emailHead");	//이메일 앞부분
	String emailTail = request.getParameter("emailTail");	//@ 뒷부분

	StringBuilder addressAll = new StringBuilder(); //주소 stringBuilder 생성

	if(!postal.equals("")){
		addressAll.append("(");
		addressAll.append(postal);
		addressAll.append(")");
		out.println("아아ㅑ");
	}
	addressAll.append(addressHead);
	addressAll.append(addressReference);
	addressAll.append(addressTail);
	String CS_ADDRESS = addressAll.toString();		//string 빌더에 address를 하나로 만들어 다시 string객체에 저장

	StringBuilder emailAll = new StringBuilder(); //이메일 stringBuilder생성
	emailAll.append(emailHead);
	emailAll.append(emailTail);
	String CS_MAIL = emailAll.toString();		//이메일 builder를 다시 string객체에 저장 (toString을  setString에서 하면 오류발생 가능성)

	//out.println(CS_NAME);
	//out.println(CS_TELEPHONE);
	//out.println(CS_LICENSE);
	//out.println(CS_ADDRESS);
	//out.println(CS_MAIL);

	Connection conn = null;
	PreparedStatement pstmt = null;
	try{
		String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
		String dbId="f5";
		String dbPass="1234";

		Class.forName("oracle.jdbc.driver.OracleDriver"); 
		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );
		
		String sql = "update CUSTOMER set CS_NAME=?, CS_ADDRESS=?, CS_TELEPHONE=?, CS_MAIL=? where CS_LICENSE=?";	
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,CS_NAME);
		pstmt.setString(2,CS_ADDRESS);
		pstmt.setString(3,CS_TELEPHONE);
		pstmt.setString(4,CS_MAIL);
		pstmt.setLong(5,CS_LICENSE);

		pstmt.executeUpdate();
		response.sendRedirect("managingCustomer_select.jsp"); //목록 페이지로 이동

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
