<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
   
<%  
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String email1 = request.getParameter("email");  
String tail = request.getParameter("emailTail");  

String email = email1 + tail ;

%>   
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>레코드 수정</title>
<link rel="stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
<style>
    *{
        margin: 0;
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
    }
    .f5{
        height: 60px;   
        width: 70px;
        position: relative;
        left: 15px;
        top:15px
    }
    .str{
        position: relative;
        top: 170px;
        left: 10px;
        font-weight: 900;
        font-size: 36px;
        color :rgb(146, 0, 0);
    }
    .ps{
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
    .boxM{
        width: 320px;
        height: 35px;
        position: relative;
        top : 70px;
        left: 163px;
        border-radius: 80px;
        background-color: #ececec;
        border:0;
        outline: 0;
        padding-left: 15px;
    }
    .boxM:focus{
        border: 1px #999999;
        outline: 1px solid #bebebe;
    }
    .btnnew{
        width: 320px;
        height: 35px;  
        border-radius: 80px;
        background-color: white;
        position: relative;
        top:135px;
        right: 162px;
        font-size: 14px;
        z-index: 3;
    }
    .bottext{
        font-size: 10px;
        color: #9F9F9F;
        position: relative;
        top: 20px;
    }
</style>
</head>
<body>
    <div class="top">
        <img  src="img/F5.png" style="width:90px; height:70px; position:relative; top:20px; left:-650px; z-index: 3; " onclick="location='Main.jsp'">
    </div>
    <div class="container">
        <div class="middle">
            <label class="ps">비밀번호 찾기</label>
            <%
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
        
            try{
            String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
            String dbId="f5";
            String dbPass="1234";
        
            Class.forName("oracle.jdbc.driver.OracleDriver"); 
            conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );
            
            String sql= "select cs_mail , cs_passwd from customer where CS_LICENSE = ? ";
        
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,id);

            rs = pstmt.executeQuery();

                if(rs.next()){
                    String remail=rs.getString("cs_mail");
                    if(remail.equals(email)){
                        String passwd=rs.getString("cs_passwd"); %>
                        <p class="liss">비밀번호</p>              
                        <input type="text" name="id" class="boxM" autocomplete="off" value="<%=passwd%>" readonly>
                        <button type="button" class="btnnew btn-outline-dark" onclick="pagemove()">확인</button>
                    <%
                    }
                    else { %>
                        <div class="str">이메일이 틀렸습니다</div>
                        <script>
                            setTimeout(function(){
                                window.history.back();
                            }, 1500);
                        </script>
        <%                
                    }
                }
                else {  %>
                    <div class="str">라이센스가 틀렸습니다</div>
                    <script>
                        setTimeout(function(){
                            window.history.back();
                        }, 1500);
                    </script>
        <%            
                }
                pstmt.close();
                conn.close(); %>
        <%
            }catch(Exception e){ 
                e.printStackTrace();
            }finally{
                if(pstmt != null) 
                try{pstmt.close();}catch(SQLException sqle){}
                if(conn != null) 
                try{conn.close();}catch(SQLException sqle){}
            }   %>
            <p class="bottext"></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>
                F5 @ 2021 &nbsp&nbsp 개인정보 처리방침 및 법적고지 &nbsp&nbsp 연락처</p>
        </div>
    </div>
<script>
    function pagemove()  {
        window.location.href = "LoginForm.jsp"
    }
</script>
