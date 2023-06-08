function execDaumPostcode() {
    daum.postcode.load(function(){
        new daum.Postcode({
            oncomplete: function(data) {
			  document.getElementById("postcode").value = data.zonecode;
			  document.getElementById("address").value = data.roadAddress;
            }
        }).open();
        	  document.getElementById("postcode").readOnly=true;       
			  document.getElementById("address").readOnly=true;      
    });
}
