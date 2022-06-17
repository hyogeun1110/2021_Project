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
<title>회원 추가</title>
<link rel="stylesheet" href="css/managing_request.css"/>  
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
      
    </div>
    <div class="rightside">
      <form action="managingCustomer_insertPro.jsp">
        <p>고객 운전면허증 번호 입력</p>
        <input type="text" class="inputbox" name="CS_LICENSE" required />
        <p>비밀번호</p>
        <input type="text" class="inputbox" name="CS_PASSWD" required />
        <p>고객 이름</p>
        <input type="text" class="inputbox" name="CS_NAME" required />
        <p>고객 전화번호 (숫자만)</p>
        <input type="text" class="inputbox" name="CS_TELEPHONE" required />

        <p>고객 주소  <input type="button"  onclick="sample3_execDaumPostcode()" value="우편번호 찾기"></p>
        <input type="text" class="inputbox"  id="sample3_postcode" name="postalCode" placeholder="우편번호" style="font-size:10px ; width:50px ; height:5px" readonly />
        <br>
        <input type="text" class="inputbox" id="sample3_address" name="addressHead" placeholder="주소" style="width:250px" readonly />
        <input type="text" class="inputbox" id="sample3_extraAddress" name="addressReference" placeholder="참고항목" style="width:250px" readonly />
          <input type="text" class="inputbox" id="sample3_detailAddress" name="addressTail" placeholder="상세주소" required/>
        <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
          <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
        </div>

        <p>고객 이메일 주소</p>
        <input type="text" class="inputbox" name="emailHead" style="width:300px" placeholder="이메일 앞부분" required />
        <select name="emailTail"  style="font-size: 16px; width : 200px" required>
          <option selected>이메일 선택</option>
          <option value="@naver.com">@naver.com</option>
          <option value="@daum.net">@daum.net</option>
          <option value="@google.com">@google.com</option>
          <option value="@nate.com">@nate.com</option>
          <option value="@kakao.com">@kakao.com</option>
        </select>
        <p></p>
      <button type="submit" class="button">입력 확인</button>
    </form>
    </div>
</div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="js/address(kakao).js"></script> <!--카카오 주소검색 js -->
<script src="js/jquery-3.1.1.min.js"></script> <!-- jQuery -->
</body>
</html>
<%
  }
} catch (Exception e) {
  e.printStackTrace();
  out.println("세션오류");
} 
%>