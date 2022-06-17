<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");

  int RR_ID=Integer.parseInt(request.getParameter("RR_ID"));	//request id
  String id="";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>해당 정비내역 조회 </title>
<link rel="stylesheet" href="css/managing_requestTable.css"/>  
<link rel="stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
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
  <h1>정비내역 조회</h1>

  <i class="fas fa-home fa-3x" onclick="location ='managingRequest_select.jsp'" style=" margin-left : 10  50px"></i>
  <a style ="font-size: 20px">(RepairRequest Main)</a>

  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th style="width:100px">정비 번호</th>
          <th>현재상태 시작날짜</th>
          <th>현재상태 시작끝</th>
          <th>현재 상태</th>
          <th>추가 정비 내역</th>
          <th>정비 비용</th>
          <th>정비비용 납입기한</th>
          <th></th>
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
  conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );
  
  String sql = "select to_char(RRSTATE_START,'yyyy-mm-dd') RRSTATE_START, to_char(RRSTATE_END,'yyyy-mm-dd') RRSTATE_END, RRSTATE,nvl(RR_ETCCOMMENT,'-') RR_ETCCOMMENT, TO_CHAR(NVL(RR_COST,0),'999,999,999') RR_COST,TO_CHAR(RR_PAYDAY,'YYYY-MM-DD') RR_PAYDAY   from RR_LIST where RR_ID=? order by RRSTATE_START ";

  pstmt = conn.prepareStatement(sql);
  pstmt.setInt(1,RR_ID);
  myRS = pstmt.executeQuery();

  if(myRS != null){
    while(myRS.next()){
      String RRSTATE_START=myRS.getString("RRSTATE_START"); //현재상태 시작
      String RRSTATE_END=myRS.getString("RRSTATE_END"); //현재상태 시작
      String RRSTATE=myRS.getString("RRSTATE"); //현재상태
      String RR_ETCCOMMENT=myRS.getString("RR_ETCCOMMENT");  //현재 상태 중 내용
      String RR_COST=myRS.getString("RR_COST"); //보여줄 용도의 가격, 다음페이지로 넘기지 않음.
      String RR_PAYDAY=myRS.getString("RR_PAYDAY"); //결제 날짜, 기본은 9999

%>
    <tr>
      <td style="width:70px"><%=RR_ID%></td>
      <td><%=RRSTATE_START%></td>
      <td><%=RRSTATE_END%></td>
      <td><%=RRSTATE%></td>
      <td><%=RR_ETCCOMMENT%></td>
      <td><%=RR_COST%>원</td>
      <td><%=RR_PAYDAY%></td>
      <td> </td>
    </tr>
<%
      }
      %>
      </tbody>
    </table>
  </div>
</section><%
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