<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>메인 페이지</title>
		
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<script>
	
	function logout(){
		<%
		session.removeAttribute("id");
		%>
		
		alert("로그아웃 되었습니다");
		location.href="login.jsp"
	}
	
	
	</script>

</head>
<body>

	<script>
    logout();
    </script>

		

</body>
</html>