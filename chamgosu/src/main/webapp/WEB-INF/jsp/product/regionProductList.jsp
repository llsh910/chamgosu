<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%
		List<Map<String, Object>> regionProductList = (List<Map<String, Object>>) request.getAttribute("regionProductList");
		Map<String, Object> pageInfo = (Map<String, Object>)request.getAttribute("pageInfo");
		String page_index = RsUtil.checkNull(pageInfo.get("page_index"));
		String totalCount = RsUtil.checkNull(pageInfo.get("totalCount"));
		String allCount = RsUtil.checkNull(pageInfo.get("allCount"));
		String per_page = RsUtil.checkNull(pageInfo.get("per_page"));
		if(page_index.equals("")) page_index = "1";
		
		//출판사 코드 리스트
		List<Map<String, Object>> pbsCodeList = (List<Map<String, Object>>)request.getAttribute("pbsCodeList");
		
		//분야(과목)별 코드 리스트
		List<Map<String, Object>> subjCodeList = (List<Map<String, Object>>)request.getAttribute("subjCodeList");
		
		//대상별 코드 리스트
		List<Map<String, Object>> objCodeList = (List<Map<String, Object>>)request.getAttribute("objCodeList");
		
		//학년별 코드리스트
		List<Map<String, Object>> gradeCodeList = (List<Map<String, Object>>)request.getAttribute("gradeCodeList");
