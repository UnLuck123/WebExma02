	function checkSpace(str){
		if(str.search(/\s/) != -1){
			return true;
		}
		else {
			return false;
		}
	}
	
	function checkPattern(str){
		var pattern1 = /[0-9]/;
		var pattern2 = /[a-zA-Z]/;
		var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;

		if(!pattern1.test(str) || !pattern2.test(str) || !pattern3.test(str)){
			return true;
		}
		else {
			return false;
		}
	}
	
	function checkchar(str){
		var char = /[~!@#$%^&*()_+|<>?:{}]/;
		
		if(char.test(str)){
			return false;
		}
		else{
			return true;
		}
	}
	
	function idValidation(id,chkid){
		alert(id);
					
		if(id == chkid){
			return true;
		}
		else{
			alert("id 중복체크를 해주세요");
			return false;
		}
	}
	
	
	function pwdValidation(pwd,chkpwd){
		alert(pwd+":" + chkpwd)
		
		if(checkPattern(pwd) == false){
			if (pwd == chkpwd)
			{
				return true;
			}else{
			alert("패스워드가 동일하지 않습니다!");
			document.Registform.pwd.focus();
			return false;
			}
		}
		else{
			alert("패스워드는 영문 + 숫자 + 특수문자가 1개이상씩 포함되야합니다.");
			return false;
		}
	
	}
	
	function nameValidation(name){
		var regex = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
		
		if(!regex.test(name)){
			return true;
		}else{
			return false;
		}
	}
	
	function rnnValidation(Frnn,Srnn){
		
		var CFrnn = parseInt(Frnn/100000);
		var CSrnn = parseInt(Srnn/1000000);
		
		if(CFrnn == 9 && (CSrnn >= 1 && CSrnn <= 2)){
			return true;
		}
		else if(CFrnn == 0 &&(CSrnn >= 3 && CSrnn <= 4)){
			return true;
		}
		else{
			alert("잘못된 주민번호입니다.");
			return false;
		}
	}
	
	function genderValidation(gender,Srnn){
		
		var GSrnn = (parseInt(Srnn / 1000000))%2;
		
		if(gender == GSrnn){
			
			return true;
			
		}
		else{
			
			alert("주민번호상의 성별과 선택하신 성별이 동일하지 않습니다.");
			
			return false;
		}
	}
	
	function emailValidation(email1,email2){
		var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var email = email1 +"@"+ email2;
		
		alert(email);
		
		if(!regex.test(email)){
      		alert("이메일을 형식에 맞게 입력해주세요.");
    		return false;
    	}
    	else{
			return true;
		}
	}
	
	function adressValidation(postcode, adress, detailadress){
		if(checkchar(postcode) && checkchar(adress) && checkchar(detailadress)){
			return true;
		}
		else{
			alert("주소에는 문자 + 숫자만 입력해주세요.");
			return false;
		}
	}
	
	function setEmailDomain(domain){
        document.getElementById("email2").value = domain;
    }
    
	
	function validateForm() {
    	console.log('확인');
    	
    	var id = document.Registform.id.value;
    	var chkid = document.Registform.chkid.value;
    	var pwd = document.Registform.pwd.value;    	
    	var chkpwd = document.Registform.chkpwd.value;
    	var name = document.Registform.name.value;
    	var gender = document.Registform.gender.value;
    	var Frnn = document.Registform.Frnn.value;
    	var Srnn = document.Registform.Srnn.value;
    	var email1 = document.Registform.email1.value;
    	var email2 = document.Registform.email2.value;
    	var postcode = document.Registform.postcode.value;
    	var adress = document.Registform.adress.value;
    	var detailadress = document.Registform.detailadress.value;
		

		
		alert('pwdValidation true');

    	if(idValidation(id,chkid))
    	{
    		if(pwdValidation(pwd,chkpwd))
			{
    			alert('pwdValidation true');
    			
    			if(nameValidation(name))
    			{
					alert('nameValidation true');
					
	    			if(genderValidation(gender,Srnn))
	    			{
	        			alert('genderValidation true');
	        			
	        			if(rnnValidation(Frnn,Srnn)){
	        				
	        				alert('rnnValidation true');
	        				
	        				if(emailValidation(email1,email2)){
								
								alert('emailValidation true');
								
								if(adressValidation(postcode,adress,detailadress)){
									
									alert('adressValidation true');
									
									return true;
								}
								else{
									alert('adressValidation true');
									
									return false
								}
							}
							else{
								alert('emailValidation false');
	        				
	        					return false;
							}
	        			}
	        			else{
	        				alert('rnnValidation false');
	        				
	        				return false;
	        			}
	    			}else{
	    				alert('genderValidation false');
	    				
	    				return false;
	    			}
	    		}else{
					alert('nameValidation false');
	    				
	    			return false;
				}
    			return true;
			}else { 
				alert('pwdValidation false');
				
				return false;
				}
    		
    		alert('idValidation true');
    		return true;
    		
    	}else { 
    		alert('idValidation false');
    		return false;}
    	
    	alert('validateForm true');
		return true;
    }
    
    