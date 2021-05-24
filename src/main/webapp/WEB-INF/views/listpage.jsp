<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
    각 브랜드별 | EDT | EDP | 성별 | 계열 ListPage.
-->
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dropdown.js"></script>
    <!--css 연동-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/homepage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header_sector1.css?after">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header_sector2.css?after">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/container.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/listpage.css">
    <title>퍼퓸가이드</title>
    <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


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
                                                            <a href="javascript:void(0)" class="closebrand" onclick="closeBrand()">
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
                                                                            <a href="./listpage.html">CK</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1>ㄱ</h1>
                                                                        <div class="brand" char="ㄱ" style="display: block;">
                                                                            <a href="./listpage.html">게스</a>
                                                                        </div>
                                                                        <div class="brand" char="ㄱ" style="display: block;">
                                                                            <a href="./listpage.html">겐조</a>
                                                                        </div>
                                                                        <div class="brand" char="ㄱ" style="display: block;">
                                                                            <a href="./listpage.html">구찌</a>
                                                                        </div>
                                                                        <div class="brand" char="ㄱ" style="display: block;">
                                                                            <a href="./listpage.html">끌로에</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1>ㄴ</h1>
                                                                        <div class="brand" char="ㄴ" style="display: block;">
                                                                            <a href="./listpage.html">나르시소 로드리게즈</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1>ㄷ</h1>
                                                                        <div class="brand" char="ㄷ" style="display: block;">
                                                                            <a href="./listpage.html">돌체앤가바나</a>
                                                                        </div>
                                                                        <div class="brand" char="ㄷ" style="display: block;">
                                                                            <a href="./listpage.html">디올</a>
                                                                        </div>
                                                                        <div class="brand" char="ㄷ" style="display: block;">
                                                                            <a href="./listpage.html">딥디크</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1>ㄹ</h1>
                                                                        <div class="brand" char="ㄹ" style="display: block;">
                                                                            <a href="./listpage.html">랄프로렌</a>
                                                                        </div>
                                                                        <div class="brand" char="ㄹ" style="display: block;">
                                                                            <a href="./listpage.html">랑방</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1>ㅁ</h1>
                                                                        <div class="brand" char="ㅁ" style="display: block;">
                                                                            <a href="./listpage.html">마크제이콥스</a>
                                                                        </div>
                                                                        <div class="brand" char="ㅁ" style="display: block;">
                                                                            <a href="./listpage.html">메르세데스 벤츠</a>
                                                                        </div>
                                                                        <div class="brand" char="ㅁ" style="display: block;">
                                                                            <a href="./listpage.html">몽블랑</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1>ㅂ</h1>
                                                                        <div class="brand" char="ㅂ" style="display: block;">
                                                                            <a href="./listpage.html">바이레도</a>
                                                                        </div>
                                                                        <div class="brand" char="ㅂ" style="display: block;">
                                                                            <a href="./listpage.html">발렌티노</a>
                                                                        </div>
                                                                        <div class="brand" char="ㅂ" style="display: block;">
                                                                            <a href="./listpage.html">버버리</a>
                                                                        </div>
                                                                        <div class="brand" char="ㅂ" style="display: block;">
                                                                            <a href="./listpage.html">베르사체</a>
                                                                        </div>
                                                                        <div class="brand" char="ㅂ" style="display: block;">
                                                                            <a href="./listpage.html">분더샵</a>
                                                                        </div>
                                                                        <div class="brand" char="ㅂ" style="display: block;">
                                                                            <a href="./listpage.html">불가리</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1>ㅅ</h1>
                                                                        <div class="brand" char="ㅅ" style="display: block;">
                                                                            <a href="./listpage.html">산타마리아노벨라</a>
                                                                        </div>
                                                                        <div class="brand" char="ㅅ" style="display: block;">
                                                                            <a href="./listpage.html">샤넬</a>
                                                                        </div>
                                                                        <div class="brand" char="ㅅ" style="display: block;">
                                                                            <a href="./listpage.html">쇼파드</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1>ㅇ</h1>
                                                                        <div class="brand" char="ㅇ" style="display: block;">
                                                                            <a href="./listpage.html">아리아나그란데</a>
                                                                        </div>
                                                                        <div class="brand" char="ㅇ" style="display: block;">
                                                                            <a href="./listpage.html">아베크롬비</a>
                                                                        </div>
                                                                        <div class="brand" char="ㅇ" style="display: block;">
                                                                            <a href="./listpage.html">아쿠아 디 파르마</a>
                                                                        </div>
                                                                        <div class="brand" char="ㅇ" style="display: block;">
                                                                            <a href="./listpage.html">안나수이</a>
                                                                        </div>
                                                                        <div class="brand" char="ㅇ" style="display: block;">
                                                                            <a href="./listpage.html">에르메스</a>
                                                                        </div>
                                                                        <div class="brand" char="ㅇ" style="display: block;">
                                                                            <a href="./listpage.html">엘리자베스아덴</a>
                                                                        </div>
                                                                        <div class="brand" char="ㅇ" style="display: block;">
                                                                            <a href="./listpage.html">입생로랑</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1>ㅈ</h1>
                                                                        <div class="brand" char="ㅈ" style="display: block;">
                                                                            <a href="./listpage.html">조말론</a>
                                                                        </div>
                                                                        <div class="brand" char="ㅈ" style="display: block;">
                                                                            <a href="./listpage.html">존바바토스</a>
                                                                        </div>
                                                                        <div class="brand" char="ㅈ" style="display: block;">
                                                                            <a href="./listpage.html">쥬시꾸뛰르</a>
                                                                        </div>
                                                                        <div class="brand" char="ㅈ" style="display: block;">
                                                                            <a href="./listpage.html">지미추</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1>ㅋ</h1>
                                                                        <div class="brand" char="ㅋ" style="display: block;">
                                                                            <a href="./listpage.html">코치</a>
                                                                        </div>
                                                                        <div class="brand" char="ㅋ" style="display: block;">
                                                                            <a href="./listpage.html">크리드</a>
                                                                        </div>
                                                                        <div class="brand" char="ㅋ" style="display: block;">
                                                                            <a href="./listpage.html">클린</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1>ㅌ</h1>
                                                                        <div class="brand" char="ㅌ" style="display: block;">
                                                                            <a href="./listpage.html">톰포드</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1>ㅍ</h1>
                                                                        <div class="brand" char="ㅍ" style="display: block;">
                                                                            <a href="./listpage.html">파코라반</a>
                                                                        </div>
                                                                        <div class="brand" char="ㅍ" style="display: block;">
                                                                            <a href="./listpage.html">페라가모</a>
                                                                        </div>
                                                                        <div class="brand" char="ㅍ" style="display: block;">
                                                                            <a href="./listpage.html">프라고나르</a>
                                                                        </div>
                                                                        <div class="brand" char="ㅍ" style="display: block;">
                                                                            <a href="./listpage.html">프라다</a>
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
                                                            <a href="javascript:void(0)" class="closebrand" onclick="closeGender()">
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
                                                                        <h1><a href="./listpage.html">남자</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">여자</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">남녀공용</a></h1>
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
                                                            <a href="javascript:void(0)" class="closebrand" onclick="closeAccords()">
                                                                <img src="${pageContext.request.contextPath}/resources/image/close_btn.png" alt="닫기">
                                                            </a>
                                                        </h1>
                                                        <!--내부 스크롤 영역-->
                                                        <div class="scroll_wrapper scrollbar_inner" style="position: relative;">
                                                            <li class="scrollbar_inner scroll_content" style="height: auto; margin-bottom: 0px; margin-left: 70px; margin-right: 0px; max-height: 600px; overflow: hidden;">
                                                                <!--계열 클릭시 listpage.html로 이동(./listpage.html)-->
                                                                <!--.jsp로 변경 후 listpage.html에 DB값 호출-->
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">프루티</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">시트러스</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">플로럴</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">화이트플로럴</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">스파이시</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">우디</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">그린/허브</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">머스크/앰버</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">스위트</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">레진/발삼</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">내추럴</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">프레쉬/아로마</a></h1>
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
                                                <a href="./listpage.html" class="category">EDT</a>
                                            </li>
                                            <li class="no_child">
                                                <a href="./listpage.html" class="category">EDP</a>
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
                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">
                        <img src="${pageContext.request.contextPath}/resources/image/close_btn.png" alt="닫기">
                    </a>
                    <div class="search_inner">
                        <!--검색창 form method="get" 방식으로 search 넘겨줌-->
                        <form id="searchBarForm" action="./search.html" method="get" target="_self" enctype="multipart/form-data">
                            <input id="banner_action" name="banner_action" value="" type="hidden">
                            <!--검색 필드-->
                            <div class="search_field">
                                <fieldset title="검색어를 입력해주세요."> <input id="keyword" name="keyword" fw-filter="" fw-label="검색어" fw-msg="" class="inputTypeText" placeholder="향수 이름으로 검색" onmousedown="clickSearchForm(this)" value="" type="text">
                                    <input type="image" src="${pageContext.request.contextPath}/resources/image/top_search_icon.png" class="btn-sch" alt="검색이미지" onclick="submitSearchBanner(this); return false;">
                                </fieldset>
                            </div>
                        </form>
                        <!--세부검색 영역 (삭제? 보류)-->
                        <div class="xans-element- xans-search xans-search-hotkeyword detail_search">

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--브랜드별 향수 출력 (DB로 호출)-->
        <div id="container">
            <div id="contents">
                <!--브랜드별 향수 노출 영역 DB로 불러올 예정 (전부 다 호출하면 됨, ul 하나당 한 줄, 각 4개)-->
                <div class="main_content" id="">
                    <!--브랜드명-->
                    <div class="main_title cboth">
                        <!--.title_t 에 브랜드명 불러오기-->
                        <div class="title_t">
                            LIST PAGE SAMPLE
                        </div>
                    </div>
                    <div class="sp_product">
                        <div class="cboth ec-base-product">
                            <!--첫째 줄
                            
                            
                            -->
                            <ul class="prdList">
                                <li style="width: 232px; margin-right: 30px;">
                                    <div class="box">
                                        <div class="thumbnail">
                                            <!--향수 이미지-->
                                            <div class="prdImg">
                                                <a href="#" class="_evt_tracker">
                                                    <img src="" alt="샘플사진">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="description">
                                            <!--향수 이름-->
                                            <div class="name">
                                                <a href="#" class="_evt_tracker">
                                                    <span style="font-size: 15px;color: #111111;">샘플향수</span>
                                                    <span id="list_name1"></span>
                                                </a>
                                            </div>
                                            <!--대표계열-->
                                            <ul class="spec">
                                                <li rel="계열" style="margin-left: 0px !important;">
                                                    <span style="font-size: 14px;color: #999999;">샘플계열</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li style="width: 232px; margin-right: 30px;">
                                    <div class="box">
                                        <div class="thumbnail">
                                            <!--향수 이미지-->
                                            <div class="prdImg">
                                                <a href="#" class="_evt_tracker">
                                                    <img src="" alt="샘플사진">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="description">
                                            <!--향수 이름-->
                                            <div class="name">
                                                <a href="#" class="_evt_tracker">
                                                    <span style="font-size: 15px;color: #111111;">샘플향수</span>
                                                </a>
                                            </div>
                                            <!--대표계열-->
                                            <ul class="spec">
                                                <li rel="계열" style="margin-left: 0px !important;">
                                                    <span style="font-size: 14px;color: #999999;">샘플계열</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li style="width: 232px; margin-right: 30px;">
                                    <div class="box">
                                        <div class="thumbnail">
                                            <!--향수 이미지-->
                                            <div class="prdImg">
                                                <a href="#" class="_evt_tracker">
                                                    <img src="" alt="샘플사진">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="description">
                                            <!--향수 이름-->
                                            <div class="name">
                                                <a href="#" class="_evt_tracker">
                                                    <span style="font-size: 15px;color: #111111;">샘플향수</span>
                                                </a>
                                            </div>
                                            <!--대표계열-->
                                            <ul class="spec">
                                                <li rel="계열" style="margin-left: 0px !important;">
                                                    <span style="font-size: 14px;color: #999999;">샘플계열</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li style="width: 232px; margin-right: 30px;">
                                    <div class="box">
                                        <div class="thumbnail">
                                            <!--향수 이미지-->
                                            <div class="prdImg">
                                                <a href="#" class="_evt_tracker">
                                                    <img src="" alt="샘플사진">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="description">
                                            <!--향수 이름-->
                                            <div class="name">
                                                <a href="#" class="_evt_tracker">
                                                    <span style="font-size: 15px;color: #111111;">샘플향수</span>
                                                </a>
                                            </div>
                                            <!--대표계열-->
                                            <ul class="spec">
                                                <li rel="계열" style="margin-left: 0px !important;">
                                                    <span style="font-size: 14px;color: #999999;">샘플계열</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            <!--둘째 줄
                            
                            
                            -->
                            <ul class="prdList">
                                <li style="width: 232px; margin-right: 30px;">
                                    <div class="box">
                                        <div class="thumbnail">
                                            <!--향수 이미지-->
                                            <div class="prdImg">
                                                <a href="#" class="_evt_tracker">
                                                    <img src="" alt="샘플사진">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="description">
                                            <!--향수 이름-->
                                            <div class="name">
                                                <a href="#" class="_evt_tracker">
                                                    <span style="font-size: 15px;color: #111111;">샘플향수</span>
                                                </a>
                                            </div>
                                            <!--대표계열-->
                                            <ul class="spec">
                                                <li rel="계열" style="margin-left: 0px !important;">
                                                    <span style="font-size: 14px;color: #999999;">샘플계열</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li style="width: 232px; margin-right: 30px;">
                                    <div class="box">
                                        <div class="thumbnail">
                                            <!--향수 이미지-->
                                            <div class="prdImg">
                                                <a href="#" class="_evt_tracker">
                                                    <img src="" alt="샘플사진">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="description">
                                            <!--향수 이름-->
                                            <div class="name">
                                                <a href="#" class="_evt_tracker">
                                                    <span style="font-size: 15px;color: #111111;">샘플향수</span>
                                                </a>
                                            </div>
                                            <!--대표계열-->
                                            <ul class="spec">
                                                <li rel="계열" style="margin-left: 0px !important;">
                                                    <span style="font-size: 14px;color: #999999;">샘플계열</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li style="width: 232px; margin-right: 30px;">
                                    <div class="box">
                                        <div class="thumbnail">
                                            <!--향수 이미지-->
                                            <div class="prdImg">
                                                <a href="#" class="_evt_tracker">
                                                    <img src="" alt="샘플사진">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="description">
                                            <!--향수 이름-->
                                            <div class="name">
                                                <a href="#" class="_evt_tracker">
                                                    <span style="font-size: 15px;color: #111111;">샘플향수</span>
                                                </a>
                                            </div>
                                            <!--대표계열-->
                                            <ul class="spec">
                                                <li rel="계열" style="margin-left: 0px !important;">
                                                    <span style="font-size: 14px;color: #999999;">샘플계열</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li style="width: 232px; margin-right: 30px;">
                                    <div class="box">
                                        <div class="thumbnail">
                                            <!--향수 이미지-->
                                            <div class="prdImg">
                                                <a href="#" class="_evt_tracker">
                                                    <img src="" alt="샘플사진">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="description">
                                            <!--향수 이름-->
                                            <div class="name">
                                                <a href="#" class="_evt_tracker">
                                                    <span style="font-size: 15px;color: #111111;">샘플향수</span>
                                                </a>
                                            </div>
                                            <!--대표계열-->
                                            <ul class="spec">
                                                <li rel="계열" style="margin-left: 0px !important;">
                                                    <span style="font-size: 14px;color: #999999;">샘플계열</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            <!--셋째 줄
                            
                            
                            -->
                            <ul class="prdList">
                                <li style="width: 232px; margin-right: 30px;">
                                    <div class="box">
                                        <div class="thumbnail">
                                            <!--향수 이미지-->
                                            <div class="prdImg">
                                                <a href="#" class="_evt_tracker">
                                                    <img src="" alt="샘플사진">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="description">
                                            <!--향수 이름-->
                                            <div class="name">
                                                <a href="#" class="_evt_tracker">
                                                    <span style="font-size: 15px;color: #111111;">샘플향수</span>
                                                </a>
                                            </div>
                                            <!--대표계열-->
                                            <ul class="spec">
                                                <li rel="계열" style="margin-left: 0px !important;">
                                                    <span style="font-size: 14px;color: #999999;">샘플계열</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li style="width: 232px; margin-right: 30px;">
                                    <div class="box">
                                        <div class="thumbnail">
                                            <!--향수 이미지-->
                                            <div class="prdImg">
                                                <a href="#" class="_evt_tracker">
                                                    <img src="" alt="샘플사진">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="description">
                                            <!--향수 이름-->
                                            <div class="name">
                                                <a href="#" class="_evt_tracker">
                                                    <span style="font-size: 15px;color: #111111;">샘플향수</span>
                                                </a>
                                            </div>
                                            <!--대표계열-->
                                            <ul class="spec">
                                                <li rel="계열" style="margin-left: 0px !important;">
                                                    <span style="font-size: 14px;color: #999999;">샘플계열</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li style="width: 232px; margin-right: 30px;">
                                    <div class="box">
                                        <div class="thumbnail">
                                            <!--향수 이미지-->
                                            <div class="prdImg">
                                                <a href="#" class="_evt_tracker">
                                                    <img src="" alt="샘플사진">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="description">
                                            <!--향수 이름-->
                                            <div class="name">
                                                <a href="#" class="_evt_tracker">
                                                    <span style="font-size: 15px;color: #111111;">샘플향수</span>
                                                </a>
                                            </div>
                                            <!--대표계열-->
                                            <ul class="spec">
                                                <li rel="계열" style="margin-left: 0px !important;">
                                                    <span style="font-size: 14px;color: #999999;">샘플계열</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                                <li style="width: 232px; margin-right: 30px;">
                                    <div class="box">
                                        <div class="thumbnail">
                                            <!--향수 이미지-->
                                            <div class="prdImg">
                                                <a href="#" class="_evt_tracker">
                                                    <img src="" alt="샘플사진">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="description">
                                            <!--향수 이름-->
                                            <div class="name">
                                                <a href="#" class="_evt_tracker">
                                                    <span style="font-size: 15px;color: #111111;">샘플향수</span>
                                                </a>
                                            </div>
                                            <!--대표계열-->
                                            <ul class="spec">
                                                <li rel="계열" style="margin-left: 0px !important;">
                                                    <span style="font-size: 14px;color: #999999;">샘플계열</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        /* 카테고리별 상품 진열 swiper_tab */
        var swiper_tab = new Swiper('.swiper-container', {
            direction: 'horizontal',
            roundLengths: true,
            slidesPerView: 5, // 한줄에 보이는 향수 개수
            spaceBetween: 28,
            scrollbar: {
                el: '.swiper-scrollbar',
                dragSize: 300
            }
        });
    </script>
</body>

</html>