<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
<style>
    *{
        margin: 0;
    }
    .container{
      width: 100%;
      height: 100%;
      margin: auto;
      display: flex;
      position: relative;
    }
    div{
        text-align: center;
    }
    .top{     
      width: 100%;
      height: 60px; 
    }
    .middle{
      width: 100%;
      height: 100%;
      position:absolute;     
    }
    .footer {
      position: absolute;
      left: 0;
      bottom: 0;
      width: 100%;
      padding: 15px 0;
      text-align: center;
      }
    .hw{
      position: relative; 
      top: 10px;
      font-size: 32px;
      margin-bottom: 0px;
      margin-top: 0px;
    }
    .f5{
        height: 60px;   
        width: 70px;
        position: relative;
        left: 15px;
        top:15px
    }
    .bottext{
        font-size: 10px;
        color: #9F9F9F;
        position: relative;
        top: -20px;
    }
    .liss{
        font-size: 11px;
        position: relative;
        top: 35px;
        color: #969696;
    }
    .boxID{
        width: 320px;
        height: 35px;
        position: relative;
        top : 30px;
        border-radius: 80px;
        background-color: #ececec;
        border:0;
        outline: 0;
        padding-left: 15px;
    }
    .boxID:focus{
        border: 1px #999999;
        outline: 1px solid #bebebe;
    }
    .pass{
        font-size: 11px;
        position: relative;
        top: 44px;
        color: #969696;
    }
    .boxPASS{
        width: 320px;
        height: 35px;
        position: relative;
        top : 37px;
        border-radius: 80px;
        background-color: #ececec;
        border:0;
        outline: 0;
        padding-left: 15px;
        z-index: 2;
    }
    .boxPASS:focus{
        border: 1px #999999;
        outline: 1px solid #bebebe;
    }
    .boxPOST{
        width: 205px;
        height: 35px;
        border-radius: 80px;
        background-color: #ececec;
        border:0;
        outline: 0;
        padding-left: 15px;
    }
    .boxPOST:focus{
        border: 1px #999999;
        outline: 1px solid #bebebe;
    }
    .btn1{
        width: 105px;
        height: 35px;
        border-radius: 80px;
        font-size: 12px;
        position: relative;
        bottom: 2px;
    }
    .post1{
      position: relative;
      top: 30px;
    }
    .boxADR{
        width: 320px;
        height: 35px;
        position: relative;
        top: 37px;
        left: 327px;
        border-radius: 80px;
        background-color: #ececec;
        border:0;
        outline: 0;
        padding-left: 15px;
        margin: 0 auto;
    }
    .boxADR1{
        width: 320px;
        height: 35px;
        position: relative;
        top : 80px;
        right: -1px;
        border-radius: 80px;
        background-color: #ececec;
        border:0;
        outline: 0;
        padding-left: 15px;   
    }
    .boxADR2{
        width: 320px;
        height: 35px;
        position: relative;
        top : 122px;
        right: 325px;
        border-radius: 80px;
        background-color: #ececec;
        border:0;
        outline: 0;
        padding-left: 15px;    
        z-index: 2;  
    }
    .mail{
        font-size: 11px;
        position: relative;
        top: 130px;
        color: #969696;
    }
    .boxMAIL{
        width: 210px;
        height: 35px;
        position: relative;
        top : 120px;
        left: 167px;
        border-radius: 80px;
        background-color: #ececec;
        border:0;
        outline: 0;
        padding-left: 15px;     
        z-index: 3; 
    }
    .form-select1{
       border-radius: 80px;
       background-color: #ececec;
       border:0;
       outline: 0;
       width: 110px;
       height: 35px;
       position: relative;
       top: 119px;
       left: 162px;
       z-index: 3;
    }
    .btnnew{
        width: 320px;
        height: 35px;  
        border-radius: 80px;
        background-color: white;
        position: relative;
        top:175px;
        right: 162px;
        font-size: 14px;
        z-index: 3;
    }
    .ckpass{
      position: relative; 
      left: 515px;
      top: 40px; 
      padding-left: 0px; 
      border-left: 0px;
      margin-left: 0px;
      text-align: left;
      padding-bottom: 0px;
      border-bottom: 0px;
      margin-bottom: 0px;
      font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    }