%>
<!--contents-->
  <div id="contents">
    <h2>ㆍ지역별 상품 관리</h2>
    <!--지역선택-->
    <div id="tabwrap">
      <ul class="tabs">
        <li class="active" rel="tab1">서울</li>
        <li rel="tab2">부산</li>
        <li rel="tab3">경기</li>
        <li rel="tab4">인천</li>
        <li rel="tab5">대구</li>
        <li rel="tab6">대전</li>
        <li rel="tab7">광주</li>
        <li rel="tab8">울산</li>
        <li rel="tab9">경남</li>
        <li rel="tab10">경북</li>
        <li rel="tab11">충남</li>
        <li rel="tab12">전남</li>
        <li rel="tab13">전북</li>
        <li rel="tab14">강원</li>
        <li rel="tab15">제주</li>
        <li rel="tab16">세종</li>
        <li rel="tab17">전국</li>
        <li rel="tab18">해외</li>
      </ul>
      <!-- 탭컨텐츠 -->
      <div class="tab_container">
        <div id="tab1" class="tab_content">
          <input type="checkbox" class="chk" />
          강남구
          <input type="checkbox" class="chk" />
          강동구
          <input type="checkbox" class="chk" />
          강북구
          <input type="checkbox" class="chk" />
          강서구
          <input type="checkbox" class="chk" />
          구로구
          <input type="checkbox" class="chk" />
          금천구
          <input type="checkbox" class="chk" />
          관악구
          <input type="checkbox" class="chk" />
          광진구
          <input type="checkbox" class="chk" />
          노원구
          <input type="checkbox" class="chk" />
          도봉구
          <input type="checkbox" class="chk" />
          동대문구
          <input type="checkbox" class="chk" />
          동작구
          <input type="checkbox" class="chk" />
          마포구
          <input type="checkbox" class="chk" />
          서대문구
          <input type="checkbox" class="chk" />
          서초구<br>
          <input type="checkbox" class="chk" />
          성북구
          <input type="checkbox" class="chk" />
          송파구 
          <input type="checkbox" class="chk" />
          성동구
          <input type="checkbox" class="chk" />
          양천구
          <input type="checkbox" class="chk" />
          영등포구
          <input type="checkbox" class="chk" />
          용산구
          <input type="checkbox" class="chk" />
          은평구
          <input type="checkbox" class="chk" />
          종로구
          <input type="checkbox" class="chk" />
          중구
          <input type="checkbox" class="chk" />
          중랑구</div>
        <div id="tab2" class="tab_content">
          <input type="checkbox" class="chk" />
          지역1
          <input type="checkbox" class="chk" />
          지역2
          <input type="checkbox" class="chk" />
          지역3
          <input type="checkbox" class="chk" />
          지역4
          <input type="checkbox" class="chk" />
          지역5</div>
        <div id="tab3" class="tab_content">
          <input type="checkbox" class="chk" />
          지역1
          <input type="checkbox" class="chk" />
          지역2
          <input type="checkbox" class="chk" />
          지역3
          <input type="checkbox" class="chk" />
          지역4
          <input type="checkbox" class="chk" />
          지역5
          <input type="checkbox" class="chk" />
          지역6</div>
        <div id="tab4" class="tab_content">
          <input type="checkbox" class="chk" />
          지역1
          <input type="checkbox" class="chk" />
          지역2
          <input type="checkbox" class="chk" />
          지역3
          <input type="checkbox" class="chk" />
          지역4
          <input type="checkbox" class="chk" />
          지역5</div>
        <div id="tab5" class="tab_content">
          <input type="checkbox" class="chk" />
          지역1
          <input type="checkbox" class="chk" />
          지역2
          <input type="checkbox" class="chk" />
          지역3
          <input type="checkbox" class="chk" />
          지역4
          <input type="checkbox" class="chk" />
          지역5
          <input type="checkbox" class="chk" />
          지역6</div>
        <div id="tab6" class="tab_content">
          <input type="checkbox" class="chk" />
          지역1
          <input type="checkbox" class="chk" />
          지역2
          <input type="checkbox" class="chk" />
          지역3
          <input type="checkbox" class="chk" />
          지역4
          <input type="checkbox" class="chk" />
          지역5</div>
        <div id="tab7" class="tab_content">
          <input type="checkbox" class="chk" />
          지역1
          <input type="checkbox" class="chk" />
          지역2
          <input type="checkbox" class="chk" />
          지역3
          <input type="checkbox" class="chk" />
          지역4
          <input type="checkbox" class="chk" />
          지역5
          <input type="checkbox" class="chk" />
          지역6</div>
        <div id="tab8" class="tab_content">
          <input type="checkbox" class="chk" />
          지역1
          <input type="checkbox" class="chk" />
          지역2
          <input type="checkbox" class="chk" />
          지역3
          <input type="checkbox" class="chk" />
          지역4
          <input type="checkbox" class="chk" />
          지역5</div>
        <div id="tab9" class="tab_content">
          <input type="checkbox" class="chk" />
          지역1
          <input type="checkbox" class="chk" />
          지역2
          <input type="checkbox" class="chk" />
          지역3
          <input type="checkbox" class="chk" />
          지역4
          <input type="checkbox" class="chk" />
          지역5
          <input type="checkbox" class="chk" />
          지역6</div>
        <div id="tab10" class="tab_content">
          <input type="checkbox" class="chk" />
          지역1
          <input type="checkbox" class="chk" />
          지역2
          <input type="checkbox" class="chk" />
          지역3
          <input type="checkbox" class="chk" />
          지역4
          <input type="checkbox" class="chk" />
          지역5</div>
        <div id="tab11" class="tab_content">
          <input type="checkbox" class="chk" />
          지역1
          <input type="checkbox" class="chk" />
          지역2
          <input type="checkbox" class="chk" />
          지역3
          <input type="checkbox" class="chk" />
          지역4
          <input type="checkbox" class="chk" />
          지역5
          <input type="checkbox" class="chk" />
          지역6</div>
        <div id="tab12" class="tab_content">
          <input type="checkbox" class="chk" />
          지역1
          <input type="checkbox" class="chk" />
          지역2
          <input type="checkbox" class="chk" />
          지역3
          <input type="checkbox" class="chk" />
          지역4
          <input type="checkbox" class="chk" />
          지역5</div>
        <div id="tab13" class="tab_content">
          <input type="checkbox" class="chk" />
          지역1
          <input type="checkbox" class="chk" />
          지역2
          <input type="checkbox" class="chk" />
          지역3
          <input type="checkbox" class="chk" />
          지역4
          <input type="checkbox" class="chk" />
          지역5
          <input type="checkbox" class="chk" />
          지역6</div>
        <div id="tab14" class="tab_content">
          <input type="checkbox" class="chk" />
          지역1
          <input type="checkbox" class="chk" />
          지역2
          <input type="checkbox" class="chk" />
          지역3
          <input type="checkbox" class="chk" />
          지역4
          <input type="checkbox" class="chk" />
          지역5</div>
          <div id="tab15" class="tab_content">
          <input type="checkbox" class="chk" />
          지역1
          <input type="checkbox" class="chk" />
          지역2
          <input type="checkbox" class="chk" />
          지역3
          <input type="checkbox" class="chk" />
          지역4
          <input type="checkbox" class="chk" />
          지역5
          <input type="checkbox" class="chk" />
          지역6</div>
        <div id="tab16" class="tab_content">
          <input type="checkbox" class="chk" />
          지역1
          <input type="checkbox" class="chk" />
          지역2
          <input type="checkbox" class="chk" />
          지역3
          <input type="checkbox" class="chk" />
          지역4
          <input type="checkbox" class="chk" />
          지역5</div>
        <div id="tab17" class="tab_content">
          <input type="checkbox" class="chk" />
          지역1
          <input type="checkbox" class="chk" />
          지역2
          <input type="checkbox" class="chk" />
          지역3
          <input type="checkbox" class="chk" />
          지역4
          <input type="checkbox" class="chk" />
          지역5
          <input type="checkbox" class="chk" />
          지역6</div>
        <div id="tab18" class="tab_content">
          <input type="checkbox" class="chk" />
          지역1
          <input type="checkbox" class="chk" />
          지역2
          <input type="checkbox" class="chk" />
          지역3
          <input type="checkbox" class="chk" />
          지역4
          <input type="checkbox" class="chk" />
          지역5</div>
      </div>
      <!-- /탭컨텐츠 --> 
    </div>
    <script>
