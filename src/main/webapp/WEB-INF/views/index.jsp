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
        url:'api/perfumes/test'
        , method : 'GET'
        , contentType: "application/json"
        , dataType: "text"
        , success :  function(resp){
           $('#req1').text(resp)
            
        }
    })	
} */

function reqAjax1() {
	var mId = 2
    $.ajax({
        url:'api/perfumes/'+mId
        , method : 'GET'
        , contentType: "application/json"
        , dataType: "text"
        , data : 'id='+mId
        , success :  function(data){
        	var json = JSON.parse(data)
        	var str = JSON.stringify(json.name)
           $('#req1').text(str)
            
        }
    })	
}
reqAjax1()
</script>

</head>
<body>
<span id="req1"></span></li>

</body>
</html>