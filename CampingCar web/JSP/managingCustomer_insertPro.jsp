<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String CS_NAME = request.getParameter("CS_NAME");		
	String CS_TELEPHONE = request.getParameter("CS_TELEPHONE");	
	String CS_PASSWD = request.getParameter("CS_PASSWD");
	long CS_LICENSE = Long.parseLong(request.getParameter("CS_LICENSE"));	
	String postal = request.getParameter("postalCode");    //우편번호
	String addressHead = request.getParameter("addressHead");		//주소 앞부분
	String addressReference = request.getParameter("addressReference");	//주소 참고
	String addressTail = request.getParameter("addressTail");				//주소 뒷부분
	String emailHead = request.getParameter("emailHead");	//이메일 앞부분
	String emailTail = request.getParameter("emailTail");	//@ 뒷부분

	StringBuilder addressAll = new StringBuilder(); //주소 stringBuilder 생성
	addressAll.append("(");
	addressAll.append(postal);
	addressAll.append(")");
	addressAll.append(addressHead);
	addressAll.append(addressReference);
	addressAll.append(addressTail);
	String CS_ADDRESS = addressAll.toString();		//string 빌더에 address를 하나로 만들어 다시 string객체에 저장

	StringBuilder emailAll = new StringBuilder(); //이메일 stringBuilder생성
	emailAll.append(emailHead);
	emailAll.append(emailTail);
	String CS_MAIL = emailAll.toString();		//이메일 builder를 다시 string객체에 저장 (toString을  setString에서 하면 오류발생 가능성)

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	try{
		String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
		String dbId="f5";
		String dbPass="1234";
	
		Class.forName("oracle.jdbc.driver.OracleDriver"); 
		conn=DriverManager.getConnection(jdbcUrl, dbId, dbPass );
		sql = "select * from customer where CS_LICENSE = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setLong(1,CS_LICENSE);
		rs=pstmt.executeQuery();//결과 저장
		
		if(rs.next()){   //결과값이 있으면  (근데 가입도 가입이 되네?)
			sql= "update customer set CS_PASSWD=?,CS_NAME=?,CS_TELEPHONE=?, CS_ADDRESS=?,CS_MAIL=? where CS_LICENSE = ? ";
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1,CS_PASSWD);
			pstmt.setString(2,CS_NAME);
			pstmt.setString(3,CS_TELEPHONE);
			pstmt.setString(4,CS_ADDRESS);
			pstmt.setString(5,CS_MAIL);
			pstmt.setLong(6,CS_LICENSE);
			pstmt.executeUpdate();

			sql= "insert into CU_LIST (CS_LICENSE, JOINDATEEND, JOINSTATE) values (?,TO_DATE('9999-12-30','YYYY-MM-DD'), '가입')";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1,CS_LICENSE);
			pstmt.executeUpdate();
			out.println("기존 가입자");

		}else{ //없으면

			sql= "insert into customer (CS_LICENSE, CS_PASSWD, CS_NAME,CS_TELEPHONE, CS_ADDRESS, CS_MAIL) values (?,?,?,?,?,?)";
	
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1,CS_LICENSE);
			pstmt.setString(2,CS_PASSWD);
			pstmt.setString(3,CS_NAME);
			pstmt.setString(4,CS_TELEPHONE);
			pstmt.setString(5,CS_ADDRESS);
			pstmt.setString(6,CS_MAIL);
			pstmt.executeUpdate();

			sql= "insert into CU_LIST (CS_LICENSE, JOINDATEEND, JOINSTATE) values (?,TO_DATE('9999-12-30','YYYY-MM-DD'), '가입')";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1,CS_LICENSE);
			pstmt.executeUpdate();
			out.println("새로운 가입자");
		}

  }catch(Exception e){ 
	  out.print("오류가 발생하였습니다. 다시 시도해 주시기 바랍니다");
	  e.printStackTrace();
  }finally{
	  if(pstmt != null) 
		 try{pstmt.close();}catch(SQLException sqle){}
	  if(conn != null) 
		 try{conn.close();}catch(SQLException sqle){}
  }
%>
<script>
   setTimeout(function(){
   location.href = "managingCustomer_select.jsp";
   alert("회원가입되었습니다.");}, 200);
</script>

