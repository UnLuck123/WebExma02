<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<meta charset="UTF-8">
<%@ include file="dbconn.jsp" %>

<title>비번 확인</title>
</head>
<body>

<%
	String id = (String)session.getAttribute("id");
	String mPW = request.getParameter("pwd");

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	
	String sql = "SELECT * FROM account where member_id='"+id+"' and member_pw='"+mPW+"'";
	
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    
    if(rs.next()){
%>	
<script>
alert('Login Success');
window.location.href='accountedit.jsp';
</script>
<%
	}
	else{
%>
<script>

alert('비번이 틀렸습니다.');
history.back();
</script>
<% 		
	}
%>		
</body>
</html>