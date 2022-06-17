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
<title>정비내역 조회 </title>
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
  <h1>현재 정비 대기중</h1>
  <i class="fas fa-plus fa-4x" onclick="location ='managingRequest_insert.jsp'"></i>
  <a style ="font-size: 20px">(ADD MaintenanceRequest)</a>
  <i class="fas fa-home fa-3x" onclick="location ='managingRepairshop_select.jsp'" style=" margin-left : 300px"></i>
  <a style ="font-size: 20px">(Repairshop page)</a>
  <i class="fas fa-home fa-3x" onclick="location ='adminMain.jsp'" style=" margin-left : 300px"></i>
  <a style ="font-size: 20px">(Manager Main)</a>

  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th style="width:70px">정비 번호</th>
          <th>정비 신청날짜</th>
          <th>차량 번호</th>
          <th>회원 이름</th>
          <th>회원 연락처</th>
          <th>정비소 이름</th>
          <th>현재 상태</th>
          <th>현재상태 시작날짜</th>
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
  
  String sql = "select rl.RR_ID, rs.RS_NAME, rr.CP_NUM, TO_CHAR(REGISTRATIONDATE,'YYYY-MM-DD') REGISTRATIONDATE, cu.CS_NAME, cu.CS_TELEPHONE, to_char(rl.RRSTATE_START,'yyyy-mm-dd') RRSTATE_START, rl.RRSTATE, nvl(RR_ETCCOMMENT,'-') RR_ETCCOMMENT,  TO_CHAR(NVL(rl.RR_COST,0),'999,999,999') RR_COST , NVL(rl.RR_COST,0) RR_COST1, TO_CHAR(rl.RR_PAYDAY,'YYYY-MM-DD') RR_PAYDAY from RR_LIST rl , REPAIR_REQUEST rr , CUSTOMER cu, REPAIRSHOP rs where rl.RRstate='정비 대기중' AND rl.RR_ID = rr.RR_ID AND rr.CS_LICENSE = cu.CS_LICENSE AND rs.RS_ID=rr.RS_ID";

  pstmt = conn.prepareStatement(sql);
  myRS = pstmt.executeQuery();

  if(myRS != null){
    while(myRS.next()){
      String RR_ID=myRS.getString("RR_ID"); //pk
      String RS_NAME=myRS.getString("RS_NAME"); // 정비소 이름
      String CS_NAME=myRS.getString("CS_NAME"); //회원 이름
      String CP_NUM=myRS.getString("CP_NUM"); //차량번호
      String CS_TELEPHONE=myRS.getString("CS_TELEPHONE"); //회원 전화번호
      String RRSTATE_START=myRS.getString("RRSTATE_START"); //현재상태 시작
      String RRSTATE=myRS.getString("RRSTATE"); //현재상태
      String RR_ETCCOMMENT=myRS.getString("RR_ETCCOMMENT");  //현재 상태 중 내용
      String RR_COST=myRS.getString("RR_COST"); //보여줄 용도의 가격, 다음페이지로 넘기지 않음.
      String RR_COST1=myRS.getString("RR_COST1"); //,를 쓰지않는 가격, 다음페이지로 넘겨줄값임
      String RR_PAYDAY=myRS.getString("RR_PAYDAY"); //결제 날짜, 기본은 9999
      String REGISTRATIONDATE=myRS.getString("REGISTRATIONDATE"); //고객 신청날짜
      String st = "정비 중";
      String pst = "정비 대기중";
%>
    <tr>
      <td style="width:70px;color:blue"  onclick="location ='managingRequest_listselect.jsp?RR_ID=<%=RR_ID%>'"><%=RR_ID%></td>
      <td><%=REGISTRATIONDATE%></td>
      <td style="width:100px"><%=CP_NUM%></td>
      <td><%=CS_NAME%></td>
      <td><%=CS_TELEPHONE%></td>
      <td><%=RS_NAME%></td>
      <td><%=RRSTATE%></td>
      <td><%=RRSTATE_START%></td>
      <td><%=RR_ETCCOMMENT%></td>
      <td><%=RR_COST%>원</td>
      <td><%=RR_PAYDAY%></td>
      <td>
      <i class="fas fa-list" onclick="location ='managingRequest_listselect.jsp?RR_ID=<%=RR_ID%>'"></i></button>
      <i class="fas fa-wrench" onclick="location ='managingRequestTable_updateFormST.jsp?RR_ID=<%=RR_ID%>&CP_NUM=<%=CP_NUM%>&RRSTATE_START=<%=RRSTATE_START%>&RR_COST=<%=RR_COST1%>&RR_PAYDAY=<%=RR_PAYDAY%>&RRSTATE=<%=RRSTATE%>&RR_ETCCOMMENT=<%=RR_ETCCOMMENT%>&pst=<%=pst%>'"></i></button>
      <a href="managingRequestTable_updateForm.jsp?RR_ID=<%=RR_ID%>&CP_NUM=<%=CP_NUM%>&RRSTATE_START=<%=RRSTATE_START%>&RR_COST=<%=RR_COST1%>&RR_PAYDAY=<%=RR_PAYDAY%>&RRSTATE=<%=RRSTATE%>&RR_ETCCOMMENT=<%=RR_ETCCOMMENT%>&st=<%=st%>&pst=<%=pst%>" class="btn btn-warning btn-sm" style="font-size: 5px;">정비 시작</a>
      </td>
    </tr>

<%
      }
      %>
      </tbody>
    </table>
  </div>
</section><%
    }
    %>
    <section>
  <h1>현재 정비중</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th style="width:70px">정비 번호</th>
          <th>정비 신청날짜</th>
          <th>차량 번호</th>
          <th>회원 이름</th>
          <th>회원 연락처</th>
          <th>정비소 번호</th>
          <th>현재 상태</th>
          <th>현재상태 시작날짜</th>
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
    sql = "select rl.RR_ID, rs.RS_NAME, rr.CP_NUM, TO_CHAR(REGISTRATIONDATE,'YYYY-MM-DD') REGISTRATIONDATE, cu.CS_NAME, cu.CS_TELEPHONE, to_char(rl.RRSTATE_START,'yyyy-mm-dd') RRSTATE_START, rl.RRSTATE, nvl(RR_ETCCOMMENT,'-') RR_ETCCOMMENT,  TO_CHAR(NVL(rl.RR_COST,0),'999,999,999') RR_COST , NVL(rl.RR_COST,0) RR_COST1, TO_CHAR(rl.RR_PAYDAY,'YYYY-MM-DD') RR_PAYDAY from RR_LIST rl , REPAIR_REQUEST rr , CUSTOMER cu, REPAIRSHOP rs where rl.RRstate='정비 중' AND rl.RR_ID = rr.RR_ID AND rr.CS_LICENSE = cu.CS_LICENSE AND rs.RS_ID=rr.RS_ID";

  pstmt = conn.prepareStatement(sql);
  myRS = pstmt.executeQuery();

  if(myRS != null){
    while(myRS.next()){
      String RR_ID=myRS.getString("RR_ID"); //pk
      String RS_NAME=myRS.getString("RS_NAME"); // 정비소 이름
      String CS_NAME=myRS.getString("CS_NAME"); //회원 이름
      String CP_NUM=myRS.getString("CP_NUM"); //차량번호
      String CS_TELEPHONE=myRS.getString("CS_TELEPHONE"); //회원 전화번호
      String RRSTATE_START=myRS.getString("RRSTATE_START"); //현재상태 시작
      String RRSTATE=myRS.getString("RRSTATE"); //현재상태
      String RR_ETCCOMMENT=myRS.getString("RR_ETCCOMMENT");  //현재 상태 중 내용
      String RR_COST=myRS.getString("RR_COST"); //보여줄 용도의 가격, 다음페이지로 넘기지 않음.
      String RR_COST1=myRS.getString("RR_COST1"); //,를 쓰지않는 가격, 다음페이지로 넘겨줄값임
      String RR_PAYDAY=myRS.getString("RR_PAYDAY"); //결제 날짜, 기본은 9999
      String REGISTRATIONDATE=myRS.getString("REGISTRATIONDATE"); //고객 신청날짜
      String rs = "정비 완료";
      String pst = "정비 중";
%>
    <tr>
      <td style="width:70px;color:blue"  onclick="location ='managingRequest_listselect.jsp?RR_ID=<%=RR_ID%>'"><%=RR_ID%></td>
      <td><%=REGISTRATIONDATE%></td>
      <td style="width:100px"><%=CP_NUM%></td>
      <td><%=CS_NAME%></td>
      <td><%=CS_TELEPHONE%></td>
      <td><%=RS_NAME%></td>
      <td><%=RRSTATE%></td>
      <td><%=RRSTATE_START%></td>
      <td><%=RR_ETCCOMMENT%></td>
      <td><%=RR_COST%>원</td>
      <td><%=RR_PAYDAY%></td>
      <td>
        <i class="fas fa-list" onclick="location ='managingRequest_listselect.jsp?RR_ID=<%=RR_ID%>'"></i></button>
        <i class="fas fa-wrench" onclick="location ='managingRequestTable_updateFormST.jsp?RR_ID=<%=RR_ID%>&CP_NUM=<%=CP_NUM%>&RRSTATE_START=<%=RRSTATE_START%>&RR_COST=<%=RR_COST1%>&RR_PAYDAY=<%=RR_PAYDAY%>&RRSTATE=<%=RRSTATE%>&RR_ETCCOMMENT=<%=RR_ETCCOMMENT%>&pst=<%=pst%>'"></i></button>
        <a href="managingRequestTable_updateForm.jsp?RR_ID=<%=RR_ID%>&CP_NUM=<%=CP_NUM%>&RRSTATE_START=<%=RRSTATE_START%>&RR_COST=<%=RR_COST1%>&RR_PAYDAY=<%=RR_PAYDAY%>&RRSTATE=<%=RRSTATE%>&RR_ETCCOMMENT=<%=RR_ETCCOMMENT%>&st=<%=rs%>&pst=<%=pst%>" class="btn btn-warning btn-sm" style="font-size: 5px;">정비 완료</a>
      </td>
    </tr>

<%
      }
      %>
      </tbody>
    </table>
  </div>
</section><%
    }
    %>
    <section>
  <h1>현재 정비완료 (입금 대기중)</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th style="width:70px">정비 번호</th>
          <th>정비 신청날짜</th>
          <th>차량 번호</th>
          <th>회원 이름</th>
          <th>회원 연락처</th>
          <th>정비소 번호</th>
          <th>현재 상태</th>
          <th>현재상태 시작날짜</th>
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
    sql = "select rl.RR_ID, rs.RS_NAME, rr.CP_NUM, TO_CHAR(REGISTRATIONDATE,'YYYY-MM-DD') REGISTRATIONDATE, cu.CS_NAME, cu.CS_TELEPHONE, to_char(rl.RRSTATE_START,'yyyy-mm-dd') RRSTATE_START, rl.RRSTATE, nvl(RR_ETCCOMMENT,'-') RR_ETCCOMMENT,  TO_CHAR(NVL(rl.RR_COST,0),'999,999,999') RR_COST , NVL(rl.RR_COST,0) RR_COST1, TO_CHAR(rl.RR_PAYDAY,'YYYY-MM-DD') RR_PAYDAY from RR_LIST rl , REPAIR_REQUEST rr , CUSTOMER cu, REPAIRSHOP rs where rl.RRstate='정비 완료' AND rl.RR_ID = rr.RR_ID AND rr.CS_LICENSE = cu.CS_LICENSE AND rs.RS_ID=rr.RS_ID";

  pstmt = conn.prepareStatement(sql);
  myRS = pstmt.executeQuery();

  if(myRS != null){
    while(myRS.next()){
      String RR_ID=myRS.getString("RR_ID"); //pk
      String RS_NAME=myRS.getString("RS_NAME"); // 정비소 이름
      String CS_NAME=myRS.getString("CS_NAME"); //회원 이름
      String CP_NUM=myRS.getString("CP_NUM"); //차량번호
      String CS_TELEPHONE=myRS.getString("CS_TELEPHONE"); //회원 전화번호
      String RRSTATE_START=myRS.getString("RRSTATE_START"); //현재상태 시작
      String RRSTATE=myRS.getString("RRSTATE"); //현재상태
      String RR_ETCCOMMENT=myRS.getString("RR_ETCCOMMENT");  //현재 상태 중 내용
      String RR_COST=myRS.getString("RR_COST"); //보여줄 용도의 가격, 다음페이지로 넘기지 않음.
      String RR_COST1=myRS.getString("RR_COST1"); //,를 쓰지않는 가격, 다음페이지로 넘겨줄값임
      String RR_PAYDAY=myRS.getString("RR_PAYDAY"); //결제 날짜, 기본은 9999
      String REGISTRATIONDATE=myRS.getString("REGISTRATIONDATE"); //고객 신청날짜
      String rs = "입금 완료(완)";
      String pst = "정비 완료";
%>
    <tr>
      <td style="width:70px;color:blue"  onclick="location ='managingRequest_listselect.jsp?RR_ID=<%=RR_ID%>'"><%=RR_ID%></td>
      <td><%=REGISTRATIONDATE%></td>
      <td style="width:100px"><%=CP_NUM%></td>
      <td><%=CS_NAME%></td>
      <td><%=CS_TELEPHONE%></td>
      <td><%=RS_NAME%></td>
      <td><%=RRSTATE%></td>
      <td><%=RRSTATE_START%></td>
      <td><%=RR_ETCCOMMENT%></td>
      <td><%=RR_COST%>원</td>
      <td><%=RR_PAYDAY%></td>
      <td>
        <i class="fas fa-list" onclick="location ='managingRequest_listselect.jsp?RR_ID=<%=RR_ID%>'"></i></button>
        <i class="fas fa-wrench" onclick="location ='managingRequestTable_updateFormST.jsp?RR_ID=<%=RR_ID%>&CP_NUM=<%=CP_NUM%>&RRSTATE_START=<%=RRSTATE_START%>&RR_COST=<%=RR_COST1%>&RR_PAYDAY=<%=RR_PAYDAY%>&RRSTATE=<%=RRSTATE%>&RR_ETCCOMMENT=<%=RR_ETCCOMMENT%>&pst=<%=pst%>'"></i></button>
        <a href="managingRequestTable_updateForm.jsp?RR_ID=<%=RR_ID%>&CP_NUM=<%=CP_NUM%>&RRSTATE_START=<%=RRSTATE_START%>&RR_COST=<%=RR_COST1%>&RR_PAYDAY=<%=RR_PAYDAY%>&RRSTATE=<%=RRSTATE%>&RR_ETCCOMMENT=<%=RR_ETCCOMMENT%>&st=<%=rs%>&pst=<%=pst%>" class="btn btn-warning btn-sm" style="font-size: 5px;">입금완료</a>
      </td>
    </tr>

<%
      }
      %>
      </tbody>
    </table>
  </div>
</section><%
    }
    %>
