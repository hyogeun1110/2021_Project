<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String n = request.getParameter("n");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>F5 - Sign In</title>
<link rel="stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
<style>
    *{
        margin: none;
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
    .btn{
        width: 170px;
        height: 50px;
        color: #9F9F9F;
        border-radius: 0%;
        border: 1px;
        outline: 1px;
        outline-color: black;
    }
    .login{
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
    .pass{
        font-size: 11px;
        position: relative;
        top: 84px;
        color: #969696;
    }
    .boxP{
        width: 320px;
        height: 35px;
        position: relative;
        top : 77px;
        border-radius: 80px;
        background-color: #ececec;
        border:0;
        outline: 0;
        padding-left: 15px;
    }
    .boxP:focus{
        border: 1px #999999;
        outline: 1px solid #bebebe;
    }
    .loginbtn{
        width: 320px;
        height: 35px;
        position: relative;
        border-radius: 80px;
        top : 100px;
        font-size: 10px;
    }
    .cancelbtn{
        width: 320px;
        height: 35px;
        position: relative;
        border-radius: 80px;
        top : 120px;
        font-size: 10px;
        background-color: #ececec;
        border: 0;
        outline: 0;
        color: black;
    }
    .f5{
        height: 60px;   
        width: 70px;
        position: relative;
        left: 15px;
        top:15px
    }
    .etc{
        position: relative;
        top: 140px;
    }
    .btnnew{
        width: 320px;
        height: 30px;  
        border-radius: 80px;
        background-color: white;
        position: relative;
        top: 20px;
        font-size: 10px;
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
        <img  src="img/F5.png" style="width:90px; height:70px; position:relative; top:20px; left:-650px;  z-index: 3;" onclick="location='Main.jsp'">
    </div>
    <div class="container">
        <form method="post" action="LoginPro.jsp">
        <div class="middle">
            <label class="login">로그인</label> 
           
            <p class="liss">라이센스</p>              
            <input type="text" name="id" class="boxM" autocomplete="off" required>
            <p class="pass">비밀번호</p>      
            <input type="password" name="passwd" class="boxP" required>
            <div>
                <button type="submit" class="loginbtn btn-primary">로그인</button>   
            </div>      
            <button type="button" class="cancelbtn btn-secondary" onclick="backPage()">취소</button>
            <div class="etc">
                <a href="findPs.jsp" class="btn btn-link" style="font-size: 12px; width: 157px;position: relative; top: 8px;">비밀번호를 잊으셨나요?</a> 
                <div>
                    <img src="img/log.jpg" align="center" style="height: 100px;width: 350px; pointer-events: none;">
                </div>
                <button type="button" class="btnnew btn-outline-dark" onclick="location='NewLoginForm.jsp'">계정 만들기</button>
                <p class="bottext"></br></br></br></br></br>F5 @ 2021 &nbsp&nbsp 개인정보 처리방침 및 법적고지 &nbsp&nbsp 연락처</p>
            </div>
        </div>
    </form>
</div>
</body>
<script>
    function backPage(){
        window.history.back();
    }
    function newPage()  {
        window.location.href = "new.jsp"
    }
</script>
</html>