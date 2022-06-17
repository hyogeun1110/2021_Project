<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  
<%
String id = "";
%>
<%
	request.setCharacterEncoding("utf-8");

  String cName=request.getParameter("cName");	
  String cId=request.getParameter("cId");	
  String cAddress=request.getParameter("cAddress");	
  String cTelephone=request.getParameter("cTel");	
  String cPersonname=request.getParameter("cPersonname");	
  String cPersonmail=request.getParameter("cPersonmail");	

%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회사 정보 수정</title>
<link rel="stylesheet" href="css/managing_company.css"/>  
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
      <form action="managingCompany_updatePro.jsp">
        <input type="text" class="inputbox" style="font-size:20px ; color:#1EDDFF;" name="id" value="<%=cId%>" readonly />
        <p>차량회사 이름</p>
        <input type="text" class="inputbox" name="name" value="<%=cName%>" required />
        <p>차량회사 전화번호</p>
        <input type="text" class="inputbox" name="tel" value="<%=cTelephone%>" required />
        <p>차량회사 주소</p>
        <input type="text" class="inputbox" name="address" value="<%=cAddress%>" required />
        <p>차량회사 관계자</p>
        <input type="text" class="inputbox" name="personname" value="<%=cPersonname%>" required />
        <p>차량회사 관계자 전화번호</p>
        <input type="text" class="inputbox" name="personmail" value="<%=cPersonmail%>" required />
        
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