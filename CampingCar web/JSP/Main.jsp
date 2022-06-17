<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet myRS = null;

   String id = "";
   try {
      String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
		String dbId="f5";
		String dbPass="1234";
  
		Class.forName("oracle.jdbc.driver.OracleDriver"); 
		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );

      String sql = "select * from company where C_STATE='사용' order by c_id ASC";
      pstmt = conn.prepareStatement(sql);
      myRS = pstmt.executeQuery();

         
   
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
<body style="background-image:url('img/camping.png');">
         <div>
         <img  src="img/F5.png" style="width:90px; height:70px; position:relative; top:20px; left:-650px; z-index: 3; " onclick="location='Main.jsp'">
         </div>
         <section style="position:relative; top:-30px; left:-20px;">
            |
      <%
 
         while (myRS.next()) {
            int cId=myRS.getInt("C_ID");
            String cName = myRS.getString("C_NAME");
            
      %>
            
         <nav><button class="btn btn-outline-dark" style="border:0; border-radius:12px; font-weight:bold;" onclick="location='CarBrand.jsp?cId=<%=cId%>'"><%=cName%></button></nav>
            |
            <%
         }
         %>
         </section>
         <div>
         <%
         
         try{
            id = (String)session.getAttribute("id");
            if(id==null || id.equals("")){
               %><button class="btn btn-outline-dark" style="border:0; border-radius:12px; font-weight:bold; position:relative; top:-60px; left:550px;" onclick="location='LoginForm.jsp'">로그인</button></nav><%
            }else{

               %>
            <a style="font-size:15px; color:black; position:relative; top:-62px; left:600px;"><%=session.getAttribute("NAME")%> 님</a>
            <a style="font-size:15px; color:gray; position:relative; top:-64px; left:530px;">-</a>
            <button class="btn btn-outline-secondary" style="border:0; border-radius:12px; font-size:13px; font-weight:bold; position:relative; top:-65px; left:473px;" onclick="location='info.jsp?id=<%=id%>'">정보수정</button>
            <button class="btn btn-outline-secondary" style="border:0; border-radius:12px; font-size:13px; font-weight:bold; position:relative; top:-65px; left:480px;" onclick="location='ReservationCheck.jsp'">예약내역</button>
            <button class="btn btn-outline-secondary" style="border:0; border-radius:12px; font-size:13px; font-weight:bold; position:relative; top:-65px; left:487px;" onclick="location='Logout.jsp'">로그아웃</button>
                 
               <%
            }
         } catch (Exception e) {
            e.printStackTrace();
            out.println("세션오류");
         } 
         if(id==null || id.equals("")){}
         else{
         %>
         
         </div>        
         <div>
            <button class="submit" onclick = "location = 'select_repair.jsp'">정비내역 확인하기</button>
         </div>
         <div>
            <button class="submit1" onclick = "location = 'shop.jsp'">정비 신청하기</button>
         </div>
            <%}
      
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