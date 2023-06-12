<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<meta charset="UTF-8">
<%@ include file="../../dbconn.jsp" %>

<title>계정 삭제</title>
</head>
<body>
<%
	try{
	String Dnum = request.getParameter("deptnum");

	PreparedStatement pstmt = null;

	ResultSet rs = null;

	String sql = "Delete from dept where deptnum = ?";
	
    pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, Dnum);
    pstmt.executeUpdate();
	}catch(Exception e){
		%>
		<script>
		alert("현재 이 부서에 사람이 있습니다.");
		window.location.href='deptMangement.jsp';
		</script>
		
		<%
	}
%>

<script>
alert("부서가 삭제되었습니다.");
window.location.href='deptMangement.jsp';
</script>





		
</body>
</html>