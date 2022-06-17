<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
   request.setCharacterEncoding("utf-8");
   String rr_id = request.getParameter("rr_id");
   String rr_com = request.getParameter("rr_com");

   Connection conn = null;
   PreparedStatement pstmt = null;

   try {
      String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
		String dbId="f5";
		String dbPass="1234";
  
		Class.forName("oracle.jdbc.driver.OracleDriver"); 
		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=rr_id%> 와 <%=rr_com%></title>
<link rel = "stylesheet" href="css/style.css">
<link rel = "stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
</head>
<body>
<% 
   String sql = "update repair_request set rr_comment = ? where rr_id = ?";
   pstmt = conn.prepareStatement(sql);
  	pstmt.setString(1,rr_com);
	pstmt.setString(2,rr_id);
   pstmt.executeUpdate();
   }
 catch (Exception e) {
    e.printStackTrace();
    } finally {
    try {
    if (pstmt != null) {
       pstmt.close();
    }
    if (conn != null) {
       conn.close();
    }
    } catch (Exception e) {
    e.printStackTrace();
    }
    }
%>
</body>
<script>
   setTimeout(function(){
   location.href = "select_repair.jsp";
   alert("정보수정이 완료되었습니다.");}, 200);
</script>
</html>