<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>메인 페이지</title>
		
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<script>
	function chkID(){
		<%
		String id = (String)session.getAttribute("id");
		%>
		
		alert("현재 로그인 중인 아이디는 <%=id %>입니다.");
    }
	
	
	</script>

</head>
<body>

<h1>메인</h1>
    
    
<input  type="button"  value="현재 로그인중인 계정 확인" onClick="chkID();">

<input  type="button"  value="계정 정보 수정" onclick="location='pwdchk.jsp'">

<input  type="button"  value="계정 삭제" onclick="location='deleteacc.jsp'">

<input  type="button"  value="로그아웃" onclick="location='logout.jsp'">

		

</body>
</html>