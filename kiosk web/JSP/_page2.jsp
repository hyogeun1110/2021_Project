<%@ page import="java.sql.*" contentType="text/html;charset=UTF-8"%>
<%
 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
 String url="jdbc:sqlserver://localhost:1433;DatabaseName=foodcourt;"; 
	
 Connection dbconn=DriverManager.getConnection(url, "madanguser", "madangpass");
 Statement stmt = dbconn.createStatement( );

%>
<% 
   request.setCharacterEncoding("UTF-8");

   String id1 = request.getParameter("1");
   String num1 = request.getParameter("101");

   String id2 = request.getParameter("2");
   String num2 = request.getParameter("102");

   String id3 = request.getParameter("3");
   String num3 = request.getParameter("103");

   String id4 = request.getParameter("4");
   String num4 = request.getParameter("104");

   String id5 = request.getParameter("5");
   String num5 = request.getParameter("105");

   String id6 = request.getParameter("6");
   String num6 = request.getParameter("106");

   String id7 = request.getParameter("7");
   String num7 = request.getParameter("107");

   String id8 = request.getParameter("8");
   String num8 = request.getParameter("108");

   String id9 = request.getParameter("9");
   String num9 = request.getParameter("109");

   String id10 = request.getParameter("10");
   String num10 = request.getParameter("110");

   String id11 = request.getParameter("11");
   String num11 = request.getParameter("111");

   String id12 = request.getParameter("12");
   String num12 = request.getParameter("112");

   String id13 = request.getParameter("13");
   String num13 = request.getParameter("113");

   String id14 = request.getParameter("14");
   String num14 = request.getParameter("114");

   String id15 = request.getParameter("15");
   String num15 = request.getParameter("115");

   String id16 = request.getParameter("16");
   String num16 = request.getParameter("116");

   String id17 = request.getParameter("17");
   String num17 = request.getParameter("117");

   String id18 = request.getParameter("18");
   String num18 = request.getParameter("118");

   String id19 = request.getParameter("19");
   String num19 = request.getParameter("119");

   String id20 = request.getParameter("20");
   String num20 = request.getParameter("120");

  
%>
<body>

<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>** 주문 확인 **</title>
<header class="header" align="center">** 주문하신 목록을 확인해주세요 **</header>
<hr>
<style>
	p{
		font-size: 20;
	}
	.header{
		font-weight: bolder;
		font-size: 60;
		font-family: "굴림";
	}
	button{
		width: 200;
		height: 30;
	}
</style>
<div align="center">
<table width="400">

	
	<% ResultSet aResultSet=stmt.executeQuery("SELECT * FROM menu WHERE menuid='"+id1+"'");
	if(id1!=null){
	   aResultSet.next( );
	 if(num1.equals(100)){} 
		else{%>	
			<p align="center">
				<%=aResultSet.getString("menu_name")%> ----- <%=num1%>개
			</p>
   <% } 
 	} %>
   
   <%
   ResultSet bResultSet=stmt.executeQuery("SELECT * FROM menu WHERE menuid='"+id2+"'");
	if(id2!=null){
	   bResultSet.next( ); 
   	if(num2.equals(100)){} 
		else{%>	
			<p align="center">
				<%=bResultSet.getString("menu_name")%> ----- <%=num2%>개
			</p>
   <% } 
}%>

<%
ResultSet cResultSet=stmt.executeQuery("SELECT * FROM menu WHERE menuid='"+id3+"'");
 if(id3!=null){
	cResultSet.next( ); 
	if(num3.equals(100)){} 
	 else{%>	
		<p align="center">
			<%=cResultSet.getString("menu_name")%> ----- <%=num3%>개
		</p>
<% } 
}%>

<%
ResultSet dResultSet=stmt.executeQuery("SELECT * FROM menu WHERE menuid='"+id4+"'");
 if(id4!=null){
	dResultSet.next( ); 
	if(num4.equals(100)){} 
	 else{%>	
		<p align="center">
			<%=dResultSet.getString("menu_name")%> ----- <%=num4%>개
		</p>
<% } 
}%>

