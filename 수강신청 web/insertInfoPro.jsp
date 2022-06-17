<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

String sub[] = request.getParameterValues("sid");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>수강신청</title>
<link rel="stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
<style>
div{
	text-align: center;
}
.container{
	width: 1000px;
	margin: 0 auto;
}
.container div{
	 text-align: center;
	 display: table;
}
.container div span{
	display: table-cell;
	vertical-align: middle;
}
.middle{
	margin-top: 20px;
	width: 1000px;
	height: 500px;
	position: relative;       

}
.str{
	position: relative;
	left: 280px;
	top: 150px;
	font-weight: 900;
	font-size: 40px;
	color :rgb(0, 0, 0);
}
</style>
<% 
   Connection conn = null;
   PreparedStatement pstmt = null;
   String str = "";

   try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/ysu";
		String dbId = "ysu";
		String dbPass = "1234";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

		for(int i=0;i<sub.length;i++){
			String sql = "insert into info (id, sub_id) values (?,?)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1,id);
			pstmt.setString(2,sub[i]);
			
			pstmt.executeUpdate();
		}
		
		str = "수강신청에 성공했습니다.";

 	} catch(Exception e) { 
 		e.printStackTrace();
 		str = "수강신청에 실패했습니다"; %>
		<script>
			setTimeout(function(){
				window.history.back();
			}, 1500);
		</script>
		 <%
 	} finally {
 		if(pstmt != null) 
 			try{pstmt.close();}catch(SQLException sqle){}
 		if(conn != null) 
 			try{conn.close();}catch(SQLException sqle){}
 	}

 %>
</head>
<body>
	<div class="container">
		<div class="middle">
			<div class="str">
				<%=str %>
			</div>
		</div>
	</div>
<script>
	setTimeout(function(){
		location.href = 'login2.jsp?id=<%=id%>&passwd=<%=passwd%>';
	}, 1500);
</script>
</body>
</html>
