<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
   request.setCharacterEncoding("utf-8");
   
   int cIds =Integer.parseInt(request.getParameter("cId"));
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
  
		Class.forName("oracle.jdbc.driver.OracleDriver"); 
		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );

      sql = "select * from company where C_STATE='사용' and c_id = ? ";
      pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1,cIds);
      myRS = pstmt.executeQuery();
      if(myRS.next()){
            cNameEntire= myRS.getString("C_NAME");
            String cImages = myRS.getString("C_IMAGES");
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
<body style="background-image:url('<%=cImages%>');">

<%
      }
      sql = "select * from company where C_STATE='사용' order by c_id ASC";
      pstmt = conn.prepareStatement(sql);
      myRS = pstmt.executeQuery();
   %>

         <div>
         <img  src="img/F5w.png" style="width:90px; height:70px; position:relative; top:20px; left:-650px;  z-index: 3;" onclick="location='Main.jsp'">
         </div>
         <section style="position:relative; top:-30px; left:-20px; color:white;">
            |
      <%
         while (myRS.next()) {
            int cId=myRS.getInt("C_ID");
            String cName = myRS.getString("C_NAME");
            String cImages = myRS.getString("C_IMAGES");
      %>
         <nav><button class="btn btn-outline-dark" style="border:0; border-radius:12px; font-weight:bold; color:white;" onclick="location='CarBrand.jsp?cId=<%=cId%>&cImages=<%=cImages%>'"><%=cName%></button></nav>
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
               %>
               
               <button class="btn btn-outline-dark" style="border:0; border-radius:12px; font-weight:bold; position:relative; top:-60px; left:550px; color:white;" onclick="location='LoginForm.jsp'">로그인</button></nav>
               
               <%
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
         <div style="font-size:50px; text-align:center; word-spacing:10em; letter-spacing :1px; color:white; position:relative; top:-20px; ">
            <a><%=cNameEntire%></a>
         </div> 

         <div style="font-size:30px; text-align:center; word-spacing:2em; letter-spacing :1px; position:relative; top:380px; color:#ffffff;">
            <a>634km</a>
            <a>3.4초</a>
            <a>289km/h</a>
            <a>1080hp</a>
         </div>    
         
         <div style="font-size:12px; text-align:center; word-spacing:10em; letter-spacing :1px; position:relative; top:380px; left:-290px; color:#ffffff;">
            <a>주행가능거리</a>
         </div> 
         <div style="font-size:11px; text-align:center; word-spacing:10em; letter-spacing :1px; position:relative; top:363px; left:-95px; color:#ffffff;">
            <a>0-100km/h도달시간</a>
         </div> 
         <div style="font-size:12px; text-align:center; word-spacing:10em; letter-spacing :1px; position:relative; top:346px; left:100px; color:#ffffff;">
            <a>최고속도</a>
         </div> 
         <div style="font-size:12px; text-align:center; word-spacing:10em; letter-spacing :1px; position:relative; top:329px; left:285px; color:#ffffff;">
            <a>최대출력</a>
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
       <nav><button class="btn btn-outline-dark" style="border:0; border-radius:12px; font-weight:bold; position:relative; top:-250px; left:530px; color:white;" onclick="location='CarMenu.jsp?cId=<%=cIds%>&cp_num=<%=cp_num%>&cp_name=<%=cp_name%>&cp_count=<%=cp_count%>&cp_info=<%=cp_info%>&cp_cost=<%=cp_cost%>&cp_images=<%=cp_images%>'"><%=cp_name%></button></nav>
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