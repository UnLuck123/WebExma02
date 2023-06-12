<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<meta charset="UTF-8">
<%@ include file="dbconn.jsp" %>

<title>계정 수정</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
	<script src = ./script/edit.js> </script>
	<script src = ./script/adress.js> </script>
</head>
<body>

<%
	String id = (String)session.getAttribute("id");	

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from account where member_id='" + id + "'";
    
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    
    rs.next();
%>	
	<h1>회원 정보 수정</h1>

<form name="accounteditform" action=accountedit_ok.jsp method=get onSubmit="return validateForm();">
    <label>ID</label>
    <input type="text" name="id" id=id placeholder="ID 5 ~ 8" value = "<%=rs.getString(1)%>" minlength='5' maxlength='8' required readonly>
    <input type="hidden" name="chkid"  id="chkid" value = "<%=rs.getString(1)%>" />
    <br>
    
    기존 비밀번호 <%=rs.getString(2)%><br>
    <label>Password</label>
    <input type="password" name="pwd" id=pwd placeholder="password 5 ~ 10" value = "<%=rs.getString(2)%>" minlength='5' maxlength='10' required ><br>
    <font size = 1px>must include a~z, 1~9, ~!@#$%^...</font><br>
    <label>CheckPassword</label>
    <input type="password" name="chkpwd" id=chkpwd placeholder="check password" value = "<%=rs.getString(2)%>" required ><br>
    
	<label>Name</label>
	<input type="text" name="name" id=name placeholder="한글이름" value = "<%=rs.getString(3)%>" minlength='2' maxlength='10' style="width:100px; readonly">
	
	<% if(rs.getString(4).equals("1")){ %>
	<p> Gender <br><input type="radio" id="man" name="gender" value=1 checked onclick="return(false);">
	<label for="man">man</label>
	<input type="radio" id="woman" name="gender" value=0 onclick="return(false);">
	<label for="woman">woman</label><br>
	<%}
	else{%>
	<p> Gender <br><input type="radio" id="man" name="gender" value=1 onclick="return(false);">
	<label for="man">man</label>
	<input type="radio" id="woman" name="gender" value=0 checked onclick="return(false);">
	<label for="woman">woman</label><br>
	<%} %>
	
	<input type="text" id=Frnn name="Frnn" placeholder="앞자리 6자" value = "<%=rs.getString(20)%>" pattern="\d*" minlength='6' maxlength='6' required readonly>
	<input type="password" id=Srnn name="Srnn" placeholder="뒷자리 7자" value = "<%=rs.getString(21)%>" pattern="\d*" minlength='7'maxlength='7' required readonly><br>

	<label>Tel</label>
	<select name="tel1" id=tel1>
	<option value="없음">없음</option>
	<option value="02">02</option>
	<option value="031">031</option>
	<option value="032">032</option>
	<option value="033">033</option>
	<option value="041">041</option>
	<option value="042">042</option>
	<option value="043">043</option>
	<option value="044">044</option>
	<option value="051">051</option>
	<option value="052">052</option>
	<option value="053">053</option>
	<option value="054">054</option>
	<option value="055">055</option>
	<option value="061">061</option>
	<option value="062">062</option>
	<option value="063">063</option>
	<option value="064">064</option>
	</select>
	-
	<input type="text" id=tel2 name="tel2" pattern="\d*" value = "<%=rs.getString(6)%>" minlength='4'maxlength='4' style="width:100px;">
	-
	<input type="text" id=tel3 name="tel3" pattern="\d*" value = "<%=rs.getString(7)%>" minlength='4'maxlength='4' style="width:100px;"><br>
	
	<label>HP</label>
	<select name="HP1" id=HP1>
	<option value="010">010</option>
	</select>
	-
	<input type="text" id=HP2 name="HP2" placeholder="필수 입력" pattern="\d*" value = "<%=rs.getString(10)%>" minlength='4'maxlength='4' style="width:100px;" required readonly>
	-
	<input type="text" id=HP3 name="HP3" placeholder="필수 입력" pattern="\d*" value = "<%=rs.getString(11)%>" minlength='4'maxlength='4' style="width:100px;" required readonly><br>
	
	<% if(rs.getString(12).equals("동의")) { %>
		<input type="checkbox" id=snssts name="snssts" value="동의" checked> sns 수신 동의<br>
	<% }else{ %>
		<input type="checkbox" id=snssts name="snssts" value="동의"> sns 수신 동의<br>
	<% } %>
	<input type="hidden" id="hsnssts" name="hsnssts">
	
	<input type="text" id=email1 name="email1" placeholder="필수 입력" value = "<%=rs.getString(14)%>" maxlength="8" required > @ 
	<input type="text" id=email2 name="email2" placeholder="필수 입력" value = "<%=rs.getString(15)%>" maxlength="15" required >
	
	<select name="domain" id=domain onchange="setEmailDomain(this.value); return false;">
    <option value=""disabled selected>-선택-</option>
    <option value="">직접입력</option>
    <option value="naver.com">naver.com</option>
    <option value="gmail.com">gmail.com</option>
    <option value="hanmail.net">hanmail.net</option>
    <option value="hotmail.com">hotmail.com</option>
    <option value="korea.com">korea.com</option>
    <option value="nate.com">nate.com</option>
    <option value="yahoo.com">yahoo.com</option>
	</select><br>
	
	<% if(rs.getString(12).equals("동의")) { %>
	<input type="checkbox" id=emailsts name="emailsts" value="동의" checked> email 수신 동의<br>
	<% }else{ %>
	<input type="checkbox" id=emailsts name="emailsts" value="동의"> email 수신 동의<br>
	<% } %>
	<input type="hidden" id="hemailsts" name="hemailsts">
	
	
	<label>Adress</label><br>
	<input type="text" id=postcode name="postcode" placeholder="우편번호 5자리" pattern="\d*" value = "<%=rs.getString(17)%>" maxlength='5' required >
	<button type="button" onclick="execDaumPostcode()">우편번호 찾기</button><br>
	<input type="text" id=address name="adress" placeholder="도로명 주소" value = "<%=rs.getString(18)%>" required ><br>
	<input type="text" id=detailadress name="detailadress" placeholder="상세주소" value = "<%=rs.getString(19)%>" required ><br>
	
	<label>type</label>
	<select name="type" id=type required>
	<option value=""disabled selected>-선택-</option>
	<%
	PreparedStatement pstmt2 = null;
	ResultSet rs2 = null;
	
	String sql2 = "select * from dept";
    
    pstmt2 = conn.prepareStatement(sql2);
    rs2 = pstmt2.executeQuery();
	String gender;
    while (rs2.next()) {
    	if(rs.getString(23).equals(rs2.getString(2))){
        	out.print("<option value='"+ rs2.getString("deptnum") +"' selected >"+ rs2.getString("deptname") +"</option>");
    	}else{
    		out.print("<option value='"+ rs2.getString("deptnum") +"'>"+ rs2.getString("deptname") +"</option>");
    	}
    }
    %>
	</select><br>
	
	<input type="submit" value="수정 완료" >
	
    
</form>
	
	
	
</body>
</html>