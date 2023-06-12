<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.simple.JSONObject"%>

<%@ include file="../../dbconn.jsp" %>

<%
	String dname = request.getParameter("dname");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT * FROM DEPT WHERE DEPTNAME = '"+dname+"'";
	
	pstmt = conn.prepareStatement(sql);


	rs = pstmt.executeQuery();
	
	
	response.setContentType("application/json");
	PrintWriter outt = response.getWriter();
	
	JSONObject resultObj = new JSONObject();
	
	if(rs.next())
	{
		resultObj.put("result","true");
	}
	else
	{
		resultObj.put("result","false");
	}
	
	outt.print(resultObj.toString());
	
%>
