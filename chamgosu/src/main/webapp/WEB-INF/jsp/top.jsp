<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.util.Date, java.text.*, java.io.*, java.net.*, project.config.util.*"%>
<%@ include file="url.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>참고수 본사 관리자페이지</title>
<script src="<%=realPath%>/js/jquery.1.10.2.js"></script>
<script src="<%=realPath%>/js/accordion.min.js"></script>
<script src="<%=realPath%>/js/accordion01.min.js"></script>
<script src="<%=realPath%>/js/util.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<link rel="stylesheet" type="text/css" href="<%=realPath%>/css/contents.css" />
</head>

<body class="subbg">
<!--header-->
<div id="header">
  <ul>
    <li class="fl"><img src="<%=realPath%>/img/layout_logo.png" alt="참고수"></li>
    <li class="fr pdt20"><span><b>접속자</b> : 참고수</span><span><b>접속권한</b> : 상품관리</span><a href="#"><img src="<%=realPath%>/img/logout.png" alt="로그아웃"> 로그아웃</a></li>
  </ul>
</div>
<!--/header-->

<div id="layout"> 
  <!--gnb-->
  <div id="gnb">
    <div class="accordion">
      <h1>기본정보</h1>
      <div> <a href="#">회사정보</a><br>
        <a href="<%= realPath%>/administrator_set.do">관리자 설정</a><br>
        <a href="#">이용약관 관리</a> </div>
      <h1>DB 관리</h1>
      <div> <a href="<%= realPath%>/adminProductList.do">상품관리</a><br>
        <a href="<%= realPath%>/regionProductList.do">지역별 상품 관리</a><br>
        <a href="#">코드 관리</a> </div>
      <h1>거래처 관리</h1>
      <div> <a href="<%= realPath%>/supplyList.do">상품공급자 관리</a><br>
        <a href="<%= realPath%>/supplyRegionList.do">공급자 취급품목 관리</a> </div>
      <h1>회원관리</h1>
      <div> <a href="<%= realPath%>/leaderTrustList.do">위탁영업 리더 관리</a><br>
        <a href="<%= realPath%>/leaderNoList.do">비사업자 리더 관리</a><br>
        <a href="<%= realPath%>/leaderUserList.do">구매회원 관리</a><br>
        <a href="<%= realPath%>/leaderUserNoList.do">비회원 관리</a><br>
      </div>
      <h1>매출통계</h1>
      <div> <a href="#">조건별 매출통계</a> </div>
      <h1>정산관리</h1>
      <div> <a href="#">일괄 지급승인 관리</a><br>
        <a href="#">지급승인 내역조회</a> </div>
      <h1>Message관리</h1>
      <div> <a href="#">푸쉬 관리</a><br>
        <a href="#">문자 관리</a><br>
        <a href="#">메일 관리</a> </div>
      <h1>설정관리</h1>
      <div> <a href="#">공지사항 관리</a><br>
        <a href="#">팝업 관리</a><br>
        <a href="#">사이트이미지 관리</a><br>
        <a href="#">제휴문의 관리</a><br>
        <a href="#">제휴 및 협력사 관리</a> </div>
    </div>
    <script>
			$(".accordion").accordion();
	</script> 
  </div>
  <!--/gnb--> 