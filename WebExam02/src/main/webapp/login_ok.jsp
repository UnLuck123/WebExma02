<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<meta charset="UTF-8">
<%@ include file="dbconn.jsp" %>

<title>로그인 중~</title>
</head>
<body>

<%
	String mID = request.getParameter("id");
	String mPW = request.getParameter("pwd");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT * FROM account where member_id='"+mID+"' and member_pw='"+mPW+"'";
	
	pstmt = conn.prepareStatement(sql);

	rs = pstmt.executeQuery();
		
	if(rs.next()) {
		session.setMaxInactiveInterval(60*60);
		session.setAttribute("id",mID);
		String status = rs.getString("status");
%>	
<script>
alert('Login Success');


</script>
<%
		if(status.equals("admin")){
			%>
			<script>
			window.location.href='./admin/adminmain.jsp';
			</script>
			<%
		}
		else{
			%>
			<script>
			window.location.href='main.jsp';
			</script>
			<%
		}
	}
	else{
%>
<script>
alert('Login fail');
history.back();
</script>
<%	
	}
%>		
</body>
</html>