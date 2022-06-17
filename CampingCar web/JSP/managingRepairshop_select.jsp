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
<title>정비소 조회 </title>
<link rel="stylesheet" href="css/managing_repairshop.css"/>  
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
  <button type="button" class="button" style="width:300px; background:#16c288; padding:10px; margin-left : 100px ; display: inline-block;"onclick="location.href='managingRepairshop_insert.jsp'">ADD Company</button>
    <button type="button" class="button" style="width:300px; background:#16c288; padding:10px; margin-left : 250px ; display: inline-block;"onclick="location.href='managingRepairshop_selectnope.jsp'">해지된 Repairshop</button>
   <button type="button" class="button" style="width:300px; background:#16c288; padding:10px; margin-left : 150px ; display: inline-block;"onclick="location.href='adminMain.jsp'">Manager Main</button>
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
  
  String sql = "select * from repairshop where RS_STATE='사용' order by rs_id ASC";

      pstmt = conn.prepareStatement(sql);
      myRS = pstmt.executeQuery();

      if(myRS != null){
        while(myRS.next()){
          String rsName=myRS.getString("rs_name");
          String rsId=myRS.getString("rs_id");
          String rsAddress=myRS.getString("rs_address");
          String rsTelephone=myRS.getString("rs_telephone");
          String rsPersonname=myRS.getString("rs_personname");
          String rsPersonmail=myRS.getString("rs_personmail");
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

                <h3><%=rsId%></h3>
                  <p>정비소 이름</p>
                  <input type="text" class="inputbox" value="<%=rsName%>" readonly />
                  <p>정비소 전화번호</p>
                  <input type="text" class="inputbox" value="<%=rsTelephone%>" readonly />
                  <p>정비소 주소</p>
                  <input type="text" class="inputbox" value="<%=rsAddress%>" readonly />
                  <p>정비소 관계자</p>
                  <input type="text" class="inputbox" value="<%=rsPersonname%>" readonly />
                  <p>정비소 관계자 이메일</p>
                  <input type="text" class="inputbox" value="<%=rsPersonmail%>" readonly />
                  
                  <p></p>
                  <button type="button" class="button" onclick="location.href='managingRepairshop_updateForm.jsp?rsName=<%=rsName%>&rsId=<%=rsId%>&rsTel=<%=rsTelephone%>&rsAddress=<%=rsAddress%>&rsPersonname=<%=rsPersonname%>&rsPersonmail=<%=rsPersonmail%>'">update</button>
                  <button type="button" class="button2" onclick="location.href='managingRepairshop_deleteForm.jsp?rsName=<%=rsName%>&rsId=<%=rsId%>&rsTel=<%=rsTelephone%>&&rsAddress=<%=rsAddress%>&rsPersonname=<%=rsPersonname%>&rsPersonmail=<%=rsPersonmail%>'">delete</button>

              </div>
            </div>
          </div>
    <br><br><br>  
    
    <%
          }
        }
        %>
    <%


  }catch(Exception e){ 
    e.printStackTrace();
  }finally{
	  if(pstmt != null) 
		 try{pstmt.close();}catch(SQLException sqle){}
	  if(conn != null) 
		 try{conn.close();}catch(SQLException sqle){}
    if(myRS != null) 
		 try{myRS.close();}catch(SQLException sqle){}
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