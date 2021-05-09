<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--����� �켱-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--swiper ����-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/swiper_bundle.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/swiper_bundle.js"></script>
    <!--js ����-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/search.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dropdown.js"></script>
   
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
	var mId = 2 //mId �ٲٸ� �� id �ҷ���
    $.ajax({
        url:'api/perfumes/'+mId
        , method : 'GET'
        , contentType: "application/json"
        , dataType: "text"
        , data : 'id='+mId
        , success :  function(data){
        	var json = JSON.parse(data).name //�ڿ� ������ �÷��� �ٲٸ� ��
        	/* var str = JSON.stringify(json) */
           $('#req1').text(json)
            
        }
    })	
}
reqAjax1()

function reqAjax2() {
	var mId = 3
    $.ajax({
        url:'api/perfumes/'+mId
        , method : 'GET'
        , contentType: "application/json"
        , dataType: "text"
        , data : 'id='+mId
        , success :  function(data){
        	var json = JSON.parse(data).name
        	/* var str = JSON.stringify(json) */
           $('#req2').text(json)
            
        }
    })	
}
reqAjax2()
</script>

   
    <!--css ����-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/homepage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header_sector1.css?after">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header_sector2.css?after">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/container.css">
    <title>��Ǿ���̵�</title>
</head>

<body>
    <div id="wrap">
        <!--���(�ֻ��)-->
        <div id="header">
            <!--��� ����1-->
            <div class="sector1">
                <!--��� �ΰ� ����-->
                <div class="banner_logo">
                    <a href="./">
                        <!--�ΰ� width 400px - 500px proper (./css/homepage.css)-->
                        <img id="banner_logo" src="${pageContext.request.contextPath}/resources/image/perfume_guide_title_banner.png" alt="banner_logo">
                    </a>
                </div>
                <!--���� �޴� ����(�˻� �κ�)-->
                <div class="left_menu">
                    <div class="search_menu">
                        <li class="search_perfume">
                            <!--�˻� ������ Ŭ���� openNav() ���� (./js/search.js)-->
                            <a href="#none" onclick="openNav()">
                                <img src="${pageContext.request.contextPath}/resources/image/search_icon.png" alt="search_icon">
                            </a>
                        </li>
                    </div>
                </div>
                <!--���� �޴� ����(�α��� �κ�)-->
                <div class="right_menu">

                </div>
            </div>
            <!--��� ����2-->
            <div class="sector2 cboth" id="category_top">
                <div class="inner">
                    <!--��� ī�װ� ���-->
                    <div class="top_category">
                        <hr>
                        <!--��� ī�װ� ���� �� �ڵ� ���-->
                        <div class="category_menu">
                            <ul class="top_menu">
                                <div id="main_category">
                                    <div id="slide_category_list">
                                        <!--��� ī�װ� �ڵ� ���-->
                                        <div class="category_brand">
                                            <div class="open">
                                                <!--�귣�庰 Ŭ���� �귣�� ��ü���� â ���-->
                                                <a href="#" onclick="openBrand()">�귣�庰</a>
                                                <div id="myBrand" id="brand_sort_outer" class="slide_brand" style="top:-600px; opacity: 0; height: 0px;">
                                                    <ul class="brand_sort">
                                                        <h1 class="brand_sort_title">Brands
                                                            <a href="javascript:void(0)" class="closebrand" onclick="closeBrand()">
                                                                <img src="${pageContext.request.contextPath}/resources/image/close_btn.png" alt="�ݱ�">
                                                            </a>
                                                        </h1>
                                                        <!--���� ��ũ�� ����-->
                                                        <div class="scroll_wrapper scrollbar_inner" style="position: relative;">
                                                            <li class="scrollbar_inner scroll_content" style="height: auto; margin-bottom: 0px; margin-right: 0px; max-height: 600px;">
                                                                <!--�귣��� Ŭ���� listpage.html�� �̵�(./listpage.html)-->
                                                                <!--.jsp�� ���� �� listpage.html�� DB�� ȣ��-->
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1>C</h1>
                                                                        <div class="brand" char="C" style="display: block;">
                                                                            <a href="./listpage.html">CK</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1>��</h1>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">�Խ�</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">����</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">����</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">���ο�</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1>��</h1>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">�����ü� �ε帮����</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1>��</h1>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">��ü�ذ��ٳ�</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">���</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">����ũ</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1>��</h1>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">�����η�</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">����</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1>��</h1>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">��ũ�����߽�</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">�޸������� ����</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">�����</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1>��</h1>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">���̷���</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">�߷�Ƽ��</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">������</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">������ü</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">�д���</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">�Ұ���</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1>��</h1>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">��Ÿ�����Ƴ뺧��</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">����</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">���ĵ�</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1>��</h1>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">�Ƹ��Ƴ��׶���</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">�ƺ�ũ�Һ�</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">����� �� �ĸ���</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">�ȳ�����</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">�����޽�</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">�����ں����Ƶ�</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">�Ի��ζ�</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1>��</h1>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">������</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">���ٹ��佺</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">��òٶٸ�</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">������</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1>��</h1>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">��ġ</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">ũ����</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">Ŭ��</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1>��</h1>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">������</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1>��</h1>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">���ڶ��</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">��󰡸�</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">�������</a>
                                                                        </div>
                                                                        <div class="brand" char="��" style="display: block;">
                                                                            <a href="./listpage.html">�����</a>
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
                                                <!--���� Ŭ���� ���� â ���-->
                                                <a href="#" onclick="controlGender()">����</a>
                                                <div id="myGender" id="brand_sort_outer" class="slide_brand" style="top:-200px; opacity: 0; height:0px;">
                                                    <ul class="brand_sort">
                                                        <h1 class="brand_sort_title">Gender
                                                            <a href="javascript:void(0)" class="closebrand" onclick="closeGender()">
                                                                <img src="${pageContext.request.contextPath}/resources/image/close_btn.png" alt="�ݱ�">
                                                            </a>
                                                        </h1>
                                                        <!--���� ��ũ�� ����-->
                                                        <div class="scroll_wrapper scrollbar_inner" style="position: relative;">
                                                            <li class="scrollbar_inner scroll_content" style="height: auto; margin-bottom: 0px; margin-left: 30px; margin-right: 0px; max-height: 600px; overflow: hidden;">
                                                                <!--���� Ŭ���� listpage.html�� �̵�(./listpage.html)-->
                                                                <!--.jsp�� ���� �� listpage.html�� DB�� ȣ��-->
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">����</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">����</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">�������</a></h1>
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
                                                <!--�迭 Ŭ���� �迭 â ���-->
                                                <a href="#" onclick="controlAccords()">�迭</a>
                                                <div id="myAccords" id="brand_sort_outer" class="slide_brand" style="top:-300px; opacity: 0; height:0px;">
                                                    <ul class="brand_sort">
                                                        <h1 class="brand_sort_title">Accords
                                                            <a href="javascript:void(0)" class="closebrand" onclick="closeAccords()">
                                                                <img src="${pageContext.request.contextPath}/resources/image/close_btn.png" alt="�ݱ�">
                                                            </a>
                                                        </h1>
                                                        <!--���� ��ũ�� ����-->
                                                        <div class="scroll_wrapper scrollbar_inner��" style="position: relative;">
                                                            <li class="scrollbar_inner scroll_content" style="height: auto; margin-bottom: 0px; margin-left: 70px; margin-right: 0px; max-height: 600px; overflow: hidden;">
                                                                <!--�迭 Ŭ���� listpage.html�� �̵�(./listpage.html)-->
                                                                <!--.jsp�� ���� �� listpage.html�� DB�� ȣ��-->
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">����Ƽ</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">��Ʈ����</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">�÷η�</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">ȭ��Ʈ�÷η�</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">�����̽�</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">���</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">�׸�/���</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">�ӽ�ũ/�ڹ�</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">����Ʈ</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">����/�߻�</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">���߷�</a></h1>
                                                                    </div>
                                                                </div>
                                                                <div class="brand_link">
                                                                    <div class="brand_group" style="display: block;">
                                                                        <h1><a href="./listpage.html">������/�Ʒθ�</a></h1>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </div>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <!--��� ī�װ� ���� ���(���� ����) = EDT, EDP-->
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

                <!--�˻� ����[openNav() ���� �˻�â ����]-->
                <div id="mySearch" class="slide_search" style="top: -350px; opacity: 0;">
                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">
                        <img src="${pageContext.request.contextPath}/resources/image/close_btn.png" alt="�ݱ�">
                    </a>
                    <div class="search_inner">
                        <!--�˻�â form method="get" ������� search �Ѱ���-->
                        <form id="searchBarForm" action="./search.html" method="get" target="_self" enctype="multipart/form-data">
                            <input id="banner_action" name="banner_action" value="" type="hidden">
                            <!--�˻� �ʵ�-->
                            <div class="search_field">
                                <fieldset title="�˻�� �Է����ּ���."> <input id="keyword" name="keyword" fw-filter="" fw-label="�˻���" fw-msg="" class="inputTypeText" placeholder="��� �̸����� �˻�" onmousedown="clickSearchForm(this)" value="" type="text">
                                    <input type="image" src="${pageContext.request.contextPath}/resources/image/top_search_icon.png" class="btn-sch" alt="�˻��̹���" onclick="submitSearchBanner(this); return false;">
                                </fieldset>
                            </div>
                        </form>
                        <!--���ΰ˻� ���� (����? ����)-->
                        <div class="xans-element- xans-search xans-search-hotkeyword detail_search">

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--���� ��� ��� (�ϴ� �κ� / DB�� ȣ��)-->
        <div id="container">
            <div id="contents">
                <div class="main">
                    <!--ī�װ� ���� ���� ���� !���� �޼���� ���� ���� = .main_content n�� ���!-->
                    <div class="main_content" id="">
                        <!--ī�װ� ����-->
                        <div class="m_tab_area cboth">
                            <div class="main_title cboth">
                                <div class="title_t">
                                    Sample
                                </div>
                            </div>
                        </div>
                        <!--ī�װ��� ��� ��� ����-->
                        <div class="tabcontent current">
                            <div class="cboth ec-base-product">
                                <div class="swiper-container swiper_tab swiper-container-horizontal">
                                    <!--ul ���ο� li �ϳ��� ��� �Ѱ�-->
                                    <ul class="prdList swiper-wrapper" style="width: 2620px; transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;">
                                        <!--thumbnail == ���� ���� / description == ���� ����-->
                                        <li class="swiper-slide" style="width: 232px; margin-right: 30px;">
                                            <div class="box">
                                                <div class="thumbnail">
                                                    <!--��� �̹���-->
                                                    <div class="prdImg">
                                                        <a href="#" class="_evt_tracker">
                                                            <img src="" alt="���û���">
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="description">
                                                    <!--��� �̸�-->
                                                    <div class="name">
                                                        <a href="#" class="_evt_tracker">
                                                            <span style="font-size: 15px;color: #111111;">�������</span>
                                                        	<!-- ajax ������ �κ� -->
                                                        	<span id="req1"></span></li>
                                                        </a>
                                                    </div>
                                                    <!--��ǥ�迭-->
                                                    <ul class="spec">
                                                        <li rel="�迭">
                                                            <span style="font-size: 14px;color: #999999;">���ð迭</span>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="swiper-slide" style="width: 232px; margin-right: 30px;">
                                            <div class="box">
                                                <div class="thumbnail">
                                                    <div class="prdImg">
                                                        <a href="#" class="_evt_tracker">
                                                            <img src="" alt="���û���">
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="description">
                                                    <div class="name">
                                                        <a href="#" class="_evt_tracker">
                                                            <span style="font-size: 15px;color: #111111;">�������</span>
                                                            <span id="req2"></span></li>
                                                        </a>
                                                    </div>
                                                    <ul class="spec">
                                                        <li rel="�迭">
                                                            <span style="font-size: 14px;color: #999999;">���ð迭</span>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="swiper-slide" style="width: 232px; margin-right: 30px;">
                                            <div class="box">
                                                <div class="thumbnail">
                                                    <div class="prdImg">
                                                        <a href="#" class="_evt_tracker">
                                                            <img src="" alt="���û���">
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="description">
                                                    <div class="name">
                                                        <a href="#" class="_evt_tracker">
                                                            <span style="font-size: 15px;color: #111111;">�������</span>
                                                        </a>
                                                    </div>
                                                    <ul class="spec">
                                                        <li rel="�迭">
                                                            <span style="font-size: 14px;color: #999999;">���ð迭</span>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="swiper-slide" style="width: 232px; margin-right: 30px;">
                                            <div class="box">
                                                <div class="thumbnail">
                                                    <div class="prdImg">
                                                        <a href="#" class="_evt_tracker">
                                                            <img src="" alt="���û���">
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="description">
                                                    <div class="name">
                                                        <a href="#" class="_evt_tracker">
                                                            <span style="font-size: 15px;color: #111111;">�������</span>
                                                        </a>
                                                    </div>
                                                    <ul class="spec">
                                                        <li rel="�迭">
                                                            <span style="font-size: 14px;color: #999999;">���ð迭</span>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="swiper-slide" style="width: 232px; margin-right: 30px;">
                                            <div class="box">
                                                <div class="thumbnail">
                                                    <div class="prdImg">
                                                        <a href="#" class="_evt_tracker">
                                                            <img src="" alt="���û���">
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="description">
                                                    <div class="name">
                                                        <a href="#" class="_evt_tracker">
                                                            <span style="font-size: 15px;color: #111111;">�������</span>
                                                        </a>
                                                    </div>
                                                    <ul class="spec">
                                                        <li rel="�迭">
                                                            <span style="font-size: 14px;color: #999999;">���ð迭</span>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="swiper-slide" style="width: 232px; margin-right: 30px;">
                                            <div class="box">
                                                <div class="thumbnail">
                                                    <div class="prdImg">
                                                        <a href="#" class="_evt_tracker">
                                                            <img src="" alt="���û���">
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="description">
                                                    <div class="name">
                                                        <a href="#" class="_evt_tracker">
                                                            <span style="font-size: 15px;color: #111111;">�������</span>
                                                        </a>
                                                    </div>
                                                    <ul class="spec">
                                                        <li rel="�迭">
                                                            <span style="font-size: 14px;color: #999999;">���ð迭</span>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="swiper-slide" style="width: 232px; margin-right: 30px;">
                                            <div class="box">
                                                <div class="thumbnail">
                                                    <div class="prdImg">
                                                        <a href="#" class="_evt_tracker">
                                                            <img src="" alt="���û���">
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="description">
                                                    <div class="name">
                                                        <a href="#" class="_evt_tracker">
                                                            <span style="font-size: 15px;color: #111111;">�������</span>
                                                        </a>
                                                    </div>
                                                    <ul class="spec">
                                                        <li rel="�迭">
                                                            <span style="font-size: 14px;color: #999999;">���ð迭</span>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                    <div class="swiper-scrollbar swiper-scrollbar-tab">
                                        <div class="swiper-scrollbar-drag" style="transform: translate3d(0px,0px,0px); width: 300px; transition-duration: 0ms;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        /* ī�װ��� ��ǰ ���� swiper_tab */
        var swiper_tab = new Swiper('.swiper-container', {
            direction: 'horizontal',
            roundLengths: true,
            slidesPerView: 5, // ���ٿ� ���̴� ��� ����
            spaceBetween: 28,
            scrollbar: {
                el: '.swiper-scrollbar',
                dragSize: 300
            }
        });
    </script>
</body>

</html>