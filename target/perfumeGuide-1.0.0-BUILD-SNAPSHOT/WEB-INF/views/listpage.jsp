<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--모바일 우선-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--swiper 연동-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/swiper_bundle.css?1" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/swiper_bundle.js"></script>
    <!--js 연동-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/search.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dropdown.js"></script>
   
   <% 

request.setCharacterEncoding("UTF-8"); //받아올 데이터의 인코딩

String brand = request.getParameter("brand"); 
String gender = request.getParameter("gender");
String accord = request.getParameter("accord");
String power = request.getParameter("power");
String note = request.getParameter("note");
%>
   
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
 
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
	        	if(data == null) {
	        		if (mOption == "brand") {
	        			location.href = "${pageContext.request.contextPath}/errorpage?keyword=" + mBrand
					}
					else if (mOption == "name") {
						location.href = "${pageContext.request.contextPath}/errorpage?keyword=" +  mBrand
					}	 
	        		
	        	}
	        	
	             var res = JSON.parse(data)
	             var prdList_num = -1

	             $("#prdList_wrap").html('') // 초기화 (리스트 비우기)
	             	        
					$.each(res, function(i, val) {
						if (mOption == "brand") {
							location.href = "${pageContext.request.contextPath}/listpage?brand=" + val.brand
						}
						else if (mOption == "name") {
							location.href = "${pageContext.request.contextPath}/detailpage?brand=" + val.brand + '&name=' + val.name
						}
	                     
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/container.css?ver=3">
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
                                                <a href="#none" onclick="openBrand()">브랜드별</a>
                                                <div id="myBrand" id="brand_sort_outer" class="slide_brand" style="top:-600px; opacity: 0; height: 0px;">
                                                    <ul class="brand_sort">
                                                        <h1 class="brand_sort_title">Brands
                                                            <a href="" class="closebrand" onclick="closeBrand()">
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
                                                         <a href="${pageContext.request.contextPath}/listpage?brand=CK" onclick="closeBrand()">CK</a>
                                                      </div>
                                                   </div>
                                                   <div class="brand_group" style="display: block;">
                                                      <h1>ㄱ</h1>
                                                      <div class="brand" char="ㄱ" style="display: block;">
                                                         <a href="${pageContext.request.contextPath}/listpage?brand=게스" onclick="closeBrand()">게스</a>
                                                      </div>
                                                      <div class="brand" char="ㄱ" style="display: block;">
                                                         <a href="${pageContext.request.contextPath}/listpage?brand=겐조 " onclick="closeBrand()">겐조</a>
                                                      </div>
                                                      <div class="brand" char="ㄱ" style="display: block;">
                                                         <a href="${pageContext.request.contextPath}/listpage?brand=구찌 " onclick="closeBrand()">구찌</a>
                                                      </div>
                                                      <div class="brand" char="ㄱ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=끌로에" onclick="closeBrand()">끌로에</a>
                                                      </div>
                                                   </div>
                                                   <div class="brand_group" style="display: block;">
                                                      <h1>ㄴ</h1>
                                                      <div class="brand" char="ㄴ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=나르시소 로드리게즈" onclick="closeBrand()">나르시소 로드리게즈</a>
                                                      </div>
                                                   </div>                                                                        
                                                   <div class="brand_group" style="display: block;">
                                                      <h1>ㄷ</h1>
                                                      <div class="brand" char="ㄷ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=돌체앤가바나" onclick="closeBrand()">돌체앤가바나</a>
                                                      </div>
                                                      <div class="brand" char="ㄷ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=디올" onclick="closeBrand()">디올</a>
                                                      </div>
                                                      <div class="brand" char="ㄷ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=딥디크" onclick="closeBrand()">딥디크</a>
                                                      </div>
                                                   </div>
                                                   <div class="brand_group" style="display: block;">
                                                      <h1>ㄹ</h1>
                                                      <div class="brand" char="ㄹ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=랄프로렌" onclick="closeBrand()">랄프로렌</a>
                                                      </div>
                                                      <div class="brand" char="ㄹ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=랑방" onclick="closeBrand()">랑방</a>
                                                      </div>
                                                   </div>
                                                   <div class="brand_group" style="display: block;">
                                                      <h1>ㅁ</h1>
                                                      <div class="brand" char="ㅁ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=마크제이콥스" onclick="closeBrand()">마크제이콥스</a>
                                                      </div>
                                                      <div class="brand" char="ㅁ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=메르세데스 벤츠" onclick="closeBrand()">메르세데스 벤츠</a>
                                                      </div>
                                                      <div class="brand" char="ㅁ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=몽블랑" onclick="closeBrand()">몽블랑</a>
                                                      </div>
                                                   </div>
                                                   <div class="brand_group" style="display: block;">
                                                      <h1>ㅂ</h1>
                                                      <div class="brand" char="ㅂ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=바이레도" onclick="closeBrand()">바이레도</a>
                                                      </div>
                                                      <div class="brand" char="ㅂ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=발렌티노" onclick="closeBrand()">발렌티노</a>
                                                      </div>
                                                      <div class="brand" char="ㅂ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=버버리" onclick="closeBrand()">버버리</a>
                                                      </div>
                                                      <div class="brand" char="ㅂ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=베르사체" onclick="closeBrand()">베르사체</a>
                                                      </div>
                                                      <div class="brand" char="ㅂ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=분더샵" onclick="closeBrand()">문더샵</a>
                                                      </div>
                                                      <div class="brand" char="ㅂ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=블가리" onclick="closeBrand()">불가리</a>
                                                      </div>
                                                   </div>
                                                   <div class="brand_group" style="display: block;">
                                                      <h1>ㅅ</h1>
                                                      <div class="brand" char="ㅅ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=산타마리아노벨라" onclick="closeBrand()">산타마리아노벨라</a>
                                                      </div>
                                                      <div class="brand" char="ㅅ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=샤넬" onclick="closeBrand()">샤넬</a>
                                                      </div>
                                                      <div class="brand" char="ㅅ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=쇼파드" onclick="closeBrand()">쇼파드</a>
                                                      </div>
                                                   </div>
                                                   <div class="brand_group" style="display: block;">
                                                      <h1>ㅇ</h1>
                                                      <div class="brand" char="ㅇ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=아리아나그란데" onclick="closeBrand()">아리아나그란데</a>
                                                      </div>
                                                      <div class="brand" char="ㅇ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=아베크롬비" onclick="closeBrand()">아베크롬비</a>
                                                      </div>
                                                      <div class="brand" char="ㅇ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=아쿠아 디 파르마" onclick="closeBrand()">아쿠아 디 파르마</a>
                                                      </div>
                                                      <div class="brand" char="ㅇ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=안나수이" onclick="closeBrand()">안나수이</a>
                                                      </div>
                                                      <div class="brand" char="ㅇ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=에르메스" onclick="closeBrand()">에르메스</a>
                                                      </div>
                                                      <div class="brand" char="ㅇ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=엘리자베스아덴" onclick="closeBrand()">엘리자베스아덴</a>
                                                      </div>
                                                      <div class="brand" char="ㅇ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=입생로랑" onclick="closeBrand()">입생로랑</a>
                                                      </div>
                                                   </div>
                                                   <div class="brand_group" style="display: block;">
                                                      <h1>ㅈ</h1>
                                                      <div class="brand" char="ㅈ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=조말론" onclick="closeBrand()">조말론</a>
                                                      </div>
                                                      <div class="brand" char="ㅈ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=존바바토스" onclick="closeBrand()">존바바토스</a>
                                                      </div>
                                                      <div class="brand" char="ㅈ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=쥬시꾸뛰르" onclick="closeBrand()">쥬시꾸뛰르</a>
                                                      </div>
                                                      <div class="brand" char="ㅈ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=지미추" onclick="closeBrand()">지미추</a>
                                                      </div>
                                                   </div>
                                                   <div class="brand_group" style="display: block;">
                                                      <h1>ㅋ</h1>
                                                      <div class="brand" char="ㅋ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=코치" onclick="closeBrand()">코치</a>
                                                      </div>
                                                      <div class="brand" char="ㅋ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=크리드" onclick="closeBrand()">크리드</a>
                                                      </div>
                                                      <div class="brand" char="ㅋ" style="display: block;">
                                                         <a href="${pageContext.request.contextPath}/listpage?brand=클린" onclick="closeBrand()">클린</a>
                                                      </div>
                                                   </div>
                                                   <div class="brand_group" style="display: block;">
                                                      <h1>ㅌ</h1>
                                                      <div class="brand" char="ㅌ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=톰포드" onclick="closeBrand()">톰포드</a>
                                                      </div>
                                                   </div>
                                                   <div class="brand_group" style="display: block;">
                                                      <h1>ㅍ</h1>
                                                      <div class="brand" char="ㅍ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=파코라반" onclick="closeBrand()">파코라반</a>
                                                      </div>
                                                      <div class="brand" char="ㅍ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=페라가모" onclick="closeBrand()">페라가모</a>
                                                      </div>
                                                      <div class="brand" char="ㅍ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=프라고나르" onclick="closeBrand()">프라고나르</a>
                                                      </div>
                                                      <div class="brand" char="ㅍ" style="display: block;">
                                                        <a href="${pageContext.request.contextPath}/listpage?brand=프라다" onclick="closeBrand()">프라다</a>

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
                                                <a href="#none" onclick="controlGender()">성별</a>
                                                <div id="myGender" id="brand_sort_outer" class="slide_brand" style="top:-200px; opacity: 0; height:0px;">
                                                    <ul class="brand_sort">
                                                        <h1 class="brand_sort_title">Gender
                                                            <a href="#none" class="closebrand" onclick="closeGender()">
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
                                                                        <h1><a href="${pageContext.request.contextPath}/listpage?gender=남자" onclick="controlGender()">남자</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="${pageContext.request.contextPath}/listpage?gender=여자" onclick="controlGender()">여자</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="${pageContext.request.contextPath}/listpage?gender=남녀공용" onclick="controlGender()">남녀공용</a></h1>
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
                                                <a href="#none" onclick="controlAccords()">계열</a>
                                                <div id="myAccords" id="brand_sort_outer" class="slide_brand" style="top:-300px; opacity: 0; height:0px;">
                                                    <ul class="brand_sort">
                                                        <h1 class="brand_sort_title">Accords
                                                            <a href="#none" class="closebrand" onclick="closeAccords()">
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
                                                                        <h1><a href="${pageContext.request.contextPath}/listpage?accord=프루티" onclick="closeAccords()">프루티</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="${pageContext.request.contextPath}/listpage?accord=시트러스" onclick="closeAccords()">시트러스</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="${pageContext.request.contextPath}/listpage?accord=플로럴" onclick="closeAccords()">플로럴</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                    	<h1><a href="${pageContext.request.contextPath}/listpage?accord=화이트플로럴" onclick="closeAccords()">화이트플로럴</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="${pageContext.request.contextPath}/listpage?accord=스파이시" onclick="closeAccords()">스파이시</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="${pageContext.request.contextPath}/listpage?accord=우디" onclick="closeAccords()">우디</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="${pageContext.request.contextPath}/listpage?accord=그린" onclick="closeAccords()">그린/허브</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="${pageContext.request.contextPath}/listpage?accord=머스크" onclick="closeAccords()">머스크/앰버</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="${pageContext.request.contextPath}/listpage?accord=스위트" onclick="closeAccords()">스위트</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="${pageContext.request.contextPath}/listpage?accord=내추럴" onclick="closeAccords()">내추럴</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="${pageContext.request.contextPath}/listpage?accord=아로마" onclick="closeAccords()">프레쉬/아로마</a></h1>
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
                                                <a href="${pageContext.request.contextPath}/listpage?power=EDT" onclick="powerAjax('EDT')" class="category">EDT</a>
                                            </li>
                                            <li class="no_child">
                                                <a href="${pageContext.request.contextPath}/listpage?power=EDP" onclick="powerAjax('EDP')" class="category">EDP</a>
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
                    <a href="#none" class="closebtn" onclick="closeNav()">
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
                           <button id="btn1" type="button" class="btn-sch" alt="검색이미지" onclick="brandSearch();closeNav();">
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
                                <div class="title_t"></div>
                            </div>
                        </div>
                        <!--카테고리별 향수 출력 영역-->
                        <div class="tabcontent current" style="margin-left: 50px">
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
   
       <script>


	var brand = "<%=brand%>"
	var gender = "<%=gender%>"
	var accord = "<%=accord%>"
	var power = "<%=power%>"
	var note = "<%=note%>"
		
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
            	
           	 $(".title_t").text(val.eng_brand)
                //document.write(val.name)
                if (i % 4 == 0) { // 한줄에 네 개씩
                    prdList_num++
                    $("#prdList_wrap").append('<ul id="prdList' + prdList_num + '" class="prdList"></ul>')
                }
                $("#prdList" + prdList_num).append('<li id="prd" style="width: 232px; margin-right: 30px;">' +
                        '<div class="box">' +
                        '<div class="thumbnail">' +
                        '<!--향수 이미지-->' +
                        '<div class="prdImg">' +
                        '<a href="${pageContext.request.contextPath}/detailpage?brand=' + val.brand + '&name=' + val.name + '" class="_evt_tracker">' +
                        '<img src="${pageContext.request.contextPath}/resources/image/products/'+val.brand+'_'+val.name+'.jpg" alt="샘플사진">' +
                        '</a>' +
                        '</div>' +
                        '</div>' +
                        '<div class="description">' +
                        '<!--향수 이름-->' +
                        '<div class="name">' +
                        '<a href="${pageContext.request.contextPath}/detailpage?brand=' + val.brand + '&name=' + val.name + '" class="_evt_tracker">' +
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
                        '<br/>' +
                        '</div>' +
                        '</div>' +
                        '</li>')
            })

        } 
    })
    closeBrand();
}
brandAjax(brand);


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
                         '<a href="${pageContext.request.contextPath}/detailpage?brand=' + val.brand + '&name=' + val.name + '" class="_evt_tracker">' +
                         '<img src="${pageContext.request.contextPath}/resources/image/products/'+val.brand+'_'+val.name+'.jpg" alt="샘플사진">' +
                         '</a>' +
                         '</div>' +
                         '</div>' +
                         '<div class="description">' +
                         '<!--향수 이름-->' +
                         '<div class="name">' +
                         '<a href="${pageContext.request.contextPath}/detailpage?brand=' + val.brand + '&name=' + val.name + '" class="_evt_tracker">' +
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
                         '<br/>' +
                         '</div>' +
                         '</div>' +
                         '</li>')
             })

         } 
     })
 }
