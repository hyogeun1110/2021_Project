<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
    String id = "";

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

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>차량 관리 </title>
<link rel="stylesheet" href="css/managing_car.css"/>  
</head>
<body>
  <br><br>
  <button type="button" class="button" style="width:300px; background:#ffd0a0; padding:10px; margin-left : 100px ; display: inline-block"onclick="location.href='managingCar_insert.jsp'">ADD Car</button>
  <button type="button" class="button" style="width:300px; background:#915921; padding:10px; margin-left : 700px ;color:white; display: inline-block;"onclick="location.href='adminMain.jsp'">Manager Main</button>
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
    
    String sql = "select c.cp_name, c.cp_type, c.cp_num, TO_CHAR(c.cp_date, 'YYYY-MM-DD') cp_date2, c.cp_count, c.cp_info, LTRIM(TO_CHAR(c.cp_cost,'999,999,999')) cp_cost2, c.cp_cost cp_cost3,  y.c_name from campcar c, company y WHERE c.c_id = y.c_id AND c.CP_STATE='사용' order by c.c_id";
      //  to_char(c.cp_cost,'999,999,999') cp_cost2
      //왼쪽에 빈공간이 생겨서 trim 넣었음
      pstmt = conn.prepareStatement(sql);
      myRS = pstmt.executeQuery();

      if(myRS != null){
        while(myRS.next()){
          String companyName=myRS.getString("c_name");
          String cpNum=myRS.getString("cp_num");
          String cpName=myRS.getString("cp_name");
          String cpType=myRS.getString("cp_type");
          String cpDate=myRS.getString("cp_date2");
          int cpCount=myRS.getInt("cp_count");
          String cpInfo=myRS.getString("cp_info");
          String cpCost=myRS.getString("cp_cost2"); //to_char로 콤마 찍기
          String cpCostint=myRS.getString("cp_cost3");
    %>
          <div class="mainscreen">
            <div class="card">
              <div class="leftside">
                <img src = "img/F5w.png"
                  class="product"
                  alt=""
                />
              </div>
              <div class="rightside">
                <form action="">
                  <h1></h1>
                  <h2><%=companyName%></h2>
                  <p>차량 이름</p>
                  <input type="text" class="inputbox" name="name" value="<%=cpName%>" readonly />
                  <p>차량 종류</p>
                  <input type="text" class="inputbox" name="type" value="<%=cpType%>" readonly />
                  <p>차량 번호</p>
                  <input type="text" class="inputbox" name="num" value="<%=cpNum%>" readonly />
                  <p>등록 날짜</p>
                  <input type="text" class="inputbox" name="date" value="<%=cpDate%>" readonly />
                  <p>최대 탑승인원</p>
                  <input type="text" class="inputbox" name="count" value="<%=cpCount%>" readonly />
                  <p>차량 정보</p>
                  <input type="text" class="inputbox" name="info" value="<%=cpInfo%>" readonly />
                  <p>1일 렌트비용</p>
                  <input type="text" class="inputbox" name="cost" value="<%=cpCost%>원" readonly />
                  <input type="hidden" class="inputbox" name="costint" value="<%=cpCostint%>원" readonly />
                  
                  <p></p>
                  <button type="button" class="button" onclick="location.href='managingCar_updateForm.jsp?name=<%=cpName%>&type=<%=cpType%>&num=<%=cpNum%>&date=<%=cpDate%>&count=<%=cpCount%>&info=<%=cpInfo%>&cost=<%=cpCostint%>'">update</button>
                  <button type="button" class="button2" onclick="location.href='managingCar_deleteForm.jsp?name=<%=cpName%>&type=<%=cpType%>&num=<%=cpNum%>&date=<%=cpDate%>&count=<%=cpCount%>&info=<%=cpInfo%>&cost=<%=cpCostint%>'">delete</button>
                </form>
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