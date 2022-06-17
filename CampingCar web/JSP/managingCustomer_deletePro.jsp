<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");

long CS_LICENSE = Long.parseLong(request.getParameter("CS_LICENSE"));	

Connection conn = null;
PreparedStatement pstmt = null;
try{
	String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
	String dbId="f5";
	String dbPass="1234";

	Class.forName("oracle.jdbc.driver.OracleDriver"); 
	conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );

	
	String sql= "update CU_LIST set JOINDATEEND = TO_DATE(SYSDATE,'YYYY-MM-DD')-1, JOINSTATE='탈퇴' where CS_LICENSE = ? AND JOINDATEEND = '9999-12-31' ";

	pstmt = conn.prepareStatement(sql);
	pstmt.setLong(1,CS_LICENSE);
	pstmt.executeUpdate();

}catch(Exception e){ 
out.print("오류가 발생하였습니다. 다시 시도해 주시기 바랍니다");
e.printStackTrace();
}finally{
	if(pstmt != null) 
		try{pstmt.close();}catch(SQLException sqle){}
	if(conn != null) 
		try{conn.close();}catch(SQLException sqle){}
}

	//session.invalidate();
%>
<script>
   setTimeout(function(){
   location.href = "managingCustomer_select.jsp";
   alert("회원탈퇴 되었습니다.");}, 200);
</script>