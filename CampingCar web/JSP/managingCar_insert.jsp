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
<title>차량 추가 </title>
<link rel="stylesheet" href="css/managing_car.css"/>  
<link rel="stylesheet" href="air-datepicker/dist/css/datepicker.min.css"> <!-- 달력 css -->
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
      </div>
      <div class="rightside">
        <form method="post" action="managingCar_insertpro.jsp">
          <h2>차량 추가</h2>
          <p>차량 이름</p>
          <input type="text" class="inputbox" name="name" required />
          <p>차량 종류</p>
          <input type="text" class="inputbox" name="type" required />
          <p>차량 번호</p>
          <input type="text" class="inputbox" name="num" required />
          <p>등록 날짜</p>
          <input type="text" class="inputbox" id="datepicker" name="date" required />
          <p>최대 탑승인원</p>
          <input type="text" class="inputbox" name="count" required />
          <p>차량 정보</p>
          <input type="text" class="inputbox" name="info" required />
          <p>1일 렌트비용</p>
          <input type="text" class="inputbox" name="cost" required />
          <p>회사 번호 선택</p>
          <input type="text" class="inputbox" name="cId" required />

          <input type="file" id="fileUpload" name="img" value="">
          <p></p>  
          <button type="submit" class="button" >CheckOut</button>
          


          <div id="image_container" >
          </div> 
      
        </form>
      </div>
    </div>
  </div>
</div>
<br><br><br>
<script src="js/jquery-3.1.1.min.js"></script> <!-- jQuery -->
<script type="text/javascript"> //파일 제목 가져오기
function getFilePath(){
     $('input[type=file]').change(function () {
         var filePath=$('#fileUpload').val();
     });
}
</script>
<!-- 달력 관련 script-->
<script src="air-datepicker/dist/js/datepicker.min.js"></script>
<script src="air-datepicker/dist/js/i18n/datepicker.ko.js"></script>
<script>
    $("#datepicker").datepicker({
    	language: 'ko'
    }); 
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