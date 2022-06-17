<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%  
	request.setCharacterEncoding("utf-8"); 

    String id = request.getParameter("id");
	String sub_id = request.getParameter("sub_id");
    String passwd = request.getParameter("passwd");

%>	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>정보 수정</title>
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
		color :white;
	}
	.loader4{
	position: relative;
	width: 150px;
	height: 20px;

	top: 45%;
	top: -webkit-calc(50% - 10px);
	top: calc(50% - 10px);
	left: 25%;
	left: -webkit-calc(50% - 75px);
	left: calc(50% - 75px);

	background-color: rgba(255,255,255,0.2);
	}
	.loader4:before{
	content: "";
	position: absolute;
	background-color: #fff;
	top: 0px;
	left: 0px;
	height: 20px;
	width: 0px;
	z-index: 0;
	opacity: 1;
	-webkit-transform-origin:  100% 0%;
		transform-origin:  100% 0% ;
	-webkit-animation: loader4 3.4s ease-in-out infinite;
		animation: loader4 3.4s ease-in-out infinite;
	}
	.loader4:after{
	content: "LOADING ...";
	color: #fff;
	font-family:  Lato,"Helvetica Neue" ;
	font-weight: 200;
	font-size: 16px;
	position: absolute;
	width: 100%;
	height: 20px;
	line-height: 20px;
	left: 0;
	top: 0;
	}

	@-webkit-keyframes loader4{
		0%{width: 0px;}
		70%{width: 100%; opacity: 1;}
		90%{opacity: 0; width: 100%;}
		100%{opacity: 0;width: 0px;}
	}

	@keyframes loader4{
		0%{width: 0px;}
		70%{width: 100%; opacity: 1;}
		90%{opacity: 0; width: 100%;}
		100%{opacity: 0;width: 0px;}
	}
</style>
</head>
<body>
<div class="container">
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/ysu";
		String dbId = "ysu";
		String dbPass = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);


		String sql= "update info set sub_id=? where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,sub_id);
		pstmt.setString(2,id);

		pstmt.executeUpdate();
%>
<div class="container">
	<div class="middle">
		<div class="str">
			정보를 수정했습니다
		</div>
		<div class="loader4"></div>
	</div>
</div>
<%
  }catch(Exception e){ 
	  e.printStackTrace();
  }finally{
	  if(rs != null) 
		 try{rs.close();}catch(SQLException sqle){}
	  if(pstmt != null) 
		 try{pstmt.close();}catch(SQLException sqle){}
	  if(conn != null) 
		 try{conn.close();}catch(SQLException sqle){}
  }
%>
</div>
<script>
setTimeout(function(){
	location.href = 'login2.jsp?id=<%=id%>&passwd=<%=passwd%>';
}, 3000);
</script>
</body>
</html>