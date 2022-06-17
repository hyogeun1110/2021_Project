<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
 
String ids = request.getParameter("id");
String passwd = request.getParameter("passwd");
long id = Long.parseLong(ids);
session.setAttribute("id",ids);


String n = "";
String page1 = "";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>F5 - Sign In</title>
<link rel="stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
<style>
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
    color: rgb(0, 0, 0);
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
<%
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  PreparedStatement pstmt2 = null;
  ResultSet rs2 = null;

   try{  
    String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
    String dbId="f5";
    String dbPass="1234";

    Class.forName("oracle.jdbc.driver.OracleDriver"); 
    conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );
    
    String sql= "select cs.cs_license, cs.cs_passwd, cs.cs_name, cu.joinstate from customer cs, cu_list cu where cs.cs_license = cu.cs_license and cs.cs_license='"+id+"'";
    

    pstmt = conn.prepareStatement(sql);   
    rs = pstmt.executeQuery();
    
    if(rs.next()){
        long rid = rs.getLong("cs_license");
        String rpasswd=rs.getString("cs_passwd");
        String rNAME = rs.getString("CS_NAME");
        String JOINSTATE = rs.getString("JOINSTATE");

        if(id==rid && passwd.equals(rpasswd)){
            session.setAttribute("NAME", rNAME);
              if(id == 99999){ 
                page1 = "rootPage";
              } else {   
                  page1 = "commonPage";
                  String sql2= "select cs.cs_license, cs.cs_passwd, cs.cs_name, cu.joinstate from customer cs, cu_list cu where cs.cs_license = cu.cs_license AND cu.joinstate = '가입' And cu.cs_license=?";
                  pstmt2 = conn.prepareStatement(sql2);   
                  pstmt2.setLong(1,id);
                  rs2 = pstmt2.executeQuery();
                  if(rs2.next()){
                  }
                  else{
                    page1 = "탈퇴" ;
                  }
                } 
        } 
        else { 
            n = "psE"; 
            page1 = "psE";
        }
    }else {
      page1 = "idE";
    }
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
<div class="loader4"></div>

<%
if(page1=="rootPage"){ %>
  <script>
    setTimeout(function(){
    location.href = "adminMain.jsp";
    }, 200);
  </script>
<% }
else if(page1=="탈퇴") { %>
  <script>
   setTimeout(function(){
    location.href = "LoginForm.jsp";
    alert("탈퇴한 계정입니다.");}, 200);
  </script>
<% session.invalidate();}
else if(page1=="commonPage"){ %>
  <script>
    setTimeout(function(){
    location.href = "Main.jsp";
    }, 200);
  </script>
<% }


else if(page1=="idE"){ %>
  <script>

    setTimeout(function(){
    location.href = "LoginForm.jsp";
    alert("라이센스가 틀렸습니다.");}, 200);

  </script>
<% }
else if(page1=="psE"){ %>
  <script>

    setTimeout(function(){
    location.href = "LoginForm.jsp";
    alert("비밀번호가 틀렸습니다.");}, 200);

  </script>
<% } %>
</body>
</html>