genderAjax(gender);

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
                         '<a href="${pageContext.request.contextPath}/detailpage?brand=' + val.brand + '&name=' + val.name + '" class="_evt_tracker">' +
                         '<img src="${pageContext.request.contextPath}/resources/image/products/'+val.brand+'_'+val.name+'.jpg" alt="샘플사진">' +
                         '</a>' +
                         '</div>' +
                         '</div>' +
                         '<div class="description">' +
                         '<!--향수 이름-->' +
                         '<div class="name">' +
                         '<a href="${pageContext.request.contextPath}/detailpage?brand=' + val.brand + '&name=' + val.name + '" class="_evt_tracker">' +
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
                         '<br/>' +
                         '</div>' +
                         '</div>' +
                         '</li>')
             })

         }
     })
 }
 accordAjax(accord);
 
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
                         '<a href="${pageContext.request.contextPath}/detailpage?brand=' + val.brand + '&name=' + val.name + '" class="_evt_tracker">' +'<img src="${pageContext.request.contextPath}/resources/image/products/'+val.brand+'_'+val.name+'.jpg" alt="샘플사진">' +
                         '</a>' +
                         '</div>' +
                         '</div>' +
                         '<div class="description">' +
                         '<!--향수 이름-->' +
                         '<div class="name">' +
                         '<a href="${pageContext.request.contextPath}/detailpage?brand=' + val.brand + '&name=' + val.name + '" class="_evt_tracker">' +'<span style="font-size: 15px;color: #111111;">' + val.name + '</span>' +
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
                         '<br/>' +
                         '</div>' +
                         '</div>' +
                         '</li>')
             })

         }
     })
     closeBrand()
 }
 powerAjax(power);
 
 
 function noteAjax(note) {
     var mNote = note //mBrand 바꾸면 그 brand 불러옴
     $.ajax({
         url: '${pageContext.request.contextPath}/api/perfumes/keyword/',
         method: 'GET',
         contentType: "application/json",
         dataType: "text",
         traditional: true,
         data: 'note=' + mNote,
         success: function(data) {

        	 if(!data) {
        		 closeBrand();
        		 return false;
        	 }
             var res = JSON.parse(data)
             var prdList_num = -1
             
             $("#prdList_wrap").html('') // 초기화 (리스트 비우기)
			$(".title_t").text(mNote)
             $.each(res, function(i, val) {
            	 
                 if (i % 4 == 0) { // 한줄에 네 개씩
                     prdList_num++
                     $("#prdList_wrap").append('<ul id="prdList' + prdList_num + '" class="prdList"></ul>')
                 }
                 $("#prdList" + prdList_num).append('<li style="width: 232px; margin-right: 30px;">' +
                         '<div class="box">' +
                         '<div class="thumbnail">' +
                         '<!--향수 이미지-->' +
                         '<div class="prdImg">' +
                         '<a href="${pageContext.request.contextPath}/detailpage?brand=' + val.brand + '&name=' + val.name + '" class="_evt_tracker">' +
                         '<img src="${pageContext.request.contextPath}/resources/image/products/'+val.brand+'_'+val.name+'.jpg" alt="샘플사진">' +
                         '</a>' +
                         '</div>' +
                         '</div>' +
                         '<div class="description">' +
                         '<!--향수 이름-->' +
                         '<div class="name">' +
                         '<a href="${pageContext.request.contextPath}/detailpage?brand=' + val.brand + '&name=' + val.name + '" class="_evt_tracker">' +
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
                         '<br/>' +
                         '</div>' +
                         '</div>' +
                         '</li>')
             })

         }
     })
 }
 noteAjax(note);
 
</script>
</body>

</html>