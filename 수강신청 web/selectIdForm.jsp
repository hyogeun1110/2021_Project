<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디,비번 찾기</title>
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
    .bottom{
        margin-top: 20px;
        margin-bottom: 20px;
        outline: 1px solid #9F9F9F;
        width: 1000px;
        height: 100px;
        background-color: #5D5D5D;
        color: #fff;
    }
    .mail{
        position: relative;
        left: 60px;
        top: 100px;
    }
    .btn{
        position: relative;
        left: -167px;
        top: 180px;
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
</style>
</head>
<body>
<div class="container">
    <form method="post" action="selectIdPro.jsp">
	    <div class="top" role="alert">
		    <span class="topSP">아이디,비번 찾기 </span>
	    </div>
    <div class="middle">
        <div class="middle-left">
            <button type="button" class="btn1 btn-secondary">전공 (필수)</button>
            <button type="button" class="btn1 btn-secondary">전공 (선택)</button>
            <button type="button" class="btn1 btn-secondary">교양 (필수)</button>
            <button type="button" class="btn1 btn-secondary" autofocus>교양 (선택)</button>
        </div>
        <div class="middle-right">
        <input type="text" class="mail" name="mail" id="mail" style="width: 350px;height: 50px;text-align: center;opacity: 0.9;" placeholder="메일을 입력하세요" maxlength="50" required>
        <input type="submit" class="btn btn-primary" style="opacity: 0.9;" value="검색하기">
    </div>
    </form>
</div>
	
<div class="bottom">
    <p align="left"></br>&nbsp ooooo TEL : 123-456-7890 </br>
        &nbsp www.ooo.com
    </p>
    </div>
</div>
</body>
</html>