$(function () {

    $(".tab_content").hide();
    $(".tab_content:first").show();

    $("ul.tabs li").click(function () {
        $("ul.tabs li").removeClass("active").css("color", "#333");
        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
        $(this).addClass("active").css("color", "#fff");
        $(".tab_content").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
    });
});
</script> 
    <!--/지역선택--> 
    
    <!-- search -->
    <div class="search">
      <ul>
        <li class="fl"> <span>SEARCH</span>
          <input type="text" class="inputTxt" style="width:320px;" />
          <input value="검색하기" type="button" class="btnm" />
        </li>
      </ul>
    </div>
    <!-- /search --> 
    
    <!-- detail search -->
    <div class="accordion01">
      <h1>상세검색</h1>
      <div class="dib">
        <ul>
          <li class="menu">
            <table style="width:800px">
              <colgroup>
              <col width="121" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              </colgroup>
              <tr>
                <th scope="col">출판사별</th>
                <td><input type="checkbox" class="chk" />
                  천재교육</td>
                <td><input type="checkbox" class="chk" />
                  비상교육</td>
                <td><input type="checkbox" class="chk" />
                  신사고</td>
                <td><input type="checkbox" class="chk" />
                  개념정리</td>
                <td><input type="checkbox" class="chk" />
                  길벗</td>
                <td><input type="checkbox" class="chk" />
                  신사고</td>
                <td><input type="checkbox" class="chk" />
                  개념정리</td>
              </tr>
            </table>
            <a>40개 <img src="../img/more.gif" alt="more"/></a>
            <ul class="hide">
              <li>
                <table style="width:800px">
                  <colgroup>
                  <col width="121" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  </colgroup>
                  <tr>
                    <th scope="col"></th>
                    <td><input type="checkbox" class="chk" />
                      천재교육</td>
                    <td><input type="checkbox" class="chk" />
                      비상교육</td>
                    <td><input type="checkbox" class="chk" />
                      신사고</td>
                    <td><input type="checkbox" class="chk" />
                      개념정리</td>
                    <td><input type="checkbox" class="chk" />
                      길벗</td>
                    <td><input type="checkbox" class="chk" />
                      신사고</td>
                    <td><input type="checkbox" class="chk" />
                      개념정리</td>
                  </tr>
                  <tr>
                    <th scope="col"></th>
                    <td><input type="checkbox" class="chk" />
                      천재교육</td>
                    <td><input type="checkbox" class="chk" />
                      비상교육</td>
                    <td><input type="checkbox" class="chk" />
                      신사고</td>
                    <td><input type="checkbox" class="chk" />
                      개념정리</td>
                    <td><input type="checkbox" class="chk" />
                      길벗</td>
                    <td><input type="checkbox" class="chk" />
                      신사고</td>
                    <td><input type="checkbox" class="chk" />
                      개념정리</td>
                  </tr>
                </table>
              </li>
            </ul>
          </li>
          <li class="menu">
            <table style="width:800px">
              <colgroup>
              <col width="121" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              </colgroup>
              <tr>
                <th scope="col">분야(과목)별</th>
                <td><input type="checkbox" class="chk" />
                  국어</td>
                <td><input type="checkbox" class="chk" />
                  수학</td>
                <td><input type="checkbox" class="chk" />
                  영어</td>
                <td><input type="checkbox" class="chk" />
                  사회</td>
                <td><input type="checkbox" class="chk" />
                  과학</td>
                <td><input type="checkbox" class="chk" />
                  토익</td>
                <td><input type="checkbox" class="chk" />
                  기술</td>
              </tr>
            </table>
            <a>40개 <img src="../img/more.gif" alt="more"/></a>
            <ul class="hide">
              <li>
                <table style="width:800px">
                  <colgroup>
                  <col width="121" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  </colgroup>
                  <tr>
                    <th scope="col"></th>
                    <td><input type="checkbox" class="chk" />
                      국어</td>
                    <td><input type="checkbox" class="chk" />
                      수학</td>
                    <td><input type="checkbox" class="chk" />
                      영어</td>
                    <td><input type="checkbox" class="chk" />
                      사회</td>
                    <td><input type="checkbox" class="chk" />
                      과학</td>
                    <td><input type="checkbox" class="chk" />
                      토익</td>
                    <td><input type="checkbox" class="chk" />
                      기술</td>
                  </tr>
                  <tr>
                    <th scope="col"></th>
                    <td><input type="checkbox" class="chk" />
                      국어</td>
                    <td><input type="checkbox" class="chk" />
                      수학</td>
                    <td><input type="checkbox" class="chk" />
                      영어</td>
                    <td><input type="checkbox" class="chk" />
                      사회</td>
                    <td><input type="checkbox" class="chk" />
                      과학</td>
                    <td><input type="checkbox" class="chk" />
                      토익</td>
                    <td><input type="checkbox" class="chk" />
                      기술</td>
                  </tr>
                </table>
              </li>
            </ul>
          </li>
          <li class="menu">
            <table style="width:800px">
              <colgroup>
              <col width="121" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              </colgroup>
              <tr>
                <th scope="col">대상별</th>
                <td><input type="checkbox" class="chk" />
                  유치부</td>
                <td><input type="checkbox" class="chk" />
                  초등학생</td>
                <td><input type="checkbox" class="chk" />
                  중학생</td>
                <td><input type="checkbox" class="chk" />
                  고등학생</td>
                <td><input type="checkbox" class="chk" />
                  대학생</td>
                <td><input type="checkbox" class="chk" />
                  대학원생</td>
                <td><input type="checkbox" class="chk" />
                  박사과정</td>
              </tr>
            </table>
            <a>40개 <img src="../img/more.gif" alt="more"/></a>
            <ul class="hide">
              <li>
                <table style="width:800px">
                  <colgroup>
                  <col width="121" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  </colgroup>
                  <tr>
                    <th scope="col"></th>
                    <td><input type="checkbox" class="chk" />
                      유치부</td>
                    <td><input type="checkbox" class="chk" />
                      초등학생</td>
                    <td><input type="checkbox" class="chk" />
                      중학생</td>
                    <td><input type="checkbox" class="chk" />
                      고등학생</td>
                    <td><input type="checkbox" class="chk" />
                      대학생</td>
                    <td><input type="checkbox" class="chk" />
                      대학원생</td>
                    <td><input type="checkbox" class="chk" />
                      박사과정</td>
                  </tr>
                  <tr>
                    <th scope="col"></th>
                    <td><input type="checkbox" class="chk" />
                      유치부</td>
                    <td><input type="checkbox" class="chk" />
                      초등학생</td>
                    <td><input type="checkbox" class="chk" />
                      중학생</td>
                    <td><input type="checkbox" class="chk" />
                      고등학생</td>
                    <td><input type="checkbox" class="chk" />
                      대학생</td>
                    <td><input type="checkbox" class="chk" />
                      대학원생</td>
                    <td><input type="checkbox" class="chk" />
                      박사과정</td>
                  </tr>
                </table>
              </li>
            </ul>
          </li>
          <li class="menu">
            <table style="width:800px">
              <colgroup>
              <col width="121" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              </colgroup>
              <tr>
                <th scope="col">학년별</th>
                <td><input type="checkbox" class="chk" />
                  1학년</td>
                <td><input type="checkbox" class="chk" />
                  2학년</td>
                <td><input type="checkbox" class="chk" />
                  3학년</td>
                <td><input type="checkbox" class="chk" />
                  4학년</td>
                <td><input type="checkbox" class="chk" />
                  4학년</td>
                <td><input type="checkbox" class="chk" />
                  5학년</td>
                <td><input type="checkbox" class="chk" />
                  6학년</td>
              </tr>
            </table>
            <a>40개 <img src="../img/more.gif" alt="more"/></a>
            <ul class="hide">
              <li>
                <table style="width:800px">
                  <colgroup>
                  <col width="121" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  </colgroup>
                  <tr>
                    <th scope="col"></th>
                    <td><input type="checkbox" class="chk" />
                      1학년</td>
                    <td><input type="checkbox" class="chk" />
                      2학년</td>
                    <td><input type="checkbox" class="chk" />
                      3학년</td>
                    <td><input type="checkbox" class="chk" />
                      4학년</td>
                    <td><input type="checkbox" class="chk" />
                      4학년</td>
                    <td><input type="checkbox" class="chk" />
                      5학년</td>
                    <td><input type="checkbox" class="chk" />
                      6학년</td>
                  </tr>
                </table>
              </li>
            </ul>
          </li>
          <li class="menu">
            <table style="width:800px">
              <colgroup>
              <col width="121" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              </colgroup>
              <tr>
                <th scope="col">발행연도별</th>
                <td><input type="checkbox" class="chk" />
                  2014년</td>
                <td><input type="checkbox" class="chk" />
                  2015년</td>
                <td><input type="checkbox" class="chk" />
                  2016년</td>
                <td><input type="checkbox" class="chk" />
                  2017년</td>
                <td><input type="checkbox" class="chk" />
                  2018년</td>
                <td><input type="checkbox" class="chk" />
                  2019년</td>
                <td><input type="checkbox" class="chk" />
                  2020년</td>
              </tr>
            </table>
            <a>40개 <img src="../img/more.gif" alt="more"/></a>
            <ul class="hide">
              <li>
                <table style="width:800px">
                  <colgroup>
                  <col width="121" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  </colgroup>
                  <tr>
                    <th scope="col"></th>
                    <td><input type="checkbox" class="chk" />
                      2014년</td>
                    <td><input type="checkbox" class="chk" />
                      2015년</td>
                    <td><input type="checkbox" class="chk" />
                      2016년</td>
                    <td><input type="checkbox" class="chk" />
                      2017년</td>
                    <td><input type="checkbox" class="chk" />
                      2018년</td>
                    <td><input type="checkbox" class="chk" />
                      2019년</td>
                    <td><input type="checkbox" class="chk" />
                      2020년</td>
                  </tr>
                </table>
              </li>
            </ul>
          </li>
          <li class="menu">
            <table style="width:800px">
              <colgroup>
              <col width="121" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              </colgroup>
              <tr>
                <th scope="col">상품등록자별</th>
                <td><input type="checkbox" class="chk" />
                  본사담당자</td>
                <td><input type="checkbox" class="chk" />
                  교보문고</td>
                <td><input type="checkbox" class="chk" />
                  영풍문고</td>
                <td><input type="checkbox" class="chk" />
                  강원도서</td>
                <td><input type="checkbox" class="chk" />
                  서울서점</td>
                <td><input type="checkbox" class="chk" />
                  광명서적</td>
                <td><input type="checkbox" class="chk" />
                  최고책방</td>
              </tr>
            </table>
            <a>40개 <img src="../img/more.gif" alt="more"/></a>
            <ul class="hide">
              <li>
                <table style="width:800px">
                  <colgroup>
                  <col width="121" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  </colgroup>
                  <tr>
                    <th scope="col"></th>
                    <td><input type="checkbox" class="chk" />
                      본사담당자</td>
                    <td><input type="checkbox" class="chk" />
                      교보문고</td>
                    <td><input type="checkbox" class="chk" />
                      영풍문고</td>
                    <td><input type="checkbox" class="chk" />
                      강원도서</td>
                    <td><input type="checkbox" class="chk" />
                      서울서점</td>
                    <td><input type="checkbox" class="chk" />
                      광명서적</td>
                    <td><input type="checkbox" class="chk" />
                      최고책방</td>
                  </tr>
                  <tr>
                    <th scope="col"></th>
                    <td><input type="checkbox" class="chk" />
                      본사담당자</td>
                    <td><input type="checkbox" class="chk" />
                      교보문고</td>
                    <td><input type="checkbox" class="chk" />
                      영풍문고</td>
                    <td><input type="checkbox" class="chk" />
                      강원도서</td>
                    <td><input type="checkbox" class="chk" />
                      서울서점</td>
                    <td><input type="checkbox" class="chk" />
                      광명서적</td>
                    <td><input type="checkbox" class="chk" />
                      최고책방</td>
                  </tr>
                </table>
              </li>
            </ul>
          </li>
          <li class="menu">
            <table style="width:800px">
              <colgroup>
              <col width="121" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              </colgroup>
              <tr>
                <th scope="col">상품공급자별</th>
                <td><input type="checkbox" class="chk" />
                  국영수책마당</td>
                <td><input type="checkbox" class="chk" />
                  으뜸학원</td>
                <td><input type="checkbox" class="chk" />
                  빨간펜</td>
                <td><input type="checkbox" class="chk" />
                  한국문고</td>
                <td><input type="checkbox" class="chk" />
                  영재교육책</td>
                <td><input type="checkbox" class="chk" />
                  북까페도매</td>
                <td><input type="checkbox" class="chk" />
                  대전서적</td>
              </tr>
            </table>
            <a>40개 <img src="../img/more.gif" alt="more"/></a>
            <ul class="hide">
              <li>
                <table style="width:800px">
                  <colgroup>
                  <col width="121" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  <col width="97" />
                  </colgroup>
                  <tr>
                    <th scope="col"></th>
                    <td><input type="checkbox" class="chk" />
                      국영수책마당</td>
                    <td><input type="checkbox" class="chk" />
                      으뜸학원</td>
                    <td><input type="checkbox" class="chk" />
                      빨간펜</td>
                    <td><input type="checkbox" class="chk" />
                      한국문고</td>
                    <td><input type="checkbox" class="chk" />
                      영재교육책</td>
                    <td><input type="checkbox" class="chk" />
                      북까페도매</td>
                    <td><input type="checkbox" class="chk" />
                      대전서적</td>
                  </tr>
                  <tr>
                    <th scope="col"></th>
                    <td><input type="checkbox" class="chk" />
                      국영수책마당</td>
                    <td><input type="checkbox" class="chk" />
                      으뜸학원</td>
                    <td><input type="checkbox" class="chk" />
                      빨간펜</td>
                    <td><input type="checkbox" class="chk" />
                      한국문고</td>
                    <td><input type="checkbox" class="chk" />
                      영재교육책</td>
                    <td><input type="checkbox" class="chk" />
                      북까페도매</td>
                    <td><input type="checkbox" class="chk" />
                      대전서적</td>
                  </tr>
                </table>
              </li>
            </ul>
          </li>
        </ul>
      </div>
      <script>
    $(document).ready(function(){
        $(".menu>a").click(function(){
            $(this).next("ul").toggleClass("hide");
        });
    });
