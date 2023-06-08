<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<meta charset="UTF-8">
<%@ include file="../dbconn.jsp" %>

<title>Insert title here</title>
</head>
<body>

<%
	String Mid = request.getParameter("chkid");
	String Mpw = request.getParameter("pwd");
	String Mtel1 = request.getParameter("tel1");
	String Mtel2 = request.getParameter("tel2");
	String Mtel3 = request.getParameter("tel3");
	String Msnssts = request.getParameter("hsnssts");
	String Memail1 = request.getParameter("email1");
	String Memail2 = request.getParameter("email2");
	String Memail = Memail1 + "@" + Memail2;
	String Memailsts = request.getParameter("hemailsts");
	String Madress1 = request.getParameter("postcode");
	String Madress2 = request.getParameter("adress");
	String Madress3 = request.getParameter("detailadress");
	
	
	
	String sql = 
	//"UPDATE ACCOUNT SET member_pw = '" + Mpw + "' tel1 = '" + Mtel1 + "' tel2 = '" + Mtel2 + "' tel3 = '" + Mtel3 + "' snssts = '" + Msnssts + "' email = '" + Memail + "' email1 = '" + Memail1 + "' email2 = '" + Memail2 + "' emailsts = '" + Memailsts + "' adress1 = '" + Madress1 + "' adress2 = '" + Madress2 + "' adress3 = '" + Madress3 + "' WHERE ID = '" + Mid +"'"; 
	"UPDATE ACCOUNT SET member_pw = ?, tel1 = ?, tel2 = ?, tel3 = ?, snssts = ?, email = ?, email1 = ?, email2 = ?, emailsts = ?, adress1 = ?, adress2 = ?, adress3 = ? WHERE member_id = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, Mpw);
		pstmt.setString(2, Mtel1);
		pstmt.setString(3, Mtel2);
		pstmt.setString(4, Mtel3);
		pstmt.setString(5, Msnssts);
		pstmt.setString(6, Memail);
		pstmt.setString(7, Memail1);
		pstmt.setString(8, Memail2);
		pstmt.setString(9, Memailsts);
		pstmt.setString(10, Madress1);
		pstmt.setString(11, Madress2);
		pstmt.setString(12, Madress3);
		pstmt.setString(13, Mid);

		pstmt.executeUpdate();	

		pstmt.close();
		
	conn.close();
	
%>
<script>
alert("수정 완료되었습니다.");
window.location.href='accMangement.jsp';
</script>