<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  

<%
  request.setCharacterEncoding("utf-8");
  int CPU_ID = Integer.parseInt(request.getParameter("CPU_ID"));	
  String CP_NAME = request.getParameter("CP_NAME");	
  String CPU_PAYDATE = request.getParameter("CPU_PAYDATE");	
  String CPU_ETCPAYINFO = request.getParameter("CPU_ETCPAYINFO");	
  String CPU_ETCPAYCOST = request.getParameter("CPU_ETCPAYCOST");	
  String id="";
  %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약 내역 수정</title>
<link rel="stylesheet" href="css/managing_company.css"/>  
<link rel="stylesheet" href="css/managing_requestTable.css"/>
<link rel="stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="air-datepicker/dist/css/datepicker.min.css"> <!-- 달력 css -->
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
<h1>정비 내역 수정</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>예약 번호</th>
          <th>차량 이름</th>
          <th>지불 기한</th>
          <th>추가 지불내용</th>
          <th>추가 지불비용</th>

          <th></th>
        </tr>
      </thead>
    </table>
  </div>

  <div class="tbl-content">
    <form action="managingReservation_updatePro.jsp">
      <table cellpadding="0" cellspacing="0" border="0">
        <tbody>
          <tr>
            <td>
              <div class="form__group field">
                <input type="input" class="form__field" name="CPU_ID"  value="<%=CPU_ID%>" readonly />
              </div>
            </td>
            <td>
              <div class="form__group field">
                <input type="input" class="form__field" name="CP_NAME"  value="<%=CP_NAME%>" readonly />
              </div>
            </td>
            <td>
              <div class="form__group field">
                <input type="input" class="form__field"  id="datepicker" name="CPU_PAYDATE"  value="<%=CPU_PAYDATE%>" required />
              </div>
            </td>
            <td>
              <div class="form__group field">
                <input type="input" class="form__field" name="CPU_ETCPAYINFO"  value="<%=CPU_ETCPAYINFO%>" required />
              </div>
            </td>
            <td>
              <div class="form__group field">
                <input type="input" class="form__field" name="CPU_ETCPAYCOST"  value="<%=CPU_ETCPAYCOST%>" required /> 
              </div>
            </td>
            <td>
              <button type="submit" class="button" >update execute</button>
            </td>
          </tr>

        </tbody>
      </table>
    </div>
  </section>
<script src="js/jquery-3.1.1.min.js"></script> <!-- jQuery -->
<script src="air-datepicker/dist/js/datepicker.min.js"></script>
<script src="air-datepicker/dist/js/i18n/datepicker.ko.js"></script>
<script>
    $("#datepicker").datepicker({
    	language: 'ko'
    }); 
</script>
</body>
</html>
<%

      }
    } catch (Exception e) {
      e.printStackTrace();
      out.println("세션오류");
    } 
    %>