<section>
  <h1>입금 완료 (완)</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th style="width:70px">정비 번호</th>
          <th>정비 신청날짜</th>
          <th style="width:100px">차량 번호</th>
          <th>회원 이름</th>
          <th>회원 연락처</th>
          <th>정비소 번호</th>
          <th>현재 상태</th>
          <th>현재상태 시작날짜</th>
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
    sql = "select rl.RR_ID, rs.RS_NAME, rr.CP_NUM, TO_CHAR(REGISTRATIONDATE,'YYYY-MM-DD') REGISTRATIONDATE, cu.CS_NAME, cu.CS_TELEPHONE, to_char(rl.RRSTATE_START,'yyyy-mm-dd') RRSTATE_START, rl.RRSTATE, nvl(RR_ETCCOMMENT,'-') RR_ETCCOMMENT,  TO_CHAR(NVL(rl.RR_COST,0),'999,999,999') RR_COST , NVL(rl.RR_COST,0) RR_COST1, TO_CHAR(rl.RR_PAYDAY,'YYYY-MM-DD') RR_PAYDAY from RR_LIST rl , REPAIR_REQUEST rr , CUSTOMER cu, REPAIRSHOP rs where rl.RRstate='입금 완료(완)' AND rl.RR_ID = rr.RR_ID AND rr.CS_LICENSE = cu.CS_LICENSE AND rs.RS_ID=rr.RS_ID";

  pstmt = conn.prepareStatement(sql);
  myRS = pstmt.executeQuery();

  if(myRS != null){
    while(myRS.next()){
      String RR_ID=myRS.getString("RR_ID"); //pk
      String RS_NAME=myRS.getString("RS_NAME"); // 정비소 이름
      String CS_NAME=myRS.getString("CS_NAME"); //회원 이름
      String CP_NUM=myRS.getString("CP_NUM"); //차량번호
      String CS_TELEPHONE=myRS.getString("CS_TELEPHONE"); //회원 전화번호
      String RRSTATE_START=myRS.getString("RRSTATE_START"); //현재상태 시작
      String RRSTATE=myRS.getString("RRSTATE"); //현재상태
      String RR_ETCCOMMENT=myRS.getString("RR_ETCCOMMENT");  //현재 상태 중 내용
      String RR_COST=myRS.getString("RR_COST"); //보여줄 용도의 가격, 다음페이지로 넘기지 않음.
      String RR_COST1=myRS.getString("RR_COST1"); //,를 쓰지않는 가격, 다음페이지로 넘겨줄값임
      String RR_PAYDAY=myRS.getString("RR_PAYDAY"); //결제 날짜, 기본은 9999
      String REGISTRATIONDATE=myRS.getString("REGISTRATIONDATE"); //고객 신청날짜
      String pst = "입금 완료(완)";
      
%>
    <tr>
      <td style="width:70px;color:blue"  onclick="location ='managingRequest_listselect.jsp?RR_ID=<%=RR_ID%>'"><%=RR_ID%></td>
      <td><%=REGISTRATIONDATE%></td>
      <td style="width:100px"><%=CP_NUM%></td>
      <td><%=CS_NAME%></td>
      <td><%=CS_TELEPHONE%></td>
      <td><%=RS_NAME%></td>
      <td><%=RRSTATE%></td>
      <td><%=RRSTATE_START%></td>
      <td><%=RR_ETCCOMMENT%></td>
      <td><%=RR_COST%>원</td>
      <td><%=RR_PAYDAY%></td>
      <td>
        <i class="fas fa-list" onclick="location ='managingRequest_listselect.jsp?RR_ID=<%=RR_ID%>'"></i></button>
        <i class="fas fa-wrench" onclick="location ='managingRequestTable_updateFormST.jsp?RR_ID=<%=RR_ID%>&CP_NUM=<%=CP_NUM%>&RRSTATE_START=<%=RRSTATE_START%>&RR_COST=<%=RR_COST1%>&RR_PAYDAY=<%=RR_PAYDAY%>&RRSTATE=<%=RRSTATE%>&RR_ETCCOMMENT=<%=RR_ETCCOMMENT%>&pst=<%=pst%>'"></i></button>
      </td>
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