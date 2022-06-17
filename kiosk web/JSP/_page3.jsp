<%@ page import="java.sql.*" contentType="text/html;charset=UTF-8"%>
<%
 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
 String url="jdbc:sqlserver://localhost:1433;DatabaseName=foodcourt;"; 
	
 Connection dbconn=DriverManager.getConnection(url, "madanguser", "madangpass");
 Statement stmt = dbconn.createStatement( );


 ResultSet myResultSet=stmt.executeQuery("SELECT m.menu_name,o.num, m.price*o.num FROM orders o, menu m WHERE o.menuid = m.menuid");
 %>

 <html>

<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>** 합계 **</title>
</head>
<style>
    .header{
        font-weight: bolder;
        font-size: 60;
        font-family: "굴림";
    }
    p{
        font-size: 20;
    }
    button{
        width: 150;
        
    }
</style>
<header class="header" align="center">결 제</header> 
<hr>
    <%
    if(myResultSet!= null){
    while(myResultSet.next( )){
        String menuname=myResultSet.getString("menu_name");
        String num=myResultSet.getString("num");
        String sumprice=myResultSet.getString("");      
    %>  
    <p align="center"><%=menuname%> <%=num%>개 | <%=sumprice%>원</p>
    <%
        }
    }  %>
<hr style="border:rgb(0, 0, 0) 1px dotted">
<%
ResultSet my2ResultSet=stmt.executeQuery("SELECT sum(m.price*o.num) FROM orders o, menu m WHERE o.menuid = m.menuid GROUP BY o.custid");
  
if(my2ResultSet!= null){
    while(my2ResultSet.next( )){
        String sumprice=my2ResultSet.getString("");        
    %>  
    <p align="center">합계 : <%=sumprice%>원</p>  
    <%
        }
    }
    %>
    <br>
    <p align="center">-카드 삽입구에 카드를 넣어주세요-<br>
    <img src="card.jpg" alt="" width="250" height="250">    
    </p>
    <div align="right"><button class="checkbtn" onclick="location='_page4.jsp'">결제 완료</button></div>

<script src="/assets/js/jquery-3.6.0.min.js"></script>
<script src="/assets/bootstrap-5.0.0-beta2/js/bootstrap.min.js"></script>   

<%
    stmt.close( );
    dbconn.close( );
    %>    
</body>
</html>