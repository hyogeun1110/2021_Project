<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String id="";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>모든회원 가입탈퇴 내역</title>
<link rel="stylesheet" href="css/managing_requestTable.css"/>  
<script src="https://kit.fontawesome.com/6db79d71a7.js" crossorigin="anonymous"></script>
</head>
<body>
 <%
    try{
      id = (String)session.getAttribute("id");
      if(id==null || !id.equals("99999")){
        %>
        <script>
          setTimeout(function(){
          location.href = "LoginForm.jsp";
          alert("관리자 로그인해주세요");}, 200);
        </script>
    <%
      }else{
 
    %>
<section>
  <!--for demo wrap-->
  <h1>모든회원 가입탈퇴 내역</h1>
  <i class="fas fa-plus fa-3x" onclick="location ='managingCustomer_select.jsp'"></i>
<a style ="font-size: 20px">(ADD Customer)</a>
<i class="fas fa-home fa-3x" onclick="location ='adminMain.jsp'" style=" margin-left : 900px"></i>
<a style ="font-size: 20px">(Manager Main)</a>



  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th style="text-align:center ; width:100px">운전면호번호</th>
          <th style="text-align:center ; width:70px">이름</th>
          <th style="text-align:center ; width:100px">상태</th>
          <th style="text-align:center ; width:120px">상태 시작날짜</th>
          <th style="text-align:center ; width:120px">상태 종료날짜</th>
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>

<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet myRS = null;
 try{
  String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
  String dbId="f5";
  String dbPass="1234";
  
  Class.forName("oracle.jdbc.driver.OracleDriver"); 
  conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass);
  
  String sql = "select cl.CS_LICENSE, cs.CS_NAME, to_char(cl.JOINDATESTART,'rrrr-mm-dd') JOINDATESTART, to_char(to_date(cl.JOINDATEEND,'rrrr-mm-dd'),'rrrr-mm-dd') JOINDATEEND, cl.JOINSTATE from CU_LIST cl, CUSTOMER cs where cl.CS_LICENSE=cs.CS_LICENSE order by cl.CS_LICENSE, cl.JOINDATESTART";

      pstmt = conn.prepareStatement(sql);    
      myRS = pstmt.executeQuery();

      if(myRS != null){
        while(myRS.next()){
          long CS_LICENSE=myRS.getLong("CS_LICENSE");
          String CS_NAME=myRS.getString("CS_NAME");
          String JOINDATESTART=myRS.getString("JOINDATESTART");
          String JOINDATEEND=myRS.getString("JOINDATEEND"); 
          String JOINSTATE=myRS.getString("JOINSTATE"); 
        
    %>
        <tr>
          <td style="width:100px"><%=CS_LICENSE%></td>
          <td style="width:70px"><%=CS_NAME%></td>
          <td style="width:100px"><%=JOINSTATE%></td>
          <td style="width:120px"><%=JOINDATESTART%></td>
          <td style="width:120px"><%=JOINDATEEND%></td>
        </tr>   
    <%
          }
        }
        %>
      </tbody>
    </table>
  </div>
</section>
    <%
  }catch(Exception e){ 
    e.printStackTrace();
  }finally{
	  if(pstmt != null) 
		 try{pstmt.close();}catch(SQLException sqle){}
	  if(conn != null) 
		 try{conn.close();}catch(SQLException sqle){}
  }
%>
</body>
</html>
<%
    }
  } catch (Exception e) {
    e.printStackTrace();
    out.println("세션오류");
  } 
  %>