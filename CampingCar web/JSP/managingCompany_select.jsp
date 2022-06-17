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
<title>차량 회사 관리 </title>
<link rel="stylesheet" href="css/managing_company.css"/>  
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

  <br><br>
  <button type="button" class="button" style="width:300px; background:#1bb0ca; padding:10px; margin-left : 100px ; inline-block"onclick="location.href='managingCompany_insert.jsp'">ADD Company</button>
  <button type="button" class="button" style="width:300px; background:#1a6a79; padding:10px; margin-left : 700px ;color:white; display: inline-block;"onclick="location.href='adminMain.jsp'">Manager Main</button>

  <br><br>
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
  
  String sql = "select * from COMPANY where C_STATE='사용' order by c_id DESC";
  pstmt = conn.prepareStatement(sql);
  myRS = pstmt.executeQuery();

  if(myRS != null){
    while(myRS.next()){
      String cName=myRS.getString("c_name");
      String cId=myRS.getString("c_id");
      String cAddress=myRS.getString("c_address");
      String cTelephone=myRS.getString("c_telephone");
      String cPersonname=myRS.getString("c_personname");
      String cPersonmail=myRS.getString("c_personmail");
%>
      <div class="mainscreen">
        <div class="card">
          <div class="leftside">
            <img
              class="product"
              alt=""
            />
          </div>
          <div class="rightside">
            <form action="">
            <h3><%=cId%></h3>
              <p>차량회사 이름</p>
              <input type="text" class="inputbox" value="<%=cName%>" readonly />
              <p>차량회사 전화번호</p>
              <input type="text" class="inputbox" value="<%=cTelephone%>" readonly />
              <p>차량회사 주소</p>
              <input type="text" class="inputbox" value="<%=cAddress%>" readonly />
              <p>차량회사 관계자</p>
              <input type="text" class="inputbox" value="<%=cPersonname%>" readonly />
              <p>차량회사 관계자 전화번호</p>
              <input type="text" class="inputbox" value="<%=cPersonmail%>" readonly />
              
              <p></p>
              <button type="button" class="button" onclick="location.href='managingCompany_updateForm.jsp?cName=<%=cName%>&cId=<%=cId%>&cTel=<%=cTelephone%>&cAddress=<%=cAddress%>&cPersonname=<%=cPersonname%>&cPersonmail=<%=cPersonmail%>'">update</button>
              <button type="button" class="button2" onclick="location.href='managingCompany_deleteForm.jsp?cName=<%=cName%>&cId=<%=cId%>&cTel=<%=cTelephone%>&&cAddress=<%=cAddress%>&cPersonname=<%=cPersonname%>&cPersonmail=<%=cPersonmail%>'">delete</button>
            </form>
          </div>
        </div>
      </div>
<br><br><br>  

<%
      }
    }
      
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