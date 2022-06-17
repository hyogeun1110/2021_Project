<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,java.io.*"%>
 <%  
      request.setCharacterEncoding("utf-8");

    String CP_NAME = request.getParameter("CP_NAME");
   String CP_NUM = request.getParameter("CP_NUM");
   String CP_COST = request.getParameter("CP_COST");

   
  
Random r = new Random();
int number= Math.round(r.nextFloat() * 100000000);
String k =Integer.toString(number);

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
    .middle{
        width: 100%;
        height: 100%;
        position:absolute;
        text-align: center;
        
    }
    .squ{
        border: 2px solid black;
        height: 430px;
        width: 620px;
        position: relative;
        top: 55px;
        left: 350px;
        border-radius: 40px;
        background-color:white;
        border:0px;
    }
    .f5{
        height: 60px;   
        width: 70px;
        position: relative;
        left: 15px;
        top:15px;
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
        top: 75px;
        color: white;
        outline: 0px;
        border: 0px;
    }
    .table1{
        outline: 0px;
        position: relative;
        top: 55px;
        right: 170px;
        text-align: left;
    }
    .table2{
        outline: 0px;
        position: relative;
        top: 90px;
        text-align: left;
    }
</style>
</head>
<body style="background-image:url('img/6.jpg'); background-size:cover;">

    <div class="top">
         <img  src="img/F5.png" style="width:90px; height:70px; position:relative; top:20px; left:-650px; z-index: 3; " onclick="location='Main.jsp'">
    </div>
    <div class="container">
        <form method="post" action="ReservationConfirm.jsp?CP_NAME=<%=CP_NAME%>&CP_NUM=<%=CP_NUM%>&CP_COST=<%=CP_COST%>">
            <div class="middle">
                <label class="yy">예약하기</label>
                <div class="squ">
                    <table class="table1" align="center">
                        <tr>
                            <td><span class="text1" id="inputGroup-sizing-sm">차량 이름</span></td>
                        </tr>
                        <tr>          
                            <td ><input type="text" class="box1" aria-label="Sizing example input"   value="<%=CP_NAME%>"  aria-describedby="inputGroup-sizing-sm" readonly></td>
                        </tr>
                        <tr><td></td></tr>
                        <tr><td></td></tr>
                        <tr><td></td></tr>
                        <tr><td></td></tr>
                        <tr>
                            <td><span class="text1" id="inputGroup-sizing-sm">차량 번호&nbsp&nbsp</span></td>
                        </tr>
                        <tr>
                            <td><input type="text" class="box1" aria-label="Sizing example input"   value="<%=CP_NUM%>"  aria-describedby="inputGroup-sizing-sm" readonly></td>
                        </tr>  
                        <tr><td></td></tr>
                        <tr><td></td></tr> 
                        <tr><td></td></tr>
                        <tr><td></td></tr>
                        <tr>
                            <td><span class="text1" id="inputGroup-sizing-sm">차량 가격&nbsp&nbsp</span></td>
                        </tr>
                        <tr>
                            <td><input type="text" class="box1" aria-label="Sizing example input"   value="<%=CP_COST%>원"  aria-describedby="inputGroup-sizing-sm" readonly></td>
                        </tr>
                    </table>
                    <table class="table2" align="center">
                        <tr>
                            <td colspan="2"><label class="text1">대여 날짜</label></td>
                            <td colspan="2"><label class="text1">반납 날짜</label></td>
                        </tr>
                        <tr>                    
                            <td colspan="2"><input type="text" class="box2" id="datepicker1" name="datepicker1" autocomplete='off' onchange="call()" readonly></td>
                            <td colspan="2"><input type="text" class="box2" id="datepicker2" name="datepicker2" autocomplete='off' onchange="call()" readonly></td>
                        </tr>
                    </table>
                </div>
                <div class="mb-3">
                    <input type="submit" class="btnok btn-outline-primary" value="입력완료">
                </div>              
            </div>
                
                <table class="table"  style="position: relative; left: 700px; top:150px;  ">
                    <thead>
                        <tr>
                            <th scope="col" >예약 불가 날짜</th>
                        </tr>
                    </thead>
    
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
  
  String sql = "select  to_char(cpu_usestart,'yyyy-mm-dd') cpu_usestart, to_char(cpu_useend,'yyyy-mm-dd') cpu_useend from CAMPCAR_USE where  cp_num =? AND RES_STATE='예약'";
      pstmt = conn.prepareStatement(sql); 
      pstmt.setString(1,CP_NUM);
      myRS = pstmt.executeQuery();
      if(myRS != null){
        while(myRS.next()){
          String CPU_USESTART=myRS.getString("CPU_USESTART");
          String CPU_USEEND=myRS.getString("CPU_USEEND");
      
          %>

  <tbody>
    <tr>
      <td><%=CPU_USESTART%> ~ <%=CPU_USEEND%></td>
    </tr>
   
<%
        }
      }
      %>
                </tbody>
            </table>
          </form>
    </div>
    <%
  }catch(Exception e){ 
    
     e.printStackTrace();
  }finally{
     if(pstmt != null) 
       try{pstmt.close();}catch(SQLException sqle){}
     if(conn != null) 
       try{conn.close();}catch(SQLException sqle){}
  }
     %>  

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
         var disabledDays = [getElementById("CPU_USESTART"),getElementById("CPU_USEEND")];
        function disableAllTheseDays(date) {
        var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
        for (i = 0; i < disabledDays.length; i++) {
        if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
            return [false];
                }
            }
        return [true];
         }

      function isValidStr(str) {
          if (str == null || str == undefined || str == "")
              return true;
          else
              return false;
      }
      
        }

</script>

</body> 
</html>