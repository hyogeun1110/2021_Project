<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<% 
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
%>	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>교양</title>
<link rel="stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
<style>
    .top{
        margin-top: 20px;
        outline: 1px solid #9F9F9F;
        width: 1000px;
        height: 100px;
        display: table;
        background-color: #eed8cb;
        background-image:url('2.png');
        background-size: 80px 80px;
        background-repeat: no-repeat;
        background-position: 10px;
    }
    div{
        text-align: center;
    }
    .container{
        width: 1000px;
        margin: 0 auto;
    }
    .container div{
         text-align: center;
         display: table;
    }
    .container div span{
        display: table-cell;
        vertical-align: middle;
    }
    .topSP{
        font-weight: 900;
        font-size: 40px;
    }
    .bottom{
        margin-top: 20px;
        margin-bottom: 20px;
        outline: 1px solid #9F9F9F;
        width: 1000px;
        height: 100px;
        background-color: #5D5D5D;
        color: #fff;
    }
    .middle{
        margin-top: 20px;
        width: 1000px;
        height: 500px;
        position: relative;       
    }
    .middle-left{
        outline: 1px solid #9F9F9F;
        position: absolute;
        top: 0px;
        width: 170px;
        height: 500px;
    }
    .middle-right{
        position: absolute;
        top: 0px;
        left: 190px;
        width: 810px;
        height: 500px;
        background-image:url('1.jpg');
        background-size: 810px 500px;
    }
    .btn1{
        width: 170px;
        height: 50px;
        color: #9F9F9F;
        border-radius: 0%;
        border: 1px;
        outline: 1px;
        outline-color: black;
    }
    .my{
      position: relative;  
      left: 335px;
      top: 75px;
    }
    table{
        opacity: 0.9;
        width: 600px;
    }
    .cbtn{
        font-size: 10px;
        position: relative;
        top: 75px;
        left: 40px;
    }
</style>
</head>
<body>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
    
    PreparedStatement pstmt2 = null;
    ResultSet rs2 = null;

  try{
	String jdbcUrl = "jdbc:mysql://localhost:3306/ysu";
    String dbId = "ysu";
    String dbPass = "1234";
	 
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
	
	String sql = "select id, passwd,name from member2 where id=?";
	pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,id);

	rs = pstmt.executeQuery();
    
	if(rs.next()){ 
	  String rId=rs.getString("id");
	  String rPasswd=rs.getString("passwd");
      String name=rs.getString("name");

      if(id.equals(rId) && passwd.equals(rPasswd)){
%>
<div class="container">
<div class="top" role="alert">
	   <span class="topSP"><%=name%>님 어서오세요.</span>
       <!-- <a href="updateForm.jsp?id=<%=id%>" class="cbtn">나의 정보 변경하기</a> -->
</div>
<div class="middle">
    <div class="middle-left">
        <button type="button" class="btn1 btn-secondary">전공 (필수)</button>
        <button type="button" class="btn1 btn-secondary">전공 (선택)</button>
        <button type="button" class="btn1 btn-secondary">교양 (필수)</button>
        <button type="button" class="btn1 btn-secondary" autofocus>교양 (선택)</button>
    </div>
    <div class="middle-right">
    <table class="table table-bordered table-striped table-hover" >
    <thead>
        <label style="color: black;font-weight: 900;font-size: 30px;position: relative;">나의 교양과목 신청정보
                <a href="insertForm.jsp?id=<%=id%>&passwd=<%=passwd%>" class="btn btn-secondary btn-sm" style="position: relative; left: 100px;">수강신청</a> 
        <% sql = "select * from info where id=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,id);
    
        rs = pstmt.executeQuery();
        
        if(rs.next()){  %>
                <a href="deleteForm.jsp?id=<%=id%>&passwd=<%=passwd%>" class="btn btn-secondary btn-sm" style="position: relative; left: 100px;">수강취소</a> 
        <% } %>
        </label>
        <tr class="table-dark">
            <th>과목</th>
            <th>위치</th>
        </tr>
    </thead>
    <%
        sql = "select s.name,s.loc from member2 m,info i,subject s where m.id='"+id+"' and m.id=i.id and i.sub_id=s.sub_id";
		pstmt = conn.prepareStatement(sql);

		rs = pstmt.executeQuery();

		while(rs.next()){
            String name1 = rs.getString("s.name");
            String loc = rs.getString("s.loc");
        %>
    <tbody>
		<tr class="table-light">
            <td><%=name1%></td>
            <td><%=loc%></td>
        </tr>
    </tbody>

<%
    }} else {
		    out.println("<div class=\"alert alert-danger\" role=\"alert\">비밀번호가 틀렸습니다.</div>"); %>
            <script>
                setTimeout(function(){
                    window.history.back();
                }, 2000);
            </script>
<%	}
    }  else {
        out.println("<div class=\"alert alert-danger\" role=\"alert\">아이디가 틀렸습니다.</div>"); %>
        <script>
            setTimeout(function(){
                window.history.back();
            }, 2000);
        </script>
    <%}
  }catch(Exception e){ 
	 e.printStackTrace();
  }finally{
	 if(rs != null) 
		 try{rs.close();}catch(SQLException sqle){}
	 if(pstmt != null) 
		 try{pstmt.close();}catch(SQLException sqle){}
	 if(conn != null) 
		 try{conn.close();}catch(SQLException sqle){}
  }
%>
</table>
<a href="login.jsp" class="btn btn-danger btn-sm" style="position: relative;bottom: -300px;opacity: 0.8;right: 350px;">로그아웃</a>
</div>
</div>
    <div class="bottom">
        <p align="left"></br>&nbsp ooooo TEL : 123-456-7890 </br>
            &nbsp www.ooo.com
        </p>
    </div>
</div>

</body>
</html>