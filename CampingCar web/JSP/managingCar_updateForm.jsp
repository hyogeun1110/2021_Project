<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  

<%
	request.setCharacterEncoding("utf-8");

	String cpName = request.getParameter("name");	
	String cpType = request.getParameter("type");	
	String cpNum = request.getParameter("num");	
	String cpDate = request.getParameter("date");	
	String cpCount = request.getParameter("count");	
	String cpInfo = request.getParameter("info");	
	String cpCost = request.getParameter("cost");	
  String id ="";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>차량 정보 수정</title>
<link rel="stylesheet" href="css/managing_car.css"/>  
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
<div class="mainscreen">
  <div class="card">
    <div class="leftside">
      <img
        class="product"
        alt=""
      />
    </div>
    <div class="rightside">
      <form action="managingCar_updatePro.jsp">
        <h2></h2>
        <p>차량 이름</p>
        <input type="text" class="inputbox" name="name" value="<%=cpName%>" required />
        <p>차량 종류</p>
        <input type="text" class="inputbox" name="type" value="<%=cpType%>" required />
        <p>차량 번호 (수정불가)</p>
        <input type="text" class="inputbox" name="num" value="<%=cpNum%>" readonly />
        <p>등록 날짜 (수정불가)</p>
        <input type="text" class="inputbox" name="date" value="<%=cpDate%>" readonly />
        <p>최대 탑승인원</p>
        <input type="text" class="inputbox" name="count" value="<%=cpCount%>" required />
        <p>차량 정보</p>
        <input type="text" class="inputbox" name="info" value="<%=cpInfo%>" required />
        <p>1일 렌트비용</p>
        <input type="text" class="inputbox" name="cost" value="<%=cpCost%>" required />
        
        <p></p>
        <button type="submit" class="button">update excute</button>
      </form>
    </div>
  </div>
</div>
</body>
</html>
<%
  }
} catch (Exception e) {
  e.printStackTrace();
  out.println("세션오류");
} 
%>