<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,java.io.*"%>
<% 
Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

try {
    String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
      String dbId="f5";
      String dbPass="1234";

      Class.forName("oracle.jdbc.driver.OracleDriver"); 
      conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );

    
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel = "stylesheet" href="css/style.css">
<link rel="stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
<style>
   * {
      box-sizing: border-box;
   }

   body {
      margin: 0;
      padding: 0;
      font-family: 'Montserrat', sans-serif;
   }

   .container {
      display: flex;
      height: 100vh;
   }

   .section {
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100%;
      overflow: hidden;
      background-size: cover;
      background-position: center;
      color: #fff;
      transition: flex .4s ease;
      position: relative;
   }

   .section .overlay {
      background-color: rgba(0, 0, 0, 0.7);
      width: 100%;
      height: 100%;
      position: absolute;
      transition: background-color .8s ease;
   }

   .section .content {
      z-index: 2;
   }

   .section:hover {
      flex: 2;
   }

   .section:hover .overlay {
      background-color: rgba(29, 29, 29, 0.95);
   }

   #a1 {
      background:#CDECFA;
   }
   #a2 {
      background:#5050FF;
   }
   #a3 {
      background:	#66EC66;
   }
   #a4 {
      background:#E16A93;
   }
   #a5 {
      background:	#FFDC3C;
   }

   #advertising {
      background-image: url(https://images.unsplash.com/photo-1517799094725-e3453440724e?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=353f3663a9fae75773d2942aeb37c2c8&auto=format&fit=crop&w=500&q=60);
   }
</style>
</head>
<body>
   <div class="container">
   <%
         String sql = "select * from repairshop";
         stmt = conn.prepareStatement(sql);
         rs = stmt.executeQuery();

         while (rs.next()) {
            int rId=rs.getInt("RS_ID");
            String rName = rs.getString("RS_NAME");
   %>
  
      <div id="a<%=rId%>" class="section" style="cursor: pointer;" onclick="location.href='shop2.jsp?rId=<%=rId%>'">
        <div class="content">
          <h1><div class="middle-l" >
            <p style="position: relative;top: 30px;font-size: 30px;"><%=rName%></p>
         </div></h1>    
        </div>
        <div class="overlay"></div>
      </div>        
<%
}
%>
</div>
<%
} catch (Exception e) {
       e.printStackTrace();
    } finally {
    try {
       if (rs != null) {
       rs.close();
    }
       if (stmt != null) {
       stmt.close();
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
</html>