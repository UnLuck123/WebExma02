<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<meta charset="UTF-8">
<%@ include file="dbconn.jsp" %>

<title>Insert title here</title>
</head>
<body>

<%
	String Mid = request.getParameter("chkid");
	String Mpw = request.getParameter("pwd");
	String Mname = request.getParameter("name");
	String Mgender = request.getParameter("gender");
	String Mtel1 = request.getParameter("tel1");
	String Mtel2 = request.getParameter("tel2");
	String Mtel3 = request.getParameter("tel3");
	String Mhp1 = request.getParameter("hp1");
	String Mhp2 = request.getParameter("hp2");
	String Mhp3 = request.getParameter("hp3");
	String Mhp = Mhp1 + Mhp2 + Mhp3;
	String Msnssts = request.getParameter("snssts");
	String Memail1 = request.getParameter("email1");
	String Memail2 = request.getParameter("email2");
	String Memail = Memail1 + "@" + Memail2;
	String Memailsts = request.getParameter("emailsts");
	String Madress1 = request.getParameter("postcode");
	String Madress2 = request.getParameter("adress");
	String Madress3 = request.getParameter("detailadress");
	String MFrnn = request.getParameter("Frnn");
	String MSrnn = request.getParameter("Srnn");
	

	String sql = 
	"INSERT INTO account(member_id, member_pw, member_name, member_gender, tel1, tel2, tel3, hp, hp1, hp2, hp3, snssts, email, email1, email2, emailsts, adress1, adress2, adress3, Frnn, Srnn)" 
	+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, Mid);
		pstmt.setString(2, Mpw);
		pstmt.setString(3, Mname);
		pstmt.setString(4, Mgender);
		pstmt.setString(5, Mtel1);
		pstmt.setString(6, Mtel2);
		pstmt.setString(7, Mtel3);
		pstmt.setString(8, Mhp);
		pstmt.setString(9, Mhp1);
		pstmt.setString(10, Mhp2);
		pstmt.setString(11, Mhp3);
		pstmt.setString(12, Msnssts);
		pstmt.setString(13, Memail);
		pstmt.setString(14, Memail1);
		pstmt.setString(15, Memail2);
		pstmt.setString(16, Memailsts);
		pstmt.setString(17, Madress1);
		pstmt.setString(18, Madress2);
		pstmt.setString(19, Madress3);
		pstmt.setString(20, MFrnn);
		pstmt.setString(21, MSrnn);

		

		pstmt.executeUpdate();	

		pstmt.close();
		
	conn.close();
	
%>
<script>
window.location.href='login.jsp';
</script>