<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
 <%  
      request.setCharacterEncoding("utf-8");

   String id = request.getParameter("id");
   %>   
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원정보</title>
<link rel="stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
<style>
    *{
        margin: 0px;
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
        position: absolute;      
    }
    .f5{
        height: 60px;   
        width: 70px;
        position: relative;
        left: 15px;
        top:15px
    }
    .lb{
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
    .boxID{
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
    .boxID:focus{
        border: 1px #999999;
        outline: 1px solid #bebebe;
    }
    .pass{
        font-size: 11px;
        position: relative;
        top: 84px;
        color: #969696;
    }
    .boxPASS{
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
    .boxPASS:focus{
        border: 1px #999999;
        outline: 1px solid #bebebe;
    }
    .mail{
        font-size: 11px;
        position: relative;
        top: 170px;
        color: #969696;
    }
    .boxMAIL{
        width: 210px;
        height: 35px;
        position: relative;
        top : 160px;
        left: 167px;
        border-radius: 80px;
        background-color: #ececec;
        border:0;
        outline: 0;
        padding-left: 15px;     
        z-index: 3; 
    }
    .form-select1{
       border-radius: 80px;
       background-color: #ececec;
       border:0;
       outline: 0;
       width: 110px;
       height: 35px;
       position: relative;
       top: 159px;
       left: 162px;
       z-index: 3;
    }
    .btnnew{
        width: 320px;
        height: 35px;  
        border-radius: 80px;
        background-color: white;
        position: relative;
        top:215px;
        right: 162px;
        font-size: 14px;
        z-index: 3;
    }
    .footer {
      position: absolute;
      left: 0;
      bottom: 0;
      width: 100%;
      padding: 15px 0;
      text-align: center;
      }
    .bottext{
      font-size: 10px;
      color: #9F9F9F;
      position: relative;
      top: 20px;
    }
    .boxPOST{
        width: 205px;
        height: 35px;
        border-radius: 80px;
        background-color: #ececec;
        border:0;
        outline: 0;
        padding-left: 15px;
    }
    .boxPOST:focus{
        border: 1px #999999;
        outline: 1px solid #bebebe;
    }
    .btn1{
        width: 105px;
        height: 35px;
        border-radius: 80px;
        font-size: 12px;
        position: relative;
        bottom: 2px;
    }
    .post1{
      position: relative;
      top: 70px;
    }
    .boxADR{
        width: 320px;
        height: 35px;
        position: relative;
        top: 77px;
        left: 327px;
        border-radius: 80px;
        background-color: #ececec;
        border:0;
        outline: 0;
        padding-left: 15px;
        margin: 0 auto;
    }
    .boxADR1{
        width: 320px;
        height: 35px;
        position: relative;
        top : 120px;
        right: -1px;
        border-radius: 80px;
        background-color: #ececec;
        border:0;
        outline: 0;
        padding-left: 15px;   
    }
    .boxADR2{
        width: 320px;
        height: 35px;
        position: relative;
        top : 162px;
        right: 325px;
        border-radius: 80px;
        background-color: #ececec;
        border:0;
        outline: 0;
        padding-left: 15px;    
        z-index: 2;  
    }
    .ckpass{
      position: relative; 
      left: 512px;
      top: 82px; 
      padding-left: 0px; 
      border-left: 0px;
      margin-left: 0px;
      text-align: left;
      padding-bottom: 0px;
      border-bottom: 0px;
      margin-bottom: 0px;
      font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
      z-index: 3;
    }
</style>
</head>
<body>
<%
Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet myRS = null;
 try{
  String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
  String dbId="f5";
  String dbPass="1234";
  
  Class.forName("oracle.jdbc.driver.OracleDriver"); 
  conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );
  
  String sql = "select CS_LICENSE , CS_NAME, CS_TELEPHONE , substr(cs_address,1,5) post , substr(cs_address , 6 ,instr(cs_address ,'(' )-6) address1 , substr(cs_address  ,instr(cs_address ,'(' ) , instr(substr(cs_address  ,instr(cs_address ,'(' )) ,')' )) address2 ,substr(cs_address  ,instr(cs_address ,')' )+1) address3 , substr(cs_mail , 1 ,instr(cs_mail ,'@' )-1) CS_MAIL , substr(cs_mail , instr(cs_mail ,'@' )+1) tail from customer where CS_LICENSE = ? ";
      pstmt = conn.prepareStatement(sql); 
      pstmt.setString(1,id);
      myRS = pstmt.executeQuery();

      if(myRS != null){
        while(myRS.next()){
          String CS_LICENSE=myRS.getString("CS_LICENSE");
          String CS_NAME=myRS.getString("CS_NAME"  );
          String CS_TELEPHONE=myRS.getString("CS_TELEPHONE");
          String CS_MAIL=myRS.getString("CS_MAIL");
          String tail1=myRS.getString("tail");

          String post=myRS.getString("post");
          String address1=myRS.getString("address1");
          String address2=myRS.getString("address2");
          String address3=myRS.getString("address3");
          %>
    <div class="top">
        <img  src="img/F5.png" style="width:90px; height:70px; position:relative; top:20px; left:-650px; z-index: 3; " onclick="location='Main.jsp'"> 
    </div>
    <div class="container">
      <form method="post" action="infoPro.jsp">
        <div class="middle">
          <label class="lb">정보수정</label>

          <p class="liss">운전면허번호</p>
          <input type="text" class="boxID" name="id" id="id" maxlength="50" value="<%=CS_LICENSE%>" autocomplete="off" readonly>
                
          <p class="pass">비밀번호</p>
          <input type="password" class="boxPASS"  name="passwd" id="passwd" maxlength="16" required>     

          <p class="pass">비밀번호 확인</p>
          <input type="password" class="boxPASS" id="passwd2" maxlength="16" required>
          <span><p class="ckpass" id="check"></p></span>
            
          <p class="pass">이름</p>
          <input type="text" class="boxPASS"  name="name" id="name" autocomplete="off" maxlength="10" value="<%=CS_NAME%>" required>
       
          <p class="pass">전화번호 ( - 제외)</p>
          <input type="text" class="boxPASS"  name="num1" id="num1" autocomplete="off" maxlength="11" value="<%=CS_TELEPHONE%>" required>
                
          <p class="pass">주소</p>
          <div class="post1">
            <input type="text" class="boxPOST" id="sample3_postcode" name="address" autocomplete="off" placeholder="우편번호" value="<%=post%>" required>
            <input type="button" class="btn1 btn-primary" onclick="sample3_execDaumPostcode()" value="우편번호 찾기">    
          </div>
          <input type="text" class="boxADR" id="sample3_address" name="address" autocomplete="off" placeholder="주소" value="<%=address1%>" readonly>
          <input type="text" class="boxADR1" id="sample3_extraAddress" name="address" placeholder="참고항목" value="<%=address2%>" readonly>
          <input type="text" class="boxADR2" id="sample3_detailAddress" name="address" value="<%=address3%>" autocomplete="off">
    
          
          <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
            <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
          </div>

          <p class="mail">이메일</p>
          <input type="text" class="boxMAIL" id="addressHead" name="email" autocomplete='off' value="<%=CS_MAIL%>" required>
          
          <select name="emailTail" class="form-select1 form-select-sm" aria-label=".form-select-sm example" style=" border-radius: 80px;background-color: #ececec;border:0;outline: 0;padding-left: 5px;" required>
            <option selected>이메일선택</option>
            <option value="@naver.com"<% if(tail1.equals("naver.com")){ %> selected <% } %> >@naver.com</option>
            <option value="@daum.net"<% if(tail1.equals("daum.net")){ %> selected <% } %>  >@daum.net</option>
            <option value="@google.com"<% if(tail1.equals("google.com")){ %> selected <% } %> >@google.com</option>
            <option value="@nate.com"<% if(tail1.equals("nate.com")){ %> selected <% } %>  >@nate.com</option>
            <option value="@kakao.com"<% if(tail1.equals("kakao.com")){ %> selected <% } %> >@kakao.com</option>
          </select>

          <input type="submit" class="btnnew btn-outline-dark" value="입력완료"><br>
          <input type="submit" class="btnnew btn-outline-dark" style=" position: relative; top:230px; left:5px;" onclick="location='CuoutPro.jsp'" value="계정삭제">
          <footer>
            <p class="bottext"></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>F5 @ 2021 &nbsp&nbsp 개인정보 처리방침 및 법적고지 &nbsp&nbsp 연락처</p>
          </footer>
          </div>
        </div>
          <%
        }
      }
 
 }catch(Exception e){ 
     out.println("삭제에 실패하였습니다. 다시 시도해주세요.");
     e.printStackTrace();
  }finally{
     if(pstmt != null) 
       try{pstmt.close();}catch(SQLException sqle){}
     if(conn != null) 
       try{conn.close();}catch(SQLException sqle){}
  }
     %>    
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="js/address(kakao).js"></script> <!--카카오 주소검색 js -->
  <script src="js/jquery-3.1.1.min.js"></script> <!-- jQuery -->
  <script src="air-datepicker/dist/js/datepicker.min.js"></script>
  <script src="air-datepicker/dist/js/i18n/datepicker.ko.js"></script>
    
  <script> /* 패스워드일치확인 jquery */
  $(function(){
      $('#passwd').keyup(function(){
        $('#check').html('');
      });
      $('#passwd2').keyup(function(){
          if($('#passwd').val() != $('#passwd2').val()){
            $('#check').html('비밀번호가 일치하지 않습니다');
            $('#check').css('color', '#FF8E99');
          } else{
            $('#check').html('비밀번호가 일치합니다');
            $('#check').css('color', '#0000FF');
          }
      });
  });
  </script>
</form>
</body>
</html>