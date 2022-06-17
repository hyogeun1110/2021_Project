<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  

<%
	request.setCharacterEncoding("utf-8");

  String rsName=request.getParameter("rsName");	
  String rsId=request.getParameter("rsId");	
  String rsAddress=request.getParameter("rsAddress");	
  String rsTelephone=request.getParameter("rsTel");	
  String rsPersonname=request.getParameter("rsPersonname");	
  String rsPersonmail=request.getParameter("rsPersonmail");	
  String id="";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회사 정보 삭제</title>
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
<div class="mainscreen">
  <div class="card">
    <div class="leftside">
      <img
        class="product"
        alt=""
      />
    </div>
    <div class="rightside">
      <form action="managingRepairshop_deletePro.jsp">
      <p style="font-size:20px ; color:red;"> 삭제 주의 </p>
        <input type="text" class="inputbox" style="font-size:20px" name="id" value="<%=rsId%>" readonly />
        <p>정비소 이름</p>
        <input type="text" class="inputbox" value="<%=rsName%>" readonly />
        <p>정비소 전화번호</p>
        <input type="text" class="inputbox" value="<%=rsTelephone%>" readonly />
        <p>정비소 주소</p>
        <input type="text" class="inputbox" value="<%=rsAddress%>" readonly />
        <p>정비소 관계자</p>
        <input type="text" class="inputbox" value="<%=rsPersonname%>" readonly />
        <p>정비소 관계자 전화번호</p>
        <input type="text" class="inputbox" value="<%=rsPersonmail%>" readonly />
        
        <p></p>
        <button type="submit" class="button">삭제(미사용)</button>
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