</style>
</head>
<body>
    <div class="top">
        <img  src="img/F5.png" style="width:90px; height:70px; position:relative; top:20px; left:-650px; z-index: 3; " onclick="location='Main.jsp'">
    </div>
    <div class="container">
    <form method="post" action="NewLoginPro.jsp">
      <div class="middle">
      <label class="hw">회원가입</label>

        <p class="liss">운전면허번호</p>
        <input type="text" class="boxID" name="id" id="id" maxlength="50" autocomplete="off" required>
        
        <p class="pass">비밀번호</p>
        <input type="password" class="boxPASS"  name="passwd" id="passwd" maxlength="16" required>
        <p class="pass">비밀번호 확인</p>
        <input type="password" class="boxPASS" id="passwd2" maxlength="16" required>
        <span><p class="ckpass" id="check"></p></span>

        <p class="pass">이름</p>
        <input type="text" class="boxPASS"  name="name" id="name" autocomplete="off" maxlength="10" required>
        
        <p class="pass">전화번호 ( - 제외)</p>
        <input type="text" class="boxPASS"  name="num1" id="num1" autocomplete="off" maxlength="100" required>

        <p class="pass">주소</p>
        <div class="post1">
          <input type="text" class="boxPOST"  id="sample3_postcode" name="address" autocomplete="off" placeholder="우편번호" required>
          <input type="button" class="btn1 btn-primary" onclick="sample3_execDaumPostcode()" value="우편번호 찾기">    
        </div>
          <input type="text" class="boxADR" id="sample3_address" name="address" autocomplete="off" placeholder="주소" readonly>
          <input type="text" class="boxADR1" id="sample3_extraAddress" name="address" placeholder="참고항목" readonly>      
        <input type="text" class="boxADR2" id="sample3_detailAddress" name="address" autocomplete="off" placeholder="상세주소">
        <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
        <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
        </div>

        <p class="mail">이메일</p>

          <input type="text" class="boxMAIL" id="addressHead" name="email" autocomplete='off' required>       
          <select name="emailTail" class="form-select1 form-select-sm" aria-label=".form-select-sm example" required>
            <option selected>이메일선택</option>
            <option value="@naver.com">@naver.com</option>
            <option value="@daum.net">@daum.net</option>
            <option value="@google.com">@google.com</option>
            <option value="@nate.com">@nate.com</option>
            <option value="@kakao.com">@kakao.com</option>
          </select>

        <input type="submit" class="btnnew btn-outline-dark" value="입력완료">
        <footer>
         <p class="bottext"></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>F5 @ 2021 &nbsp&nbsp 개인정보 처리방침 및 법적고지 &nbsp&nbsp 연락처</p>
        </footer>
      </div>
    </div>
         
  
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="js/address(kakao).js"></script> <!--카카오 주소검색 js -->
  <script src="js/jquery-3.1.1.min.js"></script> <!-- jQuery -->
  <script src="air-datepicker/dist/js/datepicker.min.js"></script>
  <script src="air-datepicker/dist/js/i18n/datepicker.ko.js"></script>
 
  <script> /* 패스워드일치확인 jquery */
  $(function(){
      $('#passwd').keyup(function(){
        $('#check').html('');
      });
      $('#passwd2').keyup(function(){
          if($('#passwd').val() != $('#passwd2').val()){
            $('#check').html('비밀번호가 일치하지 않습니다');
            $('#check').css('color', '#FF8E99');
          } else{
            $('#check').html('비밀번호가 일치합니다');
            $('#check').css('color', '#0000FF');
          }
      });
  });
  </script> 
  </form>
</body>
</html>