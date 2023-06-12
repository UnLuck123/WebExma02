<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

<meta charset="UTF-8">
<%@ include file="../../dbconn.jsp" %>

<title>계정 목록</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
function chkName(){
	var dname = document.deptform.dname.value;
	var chkname = document.deptform.chkname.value;

	var dnum = document.deptform.dnum.value;
	var chknum = document.deptform.chknum.value;

	var regex = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
	
	
	if(!regex.test(dname)){
		if(dname == chkname && dnum == chknum){
			return true;
		}
		else{
			alert("중복체크를 해주세요");
			return false;
		}
	}else{
		alert("한글만 입력해주세요.");
		return false;
	}
}
</script>
<script>

function fn_overlapped(){
	   
	var _dname = $("#dname").val();
	var _dnum = $("#dnum").val();
	var chk;
	if(_dname==''){
	   	 alert("부서 이름를 입력하세요");
	   	 return;
	    }
	if(_dnum=='' && _dnum.length() >= 4){
	   	 alert("부서 코드를 입력하세요");
	   	 return;
	    }
	
	$.ajax({
	       type:"post",
	       async:false,  
	       url:"deptname_overlapped.jsp",
	       dataType:"json",
	       data: {dname:_dname},
	       success:function (data,textStatus){
	    	   
	          if(data.result=='false'){
	       	    alert("사용할 수 있는 부서 이름입니다.");
	       	    $('#btnOverlapped').prop("disabled", true);
	       	    $('#dname').prop("disabled", true);
	       	    $('#chkname').val(_dname);
	       	    chk = "true";
	          }else{
	        	  alert("중복된 부서 이름입니다.");
	        	  chk = "false";
	          }
	       },
	       error:function(data,textStatus){
	          alert("에러가 발생했습니다.");ㅣ
	       },
	       complete:function(data,textStatus){
	          //alert("작업을완료 했습니다");
	       }
	    });
	
    $.ajax({
       type:"post",
       async:false,  
       url:"deptnum_overlapped.jsp",
       dataType:"json",
       data: {dnum:_dnum},
       success:function (data,textStatus){
          if(data.result=='false'){
       	    alert("사용할 수 있는 부서 코드입니다.");
       	    if(chk === "true"){
       	    	$('#btnOverlapped').prop("disabled", true);
       	    	$('#dnum').prop("disabled", true);
       	    	$('#chknum').val(_dnum);
       	    }
          }else{
	       	  $('#btnOverlapped').prop("disabled", false);
	       	  $('#dname').prop("disabled", false);
        	  alert("중복된 부서 코드입니다.");
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
	
<script>

function deletedept(deptnum)
{
	alert("delete");
	
	window.location.replace("dept_delete.jsp?deptnum="+deptnum);
}
</script>

</head>
<body>
	
<h1>부서 관리</h1>

<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from dept";
    
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
	String gender;
    while (rs.next()) {
    	out.print(" 부서명 : " + rs.getString(1) + " | 부서 코드 : " + rs.getString(2));
    	out.print("<input type=button value=삭제 onClick=deletedept('"+rs.getString("deptnum")+"');><br>");		
    }
%>	
<br><br>
<form name="deptform" action=dept_make.jsp method=get onSubmit="return chkName();">
<label>부서 추가</label>
    <input type="text" name="dname" id=dname placeholder="부서명 ~ 10" maxlength='10' required>
    <input type="hidden" name="chkname"  id="chkname" />
-
    <input type="text" name="dnum" id=dnum placeholder="부서 코드 4" pattern="\d*" minlength='4' maxlength='4' required >
    <input type="hidden" name="chknum"  id="chknum" />
    <input type="button"  id="btnOverlapped" value="중복체크" onClick="fn_overlapped();" /><br>

<input type="submit" value="추가">
<input  type="button"  value="나가기" onclick="location='../adminmain.jsp'">

</form>
</body>
</html>