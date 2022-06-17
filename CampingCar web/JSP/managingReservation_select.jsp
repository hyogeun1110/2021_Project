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
<title>예약내역 조회 </title>
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
  <h1>차량 예약 내역</h1>

  <i class="fas fa-home fa-3x" onclick="location ='adminMain.jsp'" style=" margin-left : 1200px"></i>
  <a style ="font-size: 20px">(Manager Main)</a>

  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th style="width:70px">예약 번호</th>
          <th style="width:90px">차량 이름</th>
          <th style="width:90px">고객 이름</th>
          <th>고객 전화번호</th>
          <th>시작일</th>
          <th>종료일</th>
          <th>사용 일수</th>
          <th>지불 금액</th>
          <th>지불 기한</th>
          <th>추가 지불내용</th>
          <th>추가 지불비용</th>
          <th>예약 상태</th>
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
  
  String sql = "select CPU_ID ,c.CP_NAME ,b.CS_NAME ,b.CS_TELEPHONE ,to_char(a.CPU_USESTART,'yyyy-mm-dd') CPU_USESTART ,to_char(a.CPU_USEEND,'yyyy-mm-dd') CPU_USEEND ,a.CPU_USEDAY ,a.CPU_COST ,nvl(to_char(a.CPU_PAYDATE,'yyyy-mm-dd'),' ') CPU_PAYDATE, nvl(a.CPU_ETCPAYCOST,0) CPU_ETCPAYCOST ,nvl(a.CPU_ETCPAYINFO,'-') CPU_ETCPAYINFO ,a.RES_STATE from CAMPCAR_USE a , CUSTOMER b, CAMPCAR c where a.CP_NUM = c.CP_NUM AND a.CS_LICENSE = b.CS_LICENSE order by CPU_USESTART DESC";

  pstmt = conn.prepareStatement(sql);
  myRS = pstmt.executeQuery();

  if(myRS != null){
    while(myRS.next()){
      int CPU_ID=myRS.getInt("CPU_ID"); //pk
      String CP_NAME=myRS.getString("CP_NAME"); // 차량 이름
      String CS_NAME=myRS.getString("CS_NAME"); //회원 이름
      String CS_TELEPHONE=myRS.getString("CS_TELEPHONE"); //차량번호
      String CPU_USESTART=myRS.getString("CPU_USESTART");
      String CPU_USEEND=myRS.getString("CPU_USEEND");
      String CPU_USEDAY=myRS.getString("CPU_USEDAY");
      String CPU_COST=myRS.getString("CPU_COST"); 
      String CPU_PAYDATE=myRS.getString("CPU_PAYDATE"); 
      String CPU_ETCPAYCOST=myRS.getString("CPU_ETCPAYCOST");  
      String CPU_ETCPAYINFO=myRS.getString("CPU_ETCPAYINFO"); 
      String RES_STATE=myRS.getString("RES_STATE");  


%>
    <tr>
      <td style="width:60px"><%=CPU_ID%></td>
      <td style="width:90px"><%=CP_NAME%></td>
      <td style="width:90px"><%=CS_NAME%></td>
      <td style="width:110px"><%=CS_TELEPHONE%></td>
      <td style="width:120px"><%=CPU_USESTART%></td>
      <td style="width:120px"><%=CPU_USEEND%></td>
      <td><%=CPU_USEDAY%></td>
      <td><%=CPU_COST%>원</td>
      <td><%=CPU_PAYDATE%></td>
      <td><%=CPU_ETCPAYINFO%></td>
      <td><%=CPU_ETCPAYCOST%>원</td>
      
      <td><%=RES_STATE%></td>
      <td>
      <i class="fas fa-wrench fa-2x" onclick="location ='managingReservation_update.jsp?CPU_ID=<%=CPU_ID%>&CP_NAME=<%=CP_NAME%>&CPU_PAYDATE=<%=CPU_PAYDATE%>&CPU_ETCPAYINFO=<%=CPU_ETCPAYINFO%>&CPU_ETCPAYCOST=<%=CPU_ETCPAYCOST%>'"></i></button>

      </td>
    </tr>

<%
      }
      %>
      </tbody>
    </table>
  </div>
</section>
<%
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