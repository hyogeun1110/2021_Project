<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
long CS_LICENSE = 0;
String CS_NAME=""; //차량번호
String CS_ADDRESS=""; //정비소
String CS_TELEPHONE=""; //회원 
String CS_MAIL="";
String id="";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 조회 </title>
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
  <h1>회원 내역</h1>
<i class="fas fa-plus fa-3x" onclick="location ='managingCustomer_insert.jsp?CS_NAME=<%=CS_NAME%>&CS_TELEPHONE=<%=CS_TELEPHONE%>&CS_ADDRESS=<%=CS_ADDRESS%>&CS_MAIL=<%=CS_MAIL%>&CS_LICENSE=<%=CS_LICENSE%>'"></i>
<a style ="font-size: 20px">(ADD Customer)</a>
<i class="fas fa-align-left fa-3x" onclick="location ='managingCustomer_selectAllPase.jsp'" style=" margin-left : 420px"></i>
<a style ="font-size: 20px">(ALL List)</a>
<i class="fas fa-home fa-3x" onclick="location ='adminMain.jsp'" style=" margin-left : 380px"></i>
<a style ="font-size: 20px">(Manager Main)</a>



  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th style="text-align:center ; width:70px">이름</th>
          <th style="text-align:center ; width:120px">전화번호</th>
          <th style="text-align:center ; width:500px">주소</th>
          <th style="text-align:center ; width:170px">메일</th>
          <th style="text-align:center ; width:70px">운전면허 번호</th>
          <th style="width:20px"></th>
          <th style="width:20px"></th>
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
  
  String sql = "select * from CUSTOMER cm, CU_LIST cl where cm.CS_LICENSE = cl.CS_LICENSE AND cl.JOINSTATE='가입'  ";

      pstmt = conn.prepareStatement(sql);
      myRS = pstmt.executeQuery();

      if(myRS != null){
        while(myRS.next()){
          CS_LICENSE=myRS.getLong("CS_LICENSE"); //pk
          CS_NAME=myRS.getString("CS_NAME"); //차량번호
          CS_ADDRESS=myRS.getString("CS_ADDRESS"); //정비소
          CS_TELEPHONE=myRS.getString("CS_TELEPHONE"); //회원 
          CS_MAIL=myRS.getString("CS_MAIL"); 
        
    %>
        <tr>
          <td style="width:70px; color:blue;" onclick="location ='managingCustomer_selectPase.jsp?CS_NAME=<%=CS_NAME%>&CS_LICENSE=<%=CS_LICENSE%>'"><%=CS_NAME%></td>
          <td style="width:120px"><%=CS_TELEPHONE%></td>
          <td style="width:500px"><%=CS_ADDRESS%></td>
          <td style="width:170px"><%=CS_MAIL%></td>
          <td style="width:70px"><%=CS_LICENSE%></td>
          <td style="width:20px"><i class="fas fa-wrench" onclick="location ='managingCustomer_updateForm.jsp?CS_NAME=<%=CS_NAME%>&CS_TELEPHONE=<%=CS_TELEPHONE%>&CS_ADDRESS=<%=CS_ADDRESS%>&CS_MAIL=<%=CS_MAIL%>&CS_LICENSE=<%=CS_LICENSE%>'"></i></button></td>
          <td style="width:20px"><i class="fas fa-user-slash"  onclick="location ='managingCustomer_deleteForm.jsp?CS_NAME=<%=CS_NAME%>&CS_TELEPHONE=<%=CS_TELEPHONE%>&CS_ADDRESS=<%=CS_ADDRESS%>&CS_MAIL=<%=CS_MAIL%>&CS_LICENSE=<%=CS_LICENSE%>'"></i></td>
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