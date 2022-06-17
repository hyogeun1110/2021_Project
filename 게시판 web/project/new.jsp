<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link href="../assets/bootstrap-5.1.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <form method="post" action="newPro.jsp">
        <br><br>
        <table align="center">
            <tr>
                <td><h5>회원 가입</h5></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td><label>아이디</label>
                <td><input type="text" name="id" autocomplete="off" required>
            </tr>
            <tr>
                <td><label>비밀번호</label></td>
                <td><input type="password" name="passwd" required></td>
            </tr>
            <tr>
                <td><label>이름</label></td>
                <td><input type="text" name="name" autocomplete="off" required></td>
            </tr>
            <tr>
                <td><label>이메일</label></td>
                <td><input type="text" name="email" autocomplete="off" required></td>
            </tr>
            <tr>
                <td><button type="submit" class="btn btn-outline-primary">회원가입</button></td>
                <td></td>
            </tr>
        </table>
    </form>
</body>
</html>