<%
ResultSet eResultSet=stmt.executeQuery("SELECT * FROM menu WHERE menuid='"+id5+"'");
 if(id5!=null){
	eResultSet.next( ); 
	if(num5.equals(100)){} 
	 else{%>	
		<p align="center">
			<%=eResultSet.getString("menu_name")%> ----- <%=num5%>개
		</p>
<% } 
}%>

<%
ResultSet fResultSet=stmt.executeQuery("SELECT * FROM menu WHERE menuid='"+id6+"'");
 if(id6!=null){
	fResultSet.next( ); 
	if(num6.equals(100)){} 
	 else{%>	
		<p align="center">
			<%=fResultSet.getString("menu_name")%> ----- <%=num6%>개
		</p>
<% } 
}%>

<%
ResultSet gResultSet=stmt.executeQuery("SELECT * FROM menu WHERE menuid='"+id7+"'");
 if(id7!=null){
	gResultSet.next( ); 
	if(num7.equals(100)){} 
	 else{%>	
		<p align="center">
			<%=gResultSet.getString("menu_name")%> ----- <%=num7%>개
		</p>
<% } 
}%>

<%
ResultSet hResultSet=stmt.executeQuery("SELECT * FROM menu WHERE menuid='"+id8+"'");
 if(id8!=null){
	hResultSet.next( ); 
	if(num8.equals(100)){} 
	 else{%>	
		<p align="center">
			<%=hResultSet.getString("menu_name")%> ----- <%=num8%>개
		</p>
<% } 
}%>

<%
ResultSet iResultSet=stmt.executeQuery("SELECT * FROM menu WHERE menuid='"+id9+"'");
 if(id9!=null){
	iResultSet.next( ); 
	if(num9.equals(100)){} 
	 else{%>	
		<p align="center">
			<%=iResultSet.getString("menu_name")%> ----- <%=num9%>개
		</p>
	   
<% } 
}%>

<%
ResultSet jResultSet=stmt.executeQuery("SELECT * FROM menu WHERE menuid='"+id10+"'");
 if(id10!=null){
	jResultSet.next( ); 
	if(num10.equals(100)){} 
	 else{%>	
		<p align="center">
			<%=jResultSet.getString("menu_name")%> ----- <%=num10%>개
		</p>
<% } 
}%>

<%
ResultSet kResultSet=stmt.executeQuery("SELECT * FROM menu WHERE menuid='"+id11+"'");
 if(id11!=null){
	kResultSet.next( ); 
	if(num11.equals(100)){} 
	 else{%>	
		<p align="center">
			<%=kResultSet.getString("menu_name")%> ----- <%=num11%>개
		</p>
<% } 
}%>

<%
ResultSet lResultSet=stmt.executeQuery("SELECT * FROM menu WHERE menuid='"+id12+"'");
 if(id12!=null){
	lResultSet.next( ); 
	if(num12.equals(100)){} 
	 else{%>	
		<p align="center">
			<%=lResultSet.getString("menu_name")%> ----- <%=num12%>개
		</p>
<% } 
}%>

<%
ResultSet mResultSet=stmt.executeQuery("SELECT * FROM menu WHERE menuid='"+id13+"'");
 if(id13!=null){
	mResultSet.next( ); 
	if(num13.equals(100)){} 
	 else{%>	
		<p align="center">
			<%=mResultSet.getString("menu_name")%> ----- <%=num13%>개
		</p>
<% } 
}%>

<%
ResultSet nResultSet=stmt.executeQuery("SELECT * FROM menu WHERE menuid='"+id14+"'");
 if(id14!=null){
	nResultSet.next( ); 
	if(num14.equals(100)){} 
	 else{%>	
		<p align="center">
			<%=nResultSet.getString("menu_name")%> ----- <%=num14%>개
		</p>
<% } 
}%>

