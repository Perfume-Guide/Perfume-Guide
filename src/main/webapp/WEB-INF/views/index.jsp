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

function brandAjax(brand) {
	var mBrand = brand //mId �ٲٸ� �� id �ҷ���
	
		$.ajax({
	        url:'api/perfumes/keyword'
	        , method : 'GET'
	        , contentType: "application/json"
	        , dataType: "text"
	        , data : 'brand='+mBrand
	        , success :  function(data){
	        	//$('#req1').text(data)
	        	//var json = JSON.parse(data).name //�ڿ� ������ �÷��� �ٲٸ� ��
	        	//$('#req1').text(json)
	        }
	    })
	
}
brandAjax("CK")

</script>

</head>
<body>
<span id="req1">fd</span></li>
<span id="req2">fd</span></li>
</body>
</html>