<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  
<%
String id = "";

  request.setCharacterEncoding("utf-8");
  String CS_NAME = request.getParameter("CS_NAME");		
  String CS_TELEPHONE = request.getParameter("CS_TELEPHONE");	
  String CS_ADDRESS = request.getParameter("CS_ADDRESS");	
  String CS_MAIL = request.getParameter("CS_MAIL");	
  long CS_LICENSE = Long.parseLong(request.getParameter("CS_LICENSE"));	
  %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회사 정보 수정</title>
<link rel="stylesheet" href="css/managing_company.css"/>  
<link rel="stylesheet" href="css/managing_requestTable.css"/>
<style>
  $primary: #11998e;
  $secondary: #38ef7d;
  $white: #fff;
  $gray: #9b9b9b;
  .form__group {
    position: relative;
    padding: 15px 0 0;
    margin-top: 10px;
    width: 50%;
  }

  .form__field {
    font-family: inherit;
    width: 100%;
    border: 0;
    border-bottom: 2px solid $gray;
    outline: 0;
    font-size: 1.3rem;
    color: $white;
    padding: 7px 0;
    background: transparent;
    transition: border-color 0.2s;

    &::placeholder {
      color: transparent;
    }

    &:placeholder-shown ~ .form__label {
      font-size: 1.3rem;
      cursor: text;
      top: 20px;
    }
  }

  .form__label {
    position: absolute;
    top: 0;
    display: block;
    transition: 0.2s;
    font-size: 1rem;
    color: $gray;
  }

  .form__field:focus {
    ~ .form__label {
      position: absolute; 
      top: 0;
      display: block;
      transition: 0.2s;
      font-size: 1rem;
      color: $primary;
      font-weight:700;    
    }
    padding-bottom: 6px;  
    font-weight: 700;
    border-width: 3px;
    border-image: linear-gradient(to right, $primary,$secondary);
    border-image-slice: 1;
  }
  /* reset input */
  .form__field{
    &:required,&:invalid { box-shadow:none; }
  }
  /* demo */
  body {
    font-family: 'Poppins', sans-serif; 
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    font-size: 1.5rem;
    background-color:#222222;
  }
</style>
</head>
<body>
<%
  try{
    id = (String)session.getAttribute("id");
    if(id==null || !id.equals("99999")){
      %>
      <script>
        setTimeout(function(){
        location.href = "LoginForm.jsp";
        alert("관리자 로그인해주세요");}, 200);
      </script>
  <%
    }else{

  %>

<h1>회원 내역 수정</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>이름</th>
          <th>전화번호</th>
          <th>주소</th>
          <th>메일</th>
          <th>운전면허 번호</th>
          <th></th>
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <form action="managingCustomer_deletePro.jsp">
      <table cellpadding="0" cellspacing="0" border="0">
        <tbody>
          <tr>
            <td>
              <div class="form__group field">
                <input type="input" class="form__field" name="CS_NAME" value="<%=CS_NAME%>" readonly />
              </div>
            </td>
            <td>
              <div class="form__group field">
                <input type="input" class="form__field" name="CS_TELEPHONE"  value="<%=CS_TELEPHONE%>" readonly />
              </div>
            </td>
            <td>
              <div class="form__group field">
                <input type="input" class="form__field" name="CS_ADDRESS"  value="<%=CS_ADDRESS%>" readonly />
              </div>
            </td>
            <td>
              <div class="form__group field">
                <input type="input" class="form__field" name="CS_MAIL"  value="<%=CS_MAIL%>" readonly />
              </div>
            </td>
            <td>
              <div class="form__group field">
                <input type="input" class="form__field" name="CS_LICENSE"  value="<%=CS_LICENSE%>" readonly />
              </div>
            </td>
            <td>
              <button type="submit" class="button" >삭제(미사용)</button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </section>

</body>
</html>
<%
  }
} catch (Exception e) {
  e.printStackTrace();
  out.println("세션오류");
} 
%>