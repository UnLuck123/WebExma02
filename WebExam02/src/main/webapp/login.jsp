<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>로그인 페이지</title>
		
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<script>

	</script>
</head>
<body>

<h1>로그인</h1>

<form name="Loginform" action=login_ok.jsp method=post>
	
	<label>ID</label>
    <input type="text" name="id" id=id placeholder="ID" minlength='5' maxlength='8' required >
    <br>
    
    <label>Password</label>
    <input type="password" name="pwd" id=pwd placeholder="password" minlength='5' maxlength='10' required ><br>
    
    
	<input type="submit" value="로그인" >
	<input  type="button"  value="회원가입"  onclick="location='regist.jsp'">
	
    
	
    
</form>


		

</body>
</html>