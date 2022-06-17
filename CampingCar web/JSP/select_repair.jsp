<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
   request.setCharacterEncoding("utf-8");
   String cpu1 = request.getParameter("cpu_1");
   String id = "";
   id = (String)session.getAttribute("id");

   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   String sql ="";
   try {
      String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
		String dbId="f5";
		String dbPass="1234";
  
		Class.forName("oracle.jdbc.driver.OracleDriver"); 
		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정비소</title>
<link rel = "stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
<style>
    .top{     
        width: 100%;
        height: 60px;
    }
</style>
</head>
<body style="background-image: url('img/color1.jpg'); background-repeat: no-repeat;background-size : 1540px 1500px;">
    <div class="top">
        <img  src="img/F5.png" style="width:90px; height:70px; position:relative; top:20px;left: 15px; z-index: 3; " onclick="location='Main.jsp'"> 
     </div>
</section>
<b style="font:12px/24px;position: relative;top: 40px;left: 688px;font-size: 20px;">정비내역 확인</b>

<table style="border: 1px solid black;border-radius: 10px; border: 0px; position: relative; top: 90px; left: 22px; background-color: white;">
    <tr align="center">
        <th>번호</th>
        <th style="width: 160px;">현재 상태</th>
        <th style="width: 160px;">중간 정비 내역</th>
        <th style="width: 160px;">가격</th>
        <th style="width: 160px;">결제 일자</th>
        <th style="width: 160px;">자동차 번호</th>
        <th style="width: 160px;">정비 신청 일자</th>
        <th style="width: 160px;">사용자 정비 신청</th>
        <th style="width: 160px;">자동차 이름</th>
        <th style="width: 160px;">정비소 이름</th>
    </tr>
<% 
    sql = "select b.RR_ID, a.RRSTATE, nvl(a.RR_ETCCOMMENT,'-') RR_ETCCOMMENT2, a.RR_ETCCOMMENT, a.RR_COST, nvl(a.RR_COST,'0') RR_COST2, to_char(a.RR_PAYDAY,'yyyy-mm-dd') RR_PAYDAY, b.CP_NUM, b.registrationdate, b.rr_comment, c.cp_name, e.rs_name from RR_LIST a, REPAIR_REQUEST b, campcar c, customer d, repairshop e where b.rs_id = e.rs_id and b.cp_num = c.cp_num and  a.rr_id = b.rr_id and b.cs_license = d.cs_license and b.cs_license = ? ";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,id);
    rs = pstmt.executeQuery();
    if(rs.next()){
        while(rs.next()){
            String RR_ID = rs.getString("RR_ID");
            String RRSTATE = rs.getString("RRSTATE");
            String RR_ETCCOMMENT2 = rs.getString("RR_ETCCOMMENT2");
            String RR_COST2 = rs.getString("RR_COST2");
            String RR_PAYDAY = rs.getString("RR_PAYDAY");
            String CP_NUM = rs.getString("CP_NUM");
            String registrationdate = rs.getString("registrationdate");
            String rr_comment = rs.getString("rr_comment");
            String cp_name = rs.getString("cp_name");
            String rs_name = rs.getString("rs_name");
%>

    <tr align="center">
        <td><%=RR_ID%></td>
        <td style="width: 160px;"><%=RRSTATE%></td> 
        <td style="width: 160px;"><%=RR_ETCCOMMENT2%></td>
        <td style="width: 160px;"><%=RR_COST2%></td>
        <td style="width: 160px;"><%=RR_PAYDAY%></td>
        <td style="width: 160px;"><%=CP_NUM%></td>
        <td style="width: 160px;"><%=registrationdate%></td>
        <td style="width: 160px;"><%=rr_comment%></td>
        <td style="width: 160px;"><%=cp_name%></td>
        <td style="width: 160px;"><%=rs_name%></td>
    </tr>
    <tr>
        <td colspan="4" align="left"><button class="btn btn-outline-dark" onclick="location='updateTestForm.jsp?rr_id=<%=RR_ID%>'" style="width: 180px;">수정하기</button></td>
    </tr>


<% } 
%>
</table>
<br>
<%
}else{ %>
<button class="btn btn-outline-dark" onclick="location='shop.jsp'" style="width: 180px;position: relative;top: 150px;left: 530px;">정비 신청하기</button>
<% }
} catch (Exception e) {
    e.printStackTrace();
    } finally {
    try {
    if (rs != null) {
       rs.close();
    }
    if (pstmt != null) {
       pstmt.close();
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