<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body class="subbg">
 <!--header-->
<%@ include file="../admin_top.jsp" %>
<!--/header-->

<div id="layout"> 
  <!--gnb-->
  <%@ include file="../admin_nav.jsp" %>
  <!--/gnb--> 
  
  <!--contents-->
  <div id="contents">
    <h2>ㆍ회사정보</h2>
    <h3>쇼핑몰 타이틀</h3>
      <table class="bbs_write01">
        <caption>쇼핑몰 타이틀</caption>
        <colgroup>
        <col width="150" />
        <col width="*" />
        </colgroup>
      <tbody>
        <tr>
          <th scope="row">쇼핑몰 타이틀</th>
          <td><input type="text" class="inputTxt" style="width:90%;" /></td>
        </tr>
        <tr>
          <th scope="row">검색 키워드</th>
          <td><input type="text" class="inputTxt" style="width:90%;" /></td>
        </tr>
        <tr>
          <th scope="row">소개글</th>
          <td><input type="text" class="inputTxt" style="width:90%;" /></td>
        </tr>
      </tbody>
    </table>
    
    <h3>사업자 정보</h3>
      <table class="bbs_write01">
        <caption>사업자 정보</caption>
        <colgroup>
        <col width="150" />
        <col width="300" />
        <col width="150" />
        <col width="*" />
        </colgroup>
      <tbody>
        <tr>
          <th scope="row">사업자등록번호</th>
          <td><input type="text" class="inputTxt" style="width:90%;" /></td>
          <th scope="row" class="bleft">인감</th>
          <td><img src="../img/stamp_noimage.jpg" alt="기본이미지" class="mgb10"> 이미지 사이즈(100X100)<br><input type="text" class="inputTxt" style="width:200px;" /> <input value="찾아보기" type="button" class="btns" /> </td>
        </tr>
        <tr>
          <th scope="row">상호</th>
          <td><input type="text" class="inputTxt" style="width:90%;" /></td>
          <th scope="row" class="bleft">대표자명</th>
          <td><input type="text" class="inputTxt" style="width:90%;" /></td>
        </tr>
        <tr>
          <th scope="row">주소</th>
          <td colspan="3"><input type="text" class="inputTxt" style="width:100px;" title="우편번호 입력" /> 
							<input value="우편번호찾기" type="button" class="btns" /> <input type="text" class="inputTxt" style="width:400px;" /></td>
        </tr>
        <tr>
          <th scope="row" class="bleft">업태</th>
          <td><input type="text" class="inputTxt" style="width:90%;" /></td>
          <th scope="row" class="bleft">종목</th>
          <td><input type="text" class="inputTxt" style="width:90%;" /></td>
        </tr>
        <tr>
          <th scope="row" class="bleft">전화번호</th>
          <td><input type="text" class="inputTxt" style="width:90%;" /></td>
          <th scope="row" class="bleft">팩스번호</th>
          <td><input type="text" class="inputTxt" style="width:90%;" /></td>
        </tr>
      </tbody>
    </table>
    
    <h3>결재 수수료</h3>
      <table class="bbs_write01">
        <caption>결재 수수료</caption>
        <colgroup>
        <col width="150" />
        <col width="*" />
        </colgroup>
      <tbody>
        <tr>
          <th scope="row">카드 수수료</th>
          <td><input type="text" class="inputTxt" style="width:30px;" /> %</td>
        </tr>
        <tr>
          <th scope="row">계좌이체 수수료</th>
          <td><input type="text" class="inputTxt" style="width:30px;" /> %</td>
        </tr>
        <tr>
          <th scope="row">가상계좌 수수료</th>
          <td><input type="text" class="inputTxt" style="width:30px;" /> %</td>
        </tr>
        <tr>
          <th scope="row">휴대폰 수수료</th>
          <td><input type="text" class="inputTxt" style="width:30px;" /> %</td>
        </tr>
      </tbody>
    </table>
    
    <!-- 버튼 -->
    <div class="btnarea">
    <input value="저 장" type="button" class="btn02 mgr10" />
    <input value="취 소" type="button" class="btn01" />
    </div>
    <!-- /버튼 -->
  </div>
  <!--/contents--> 
</div>
</body>