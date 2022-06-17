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
<title>정비소 추가</title>
<link rel="stylesheet" href="css/managing_repairshop.css"/>  
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

  <br><br><br>
<div class="mainscreen">
  <div class="card">
    <div class="leftside">
      <img
        class="product"
        alt=""
      />
    </div>
    <div class="rightside">
      <form action="managingRepairshop_insertPro.jsp">
        <p>정비소 ID번호부여</p>
        <input type="text" class="inputbox" name="id" required />
        <p>정비소 이름</p>
        <input type="text" class="inputbox" name="name" required />
        <p>정비소 전화번호</p>
        <input type="text" class="inputbox" name="tel" required />
        <p>정비소 주소</p>
        <input type="text" class="inputbox" name="address" required />
        <p>정비소 관계자</p>
        <input type="text" class="inputbox" name="personname" required />
        <p>정비소 관계자 전화번호</p>
        <input type="text" class="inputbox" name="personmail" required />
        
        <p></p>
      <button type="submit" class="button">insert excute</button>
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