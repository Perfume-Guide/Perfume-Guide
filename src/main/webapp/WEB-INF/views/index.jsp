<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
/* function reqAjax1() {
    $.ajax({
        url:'api/perfumes/keyword'
        , method : 'GET'
        , contentType: "application/json"
        , dataType: "text"
        , success :  function(resp){
           $('#req1').text(resp)
            
        }
    })	
} 
reqAjax1() */

function brandAjax(opt, brand) {
	var mBrand = brand //mBrand 바꾸면 그 brand 불러옴
		$.ajax({
	        url:'api/perfumes/search'
	        , method : 'GET'
	        , contentType: "application/json"
	        , dataType: "text"
	        , traditional: true
	        , data : {'searchOpt' : opt, 'brand=' : mBrand}
	        , success :  function(data){
				
	        	 var res = JSON.parse(data)
	        	
	        	for(var i=1; i<3; i++) {
	        		$('#req'+i).text('')
	        	}
	        	$.each(res, function(i, val) {
	        		//document.write(val.name)
	        		 
	        		$('#req'+i).text(val.name)
	        	}) 
	        	
	        }
	    })
	closeBrand()
}
brandAjax(brand, "CK")
</script>

</head>
<body>
<span id="req1">fd</span></li>
<span id="req2">fd</span></li>
</body>
</html>