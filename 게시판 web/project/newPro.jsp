<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.userDBBean"%>

<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="member" scope="page" class="project.userDataBean">
   <jsp:setProperty name="member" property="*"/>
</jsp:useBean>
<%
	
	userDBBean manager = userDBBean.getInstance();
    manager.insertMember(member);

%>
<script>
    alert("회원가입 되었습니다.");
    location.href="login.jsp";
</script>
