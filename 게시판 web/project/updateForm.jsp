<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="project.BoardDBBean"%>
<%@ page import="project.BoardDataBean"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판</title>
<link href="../assets/bootstrap-5.1.1/css/bootstrap.min.css" rel="stylesheet">
<link href="../assets/fontawesome-free-5.15.4-web/css/all.min.css" rel="stylesheet">
<link href="style.css" rel="stylesheet">
</head>
<body>
<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  BoardDBBean dbPro = BoardDBBean.getInstance(); 
  BoardDataBean article = dbPro.updateGetArticle(num);
 
%>
<div class="container">
  <div class="alert alert-primary" role="alert">
      <h1><i class="fas fa-pen"></i> 글수정</h1>
  </div>

  <form method="post" name="writeform" action="updatePro.jsp?pageNum=<%=pageNum%>" onsubmit="return writeSave()">
    <input type="hidden" name="num" value="<%=article.getNum()%>">
    <table class="table table-hover table-bordered">  
      <tbody>
          <tr>
            <td class="table-success">제 목</td>
            <td>
              <input type="text" size="40" maxlength="50" name="subject" value="<%=article.getSubject()%>" autocomplete="off" class="form-control" style="ime-mode:active;">
            </td>
          </tr>
          <tr>
            <td class="table-success">내 용</td>
            <td>
              <textarea name="content" rows="13" cols="40" class="form-control" autocomplete="off" style="ime-mode:active;"><%=article.getContent()%></textarea>
            </td>
          </tr>
          <tr>      
            <td colspan="2" class="text-center"> 
              <input type="submit" class="btn btn-warning" value="글수정" >  
              <input type="reset" class="btn btn-danger" value="다시작성">
              <a href="list.jsp?pageNum=<%=pageNum%>" class="btn btn-primary">목록보기</a>
            </td>
          </tr>
        </tbody>
      </table>
  </form>    
</div>  

<script src="script.js"></script>
</body>
</html>