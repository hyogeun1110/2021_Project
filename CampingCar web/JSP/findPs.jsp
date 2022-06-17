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
    .f5{
        height: 60px;   
        width: 70px;
        position: relative;
        left: 15px;
        top:15px
    }
    .ps{
        position: relative; 
        top: 50px;
        font-size: 32px;
        margin-bottom: 0px;
        margin-top: 0px;
    }
    .liss{
        font-size: 11px;
        position: relative;
        top: 75px;
        color: #969696;
    }
    .boxM{
        width: 320px;
        height: 35px;
        position: relative;
        top : 70px;
        border-radius: 80px;
        background-color: #ececec;
        border:0;
        outline: 0;
        padding-left: 15px;
    }
    .boxM:focus{
        border: 1px #999999;
        outline: 1px solid #bebebe;
    }
    .boxMAIL{
        width: 210px;
        height: 35px;
        position: relative;
        top : 160px;
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
       top: 159px;
       left: 162px;
       z-index: 3;
    }
    .btnnew{
        width: 320px;
        height: 35px;  
        border-radius: 80px;
        background-color: white;
        position: relative;
        top:130px;
        right: -4px;
        font-size: 14px;
        z-index: 3;
    }
    .pass{
        font-size: 11px;
        position: relative;
        top: 84px;
        color: #969696;
    }
    .mail1{
      position: relative;
      bottom: 78px;
      right: 163px;
    }
    .bottext{
        font-size: 10px;
        color: #9F9F9F;
        position: relative;
        top: 20px;
    }
</style>
</head>
<body>
    <div class="top">
        <img  src="img/F5.png" style="width:90px; height:70px; position:relative; top:20px; left:-650px; z-index: 3; " onclick="location='Main.jsp'">
    </div>
    <div class="container">
      <form method="post" action="findPsPro.jsp">
        <div class="middle">
          <label class="ps">비밀번호 찾기</label> 

          <p class="liss">라이센스</p>              
          <input type="text" name="id" class="boxM" autocomplete="off" required>

          <p class="pass">이메일</p>      
          <div class="mail1">
            <input type="text" class="boxMAIL" id="addressHead" name="email" autocomplete='off' required>       
            <select name="emailTail" class="form-select1 form-select-sm" aria-label=".form-select-sm example" required>
              <option selected>이메일선택</option>
              <option value="@naver.com">@naver.com</option>
              <option value="@daum.net">@daum.net</option>
              <option value="@google.com">@google.com</option>
              <option value="@nate.com">@nate.com</option>
              <option value="@kakao.com">@kakao.com</option>
            </select>
          </div>
          <button type="submit" class="btnnew btn-outline-dark">찾기</button>
          <p class="bottext"></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>
            F5 @ 2021 &nbsp&nbsp 개인정보 처리방침 및 법적고지 &nbsp&nbsp 연락처</p>
        </div>
      </form>
    </div>
   
</body>
</html>