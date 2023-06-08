<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<meta charset="UTF-8">
<%@ include file="dbconn.jsp" %>

<title>계정 삭제</title>
</head>
<body>
<%

	String id = (String)session.getAttribute("id");
	String mPW = request.getParameter("pwd");
	
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;

	ResultSet rs = null;
	ResultSet rs2 = null;

	
	String sql = "SELECT * FROM account where member_id='" +id+ "' and member_pw='"+mPW+"'";
	
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    
  
    if(rs.next()){
    	
    	String sql2 = "Delete from account where member_id = ?";
    	
    	pstmt2 = conn.prepareStatement(sql2);
    	pstmt2.setString(1, id);
        
    	pstmt2.executeUpdate();
%>	
<script>
alert('Delete Success');
window.location.href='login.jsp';
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