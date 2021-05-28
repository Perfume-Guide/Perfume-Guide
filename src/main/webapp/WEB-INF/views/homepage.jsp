<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--모바일 우선-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--swiper 연동-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/swiper_bundle.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/swiper_bundle.js"></script>
    <!--js 연동-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/search.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dropdown.js?ver=2"></script>
   
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>

<script>

function detailAjax(brand, name) {
    var mBrand = brand //mBrand 바꾸면 그 brand 불러옴
    var mName = name //mName 바꾸면 그 name 불러옴
    $.ajax({
        url: 'api/perfumes/keyword/',
        method: 'GET',
        contentType: "application/json",
        dataType: "text",
        traditional: true,
        data: 'brand=' + mBrand + '&name=' + mName,
        success: function(data) {

            var res = JSON.parse(data)

            $("#prdList_wrap").html('') // 초기화 (리스트 비우기)

            $.each(res, function(i, val) {
                //document.write(val.name)
                $(".title_t").text(val.brand + " " + val.name)
                $("#prdList_wrap").append('<ul id="prdList" class="prdList">' +
                	'<img src="${pageContext.request.contextPath}/resources/image/products/'+val.brand+'_'+val.name+'.jpg" alt="샘플사진">' +
                    '</ul>')
            })

        }
    })
}

 
 function brandAjax(brand) {
     var mBrand = brand //mBrand 바꾸면 그 brand 불러옴
     $.ajax({
         url: '${pageContext.request.contextPath}/api/perfumes/keyword/',
         method: 'GET',
         contentType: "application/json",
         dataType: "text",
         traditional: true,
         data: 'brand=' + mBrand,
         success: function(data) {

             var res = JSON.parse(data)
             var prdList_num = -1
             
             $("#prdList_wrap").html('') // 초기화 (리스트 비우기)
			
             $.each(res, function(i, val) {
            	 $(".title_t").text(val.brand)
                 //document.write(val.name)
                 if (i % 4 == 0) { // 한줄에 네 개씩
                     prdList_num++
                     $("#prdList_wrap").append('<ul id="prdList' + prdList_num + '" class="prdList"></ul>')
                 }
                 $("#prdList" + prdList_num).append('<li style="width: 232px; margin-right: 30px;">' +
                         '<div class="box">' +
                         '<div class="thumbnail">' +
                         '<!--향수 이미지-->' +
                         '<div class="prdImg">' +
                         '<a href="javascript:void(0);" onclick="detailAjax(&#39;' + val.brand + '&#39;, &#39;' + val.name + '&#39;)" class="_evt_tracker">' +                        
                         '<img src="${pageContext.request.contextPath}/resources/image/products/'+val.brand+'_'+val.name+'.jpg" alt="샘플사진">' +                          
                         '</a>' +
                         '</div>' +
                         '</div>' +
                         '<div class="description">' +
                         '<!--향수 이름-->' +
                         '<div class="name">' +
                         '<a href="javascript:void(0);" onclick="detailAjax(&#39;' + val.brand + '&#39;, &#39;' + val.name + '&#39;)" class="_evt_tracker">' +
                         '<span style="font-size: 15px;color: #111111;">' + val.name + '</span>' +
                         '<!-- ajax 변경한 부분 -->' +
                         '<span id="req0"></span>' +
                         '</a>' +
                         '</div>' +
                         '<!--대표계열-->' +
                         '<ul class="spec">' +
                         '<li rel="계열">' +
                         '<span style="font-size: 14px;color: #999999;">' + val.accord + '</span>' +
                         '</li>' +
                         '</ul>' +
                         '</div>' +
                         '</div>' +
                         '</li>')
                     // $('#req' + i).text(val.name)
             })

         } 
     })
     closeBrand()
 }

 function genderAjax(gender) {
     var mGender = gender //mBrand 바꾸면 그 brand 불러옴
     $.ajax({
         url: '${pageContext.request.contextPath}/api/perfumes/keyword/',
         method: 'GET',
         contentType: "application/json",
         dataType: "text",
         traditional: true,
         data: 'gender=' + mGender,
         success: function(data) {

             var res = JSON.parse(data)
             var prdList_num = -1
             
             $("#prdList_wrap").html('') // 초기화 (리스트 비우기)
			
             $.each(res, function(i, val) {
            	 $(".title_t").text(val.gender)
                 //document.write(val.name)
                 if (i % 4 == 0) { // 한줄에 네 개씩
                     prdList_num++
                     $("#prdList_wrap").append('<ul id="prdList' + prdList_num + '" class="prdList"></ul>')
                 }
                 $("#prdList" + prdList_num).append('<li style="width: 232px; margin-right: 30px;">' +
                         '<div class="box">' +
                         '<div class="thumbnail">' +
                         '<!--향수 이미지-->' +
                         '<div class="prdImg">' +
                         '<a href="javascript:void(0);" onclick="detailAjax(&#39;' + val.brand + '&#39;, &#39;' + val.name + '&#39;)" class="_evt_tracker">' +
                         '<img src="${pageContext.request.contextPath}/resources/image/products/'+val.brand+'_'+val.name+'.jpg" alt="샘플사진">' +
                         '</a>' +
                         '</div>' +
                         '</div>' +
                         '<div class="description">' +
                         '<!--향수 이름-->' +
                         '<div class="name">' +
                         '<a href="javascript:void(0);" onclick="detailAjax(&#39;' + val.brand + '&#39;, &#39;' + val.name + '&#39;)" class="_evt_tracker">' +
                         '<span style="font-size: 15px;color: #111111;">' + val.name + '</span>' +
                         '<!-- ajax 변경한 부분 -->' +
                         '<span id="req0"></span>' +
                         '</a>' +
                         '</div>' +
                         '<!--대표계열-->' +
                         '<ul class="spec">' +
                         '<li rel="계열">' +
                         '<span style="font-size: 14px;color: #999999;">' + val.accord + '</span>' +
                         '</li>' +
                         '</ul>' +
                         '</div>' +
                         '</div>' +
                         '</li>')
                     // $('#req' + i).text(val.name)
             })

         } 
     })
     closeBrand()
 }
 
 function accordAjax(accord) {
     var mAccord = accord //mBrand 바꾸면 그 brand 불러옴
     $.ajax({
         url: '${pageContext.request.contextPath}/api/perfumes/keyword/',
         method: 'GET',
         contentType: "application/json",
         dataType: "text",
         traditional: true,
         data: 'accord=' + mAccord,
         success: function(data) {

        	 if(!data) {
        		 closeBrand();
        		 return false;
        	 }
             var res = JSON.parse(data)
             var prdList_num = -1
             
             $("#prdList_wrap").html('') // 초기화 (리스트 비우기)
			
             $.each(res, function(i, val) {
            	 $(".title_t").text(val.accord)
                 //document.write(val.name)
                 if (i % 4 == 0) { // 한줄에 네 개씩
                     prdList_num++
                     $("#prdList_wrap").append('<ul id="prdList' + prdList_num + '" class="prdList"></ul>')
                 }
                 $("#prdList" + prdList_num).append('<li style="width: 232px; margin-right: 30px;">' +
                         '<div class="box">' +
                         '<div class="thumbnail">' +
                         '<!--향수 이미지-->' +
                         '<div class="prdImg">' +
                         '<a href="javascript:void(0);" onclick="detailAjax(&#39;' + val.brand + '&#39;, &#39;' + val.name + '&#39;)" class="_evt_tracker">' +
                         '<img src="${pageContext.request.contextPath}/resources/image/products/'+val.brand+'_'+val.name+'.jpg" alt="샘플사진">' +
                         '</a>' +
                         '</div>' +
                         '</div>' +
                         '<div class="description">' +
                         '<!--향수 이름-->' +
                         '<div class="name">' +
                         '<a href="javascript:void(0);" onclick="detailAjax(&#39;' + val.brand + '&#39;, &#39;' + val.name + '&#39;)" class="_evt_tracker">' +
                         '<span style="font-size: 15px;color: #111111;">' + val.name + '</span>' +
                         '<!-- ajax 변경한 부분 -->' +
                         '<span id="req0"></span>' +
                         '</a>' +
                         '</div>' +
                         '<!--대표계열-->' +
                         '<ul class="spec">' +
                         '<li rel="계열">' +
                         '<span style="font-size: 14px;color: #999999;">' + val.accord + '</span>' +
                         '</li>' +
                         '</ul>' +
                         '</div>' +
                         '</div>' +
                         '</li>')
                     // $('#req' + i).text(val.name)
             })

         }
     })
     closeBrand()
 }
 
 function powerAjax(power) {
     var mPower = power //mBrand 바꾸면 그 brand 불러옴
     $.ajax({
         url: '${pageContext.request.contextPath}/api/perfumes/keyword/',
         method: 'GET',
         contentType: "application/json",
         dataType: "text",
         traditional: true,
         data: 'power=' + mPower,
         success: function(data) {

        	 if(!data) {
        		 closeBrand();
        		 return false;
        	 }
             var res = JSON.parse(data)
             var prdList_num = -1
             
             $("#prdList_wrap").html('') // 초기화 (리스트 비우기)
			
             $.each(res, function(i, val) {
            	 $(".title_t").text(val.power)
                 //document.write(val.name)
                 if (i % 4 == 0) { // 한줄에 네 개씩
                     prdList_num++
                     $("#prdList_wrap").append('<ul id="prdList' + prdList_num + '" class="prdList"></ul>')
                 }
                 $("#prdList" + prdList_num).append('<li style="width: 232px; margin-right: 30px;">' +
                         '<div class="box">' +
                         '<div class="thumbnail">' +
                         '<!--향수 이미지-->' +
                         '<div class="prdImg">' +
                         '<a href="javascript:void(0);" onclick="detailAjax(&#39;' + val.brand + '&#39;, &#39;' + val.name + '&#39;)" class="_evt_tracker">' +
                         '<img src="${pageContext.request.contextPath}/resources/image/products/'+val.brand+'_'+val.name+'.jpg" alt="샘플사진">' +
                         '</a>' +
                         '</div>' +
                         '</div>' +
                         '<div class="description">' +
                         '<!--향수 이름-->' +
                         '<div class="name">' +
                         '<a href="javascript:void(0);" onclick="detailAjax(&#39;' + val.brand + '&#39;, &#39;' + val.name + '&#39;)" class="_evt_tracker">' +
                         '<span style="font-size: 15px;color: #111111;">' + val.name + '</span>' +
                         '<!-- ajax 변경한 부분 -->' +
                         '<span id="req0"></span>' +
                         '</a>' +
                         '</div>' +
                         '<!--대표계열-->' +
                         '<ul class="spec">' +
                         '<li rel="계열">' +
                         '<span style="font-size: 14px;color: #999999;">' + val.accord + '</span>' +
                         '</li>' +
                         '</ul>' +
                         '</div>' +
                         '</div>' +
                         '</li>')
                     // $('#req' + i).text(val.name)
             })

         }
     })
     closeBrand()
 }
 
