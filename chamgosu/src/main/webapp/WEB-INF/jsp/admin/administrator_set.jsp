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
    <h2>ㆍ관리자 설정</h2>
    <!-- 버튼 -->
    <div class="btnarea-r">
      <input value="신규등록" type="button" class="btnm" />
    </div>
    <!-- /버튼 -->
    <table class="bbs_write01">
      <caption>
      사업자 정보
      </caption>
      <colgroup>
      <col width="150" />
      <col width="300" />
      <col width="150" />
      <col width="*" />
      </colgroup>
      <tbody>
        <tr>
          <th scope="row">아이디</th>
          <td><input type="text" class="inputTxt" style="width:90%;" /></td>
          <th scope="row" class="bleft">비밀번호</th>
          <td><input type="password" class="inputTxt" style="width:90%;" /></td>
        </tr>
        <tr>
          <th scope="row">담당자명</th>
          <td><input type="text" class="inputTxt" style="width:90%;" /></td>
          <th scope="row" class="bleft">휴대전화</th>
          <td><input type="text" class="inputTxt" style="width:90%;" /></td>
        </tr>
        <tr>
          <th scope="row">직통전화</th>
          <td><input type="text" class="inputTxt" style="width:90%;" /></td>
          <th scope="row" class="bleft" rowspan="2">접속권한</th>
          <td rowspan="2"><select style="width:200px;" title="접속권한">
              <option>선택하세요</option>
              <option>웹마스터</option>
              <option>상품관리</option>
              <option>거래처관리</option>
              <option>회원관리</option>
              <option>매출관리</option>
              <option>정산관리</option>
              <option>Message관리</option>
              <option>경영관리</option>
            </select></td>
        </tr>
        <tr>
          <th scope="row">이메일</th>
          <td><input type="text" class="inputTxt" style="width:90%;" /></td>
        </tr>
        <tr>
          <th scope="row">메모</th>
          <td colspan="3"><textarea rows="4" class="inputTxt" style="width:95%;"></textarea></td>
        </tr>
      </tbody>
    </table>
    
    <!-- 버튼 -->
    <div class="btnarea">
      <input value="저 장" type="button" class="btn02 mgr10" />
      <input value="취 소" type="button" class="btn01" />
    </div>
    <!-- /버튼 --> 
    
    <!--list-->
    <table class="bbs_list01 mgt40">
      <caption>
      관리자리스트
      </caption>
      <colgroup>
      <col width="50" />
      <col width="120" />
      <col width="150" />
      <col width="100" />
      <col width="200" />
      <col width="200" />
      <col width="*" />
      </colgroup>
      <thead>
        <tr>
          <th scope="col">번호</th>
          <th scope="col">접속권한</th>
          <th scope="col">아이디</th>
          <th scope="col">담당자명</th>
          <th scope="col">마지막 접속</th>
          <th scope="col">등록일</th>
          <th scope="col">수정/삭제</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1</td>
          <td>웹마스터</td>
          <td>Webmaster</td>
          <td>홍길동</td>
          <td>2016.07.01 PM 05”45</td>
          <td>2016.07.01 PM 05”45</td>
          <td><input value="수정" type="button" class="btns01" />
            <input value="삭제" type="button" class="btns" /></td>
        </tr>
        <tr>
          <td>1</td>
          <td>웹마스터</td>
          <td>Webmaster</td>
          <td>홍길동</td>
          <td>2016.07.01 PM 05”45</td>
          <td>2016.07.01 PM 05”45</td>
          <td><input value="수정" type="button" class="btns01" />
            <input value="삭제" type="button" class="btns" /></td>
        </tr>
        <tr>
          <td>1</td>
          <td>웹마스터</td>
          <td>Webmaster</td>
          <td>홍길동</td>
          <td>2016.07.01 PM 05”45</td>
          <td>2016.07.01 PM 05”45</td>
          <td><input value="수정" type="button" class="btns01" />
            <input value="삭제" type="button" class="btns" /></td>
        </tr>
      </tbody>
    </table>
    <script>
			$('.bbs_list01 tr:even').css("background","#f4f4f4");
	</script>
    <!--/list--> 
    
    <!-- paging -->
    <div class="paging"> <a href="#" class="btn"><img src="<%= realPath%>/css/images/btn_page_prev02.gif" alt="처음 페이지로 가기" /></a> <a href="#" class="btn"><img src="<%= realPath%>/css/images/btn_page_prev.gif" alt="이전 페이지로 가기" /></a> <span> <a href="#"><strong>1</strong></a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> </span> <a href="#" class="btn"><img src="<%= realPath%>/css/images/btn_page_next.gif" alt="다음 페이지로 가기" /></a> <a href="#" class="btn"><img src="<%= realPath%>/css/images/btn_page_next02.gif" alt="마지막 페이지로 가기" /></a> </div>
    <!-- //paging --> 
    
  </div>
  <!--/contents--> 
</div>
</body>