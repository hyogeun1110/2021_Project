<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
String id="";
%>

<html>
<head>
  <meta charset="UTF-8">
  <title>Admin</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" >
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" >
<script src="https://kit.fontawesome.com/6db79d71a7.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/adminSelectStyle.css">
</head>
<style>
  .button{
      background:#1EDDFF;
      padding: 15px;
      border: none;
      border-radius: 50px;
      color: white;
      font-weight: 400;
      font-size: 14px;
      margin-top: 10px;
      width:100%;
      letter-spacing: .1rem;
      outline:none;
  }

  .button:hover
  {
    transform: scale(1.01) translateY(-3px);
      box-shadow: 3px 3px 6px #38373785;
  }
</style>
<body>
 <%
    try{
      id = (String)session.getAttribute("id");
      if(!id.equals("99999")){
        %>
        <script>
          setTimeout(function(){
          location.href = "LoginForm.jsp";
          alert("관리자 로그인해주세요");}, 200);
        </script>
    <%
      }else{
 
    %>
<button type="button" class="button" style="width:300px; background: linear-gradient(-45deg,#edf8bb,#f17d7d);; padding:10px; margin-left : 180px ; position:relative; top : 100px ;color:black;display: inline-block"onclick="location.href='Logout.jsp'">로그아웃</button>
<button type="button" class="button" style="width:300px; background: linear-gradient(-45deg,#edf8bb,#f17d7d); padding:10px; margin-left : 550px ; position:relative; top : 100px ;color:black; display: inline-block;"onclick="location.href='Main.jsp'">홈페이지</button>
<section>
  <div class="container-fluid">
    <div class="container">
      <div class="row">
        <div class="col-sm-3">
          <div class="card text-center">
            <div class="title">
              <i class="fas fa-building fa-5x"></i>    
              <h2>회사 관리</h2>
            </div>
            <div class="price">
              <h4><sup>F</sup>5</h4>
            </div>
            <div class="option">
              <ul>
                <li> <i class="fa fa-check" aria-hidden="true"></i> 조회 </li>
                <li> <i class="fa fa-check" aria-hidden="true"></i> 추가 </li>
                <li> <i class="fa fa-check" aria-hidden="true"></i> 수정 </li>
                <li> <i class="fa fa-times" aria-hidden="true"></i> 삭제 </li>
              </ul>
            </div>
            <a href="managingCompany_select.jsp">이동하기</a>
            <a href="managingCompany_selectnope.jsp">(미사용)이동하기</a>
          </div>
        </div>
        <!-- END Col one -->
        <div class="col-sm-3">
          <div class="card text-center">
            <div class="title">
              <i class="fas fa-car fa-5x"></i>   
              <h2>차량 관리(예약)</h2>
            </div>
            <div class="price">
              <h4><sup>F</sup>5</h4>
            </div>
            <div class="option">
              <ul>
              <li> <i class="fa fa-check" aria-hidden="true"></i> 조회 </li>
              <li> <i class="fa fa-check" aria-hidden="true"></i> 추가 </li>
              <li> <i class="fa fa-check" aria-hidden="true"></i> 수정 </li>
              <li> <i class="fa fa-times" aria-hidden="true"></i> 삭제 </li>
              </ul>
            </div>
            <a href="managingCar_select.jsp">이동하기</a>
            <a href="managingCar_selectnope.jsp">(미사용)이동하기</a>
            <a href="managingReservation_select.jsp">예약내역 이동하기</a>
          </div>
        </div>
        <!-- END Col two -->
        <div class="col-sm-3">
          <div class="card text-center">
            <div class="title">
              <i class="far fa-address-card fa-5x"></i>
              <h2>회원 관리</h2>
            </div>
            <div class="price">
              <h4><sup>F</sup>5</h4>
            </div>
            <div class="option">
              <ul>
              <li> <i class="fa fa-check" aria-hidden="true"></i> 조회 </li>
              <li> <i class="fa fa-check" aria-hidden="true"></i> 추가 </li>
              <li> <i class="fa fa-check" aria-hidden="true"></i> 수정 </li>
              <li> <i class="fa fa-times" aria-hidden="true"></i> 삭제 </li>
              </ul>
            </div>
            <br><br><br>
            <a href="managingCustomer_select.jsp">이동하기</a>
          </div>
        </div>
        <!-- END Col 4 -->
        <div class="col-sm-3">
          <div class="card text-center">
            <div class="title">
              <i class="far fa-calendar-alt fa-5x"></i>
              <h2>정비 신청 관리 (정비소)</h2>
            </div>
            <div class="price">
              <h4><sup>F</sup>5</h4>
            </div>
            <div class="option">
              <ul>
              <li> <i class="fa fa-check" aria-hidden="true"></i> 조회 </li>
              <li> <i class="fa fa-check" aria-hidden="true"></i> 추가 </li>
              <li> <i class="fa fa-check" aria-hidden="true"></i> 수정 </li>
              <li> <i class="fa fa-times" aria-hidden="true"></i> 삭제 </li>
              </ul>
            </div>
            <a href="managingRequest_select.jsp">정비이력 이동</a>
            <a href="managingRepairshop_select.jsp">정비소 이동</a>
          </div>
        </div>
        <!-- END Col three -->
      </div>
    </div>
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
