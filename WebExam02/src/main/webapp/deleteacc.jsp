<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>계정 삭제</title>

</head>
<body>

<h1>비번 확인</h1>

<form name="pwdchk" action=deleteacc_ok.jsp method=post>
	
    <label>Password</label>
    <input type="password" name="pwd" id=pwd placeholder="password" minlength='5' maxlength='10' required ><br>
    
    
	<input type="submit" value="입력" >
	
	
    
</form>


		

</body>
</html>