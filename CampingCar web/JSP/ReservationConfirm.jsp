<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*,java.io.*"%>
 <%  
      request.setCharacterEncoding("utf-8");

   String CS_ID = request.getParameter("CS_ID");
    String CP_NAME = request.getParameter("CP_NAME");
   String CP_NUM = request.getParameter("CP_NUM");
   String CP_COST = request.getParameter("CP_COST");
   String datepicker1 = request.getParameter("datepicker1");
   String datepicker2 = request.getParameter("datepicker2");
   //String id = request.getParameter("csId");
  
Random r = new Random();
int number= Math.round(r.nextFloat() * 1000);
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
    .squ{
        border: 1px solid black;
        height: 580px;
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
        top: 80px;
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
        top: 120px;
        right: 215px;
        text-align: left;
    }
</style>
</head>
<body style="background-image:url('img/6.jpg'); background-size:cover;">
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
  
  String sql = "select * from CAMPCAR_USE where CPU_USEEND between to_date(?,'yyyy-mm-dd') AND to_date(?,'yyyy-mm-dd') or CPU_USESTART between to_date(?,'yyyy-mm-dd') and to_date(?,'yyyy-mm-dd') and res_state ='예약'";
      pstmt = conn.prepareStatement(sql); 
      pstmt.setString(1,datepicker1);
      pstmt.setString(2,datepicker2);
      pstmt.setString(3,datepicker1);
      pstmt.setString(4,datepicker2);
      myRS = pstmt.executeQuery();
      if(myRS.next()){
        %>
        <script>
          setTimeout(function(){
            alert("날짜를 변경해주세요");
            history.back();});
          </script>
        <%

      }
    
  }catch(Exception e){ 
    
     e.printStackTrace();
  }finally{
     if(pstmt != null) 
       try{pstmt.close();}catch(SQLException sqle){}
     if(conn != null) 
       try{conn.close();}catch(SQLException sqle){}
  }
     %>  


  <div class="top">
    <img  src="img/F5.png" style="width:90px; height:70px; position:relative; top:20px; left:-650px; z-index: 3; " onclick="location='Main.jsp'">
  </div>
  <div class="container">
    <form method="post" action="ReservationPro.jsp?CP_NAME=<%=CP_NAME%>&CP_NUM=<%=CP_NUM%>">
      <div class="middle">
        <label class="yy">예약하기</label>
        <div class="squ">
          <table class="table1" align="center">
            <tr>
              <td><span class="text1" id="inputGroup-sizing-sm">차량 이름&nbsp&nbsp</span></td>
            </tr>
            <tr>
              <td><input type="text" class="box1" aria-label="Sizing example input"   value="<%=CP_NAME%>"  aria-describedby="inputGroup-sizing-sm" readonly></td>
            </tr>
            <tr>
              <td><span class="text1" id="inputGroup-sizing-sm">차량 번호&nbsp&nbsp</span></td>
            </tr>
            <tr>
              <td><input type="text" class="box1" aria-label="Sizing example input"   value="<%=CP_NUM%>"  aria-describedby="inputGroup-sizing-sm" readonly></td>
            </tr>
            <tr>
              <td><span class="text1" id="inputGroup-sizing-sm">차량 가격&nbsp&nbsp</span></td>
            </tr>
            <tr> 
              <td><input type="text" class="box1" aria-label="Sizing example input"   id = "d3" name = "d3" value="<%=CP_COST%>"  aria-describedby="inputGroup-sizing-sm" readonly></td>
            </tr>
          </table>
          <table class="table2" align="center">
            <tr>
              <td colspan="2"><label class="text1">대여 날짜</label></td>
              <td colspan="2"><label class="text1">반납 날짜</label></td>
            </tr>
            <tr>
              <td colspan="2"><input type="text" class="box2" id="datepicker1" name="datepicker1"  value="<%=datepicker1%>" autocomplete='off' readonly></td>
              <td colspan="2"><input type="text" class="box2" id="datepicker2" name="datepicker2" value="<%=datepicker2%>" autocomplete='off'  readonly></td>
            </tr>
          </table>
          <table class="table3" align="center">
            <tr>
              <td colspan="4"><span class="text1" id="inputGroup-sizing-sm">날짜</span></td>
            </tr>
            <tr>
              <td colspan="4"><input type="text" class="box2" aria-label="Sizing example input"  id = "d1" name = "d1" aria-describedby="inputGroup-sizing-sm" readonly></td>
            </tr>
            <tr>
              <td colspan="4"><span class="text1" id="inputGroup-sizing-sm">총가격</span></td>
            </tr>
            <tr>
              <td colspan="4"><input type="text" class="box2" aria-label="Sizing example input"  id = "d2" name = "d2" aria-describedby="inputGroup-sizing-sm" readonly></td>
            </tr>
          </table>
          <table class="table4" align="center">
            <tr>
              <td><span class="text1" id="inputGroup-sizing-sm">대여번호&nbsp&nbsp</span></td>
            </tr>
            <tr>
              <td><input type="text" class="box3" aria-label="Sizing example input"  id = "k" name = "k" value="<%=k%>" aria-describedby="inputGroup-sizing-sm" readonly></td>
            </tr>
          </table>
        </div>
        <input type="submit" class="btnok btn-outline-primary" value="예약하기">
      </div>
    </form>
  </div>




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
document.getElementById('d1').value = parseInt(diff/currDay+1)




</script>
<script>
 var str1 = document.getElementById("d1").value;
 var str2 = document.getElementById("d3").value;
document.getElementById('d2').value = parseInt(str1 * str2)




</script>
</body> 
</html>