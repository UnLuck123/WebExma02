<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<meta charset="UTF-8">
<%@ include file="dbconn.jsp" %>

<title>계정 목록</title>
</head>
<body>

<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from account";
    
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    int count=1;
	String gender;
    while (rs.next()) {
    	if(rs.getString(4).charAt(0) == '1'){
    		gender = "남성";
    	}else{
    		gender = "여성";
    	}
    	out.println(count + " id : " + rs.getString(1) + " pw : " + rs.getString(2) + " name : " + rs.getString(3) + " gender : " + gender);
    	count++;
    }               
		
%>	

</body>
</html>