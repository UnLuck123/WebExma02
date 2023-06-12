<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원가입 페이지</title>
	<%@ include file="dbconn.jsp" %>
		
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
	<script src = ./script/regist.js> </script>
	<script src = ./script/adress.js> </script>
	<script>

	function fn_overlapped(){
		   
		var _id = $("#id").val();

		if(_id==''){
		   	 alert("ID를 입력하세요");
		   	 return;
		    }
		
		var regex1 = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]|[~!@#$%^&*()_+|<>?:{}]/g;
		var regex2 = /[a-zA-Z]/;
		
		if(checkSpace(_id) == false){
			if(!regex1.test(_id) && regex2.test(_id)){
				
			}
			else{
				alert('id는 영문 + 숫자 조합으로만 입력해주세요.');
				return false;
			}
		}
		else{
			alert('id는 영문 + 숫자 조합으로만 입력해주세요.(공백 제외)');
			return false;
		}
		
	    $.ajax({
	       type:"post",
	       async:false,  
	       url:"overlapped.jsp",
	       dataType:"json",
	       data: {id:_id},
	       success:function (data,textStatus){
	    	   
	          if(data.result=='false'){
	       	    alert("사용할 수 있는 ID입니다.");
	       	    $('#btnOverlapped').prop("disabled", true);
	       	    $('#id').prop("disabled", true);
	       	    $('#chkid').val(_id);
	          }else{
	        	  alert("사용할 수 없는 ID입니다.");
	          }
	       },
	       error:function(data,textStatus){
	          alert("에러가 발생했습니다.");ㅣ
	       },
	       complete:function(data,textStatus){
	          //alert("작업을완료 했습니다");
	       }
	    });
	 }	
	</script>
	
</head>
<body>

<h1>회원가입</h1>

<form name="Registform" action=regist_ok.jsp method=get onSubmit="return validateForm();">

    <label>ID</label>
    <input type="text" name="id" id=id placeholder="ID 5 ~ 8" minlength='5' maxlength='8' required >
    <input type="hidden" name="chkid"  id="chkid" />
    <input type="button"  id="btnOverlapped" value="중복체크" onClick="fn_overlapped();" /> 
    <br>
    
    <label>Password</label>
    <input type="password" name="pwd" id=pwd placeholder="password 5 ~ 10" minlength='5' maxlength='10' required ><br>
    <font size = 1px>must include a~z, 1~9, ~!@#$%^...</font><br>
    <label>CheckPassword</label>
    <input type="password" name="chkpwd" id=chkpwd placeholder="check password" required ><br>
    
	<label>Name</label>
	<input type="text" name="name" id=name placeholder="한글이름" minlength='2' maxlength='10' style="width:100px;" required >
	
	<p> Gender <br><input type="radio" id="man" name="gender" value=1 checked>
	<label for="man">man</label>
	<input type="radio" id="woman" name="gender" value=0>
	<label for="woman">woman</label><br>
	
	<input type="text" id=Frnn name="Frnn" placeholder="앞자리 6자" pattern="\d*" minlength='6' maxlength='6' required >
	<input type="password" id=Srnn name="Srnn" placeholder="뒷자리 7자" pattern="\d*" minlength='7'maxlength='7' required ><br>
	
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
	<input type="text" id=tel2 name="tel2" pattern="\d*" value='' minlength='3'maxlength='4' style="width:100px;">
	-
	<input type="text" id=tel3 name="tel3" pattern="\d*" value='' minlength='4'maxlength='4' style="width:100px;"><br>
	
	<label>HP</label>
	<select name="hp1" id=hp1>
	<option value="010">010</option>
	</select>
	-
	<input type="text" id=hp2 name="hp2" placeholder="필수 입력" pattern="\d*" minlength='4'maxlength='4' style="width:100px;" required >
	-
	<input type="text" id=hp3 name="hp3" placeholder="필수 입력" pattern="\d*" minlength='4'maxlength='4' style="width:100px;" required ><br>
	<input type="checkbox" id=snssts name="snssts" value="동의" checked> sns 수신 동의<br>
	
	<input type="text" id=email1 name="email1" placeholder="필수 입력" maxlength="8" required > @ 
	<input type="text" id=email2 name="email2" placeholder="필수 입력" maxlength="15" required >
	
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
	<input type="checkbox" id=emailsts name="emailsts" value="동의" checked> email 수신 동의<br>
	
	<label>Adress</label><br>
	<input type="text" id=postcode name="postcode" placeholder="우편번호 5자리" pattern="\d*" maxlength='5' required >
	<button type="button" onclick="execDaumPostcode()">우편번호 찾기</button><br>
	<input type="text" id=address name="adress" placeholder="도로명 주소" required ><br>
	<input type="text" id=detailadress name="detailadress" placeholder="상세주소" required ><br>
	
	<label>type</label>
	<select name="type" id=type required>
	<option value=""disabled selected>-선택-</option>
	<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from dept";
    
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
	String gender;
    while (rs.next()) {    	
    	out.print("<option value='"+ rs.getString("deptnum") +"'>"+ rs.getString("deptname") +"</option>");		
    }
    %>
	</select><br>
	
	<input type="submit" value="가입" >
	<input  type="reset"  value="다시입력">
	
    
</form>


		

</body>
</html>