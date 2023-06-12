<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<meta charset="UTF-8">
<%@ include file="../../dbconn.jsp" %>

<title>Insert title here</title>
</head>
<body>

<%
	String Dname = request.getParameter("chkname");
	String Dnum = request.getParameter("chknum");

	String sql = 
	"INSERT INTO dept(deptname, deptnum)" 
	+ "VALUES(?, ?)";
		
	PreparedStatement pstmt = conn.prepareStatement(sql);
		
	pstmt.setString(1, Dname);
	pstmt.setString(2, Dnum);


	pstmt.executeUpdate();	

	pstmt.close();
		
	conn.close();
%>
<script>
window.location.href='deptMangement.jsp';
</script>