<%
ResultSet oResultSet=stmt.executeQuery("SELECT * FROM menu WHERE menuid='"+id15+"'");
 if(id15!=null){
	oResultSet.next( ); 
	if(num15.equals(100)){} 
	 else{%>	
		<p align="center">
			<%=oResultSet.getString("menu_name")%> ----- <%=num15%>개
		</p>
<% } 
}%>

<%
ResultSet pResultSet=stmt.executeQuery("SELECT * FROM menu WHERE menuid='"+id16+"'");
 if(id16!=null){
	pResultSet.next( ); 
	if(num16.equals(100)){} 
	 else{%>	
		<p align="center">
			<%=pResultSet.getString("menu_name")%> ----- <%=num16%>개
		</p>
<% } 
}%>

<%
ResultSet qResultSet=stmt.executeQuery("SELECT * FROM menu WHERE menuid='"+id17+"'");
 if(id17!=null){
	qResultSet.next( ); 
	if(num17.equals(100)){} 
	 else{%>	
		<p align="center">
			<%=qResultSet.getString("menu_name")%> ----- <%=num17%>개
		</p>
<% } 
}%>

<%
ResultSet rResultSet=stmt.executeQuery("SELECT * FROM menu WHERE menuid='"+id18+"'");
 if(id18!=null){
	rResultSet.next( ); 
	if(num18.equals(100)){} 
	 else{%>	
		<p align="center">
			<%=rResultSet.getString("menu_name")%> ----- <%=num18%>개
		</p>
<% } 
}%>

<%
ResultSet sResultSet=stmt.executeQuery("SELECT * FROM menu WHERE menuid='"+id19+"'");
 if(id19!=null){
	sResultSet.next( ); 
	if(num19.equals(100)){} 
	 else{%>	
		<p align="center">
			<%=sResultSet.getString("menu_name")%> ----- <%=num19%>개
		</p>
<% } 
}%>

<%
ResultSet tResultSet=stmt.executeQuery("SELECT * FROM menu WHERE menuid='"+id20+"'");
 if(id20!=null){
	tResultSet.next( ); 
	if(num20.equals(100)){} 
	 else{%>	
		<p align="center">
			<%=tResultSet.getString("menu_name")%> ----- <%=num20%>개
		</p>
<% } 
}%>
<hr>
<button type="button" onclick="location='_page1.jsp'">돌아가기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%
Connection con = null; 
PreparedStatement pstmt = null; 

con = DriverManager.getConnection(url,"madanguser","madangpass");

String sql = "INSERT INTO orders VALUES (?, ?, ?)";

PreparedStatement pstmt1 = null;
pstmt1 = con.prepareStatement(sql);
pstmt1.setString(1, "1");
pstmt1.setString(2, id1);
pstmt1.setString(3, num1);

PreparedStatement pstmt2 = null;
pstmt2 = con.prepareStatement(sql);
pstmt2.setString(1, "1");
pstmt2.setString(2, id2);
pstmt2.setString(3, num2);

PreparedStatement pstmt3 = null;
pstmt3 = con.prepareStatement(sql);
pstmt3.setString(1, "1");
pstmt3.setString(2, id3);
pstmt3.setString(3, num3);

PreparedStatement pstmt4 = null;
pstmt4 = con.prepareStatement(sql);
pstmt4.setString(1, "1");
pstmt4.setString(2, id4);
pstmt4.setString(3, num4);

PreparedStatement pstmt5 = null;
pstmt5 = con.prepareStatement(sql);
pstmt5.setString(1, "1");
pstmt5.setString(2, id5);
pstmt5.setString(3, num5);

PreparedStatement pstmt6 = null;
pstmt6 = con.prepareStatement(sql);
pstmt6.setString(1, "1");
pstmt6.setString(2, id6);
pstmt6.setString(3, num6);

PreparedStatement pstmt7 = null;
pstmt7 = con.prepareStatement(sql);
pstmt7.setString(1, "1");
pstmt7.setString(2, id7);
pstmt7.setString(3, num7);

PreparedStatement pstmt8 = null;
pstmt8 = con.prepareStatement(sql);
pstmt8.setString(1, "1");
pstmt8.setString(2, id8);
pstmt8.setString(3, num8);