function brandSearch() {
	
	var mBrand = $('#keyword1').val() //mBrand 바꾸면 그 brand 불러옴
	var mOption = $(':input:radio[name=searchOpt]:checked').val()
		$.ajax({
	        url:'${pageContext.request.contextPath}/api/perfumes/search?searchOpt=' + mOption
	        , method : 'GET'
	        , contentType: "application/json"
	        , dataType: "text"
	        , traditional: true
	        , data : 'keyword=' + mBrand
	        , success :  function(data){

	             var res = JSON.parse(data)
	             var prdList_num = -1

	             $("#prdList_wrap").html('') // 초기화 (리스트 비우기)
					$.each(res, function(i, val) {
						$(".title_t").text(val.brand)
	                 if (i % 4 == 0) { // 한줄에 네 개씩
	                     prdList_num++
	                     $("#prdList_wrap").append('<ul id="prdList' + prdList_num + '" class="prdList"></ul>')
	                 }
	                 $("#prdList" + prdList_num).append('<li style="width: 232px; margin-right: 30px;">' +
	                         '<div class="box">' +
	                         '<div class="thumbnail">' +
	                         '<!--향수 이미지-->' +
	                         '<div class="prdImg">' +
	                         '<a href="javascript:void(0);" onclick="detailAjax(&#39;' + val.brand + '&#39;, &#39;' + val.name + '&#39;)" class="_evt_tracker">' +
	                         '<img src="${pageContext.request.contextPath}/resources/image/products/'+val.brand+'_'+val.name+'.jpg" alt="샘플사진">' +
	                         '</a>' +
	                         '</div>' +
	                         '</div>' +
	                         '<div class="description">' +
	                         '<!--향수 이름-->' +
	                         '<div class="name">' +
	                         '<a href="javascript:void(0);" onclick="detailAjax(&#39;' + val.brand + '&#39;, &#39;' + val.name + '&#39;)" class="_evt_tracker">' +
	                         '<span style="font-size: 15px;color: #111111;">' + val.name + '</span>' +
	                         '<!-- ajax 변경한 부분 -->' +
	                         '<span id="req0"></span>' +
	                         '</a>' +
	                         '</div>' +
	                         '<!--대표계열-->' +
	                         '<ul class="spec">' +
	                         '<li rel="계열">' +
	                         '<span style="font-size: 14px;color: #999999;">' + val.accord + '</span>' +
	                         '</li>' +
	                         '</ul>' +
	                         '</div>' +
	                         '</div>' +
	                         '</li>')
	                     
	             })

	         }
	     })
	     closeBrand()
}

