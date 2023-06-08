<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<meta charset="UTF-8">
<%@ include file="../dbconn.jsp" %>

<title>계정 목록</title>
<script>
function updateMem(id)
{
	alert("update");	
	
	window.location.replace("./update.jsp?member_id="+id);
	
}

function deleteMem(id)
{
	alert("delete");
	
	window.location.replace("delete.jsp?member_id="+id);
}
</script>

</head>
<body>

<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from account";
    
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
	String gender;
    while (rs.next()) {
    	if(rs.getString(4).charAt(0) == '1'){
    		gender = "남성";
    	}else{
    		gender = "여성";
    	}
    	out.print(" id : " + rs.getString(1) + " name : " + rs.getString(3) + " gender : " + gender + " 어드민 여부 : " + rs.getString(22));
    	out.print("<input type=button value=계정수정 onClick=updateMem('"+rs.getString("member_id")+"');>");		
		out.print("<input type=button value=계정삭제 onClick=deleteMem('"+rs.getString("member_id")+"');><br><br>");			
    }               
		
%>	

</body>
</html>