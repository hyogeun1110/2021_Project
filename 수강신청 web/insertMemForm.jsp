<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link rel="stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
<style>
  .top{
        margin-top: 20px;
        outline: 1px solid #9F9F9F;
        width: 1000px;
        height: 100px;
        display: table;
        background-color: #eed8cb;
        background-image:url('2.png');
        background-size: 80px 80px;
        background-repeat: no-repeat;
        background-position: 10px;
    }
    div{
        text-align: center;
    }
    .container{
        width: 1000px;
        margin: 0 auto;
    }
    .container div{
         text-align: center;
         display: table;
    }
    .container div span{
        display: table-cell;
        vertical-align: middle;
    }
    .topSP{
        font-weight: 900;
        font-size: 40px;
    }
    .middle{
        margin-top: 20px;
        width: 1000px;
        height: 500px;
        position: relative;       
    }
    .middle-left{
        outline: 1px solid #9F9F9F;
        position: absolute;
        top: 0px;
        width: 170px;
        height: 500px;
    }
    .middle-right{
        position: absolute;
        top: 0px;
        left: 190px;
        width: 810px;
        height: 500px;
        background-image:url('1.jpg');
        background-size: 810px 500px;
    }
    .btn1{
        width: 170px;
        height: 50px;
        color: #9F9F9F;
        border-radius: 0%;
        border: 1px;
        outline: 1px;
        outline-color: black;
    }
    .bottom{
        margin-top: 20px;
        margin-bottom: 20px;
        outline: 1px solid #9F9F9F;
        width: 1000px;
        height: 100px;
        background-color: #5D5D5D;
        color: #fff;
    }
    .my{
      position: relative;  
      left: 110px;
      top: 75px;
      opacity: 0.9;
    }
</style>
</head>
<body>
    <div class="container">
      <div class="top">
        <span class="topSP">회원 가입</span>
      </div>
    <div class="middle">
      <div class="middle-left">
        <button type="button" class="btn1 btn-secondary">전공 (필수)</button>
        <button type="button" class="btn1 btn-secondary">전공 (선택)</button>
        <button type="button" class="btn1 btn-secondary">교양 (필수)</button>
        <button type="button" class="btn1 btn-secondary" autofocus>교양 (선택)</button>
      </div>
      <div class="middle-right">
      <form method="post" action="insertMemPro.jsp">
       <div class="my">
        <div class="mb-3">
          <input type="text" class="form-control" style="width: 350px;height: 50px;text-align: center;" name="id" id="id" placeholder="아이디 입력" maxlength="50" required>
        </div>
        <div class="mb-3">
          <input type="password" class="form-control" style="width: 350px;height: 50px;text-align: center;"v name="passwd" id="passwd" placeholder="비밀번호 입력" maxlength="16" required>
        </div>
        <div class="mb-3">
          <input type="text" class="form-control" style="width: 350px;height: 50px;text-align: center;" name="name" id="name" placeholder="이름 입력" maxlength="16" required>
        </div>
        <div class="mb-3">
          <input type="text" class="form-control" style="width: 350px;height: 50px;text-align: center;" name="mail" id="mail" placeholder="메일 입력" maxlength="30" required>
        </div>
        <div class="mb-3">
          <input type="text" class="form-control" style="width: 350px;height: 50px;text-align: center;" name="phone" id="phone" placeholder="전화번호 입력( - 없이)" maxlength="11" required>
        </div>
        <div class="mb-3">
          <input type="text" class="form-control" style="width: 350px;height: 50px;text-align: center;" name="mainS" id="mainS" placeholder="과 입력" maxlength="10" required>
        </div>
      </div>
        <div class="mb-3">
          <input type="submit" class="btn btn-primary" value="입력완료" style="position: relative;left: 370px;top: 70px;opacity: 0.9;">
        </div>
      </form>
</div>  
</div>
<div class="bottom">
  <p align="left"></br>&nbsp ooooo TEL : 123-456-7890 </br>
      &nbsp www.ooo.com
  </p>
</div>
</body>
</html>