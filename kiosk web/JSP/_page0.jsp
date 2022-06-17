<%@ page import="java.sql.*" contentType="text/html;charset=UTF-8"%>
<%
 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
 String url="jdbc:sqlserver://localhost:1433;DatabaseName=foodcourt;"; 
	
 Connection dbconn=DriverManager.getConnection(url, "madanguser", "madangpass");
 Statement stmt = dbconn.createStatement( );
%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>** 어서오세요 **</title>
</head>
<style>
    button{
        width: 1000;
        height: 600;
        font-size: 100;
    }
</style>
<div align="center"><button class="checkbtn" onclick="location='_page1.jsp'">화면을 터치하세요</button></div>

<script src="/assets/js/jquery-3.6.0.min.js"></script>
<script src="/assets/bootstrap-5.0.0-beta2/js/bootstrap.min.js"></script>   
   
</body>
</html>