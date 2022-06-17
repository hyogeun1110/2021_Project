<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%  
	request.setCharacterEncoding("utf-8");

  String rsName=request.getParameter("name");	
  int rsId=Integer.parseInt(request.getParameter("id"));	
  String rsAddress=request.getParameter("address");	
  String rsTelephone=request.getParameter("tel");	
  String rsPersonname=request.getParameter("personname");	
  String rsPersonmail=request.getParameter("personmail");	
  //int cIdint = Integer.parseInt(cId);

	Connection conn = null;
	PreparedStatement pstmt = null;

	try{
		String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
		String dbId="f5";
		String dbPass="1234";

		Class.forName("oracle.jdbc.driver.OracleDriver"); 
		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );
		
		String sql = "INSERT INTO repairshop (RS_ID, RS_NAME, RS_ADDRESS, RS_TELEPHONE, RS_PERSONNAME, RS_PERSONMAIL) VALUES (?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1,rsId);
		pstmt.setString(2,rsName);
        pstmt.setString(3,rsAddress);
        pstmt.setString(4,rsTelephone);
        pstmt.setString(5,rsPersonname);
        pstmt.setString(6,rsPersonmail);
		
		pstmt.executeUpdate();

  		response.sendRedirect("managingRepairshop_select.jsp"); //목록 페이지로 이동

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