</script>
   
    <!--css 연동-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/homepage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header_sector1.css?ver=2">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header_sector2.css?ver=2">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/container.css">
    <title>퍼퓸가이드</title>
</head>

<body>
    <div id="wrap">
        <!--헤더(최상단)-->
        <div id="header">
            <!--헤더 섹터1-->
            <div class="sector1">
                <!--상단 로고 영역-->
                <div class="banner_logo">
                    <a href="./">
                        <!--로고 width 400px - 500px proper (./css/homepage.css)-->
                        <img id="banner_logo" src="${pageContext.request.contextPath}/resources/image/perfume_guide_title_banner.png" alt="banner_logo">
                    </a>
                </div>
                <!--좌측 메뉴 영역(검색 부분)-->
                <div class="left_menu">
                    <div class="search_menu">
                        <li class="search_perfume">
                            <!--검색 아이콘 클릭시 openNav() 실행 (./js/search.js)-->
                            <a href="#none" onclick="openNav()">
                                <img src="${pageContext.request.contextPath}/resources/image/search_icon.png" alt="search_icon">
                            </a>
                        </li>
                    </div>
                </div>
                <!--우측 메뉴 영역(로그인 부분)-->
                <div class="right_menu">

                </div>
            </div>
            <!--헤더 섹터2-->
            <div class="sector2 cboth" id="category_top">
                <div class="inner">
                    <!--상단 카테고리 출력-->
                    <div class="top_category">
                        <hr>
                        <!--상단 카테고리 수동 및 자동 출력-->
                        <div class="category_menu">
                            <ul class="top_menu">
                                <div id="main_category">
                                    <div id="slide_category_list">
                                        <!--상단 카테고리 자동 출력-->
                                        <div class="category_brand">
                                            <div class="open">
                                                <!--브랜드별 클릭시 브랜드 전체보기 창 출력-->
                                                <a href="#" onclick="openBrand()">브랜드별</a>
                                                <div id="myBrand" id="brand_sort_outer" class="slide_brand" style="top:-600px; opacity: 0; height: 0px;">
                                                    <ul class="brand_sort">
                                                        <h1 class="brand_sort_title">Brands
                                                            <a href="#" class="closebrand" onclick="closeBrand()">
                                                                <img src="${pageContext.request.contextPath}/resources/image/close_btn.png" alt="닫기">
                                                            </a>
                                                        </h1>
                                                        <!--내부 스크롤 영역-->
                                                        <div class="scroll_wrapper scrollbar_inner" style="position: relative;">
                                                            <li class="scrollbar_inner scroll_content" style="height: auto; margin-bottom: 0px; margin-right: 0px; max-height: 600px;">
                                                                <!--브랜드명 클릭시 listpage.html로 이동(./listpage.html)-->
                                                                <!--.jsp로 변경 후 listpage.html에 DB값 호출-->
                                                                <div class="brand_link">
                                                   <div class="brand_group" style="display: block;">
                                                      <h1>C</h1>
                                                      <div class="brand" char="C" style="display: block;">
                                                         <a href="#" onclick="brandAjax('CK');closeBrand();">CK</a>
                                                      </div>
                                                   </div>
                                                   <div class="brand_group" style="display: block;">
                                                      <h1>ㄱ</h1>
                                                      <div class="brand" char="ㄱ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('게스');closeBrand();">게스</a>
                                                      </div>
                                                      <div class="brand" char="ㄱ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('겐조');closeBrand();">겐조</a>
                                                      </div>
                                                      <div class="brand" char="ㄱ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('구찌');closeBrand();">구찌</a>
                                                      </div>
                                                      <div class="brand" char="ㄱ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('끌로에');closeBrand();">끌로에</a>
                                                      </div>
                                                   </div>
                                                   <div class="brand_group" style="display: block;">
                                                      <h1>ㄴ</h1>
                                                      <div class="brand" char="ㄴ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('나르시소 로드리게즈');closeBrand();">나르시소 로드리게즈</a>
                                                      </div>
                                                   </div>                                                                        
                                                   <div class="brand_group" style="display: block;">
                                                      <h1>ㄷ</h1>
                                                      <div class="brand" char="ㄷ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('돌체앤가바나');closeBrand();">돌체앤가바나</a>
                                                      </div>
                                                      <div class="brand" char="ㄷ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('디올');closeBrand();">디올</a>
                                                      </div>
                                                      <div class="brand" char="ㄷ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('딥디크');closeBrand();">딥디크</a>
                                                      </div>
                                                   </div>
                                                   <div class="brand_group" style="display: block;">
                                                      <h1>ㄹ</h1>
                                                      <div class="brand" char="ㄹ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('랄프로렌');closeBrand();">랄프로렌</a>
                                                      </div>
                                                      <div class="brand" char="ㄹ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('랑방');closeBrand();">랑방</a>
                                                      </div>
                                                   </div>
                                                   <div class="brand_group" style="display: block;">
                                                      <h1>ㅁ</h1>
                                                      <div class="brand" char="ㅁ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('마크제이콥스');closeBrand();">마크제이콥스</a>
                                                      </div>
                                                      <div class="brand" char="ㅁ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('메르세데스 벤츠');closeBrand();">메르세데스 벤츠</a>
                                                      </div>
                                                      <div class="brand" char="ㅁ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('몽블랑');closeBrand();">몽블랑</a>
                                                      </div>
                                                   </div>
                                                   <div class="brand_group" style="display: block;">
                                                      <h1>ㅂ</h1>
                                                      <div class="brand" char="ㅂ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('바이레도');closeBrand();">바이레도</a>
                                                      </div>
                                                      <div class="brand" char="ㅂ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('발렌티노');closeBrand();">발렌티노</a>
                                                      </div>
                                                      <div class="brand" char="ㅂ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('버버리');closeBrand();">버버리</a>
                                                      </div>
                                                      <div class="brand" char="ㅂ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('베르사체');closeBrand();">베르사체</a>
                                                      </div>
                                                      <div class="brand" char="ㅂ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('분더샵');closeBrand();">분더샵</a>
                                                      </div>
                                                      <div class="brand" char="ㅂ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('불가리');closeBrand();">불가리</a>
                                                      </div>
                                                   </div>
                                                   <div class="brand_group" style="display: block;">
                                                      <h1>ㅅ</h1>
                                                      <div class="brand" char="ㅅ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('산타마리아노벨라');closeBrand();">산타마리아노벨라</a>
                                                      </div>
                                                      <div class="brand" char="ㅅ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('샤넬');closeBrand();">샤넬</a>
                                                      </div>
                                                      <div class="brand" char="ㅅ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('쇼파드');closeBrand();">쇼파드</a>
                                                      </div>
                                                   </div>
                                                   <div class="brand_group" style="display: block;">
                                                      <h1>ㅇ</h1>
                                                      <div class="brand" char="ㅇ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('아리아나그란데');closeBrand();">아리아나그란데</a>
                                                      </div>
                                                      <div class="brand" char="ㅇ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('아베크롬비');closeBrand();">아베크롬비</a>
                                                      </div>
                                                      <div class="brand" char="ㅇ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('아쿠아 디 파르마');closeBrand();">아쿠아 디 파르마</a>
                                                      </div>
                                                      <div class="brand" char="ㅇ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('안나수이');closeBrand();">안나수이</a>
                                                      </div>
                                                      <div class="brand" char="ㅇ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('에르메스');closeBrand();">에르메스</a>
                                                      </div>
                                                      <div class="brand" char="ㅇ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('엘리자베스아덴');closeBrand();">엘리자베스아덴</a>
                                                      </div>
                                                      <div class="brand" char="ㅇ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('입생로랑');closeBrand();">입생로랑</a>
                                                      </div>
                                                   </div>
                                                   <div class="brand_group" style="display: block;">
                                                      <h1>ㅈ</h1>
                                                      <div class="brand" char="ㅈ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('조말론');closeBrand();">조말론</a>
                                                      </div>
                                                      <div class="brand" char="ㅈ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('존바바토스');closeBrand();">존바바토스</a>
                                                      </div>
                                                      <div class="brand" char="ㅈ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('쥬시꾸뛰르');closeBrand();">쥬시꾸뛰르</a>
                                                      </div>
                                                      <div class="brand" char="ㅈ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('지미추');closeBrand();">지미추</a>
                                                      </div>
                                                   </div>
                                                   <div class="brand_group" style="display: block;">
                                                      <h1>ㅋ</h1>
                                                      <div class="brand" char="ㅋ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('코치');closeBrand();">코치</a>
                                                      </div>
                                                      <div class="brand" char="ㅋ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('크리드');closeBrand();">크리드</a>
                                                      </div>
                                                      <div class="brand" char="ㅋ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('클린');closeBrand();">클린</a>
                                                      </div>
                                                   </div>
                                                   <div class="brand_group" style="display: block;">
                                                      <h1>ㅌ</h1>
                                                      <div class="brand" char="ㅌ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('톰포드');closeBrand();">톰포드</a>
                                                      </div>
                                                   </div>
                                                   <div class="brand_group" style="display: block;">
                                                      <h1>ㅍ</h1>
                                                      <div class="brand" char="ㅍ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('파코라반');closeBrand();">파코라반</a>
                                                      </div>
                                                      <div class="brand" char="ㅍ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('페라가모');closeBrand();">페라가모</a>
                                                      </div>
                                                      <div class="brand" char="ㅍ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('프라고나르');closeBrand();">프라고나르</a>
                                                      </div>
                                                      <div class="brand" char="ㅍ" style="display: block;">
                                                         <a href="#" onclick="brandAjax('프라다');closeBrand();">프라다</a>
                                                      </div>
                                                   </div>
                                                </div>
                                                            </li>
                                                        </div>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="category_brand">
                                            <div class="open">
                                                <!--성별 클릭시 성별 창 출력-->
                                                <a href="#" onclick="controlGender()">성별</a>
                                                <div id="myGender" id="brand_sort_outer" class="slide_brand" style="top:-200px; opacity: 0; height:0px;">
                                                    <ul class="brand_sort">
                                                        <h1 class="brand_sort_title">Gender
                                                            <a href="#" class="closebrand" onclick="closeGender()">
                                                                <img src="${pageContext.request.contextPath}/resources/image/close_btn.png" alt="닫기">
                                                            </a>
                                                        </h1>
                                                        <!--내부 스크롤 영역-->
                                                        <div class="scroll_wrapper scrollbar_inner" style="position: relative;">
                                                            <li class="scrollbar_inner scroll_content" style="height: auto; margin-bottom: 0px; margin-left: 30px; margin-right: 0px; max-height: 600px; overflow: hidden;">
                                                                <!--성별 클릭시 listpage.html로 이동(./listpage.html)-->
                                                                <!--.jsp로 변경 후 listpage.html에 DB값 호출-->
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="#" onclick="genderAjax('남자');closeGender();">남자</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="#" onclick="genderAjax('여자');closeGender();">여자</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="#" onclick="genderAjax('남녀공용');closeGender();">남녀공용</a></h1>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </div>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="category_brand">
                                            <div class="open">
                                                <!--계열 클릭시 계열 창 출력-->
                                                <a href="#" onclick="controlAccords()">계열</a>
                                                <div id="myAccords" id="brand_sort_outer" class="slide_brand" style="top:-300px; opacity: 0; height:0px;">
                                                    <ul class="brand_sort">
                                                        <h1 class="brand_sort_title">Accords
                                                            <a href="#" class="closebrand" onclick="closeAccords()">
                                                                <img src="${pageContext.request.contextPath}/resources/image/close_btn.png" alt="닫기">
                                                            </a>
                                                        </h1>
                                                        <!--내부 스크롤 영역-->
                                                        <div class="scroll_wrapper scrollbar_innerㅋ" style="position: relative;">
                                                            <li class="scrollbar_inner scroll_content" style="height: auto; margin-bottom: 0px; margin-left: 70px; margin-right: 0px; max-height: 600px; overflow: hidden;">
                                                                <!--계열 클릭시 listpage.html로 이동(./listpage.html)-->
                                                                <!--.jsp로 변경 후 listpage.html에 DB값 호출-->
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="#" onclick="accordAjax('프루티');closeAccords();">프루티</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="#" onclick="accordAjax('시트러스');closeAccords();">시트러스</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="#" onclick="accordAjax('플로럴');closeAccords();">플로럴</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="#" onclick="accordAjax('화이트플로럴');closeAccords();">화이트플로럴</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="#" onclick="accordAjax('스파이시');closeAccords();">스파이시</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="#" onclick="accordAjax('우디');closeAccords();">우디</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="#" onclick="accordAjax('그린');closeAccords();">그린/허브</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="#" onclick="accordAjax('머스크');closeAccords();">머스크/앰버</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="#" onclick="accordAjax('스위트');closeAccords();">스위트</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="#" onclick="accordAjax('레진');closeAccords();">레진/발삼</a></h1>
                                                                        <!-- 레진/발삼x -->
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="#" onclick="accordAjax('내추럴');closeAccords();">내추럴</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="#" onclick="accordAjax('아로마');closeAccords();">프레쉬/아로마</a></h1>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </div>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <!--상단 카테고리 수동 출력(고정 영역) = EDT, EDP-->
                                        <ul class="category_list">
                                            <li class="no_child">
                                                <a href="#" onclick="powerAjax('EDT')" class="category">EDT</a>
                                            </li>
                                            <li class="no_child">
                                                <a href="#" onclick="powerAjax('EDP')" class="category">EDP</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </ul>
                        </div>
                        <hr>
                    </div>
                </div>

                <!--검색 영역[openNav() 이후 검색창 영역]-->
                <div id="mySearch" class="slide_search" style="top: -350px; opacity: 0;">
                    <a href="#" class="closebtn" onclick="closeNav()">
                        <img src="${pageContext.request.contextPath}/resources/image/close_btn.png" alt="닫기">
                    </a>
                    <div class="search_inner">
                        <!--검색창 form method="get" 방식으로 search 넘겨줌-->
                        
                     <!--검색 필드-->
                     <div class="search_field">
                        <input type="radio" name="searchOpt" id="radio_brand"   value="brand" style="visibility: hidden;"> 
                        <label for="radio_brand" id="radio_brand_label" onclick="brandLabelClick()">브랜드명</label> 
                        <input type="radio"   name="searchOpt" id="radio_name" value="name"   style="visibility: hidden;"> 
                        <label for="radio_name"   id="radio_name_label" onclick="nameLabelClick()">향수명</label>
                        <fieldset form="searchBarForm" title="검색어를 입력해주세요." onkeypress="enterSearchBanner(this);">
                           <input id="keyword1" name="keyword" fw-label="검색어" class="inputTypeText" type="text" value="" />
                           <button id="btn1" type="button" class="btn-sch" alt="검색이미지" onclick="brandSearch()">
                              <img src="${pageContext.request.contextPath}/resources/image/top_search_icon.png" alt="검색"">
                           </button>
                        </fieldset>
                     </div>

                 
                        <!--세부검색 영역 (삭제? 보류)-->
                        <div class="xans-element- xans-search xans-search-hotkeyword detail_search">

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--메인 향수 출력 (하단 부분 / DB로 호출)-->
        <div id="container">
            <div id="contents">
                <div class="main">
                    <!--카테고리 랜덤 노출 영역 !추후 메서드로 구현 예정 = .main_content n개 출력!-->
                    <div class="main_content" id="">
                        <!--카테고리 제목-->
                        <div class="m_tab_area cboth">
                            <div class="main_title cboth">
                                <div id="title_t" class="title_t">
                                    Sample
                                </div>
                            </div>
                        </div>
                        <!--카테고리별 향수 출력 영역-->
                        <div class="tabcontent current">
                            <div class="cboth ec-base-product">
                                <div id="prdList_wrap" class="swiper-container swiper_tab swiper-container-horizontal">
                                    <!--ul 내부에 li 하나당 향수 한개-->
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
      /* 카테고리별 상품 진열 swiper_tab */
      var swiper_tab = new Swiper('.swiper-container', {
         direction : 'horizontal',
         roundLengths : true,
         slidesPerView : 5, // 한줄에 보이는 향수 개수
         spaceBetween : 28,
         scrollbar : {
            el : '.swiper-scrollbar',
            dragSize : 300
         }
      });
   </script>
	<script>function enterSearchBanner() {
            var searchBarForm = document.getElementById('searchBarForm');
            var value = document.getElementById("keyword1").value;
            if (event.keyCode == 13) {
            	brandSearch();
            }
        }
    </script>

   <script>
      function brandLabelClick() {
         document.getElementById("radio_brand_label").style.fontWeight = "bold";
         document.getElementById("radio_name_label").style.fontWeight = "normal";
      }

      function nameLabelClick() {
         document.getElementById("radio_brand_label").style.fontWeight = "normal";
         document.getElementById("radio_name_label").style.fontWeight = "bold";
      }
   </script>
</body>

</html>