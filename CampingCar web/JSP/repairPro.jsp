<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,java.io.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<%

String id = "";
id = (String)session.getAttribute("id");

int rIds =Integer.parseInt(request.getParameter("rId"));
String carnum = request.getParameter("carnum");
String cont = request.getParameter("cont");  

Random r = new Random();
int n= Math.round(r.nextFloat() * 100);

Connection conn = null;
PreparedStatement stmt = null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
</head>
<body>
<%
    try{
        String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
        String dbId="f5";
        String dbPass="1234";
    
        Class.forName("oracle.jdbc.driver.OracleDriver"); 
        conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );
        
        String sql= "insert into repair_request (rr_id , cp_num, rs_id , cs_license , rr_comment) values (?,?,?,?,?)";
  
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1,n);
        stmt.setString(2,carnum);
        stmt.setInt(3,rIds);
        stmt.setString(4,id);  
        stmt.setString(5,cont);

        stmt.executeUpdate();

        sql= "insert into rr_list (rr_id , rrstate , RRSTATE_END, RR_PAYDAY) values (?,'정비 대기중','9999-12-30','9999-12-30')";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1,n);
        stmt.executeUpdate();
        
         stmt.close();
         conn.close();
    }catch(Exception e){ 
       e.printStackTrace();
    }
  %>
</body>
<script>
    setTimeout(function(){
    location.href = "select_repair.jsp";
    }, 200);
  </script>
</html>