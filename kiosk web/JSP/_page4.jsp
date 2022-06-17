<%@ page import="java.sql.*" contentType="text/html;charset=UTF-8"%>
<%
 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
 String url="jdbc:sqlserver://localhost:1433;DatabaseName=foodcourt;"; 
	
 Connection dbconn=DriverManager.getConnection(url, "madanguser", "madangpass");
 Statement stmt = dbconn.createStatement( );

 ResultSet myResultSet=stmt.executeQuery("SELECT * FROM orders WHERE custid=1");
 %>

 <html>

<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>** 식권 출력! **</title>
</head>
<table border="1" align="center">
<%
if(myResultSet!= null){
    myResultSet.next( );
%>
<p align="center">-주문번호 : <%=myResultSet.getString("custid")%>번-</p>
<% } %>
<%
ResultSet m1ResultSet=stmt.executeQuery("SELECT o.custid, c.court_name, m.menu_name, o.num FROM court c, menu m, orders o WHERE c.courtid = m.courtid AND m.menuid = o.menuid AND c.courtid =1");
%>
<% if(m1ResultSet!= null){ %>

        <%
        
        while(m1ResultSet.next( )){
            String custid=m1ResultSet.getString("custid");
            String cname=m1ResultSet.getString("court_name");
            String mname=m1ResultSet.getString("menu_name");
            String num=m1ResultSet.getString("num");      
        %>  
        <tr>
            <td><%=custid%>번</td>
            <td><%=cname%></td>
            <td><%=mname%>&nbsp;&nbsp;</td>
            <td><%=num%>개</td>
        </tr>
    <%
        }
    }
    %>    

    <%
ResultSet m2ResultSet=stmt.executeQuery("SELECT o.custid, c.court_name, m.menu_name, o.num FROM court c, menu m, orders o WHERE c.courtid = m.courtid AND m.menuid = o.menuid AND c.courtid =2");
%>
<% if(m2ResultSet!= null){ %>

        <%
        
        while(m2ResultSet.next( )){
            String custid=m2ResultSet.getString("custid");
            String cname=m2ResultSet.getString("court_name");
            String mname=m2ResultSet.getString("menu_name");
            String num=m2ResultSet.getString("num");      
        %>  
        <tr>
            <td><%=custid%>번</td>
            <td><%=cname%></td>
            <td><%=mname%>&nbsp;&nbsp;</td>
            <td><%=num%>개</td>
        </tr>
    <%
        }
    }
    %>    

    <%
ResultSet m3ResultSet=stmt.executeQuery("SELECT o.custid, c.court_name, m.menu_name, o.num FROM court c, menu m, orders o WHERE c.courtid = m.courtid AND m.menuid = o.menuid AND c.courtid =3");
%>
<% if(m3ResultSet!= null){ %>
    

        <%
        
        while(m3ResultSet.next( )){
            String custid=m3ResultSet.getString("custid");
            String cname=m3ResultSet.getString("court_name");
            String mname=m3ResultSet.getString("menu_name");
            String num=m3ResultSet.getString("num");      
        %>  
        <tr>
            <td><%=custid%>번</td>
            <td><%=cname%></td>
            <td><%=mname%>&nbsp;&nbsp;</td>
            <td><%=num%>개</td>
        </tr>
    <%
        }
    }
    %>    

    <%
ResultSet m4ResultSet=stmt.executeQuery("SELECT o.custid, c.court_name, m.menu_name, o.num FROM court c, menu m, orders o WHERE c.courtid = m.courtid AND m.menuid = o.menuid AND c.courtid =4");
%>
<% if(m4ResultSet!= null){ %>
    

        <%
        
        while(m4ResultSet.next( )){
            String custid=m4ResultSet.getString("custid");
            String cname=m4ResultSet.getString("court_name");
            String mname=m4ResultSet.getString("menu_name");
            String num=m4ResultSet.getString("num");      
        %>  
        <tr>
            <td><%=custid%>번</td>
            <td><%=cname%></td>
            <td><%=mname%>&nbsp;&nbsp;</td>
            <td><%=num%>개</td>
        </tr>
    <%
        }
    }
    %>    


</table>
<br>
<%
Connection con = null; 
PreparedStatement pstmt = null; 

con = DriverManager.getConnection(url,"madanguser","madangpass");

String sql = "DELETE FROM orders";

pstmt = con.prepareStatement(sql);
%>
<div align="center"><button class="checkbtn" onclick="location='_page0.jsp'">처음으로<%pstmt.executeUpdate();%></button></div>

<script src="/assets/js/jquery-3.6.0.min.js"></script>
<script src="/assets/bootstrap-5.0.0-beta2/js/bootstrap.min.js"></script>   

<%
    stmt.close( );
    dbconn.close( );
    %>    
</body>
</html>