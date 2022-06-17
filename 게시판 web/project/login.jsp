<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<link href="../assets/bootstrap-5.1.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <form method="post" action="loginPro.jsp">
        
        <br><br>
        <table align="center">
            <tr>
                <td colspan="2"><h5>접속하시려면 로그인을 해주세요</h5></td>                
            </tr>
            <tr>
                <td><label>아이디</label></td>
                <td><input type="text" name="id" autocomplete="off" required></td>
            </tr>
            <tr>
                <td><label>비밀번호</label></td>
                <td><input type="password" name="passwd" required></td>
            </tr>
            <tr>
                <td><button type="submit" class="btn btn-outline-success">로그인</button></td>
                <td><button type="button" class="btn btn-outline-warning" onclick="location='new.jsp'">회원가입</button></td>
            </tr>
        </table>
              
    </form>
    
</body>
</html>