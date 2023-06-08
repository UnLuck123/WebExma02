<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<meta charset="UTF-8">
<%@ include file="../dbconn.jsp" %>

<title>계정 삭제</title>
</head>
<body>
<%

	String id = request.getParameter("member_id");
	
	PreparedStatement pstmt = null;

	ResultSet rs = null;

	String sql = "Delete from account where member_id = ?";
	
    pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
    pstmt.executeUpdate();
    
%>
<script>
alert("계정이 삭제되었습니다.");
history.back();
</script>





		
</body>
</html>