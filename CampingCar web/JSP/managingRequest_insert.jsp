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
<title>정비소 추가</title>
<link rel="stylesheet" href="css/managing_request.css"/>  
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
<br><br><br>
<div class="mainscreen">
  <div class="card">
    <div class="leftside">
      
    </div>
    <div class="rightside">
      <form action="managingRequest_insertPro.jsp">
        <p>고객 운전면허증 번호 입력</p>
        <input type="text" class="inputbox" name="cuId" required />
        <p>차 번호 입력</p>
        <input type="text" class="inputbox" name="cpNum" required />
        <p>정비 요청사항</p>
        <input type="text" class="inputbox" name="content" required />

        <select name="rsId"  style="font-size: 16px;" required>
              <option selected>정비소 선택</option>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet myRS = null;
  try{
    String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
    String dbId="f5";
    String dbPass="1234";

    Class.forName("oracle.jdbc.driver.OracleDriver"); 
    conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );
    
    String sql = "SELECT RS_ID, RS_NAME, RS_ADDRESS FROM REPAIRSHOP ";

      pstmt = conn.prepareStatement(sql);
      myRS = pstmt.executeQuery();
      if(myRS != null){
        while(myRS.next()){
          String rsId=myRS.getString("rs_id");
          String rsName=myRS.getString("rs_name");
          String rsAddress=myRS.getString("rs_address");
          %>
                
          <%
        }
      }
%>
            </select>
        <p></p>
      <button type="submit" class="button">입력 확인</button>
    </form>
  </div>
</div>
</div>
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