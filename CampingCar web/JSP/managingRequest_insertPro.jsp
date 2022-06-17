<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*"%>

<%  
	request.setCharacterEncoding("utf-8");

  long cuId = Long.parseLong(request.getParameter("cuId"));	//고객 id 
  String cpNum=request.getParameter("cpNum");			//차량 번호
  String content=request.getParameter("content");		// 정비 요청사항
  int rsId=Integer.parseInt(request.getParameter("rsId"));		//	정비소 선택

  //int cIdint = Integer.parseInt(cId);

	Random r = new Random();
	int number= Math.round(r.nextFloat() * 10000000); //request ID 랜덤생성

	Connection conn = null;
	PreparedStatement pstmt = null;

	try{
		String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
		String dbId="f5";
		String dbPass="1234";

		Class.forName("oracle.jdbc.driver.OracleDriver"); 
		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );
		
		String sql = "INSERT INTO REPAIR_REQUEST (RR_ID, CP_NUM, RS_ID, CS_LICENSE, RR_COMMENT) VALUES (?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1,number);
		pstmt.setString(2,cpNum);
        pstmt.setInt(3,rsId);
        pstmt.setLong(4,cuId);
        pstmt.setString(5,content);

		pstmt.executeUpdate();
		
		sql = "INSERT INTO RR_LIST(RR_ID, RRSTATE, RRSTATE_END, RR_PAYDAY) VALUES (?,'정비 대기중','9999-12-30','9999-12-30')";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1,number);
		pstmt.executeUpdate();
		%>
		 <script>
          setTimeout(function(){
          location.href = "LoginForm.jsp";
          alert("관리자 로그인해주세요");}, 200);
        </script>
		<%
		//response.sendRedirect(""); //목록 페이지로 이동

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
setTimeout(function(){
	location.href = 'managingRequest_select.jsp';
}, 2000);
</script>
</body>
</html>