<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String id = "";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>차량 회사 관리 </title>
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
      <form action="managingCompany_insertPro.jsp">
      <p>차량회사 ID번호부여</p>
      <input type="text" class="inputbox" name="id" required />
      <p>차량회사 이름</p>
      <input type="text" class="inputbox" name="name" required />
      <p>차량회사 전화번호</p>
      <input type="text" class="inputbox" name="tel" required />
      <p>차량회사 주소</p>
      <input type="text" class="inputbox" name="address" required />
      <p>차량회사 관계자</p>
      <input type="text" class="inputbox" name="personname" required />
      <p>차량회사 관계자 전화번호</p>
      <input type="text" class="inputbox" name="personmail" required />

      <input type="file" id="fileUpload" name="img" value="">
      <p></p>
      <button type="submit" class="button" onclick="location.href='managingCompany_updatePro.jsp'">update excute</button>
    </form>
  </div>
</div>
</div>
<script src="js/jquery-3.1.1.min.js"></script> <!-- jQuery -->
<script type="text/javascript">
function getFilePath(){
     $('input[type=file]').change(function () {
         var filePath=$('#fileUpload').val();
     });
}
</script>
</body>
</html>
<%

  }
} catch (Exception e) {
  e.printStackTrace();
  out.println("세션오류");
} 
%>