</script> 
    </div>
    <script>
			$(".accordion01").accordion01();
	</script> 
    <!-- /detail search -->
    
    <h4><span>총 상품수 : 100건</span> 검색상품 수 : 100건
      <p>
        <select style="width:90px;">
          <option>10개씩 보기</option>
          <option>20개씩 보기</option>
          <option>50개씩 보기</option>
          <option>100개씩 보기</option>
        </select>
      </p>
    </h4>
    <table class="bbs_list02">
      <caption>
      상품리스트
      </caption>
      <colgroup>
      <col width="30" />
      <col width="100" />
      <col width="100" />
      <col width="102" />
      <col width="80" />
      <col width="80" />
      <col width="70" />
      <col width="80" />
      <col width="70" />
      <col width="110" />
      <col width="50" />
      <col width="110" />
      </colgroup>
      <thead>
        <tr>
          <th scope="col"><input type="checkbox" class="chk" id="checkall" /></th>
          <th scope="col">교재 이미지</th>
          <th scope="col">상품일련번호<br>
            ISBN</th>
          <th scope="col">교재명<br>
            (부제목)</th>
          <th scope="col">출판사<br>
            저자</th>
          <th scope="col">정가<br>
            분야(과목)</th>
          <th scope="col">대상<br>
            학년</th>
          <th scope="col">단계<br>
            발행연도</th>
          <th scope="col">공급자<br>
            공급율</th>
          <th scope="col">상품등록자별<br>
            <input type="checkbox" class="chk" id="checkall01" />
              예
              <input type="checkbox" class="chk" id="checkall02" />
              아니오</th>
          <th scope="col">재고</th>
          <th scope="col">수정/삭제</th>
        </tr>
      </thead>
    </table>
    <!--스크롤되는 테이블영역(책이미지 가로80px로 리사이징됩니다.)-->
    <div class="scy_line">
      <table class="bbs_list02 botn">
        <caption>
        상품리스트
        </caption>
        <colgroup>
        <col width="30" />
        <col width="100" />
        <col width="100" />
        <col width="102" />
        <col width="80" />
        <col width="80" />
        <col width="70" />
        <col width="80" />
        <col width="70" />
        <col width="110" />
        <col width="50" />
        <col width="93" />
        </colgroup>
        <tbody>
        	 <% 
	          	if(regionProductList.size() > 0){
	          		for(int i=0; i<regionProductList.size(); i++){%>
          <tr> <td><input type="checkbox" class="chk" name="chk" /></td>
            <td><img src="<%= realPath%><%= (RsUtil.checkNull(regionProductList.get(i).get("MG_BOOKIMG")).equals("") ? "/img/book_noimage.jpg" : "/bookimg/thumnail_" + RsUtil.checkNull(regionProductList.get(i).get("MG_BOOKIMG")) ) %>" alt="책 기본이미지"></td>
            <td><%= RsUtil.checkNull(regionProductList.get(i).get("MG_ISBN"))%></td>
            <td><%= RsUtil.checkNull(regionProductList.get(i).get("MG_BOOKNM"))%><br>
	              (<%= RsUtil.checkNull(regionProductList.get(i).get("MG_BOOKSUBNM"))%>)</td>
            <td><%= RsUtil.checkNull(regionProductList.get(i).get("MG_PBS"))%><br>
	             	 <%= RsUtil.checkNull(regionProductList.get(i).get("MG_BOOKWRITER"))%></td>
            <td><%= MultiUtil.comma(RsUtil.checkNull(regionProductList.get(i).get("MG_PRICE")))%>원<br>
	             	 <%= RsUtil.checkNull(regionProductList.get(i).get("MG_SUBJECT"))%></td>
            <td><%= RsUtil.checkNull(regionProductList.get(i).get("MG_OBJECT"))%><br />
	            	<%= RsUtil.checkNull(regionProductList.get(i).get("MG_GRADE"))%>
	            </td>
           <td><%= RsUtil.checkNull(regionProductList.get(i).get("MG_BOOKISYEAR"))%></td>
            <td><%= RsUtil.checkNull(regionProductList.get(i).get("SP_BUSINM"))%><br>
              <%= RsUtil.checkNull(regionProductList.get(i).get("RG_SPRATE"))%>%</td>
            <td>본사 담당자<br>
              <input type="checkbox" class="chk" name="chk01" />
              예
              <input type="checkbox" class="chk" name="chk02" />
              아니오</td>
            <td><%= RsUtil.checkNull(regionProductList.get(i).get("RG_STOCKCNT"))%></td>
            <td><input value="수정" type="button" class="btns01" />
              <input value="삭제" type="button" class="btns" /></td>
          </tr>
          <%}}else{%>
          	<tr>
          		<td colspan="11">상품이 존재하지 않습니다.</td>
          	</tr>
          <%} %>
        </tbody>
      </table>
    </div>
    <!--/스크롤되는 테이블영역--> 
    <script>
			$('.bbs_list01 tr:even').css("background","#f4f4f4");
			$('.bbs_list02 tr:even').css("background","#f4f4f4");
		</script> 
    
    <!-- paging -->
    <div class="paging"> <a href="#" class="btn"><img src="../img/btn_page_prev02.gif" alt="처음 페이지로 가기" /></a> <a href="#" class="btn"><img src="../img/btn_page_prev.gif" alt="이전 페이지로 가기" /></a> <span> <a href="#"><strong>1</strong></a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> </span> <a href="#" class="btn"><img src="../img/btn_page_next.gif" alt="다음 페이지로 가기" /></a> <a href="#" class="btn"><img src="../img/btn_page_next02.gif" alt="마지막 페이지로 가기" /></a> </div>
    <!-- //paging --> 
    
    <!-- 버튼 -->
    <div class="btnarea">
      <input value="일괄저장" type="button" class="btn02 mgr10" />
      <input value="선택삭제" type="button" class="btn01" />
    </div>
    <!-- /버튼 --> 
  </div>
  <!--/contents--> 
  <%@ include file="../bottom.jsp"%>