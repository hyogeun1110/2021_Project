<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "project.BoardDBBean" %>
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

  

  int num = 0, ref = 1, re_step = 0, re_level = 0;
  String strV = "";

  String Id = (String)session.getAttribute("id");
  BoardDBBean dbPro = BoardDBBean.getInstance(); 
  BoardDataBean article = dbPro.NameArticle(Id);

  
  try{
    if(request.getParameter("num")!=null){
      num=Integer.parseInt(request.getParameter("num"));
      ref=Integer.parseInt(request.getParameter("ref"));
      re_step=Integer.parseInt(request.getParameter("re_step"));
      re_level=Integer.parseInt(request.getParameter("re_level"));
    }
%>
<div class="container">
  <div class="alert alert-primary" role="alert">
      <h1><i class="fas fa-pen"></i> 글쓰기</h1>
  </div>


  <form method="post" action="writePro.jsp" onsubmit="return writeSave(this)">
    <input type="hidden" name="num" value="<%=num%>">
    <input type="hidden" name="ref" value="<%=ref%>">
    <input type="hidden" name="re_step" value="<%=re_step%>">
    <input type="hidden" name="re_level" value="<%=re_level%>">

    <table class="table table-hover table-bordered">
      <tbody>
        <tr>
          <td colspan="2">
            <div class="d-grid gap-2">
              <a href="list.jsp" class="btn btn-primary">글목록</a>
            </div>
          </td>
        </tr>
        <tr>
          <td class="table-success">이 름</td>
          <td>
            <input type="text" size="10" maxlength="10" name="writer" value="<%=article.getName()%>" class="form-control" style="ime-mode:active;" readonly><!--active:한글-->
          </td>
        </tr>
        <tr>
          <td class="table-success">제 목</td>
          <td>
          <%
            if(request.getParameter("num")==null) 
            strV = "";
            else
            strV = "[답변]";
          %>
            <input type="text" size="40" maxlength="50" name="subject" class="form-control" value="<%=strV%>" autocomplete="off" style="ime-mode:active;">
          </td>	
        </tr>
        <tr>
          <td class="table-success">내 용</td>
          <td>
            <textarea name="content" rows="13" cols="40" class="form-control" autocomplete="off" style="ime-mode:active;"></textarea> 
          </td>
        </tr>
        <tr>      
          <td colspan="2" class="text-center"> 
            <input type="submit" class="btn btn-success" value="글쓰기" >  
            <input type="reset" class="btn btn-warning" value="다시작성">
            <a href="list.jsp" class="btn btn-primary">목록보기</a>
          </td>
        </tr>
      </tbody>
    </table>    
    <%
      }catch(Exception e){}
    %>     
</form>  
</div>
<script src="script.js"></script>
</body>
</html>