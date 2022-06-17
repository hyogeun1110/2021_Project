<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
   request.setCharacterEncoding("utf-8");
   
   int cIds =Integer.parseInt(request.getParameter("cId"));
   String cpNum = request.getParameter("cp_num");
   String cpName = request.getParameter("cp_name");
   String cpCount = request.getParameter("cp_count");
   String cpInfo = request.getParameter("cp_info");
   String cpCost = request.getParameter("cp_cost");
   String cImages = request.getParameter("cp_images");

   String id = "";

   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet myRS = null;
   String sql ="";
   String cNameEntire = ""; //해당 페이지의 회사이름을 전역변수 선언
      try {
      String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
		String dbId="f5";
		String dbPass="1234";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑카</title>
<link rel = "stylesheet" href="css/style.css">
<link rel = "stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
</head>
<style>
</style>
<body style="background-image:url('<%=cImages%>'); ">
   <%

  
		Class.forName("oracle.jdbc.driver.OracleDriver"); 
		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );
      //sql = "select c_name from company where c_id = ?";//c_images,

      //pstmt = conn.prepareStatement(sql);
      //myRS = pstmt.executeQuery();
   %>

         <div>
         <img  src="img/F5w.png" style="width:90px; height:70px; position:relative; top:20px; left:-650px; z-index: 3; " onclick="location='Main.jsp'">
         </div>
         <section style="position:relative; top:-30px; left:-20px; color:white;">
            |
      <%
      sql = "select * from company where C_STATE='사용' order by c_id ASC";
      pstmt = conn.prepareStatement(sql);
      myRS = pstmt.executeQuery();
         while (myRS.next()) {
            int cId=myRS.getInt("C_ID");
            String cName = myRS.getString("C_NAME");
            
      %>
         <nav><button class="btn btn-outline-dark" style="border:0; border-radius:12px; font-weight:bold; color:white;" onclick="location='CarBrand.jsp?cId=<%=cId%>'"><%=cName%></button></nav>
            |
            <%
         } //while 끝
         %>
         </section>

         <div>
         <%
         
         try{
            id = (String)session.getAttribute("id");           
            if(id==null || id.equals("")){
               %><button class="btn btn-outline-dark" style="border:0; border-radius:12px; font-weight:bold; position:relative; top:-60px; left:550px; color:white;" onclick="location='LoginForm.jsp'">로그인</button></nav><%
            }else{

               %>
            <a style="font-size:15px; color:black; position:relative; top:-62px; left:600px; color:white;"><%=session.getAttribute("NAME")%> 님</a>
            <a style="font-size:15px; color:gray; position:relative; top:-64px; left:530px;">|</a>
            <button class="btn btn-outline-secondary" style="border:0; border-radius:12px; font-size:13px; font-weight:bold; position:relative; top:-65px; left:473px;" onclick="location='info.jsp?id=<%=id%>'">정보수정</button>
            <button class="btn btn-outline-secondary" style="border:0; border-radius:12px; font-size:13px; font-weight:bold; position:relative; top:-65px; left:480px;" onclick="location='ReservationCheck.jsp'">예약내역</button>
            <button class="btn btn-outline-secondary" style="border:0; border-radius:12px; font-size:13px; font-weight:bold; position:relative; top:-65px; left:487px;" onclick="location='Logout.jsp'">로그아웃</button>      
               <%
            }
         } catch (Exception e) {
            e.printStackTrace();
            out.println("세션오류");
         } 
         %>
         </div> 
         <div style="font-size:12px; text-align:center; word-spacing:10em; letter-spacing :1px; position:relative; top:500px; left:-350px; color:#ffffff;">
            <a>탑승인원</a>
         </div> 
         <div style="font-size:12px; text-align:center; word-spacing:10em; letter-spacing :1px; position:relative; top:483px; left:-40px; color:#ffffff;">
            <a>차량상세정보</a>
         </div> 
         <div style="font-size:12px; text-align:center; word-spacing:10em; letter-spacing :1px; position:relative; top:466px; left:260px; color:#ffffff;">
            <a>비용</a>
         </div> 
         <div>
            <button class="submit1" style="width:180px; position:relative; top:410px; left:470px; color:white; border:solid #ffffff; background:none;  z-index: 3;" onclick = "location = 'Reservation.jsp?CP_NAME=<%=cpName%>&CP_NUM=<%=cpNum%>&CP_COST=<%=cpCost%>'">예약하기</button>
         </div>

      <div style="font-size:40px; text-align:center; word-spacing:4px; font-weight:bold; letter-spacing :1px; color:white;  position:relative; top:-100px;">
         <h1><%=cpName%></h1>
      </div>
      <div style="font-size:30px; text-align:center; word-spacing:10em; letter-spacing :1px; position:relative; top:300px; left:-350px; color:#ffffff;">
         <span><%=cpCount%>인승</span>
      </div>
      <div style="font-size:25px; text-align:center; word-spacing:10px; letter-spacing :1px; position:relative; top:260px; left:-40px; color:#ffffff;">
         <span><%=cpInfo%></span>
      </div>
      <div style="font-size:30px; text-align:center; word-spacing:1em; letter-spacing :1px; position:relative; top:220px; left:260px; color:#ffffff;">
         <span><%=cpCost%>원</span>
      </div>
      
         <%  
      sql = "select * from campcar where CP_STATE='사용' and c_id = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1,cIds);
      myRS = pstmt.executeQuery();
      
      myRS = pstmt.executeQuery();
         while (myRS.next()) {
            String cp_num = myRS.getString("CP_NUM");
            String cp_name = myRS.getString("CP_NAME");
            int cp_count = myRS.getInt("CP_COUNT");
            String cp_info = myRS.getString("CP_INFO");
            int cp_cost = myRS.getInt("CP_COST");
            String cp_images = myRS.getString("CP_IMAGES");
      %>
       <nav><button class="btn btn-outline-dark" style="border:0; border-radius:12px; font-weight:bold; position:relative; top:-344px; left:530px; color:white;" onclick="location='CarMenu.jsp?cId=<%=cIds%>&cp_name=<%=cp_name%>&cp_count=<%=cp_count%>&cp_num=<%=cp_num%>&cp_info=<%=cp_info%>&cp_cost=<%=cp_cost%>&cp_images=<%=cp_images%>'"><%=cp_name%></button></nav>
   <%
      }
      
   } catch (Exception e) {
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
   </table>
</body>
</html>