PreparedStatement pstmt9 = null;
pstmt9 = con.prepareStatement(sql);
pstmt9.setString(1, "1");
pstmt9.setString(2, id9);
pstmt9.setString(3, num9);

PreparedStatement pstmt10 = null;
pstmt10 = con.prepareStatement(sql);
pstmt10.setString(1, "1");
pstmt10.setString(2, id10);
pstmt10.setString(3, num10);


PreparedStatement pstmt11 = null;
pstmt11 = con.prepareStatement(sql);
pstmt11.setString(1, "1");
pstmt11.setString(2, id11);
pstmt11.setString(3, num11);

PreparedStatement pstmt12 = null;
pstmt12 = con.prepareStatement(sql);
pstmt12.setString(1, "1");
pstmt12.setString(2, id12);
pstmt12.setString(3, num12);

PreparedStatement pstmt13 = null;
pstmt13 = con.prepareStatement(sql);
pstmt13.setString(1, "1");
pstmt13.setString(2, id13);
pstmt13.setString(3, num13);

PreparedStatement pstmt14 = null;
pstmt14 = con.prepareStatement(sql);
pstmt14.setString(1, "1");
pstmt14.setString(2, id14);
pstmt14.setString(3, num14);

PreparedStatement pstmt15 = null;
pstmt15 = con.prepareStatement(sql);
pstmt15.setString(1, "1");
pstmt15.setString(2, id15);
pstmt15.setString(3, num15);

PreparedStatement pstmt16 = null;
pstmt16 = con.prepareStatement(sql);
pstmt16.setString(1, "1");
pstmt16.setString(2, id16);
pstmt16.setString(3, num16);

PreparedStatement pstmt17 = null;
pstmt17 = con.prepareStatement(sql);
pstmt17.setString(1, "1");
pstmt17.setString(2, id17);
pstmt17.setString(3, num17);

PreparedStatement pstmt18 = null;
pstmt18 = con.prepareStatement(sql);
pstmt18.setString(1, "1");
pstmt18.setString(2, id18);
pstmt18.setString(3, num18);

PreparedStatement pstmt19 = null;
pstmt19 = con.prepareStatement(sql);
pstmt19.setString(1, "1");
pstmt19.setString(2, id19);
pstmt19.setString(3, num19);

PreparedStatement pstmt20 = null;
pstmt20 = con.prepareStatement(sql);
pstmt20.setString(1, "1");
pstmt20.setString(2, id20);
pstmt20.setString(3, num20);
%>
<button class="checkbtn" onclick="location='_page3.jsp'" >
	<%
	if(id1 != null){
	pstmt1.executeUpdate();}

	if(id2 != null){
	pstmt2.executeUpdate();}

	if(id3 != null){
	pstmt3.executeUpdate();}

	if(id4 != null){
	pstmt4.executeUpdate();}

	if(id5 != null){
	pstmt5.executeUpdate();}

	if(id6 != null){
	pstmt6.executeUpdate();}

	if(id7 != null){
	pstmt7.executeUpdate();}

	if(id8 != null){
	pstmt8.executeUpdate();}

	if(id9 != null){
	pstmt9.executeUpdate();}

	if(id10 != null){
	pstmt10.executeUpdate();}

	if(id11 != null){
	pstmt11.executeUpdate();}

	if(id12 != null){
	pstmt12.executeUpdate();}

	if(id13 != null){
	pstmt13.executeUpdate();}

	if(id14 != null){
	pstmt14.executeUpdate();}

	if(id15 != null){
	pstmt15.executeUpdate();}

	if(id16 != null){
	pstmt16.executeUpdate();}

	if(id17 != null){
	pstmt17.executeUpdate();}

	if(id18 != null){
	pstmt18.executeUpdate();}

	if(id19 != null){
	pstmt19.executeUpdate();}

	if(id20 != null){
	pstmt20.executeUpdate();}
	%>
	결제하러가기</button>
</table>
</div>
<%
    stmt.close( );
    dbconn.close( );
    %>    
</body>
