<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<% 
	request.setCharacterEncoding("utf-8");

   String id = request.getParameter("id");
   String passwd= request.getParameter("passwd");
   String name = request.getParameter("name"); 
   String mail = request.getParameter("mail"); 
   String phone = request.getParameter("phone");  
   String mainS = request.getParameter("mainS");    

   Connection conn = null;
   PreparedStatement pstmt = null;
   String str = "";

   try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/ysu";
		String dbId = "ysu";
		String dbPass = "1234";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

		String sql = "insert into member2 (id, passwd, name, mail, phone, mainsub) values (?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1,id);
		pstmt.setString(2,passwd);
		pstmt.setString(3,name);
		pstmt.setString(4,mail);
		pstmt.setString(5,phone);
		pstmt.setString(6,mainS);
		

		pstmt.executeUpdate();

		str = "회원가입에 성공했습니다.";

		

 	} catch(Exception e) { 
 		e.printStackTrace();
 		str = "회원가입에 실패했습니다";
 	} finally {
 		if(pstmt != null) 
 			try{pstmt.close();}catch(SQLException sqle){}
 		if(conn != null) 
 			try{conn.close();}catch(SQLException sqle){}
 	}

 %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
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
        background-image:url('3.gif');
        background-size: 1000px 500px;
    }
	.str{
		position: relative;
		left: 280px;
		top: 150px;
		font-weight: 900;
		font-size: 40px;
		color :black;
	}
</style>
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
		location.href = 'login.jsp';
		}, 1500);
	</script>
</body>
</html>
