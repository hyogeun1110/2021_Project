<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,java.io.*"%>
 <%  
      request.setCharacterEncoding("utf-8");

String id = (String)session.getAttribute("id");
String k = request.getParameter("k"); //예약번호

String originalCar = ""; //여기다가 원래 고객의 차량변호 전역변수
String originalName = ""; //여기다가 원래 고객의 차량이름 전역변수
String originalCount = ""; //여기다가 원래 고객의 인승 전역변수
String originalCost = ""; //여기다가 원래 고객의 비용 전역변수
   %>   
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약</title>
<link rel="stylesheet" href="air-datepicker/dist/css/datepicker.min.css">
<link rel="stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
<style>
  *{
        margin: none;
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
    .squ{
        border: 1px solid black;
        height: 350px;
        width: 620px;
        position: relative;
        top: 55px;
        left: 350px;
        border-radius: 40px;
        background-color:white;
        border:0px;
    }
    .middle{
        width: 100%;
        height: 100%;
        position:absolute;
    }
    .f5{
        height: 60px;   
        width: 70px;
        position: relative;
        left: 15px;
        top:15px
    }
    .yy{
        position: relative; 
        top: 50px;
        font-size: 32px;
        margin-bottom: 0px;
        margin-top: 0px;
        font-weight: 900;
    }
    .box1{
        width: 200px;
        height: 35px;
        border-radius: 80px;
        background-color: #ececec;
        border:0;
        outline: 0;
        padding-left: 15px;
    }
    .box2{
        width: 270px;
        height: 35px;
        border-radius: 80px;
        background-color: #ececec;
        border:0;
        outline: 0;
        padding-left: 15px;
    }
    .box3{
        width: 120px;
        height: 35px;
        border-radius: 80px;
        background-color: #ececec;
        border:0;
        outline: 0;
        padding-left: 15px;
    }
    .text1{
        font-size: 13px;
        color: black;
    }
    .btnok{
        width: 120px;
        height: 40px;  
        border-radius: 80px;
        background-color: rgb(130, 130, 247);
        font-size: 15px;
        position: relative;
        top: 247px;
        left: 215px;
        color: white;
        outline: 0px;
        border: 0px;
    }
    .table1{
        outline: 0px;
        position: relative;
        top: 35px;
        right: 175px;
        text-align: left;
    }
    .table2{
        outline: 0px;
        position: relative;
        top: 65px;
        right: 5px;
        text-align: left;
    }
    .table3{
        outline: 0px;
        position: relative;
        top: 80px;
        
        text-align: left;
        right: 140px;
    }
    .table4{
        outline: 0px;
        position: relative;
        top: 110px;
        right: 215px;
        text-align: left;
    }
    .form-select1{
        width: 480px;
        border-radius: 80px;
        background-color: #ececec;
        border:0;
        outline: 0;
        position: relative;
        top :50px;
        right: 37px;
    }
</style>
</head>
<body style="background-image:url('img/6.jpg'); background-size:cover;">
  <div class="top">
    <img  src="img/F5.png" style="width:90px; height:70px; position:relative; top:20px; left:-650px;  z-index: 3;" onclick="location='Main.jsp'">
  </div>
  <div class="container">
    <form method="post" action="ReservationChangeCarSelect.jsp">
      <div class="middle">
        <label class="yy">예약변경</label>
        <div class="squ">
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

  String sql2 = "SELECT * FROM CAMPCAR order by c_id";
    pstmt = conn.prepareStatement(sql2); 
    myRS = pstmt.executeQuery();
    %>
        <select class="form-select1 form-select-lg mb-3" aria-label=".form-select-lg example" id="carSelect" name="carSelect" style="color:gray; font-size: 16px;right:-70px;" >
        <option selected style="color:black">차량 선택</option>
    <%
    if(myRS != null){
      while(myRS.next()){
        String CP_NUM2=myRS.getString("CP_NUM");
        String CP_NAME2=myRS.getString("CP_NAME");
        String CP_COUNT2=myRS.getString("CP_COUNT");
        String CP_COST2=myRS.getString("CP_COST");
        out.println(CP_COST2);
        %>
          <option value="<%=CP_NUM2%>/<%=CP_NAME2%>/<%=CP_COUNT2%>/<%=CP_COST2%>" > <%=CP_NAME2%> / <%=CP_COUNT2%>인승 / <%=CP_COST2%>원</option>
      <%
          
      }
    }
    %>
    </select> 
<%
  
  String sql = "select b.cpu_id, b.cp_num, c.cp_name, c.cp_count, c.cp_cost, b.cs_license, b.cpu_usestart, b.cpu_useend, b.cpu_useday, b.cpu_cost from CAMPCAR_USE b,CAMPCAR c where b.CP_NUM = c.CP_NUM and b.CPU_ID = ?";
      pstmt = conn.prepareStatement(sql); 
      pstmt.setString(1,k);
      myRS = pstmt.executeQuery();
      if(myRS != null){
        while(myRS.next()){
          String CPU_ID=myRS.getString("CPU_ID");
          String CP_NUM=myRS.getString("CP_NUM");
          String CP_NAME=myRS.getString("CP_NAME");
          String CP_COUNT=myRS.getString("CP_COUNT");
          String CP_COST=myRS.getString("CP_COST");
          String CS_LICENSE=myRS.getString("CS_LICENSE");
          String CPU_USESTART=myRS.getString("CPU_USESTART");
          String CPU_USEEND=myRS.getString("CPU_USEEND");
          String CPU_USEDAY=myRS.getString("CPU_USEDAY");
          String CPU_COST=myRS.getString("CPU_COST");

          
          originalCar = CP_NUM ;
          originalName = CP_NAME; 
          originalCount = CP_COUNT;
          originalCost = CP_COST;
          
          
          %>
      
<table class="table4" align="center">
  <tr>
    <td><span class="text1" id="inputGroup-sizing-sm">대여번호</span></td>
  </tr>
  <tr>
    <td><input type="text" class="box3" aria-label="Sizing example input"  id = "k" name = "k" value="<%=CPU_ID%>" aria-describedby="inputGroup-sizing-sm" readonly></td>
  </tr>
</div>

<input type="submit" class="btnok btn-primary" style="left:-200px;" value="차량선택">
    

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
      </div>
    </form>
  </div>


<script src="js/jquery-3.1.1.min.js"></script> <!-- jQuery -->
<script src="air-datepicker/dist/js/datepicker.min.js"></script>
<script src="air-datepicker/dist/js/i18n/datepicker.ko.js"></script>
<script> /* 달력 jquery */
  $("#datepicker").datepicker({
      language: 'ko'
  });
  //두개짜리 제어 연결된거 만들어주는 함수
  datePickerSet($("#datepicker1"), $("#datepicker2"), true); //다중은 시작하는 달력 먼저, 끝달력 2번째
  /*
      * 달력 생성기
      * @param sDate 파라미터만 넣으면 1개짜리 달력 생성
      * @example   datePickerSet($("#datepicker"));
      * 
      * 
      * @param sDate, 
      * @param eDate 2개 넣으면 연결달력 생성되어 서로의 날짜를 넘어가지 않음
      * @example   datePickerSet($("#datepicker1"), $("#datepicker2"));
      */
  function datePickerSet(sDate, eDate, flag, dateDiff) {

      //시작 ~ 종료 2개 짜리 달력 datepicker	
      if (!isValidStr(sDate) && !isValidStr(eDate) && sDate.length > 0 && eDate.length > 0) {
          var sDay = sDate.val();
          var eDay = eDate.val();
      


          if (flag && !isValidStr(sDay) && !isValidStr(eDay)) { //처음 입력 날짜 설정, update...			
              var sdp = sDate.datepicker().data("datepicker");
              sdp.selectDate(new Date(sDay.replace(/-/g, "/")));  //익스에서는 그냥 new Date하면 -을 인식못함 replace필요

              var edp = eDate.datepicker().data("datepicker");
              edp.selectDate(new Date(eDay.replace(/-/g, "/")));  //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
          }

          //시작일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
          if (!isValidStr(eDay)) {
              sDate.datepicker({
                  maxDate: new Date(eDay.replace(/-/g, "/"))
              });
          }
          sDate.datepicker({
              language: 'ko',
              autoClose: true,
              onSelect: function () {
                  datePickerSet(sDate, eDate);
              }
          });

          //종료일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
          if (!isValidStr(sDay)) {
              eDate.datepicker({
                  minDate: new Date(sDay.replace(/-/g, "/"))
              });
          }
          eDate.datepicker({
              language: 'ko',
              autoClose: true,
              onSelect: function () {
                  datePickerSet(sDate, eDate);
              }
          });

          //한개짜리 달력 datepicker
      } else if (!isValidStr(sDate)) {
          var sDay = sDate.val();
          if (flag && !isValidStr(sDay)) { //처음 입력 날짜 설정, update...			
              var sdp = sDate.datepicker().data("datepicker");
              sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
          }

          sDate.datepicker({
              language: 'ko',
              autoClose: true
          });
      }


      function isValidStr(str) {
          if (str == null || str == undefined || str == "")
              return true;
          else
              return false;
      }
  }

</script>


<script>
  var strDate1 = document.getElementById("datepicker1").value;
  var strDate2 = document.getElementById("datepicker2").value;
  var arr1 = strDate1.split('-');
  var arr2 = strDate2.split('-');
  var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
  var dat2 = new Date(arr2[0], arr2[1], arr2[2]);
  var diff = dat2 - dat1;
  var currDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
  var currMonth = currDay * 30;// 월 만듬
  var currYear = currMonth * 12; // 년 만듬
  document.getElementById('d1').value = parseInt(diff/currDay)


</script>
<script src="js/jquery-3.1.1.min.js"></script>
<script>
 var str1 = document.getElementById("d1").value;
 var str2 = document.getElementById("d3").value;
document.getElementById('d2').value = parseInt(str1 * str2)

</script>

<script>
$("#carSelect").val("<%=originalCar%>/<%=originalName%>/<%=originalCount%>/<%=originalCost%>").prop("selected", true); // 가져온 값을 디폴트로 설정
</script>
</body> 
</html>