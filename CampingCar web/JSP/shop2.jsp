<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
   request.setCharacterEncoding("utf-8");
   String rid1 = request.getParameter("rId");
   int rIds =Integer.parseInt(request.getParameter("rId"));
   String rImagess = request.getParameter("rImages");

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
<link rel = "stylesheet" href="css/style.css">
<link rel = "stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
<style>

</style>
</head>
<%
    sql = "select rs_img from repairshop where rs_id = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1,rIds);
    rs = pstmt.executeQuery();

    if(rs.next()){
        String rImages = rs.getString("rs_img");
%>
<body style="background-image:url('<%=rImages%>');">
<% } %>

   <section style="position:relative;">
    <%
        sql = "select * from repairshop";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            int rId=rs.getInt("RS_ID");
            String rName = rs.getString("RS_NAME");
            
      %>
        <nav><button class="btn btn-outline-dark" style="border:0; border-radius:12px; font-weight:bold;" onclick="location='shop2.jsp?rId=<%=rId%>'"><%=rName%></button></nav>
            |
<%  }   %>
</section>
<%
    sql = "select * from repairshop where rs_id = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1,rIds);
    rs = pstmt.executeQuery();
    while(rs.next()){
        String name = rs.getString("rs_name");
        String adress = rs.getString("rs_address");
        String telephone = rs.getString("rs_telephone");
        String personname = rs.getString("rs_personname");
        String mail = rs.getString("rs_personmail");
        String rImages = rs.getString("rs_img");
%>
<div class="page1"></div>

<table align="center" style="position: relative; top: 25px;">
    <tr align="center">
        <th colspan="2" style="font-weight: 900;"><%=name%></th>
        <td style="font-weight: 700;">&nbsp(<%=adress%>)</td>
    </tr>
    </table>
    <table align="center" style="position: relative;top: 545px;">
    <tr>
        <td style="color: white; font-weight: 800;">담당자 -&nbsp</td>
        <td style="color: white; font-weight: 800;"><%=personname%></td>
        <td style="color: white; font-weight: 800;">&nbsp&nbsp(<%=telephone%> - <%=mail%>)</td>
    </tr>
</table>
<button class="btn btn-outline-dark" onclick="location='repair.jsp?rId=<%=rid1%>'" style="position: relative;left: 700px;top: 3px;">정비신청하기</button>
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