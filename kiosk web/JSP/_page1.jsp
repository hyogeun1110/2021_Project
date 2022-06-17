<%@ page import="java.sql.*" contentType="text/html;charset=UTF-8"%>
<%
 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
 String url="jdbc:sqlserver://localhost:1433;DatabaseName=foodcourt;"; 
	
 Connection dbconn=DriverManager.getConnection(url, "madanguser", "madangpass");
 Statement stmt = dbconn.createStatement( );


 ResultSet sangResultSet=stmt.executeQuery("SELECT a.menuid, b.court_name, a.menu_name, a.price FROM menu a,court b WHERE a.courtid = b.courtid AND a.courtid=1");
int n = 1;
int x = 101;
 %>

 <html>

<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>** 음식메뉴 **</title>
<style>
    input {
  width:50px;
  height:50px;
  font-size:20px;
}

.gong {
    font-family: "궁서";
}
.header{
 font-family: "굴림";
 font-weight :bolder;
}
</style>
</head>    
<header class="header"><p align="center"><span style="font-size: 46;"> **드시고 싶은 음식을 체크한후 개수를 지정해주세요**</span></p></header>
<hr><br>

<form method="post" name="send" action="_page2.jsp" align="center" >
<table border="1" width="400" bordercolor="f51b1b" align="center">
    <b class="gong"><span style="font-size:32pt; color: f51b1b;">상하이</span></b>      
    <%
    if(sangResultSet!= null){
    while(sangResultSet.next( )){
        String menu_name1=sangResultSet.getString("menu_name");
        String price1=sangResultSet.getString("price");
        String menuid1=sangResultSet.getString("menuid");        
    %>  
    <tr>
        <td width="50"><input type="checkbox" name=<%=n%> value="<%=menuid1%>"></input></td>
        <td align="center"><span style="font-size:12pt;">
        <%=menu_name1%></font></span></td>
        <td align="center"><span style="font-size:12pt;">
        <%=price1%>원</font></span></td>                 
        <td width="50">
        <input type="number" name=<%=x%> min="0", max="10" class="number" value="0"></input>
        </td>
        <% n=n+1; x=x+1;  %>
        
    </tr>
    <% 
        }
    }
    %>    
</table>
<br>
<%
ResultSet hansResultSet=stmt.executeQuery("SELECT a.menuid, b.court_name, a.menu_name, a.price FROM menu a,court b WHERE a.courtid = b.courtid AND a.courtid=2");
%>

<table border="1" width="400" bordercolor="155b94" align="center">
    <b class="gong"><span style="font-size:32pt; color: 155b94;">한성면옥</span></b>
<%
if(hansResultSet!= null){
while(hansResultSet.next( )){
    String menu_name2=hansResultSet.getString("menu_name");
    String price2=hansResultSet.getString("price");  
    String menuid2=hansResultSet.getString("menuid");      
%>    
    <tr>
        <td width="50"><input type="checkbox" name=<%=n%> value="<%=menuid2%>"></input></td>
        <td align="center" name=<%=n%>><span style="font-size:12pt;">
        <%=menu_name2%></font></span></td>
        <td align="center"><span style="font-size:12pt;">
        <%=price2%>원</font></span></td>         
        <td width="50">
            <input type="number" name=<%=x%> min="0", max="10" class="number" value="0"></input>
        </td>
        <% n = n+1; x=x+1; 
         %>
    </tr>
    <% 
        }
    }
    %>    
</table>
<br>
<%
ResultSet junjResultSet=stmt.executeQuery("SELECT a.menuid, b.court_name, a.menu_name, a.price FROM menu a,court b WHERE a.courtid = b.courtid AND a.courtid=3");
%>

<table border="1" width="400" bordercolor="207015" align="center">
    <b class="gong"><span style="font-size:32pt; color: 207015;">전주한식</span></b>
<%
if(junjResultSet!= null){
while(junjResultSet.next( )){
    String menu_name3=junjResultSet.getString("menu_name");
    String price3=junjResultSet.getString("price");  
    String menuid3=junjResultSet.getString("menuid");      
%>    
    <tr>
        <td width="50"><input type="checkbox" name=<%=n%> value="<%=menuid3%>"></input></td>
        <td align="center" name=<%=n%> ><span style="font-size:12pt;">
        <%=menu_name3%></font></span></td>
        <td align="center" ><span style="font-size:12pt;">
        <%=price3%>원</font></span></td>                   
        <td width="50">
            <input type="number" name=<%=x%> min="0", max="10" class="number" value="0"></input>
        </td>
        <% n = n+1;  x=x+1; 
         %>
    </tr>
    <% 
        }
    }
    %>    
</table>
<br>
<%
ResultSet dongaResultSet=stmt.executeQuery("SELECT a.menuid, b.court_name, a.menu_name, a.price FROM menu a,court b WHERE a.courtid = b.courtid AND a.courtid=4");
%>

<table border="1" width="400" bordercolor="8a6619" align="center">
    <b class="gong"><span style="font-size:32pt; color: 8a6619;">돈이돈까스</span></b>
<%
if(dongaResultSet!= null){
while(dongaResultSet.next( )){
    String menu_name4=dongaResultSet.getString("menu_name");
    String price4=dongaResultSet.getString("price");   
    String menuid4=dongaResultSet.getString("menuid");     
%>   
    
    <tr>
        <td width="50"><input type="checkbox" name=<%=n%> value="<%=menuid4%>"></input></td>
        <td align="center" name=<%=n%>><span style="font-size:12pt;">
        <%=menu_name4%></font></span></td>
        <td align="center"><span style="font-size:12pt;">
        <%=price4%>원</font></span></td>                   
        <td width="50">
        <input type="number" name=<%=x%> width="50" min="0", max="10" class="number" value="0"></input>
        </td>
        <% n = n+1; x=x+1; 
         %>
    </tr>
    <% 
        }
    }
    %>    
</table>
<br>
<button class="checkbtn" style="background: seagreen;"><font color="white">주문 &nbsp;&nbsp;&nbsp;완료</font></button>
</form>
<style>
.checkbtn{
    width: 700;
    height: 50;
    font-weight: bold;
    font-size: 30 ;    
}
</style>
<script src="/assets/js/jquery-3.6.0.min.js"></script>
<script src="/assets/bootstrap-5.0.0-beta2/js/bootstrap.min.js"></script>   

<%
    stmt.close( );
    dbconn.close( );
    %>    
</body>
</html>