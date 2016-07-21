<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>
<%
	//코드 메인 페이지
	
	List<Map<String, Object>> indexCodeList = (List<Map<String, Object>>)request.getAttribute("indexCodeList");
	List<Map<String, Object>> code1List = (List<Map<String, Object>>)request.getAttribute("code1List");
	
	
%>
 <!--contents-->
  <div id="contents">
    <h2>ㆍ코드 관리</h2>
    
    <!--코드리스트--> 
    <script>
document.write('<style type="text/css">.tabber{display:none;}<\/style>');
var tabberOptions = {
  'manualStartup':true,
  'onLoad': function(argsObj) {
    if (argsObj.tabber.id == 'tab2') {
      alert('Finished loading tab2!');
    }
  },

  'onClick': function(argsObj) {

    var t = argsObj.tabber;
    var id = t.id;
    var i = argsObj.index; 
    var e = argsObj.event; 

    if (id == 'tab2') {
      return confirm('Swtich to '+t.tabs[i].headingText+'?\nEvent type: '+e.type);
    }
  },
  'addLinkId': true

};
</script>
    <div class="tabber" id="tab1">
      <div class="tabbertab">
        <h2>영업지역</h2>
        <div class="tabber" id="tab1-1"> 
          <!--지역등록하기-->
          <div class="mgb20 agl">
          <input type="text" class="inputTxt" style="width:120px;" /> 
          <input value="시.도 등록하기" type="button" class="btns01 mgr15" />
          <select style="width:70px;">
            <option>서울</option>
            <option>부산</option>
            <option>경기</option>
            <option>인천</option>
            <option>대구</option>
            <option>대전</option>
            <option>광주</option>
            <option>울산</option>
            <option>경남</option>
            <option>경북</option>
            <option>충북</option>
            <option>충남</option>
            <option>전남</option>
            <option>전북</option>
            <option>강원</option>
            <option>제주</option>
            <option>세종</option>
          </select> →
          <input type="text" class="inputTxt" style="width:120px;" /> 
          <input value="시.도 수정하기" type="button" class="btns01 mgr15" /> 
          <select style="width:70px;">
            <option>서울</option>
            <option>부산</option>
            <option>경기</option>
            <option>인천</option>
            <option>대구</option>
            <option>대전</option>
            <option>광주</option>
            <option>울산</option>
            <option>경남</option>
            <option>경북</option>
            <option>충북</option>
            <option>충남</option>
            <option>전남</option>
            <option>전북</option>
            <option>강원</option>
            <option>제주</option>
            <option>세종</option>
          </select>
          <input value="시.도 삭제하기" type="button" class="btns01 mgr15" />
          </div>
          <!--/지역등록하기-->
          
          <!--지역선택-->
          <div id="tabwrap">
            <ul class="tabs">
              <li class="active w60" rel="tab17">서울</li>
              <li class="w60" rel="tab2">부산</li>
              <li class="w60" rel="tab3">경기</li>
              <li class="w60" rel="tab4">인천</li>
              <li class="w60" rel="tab5">대구</li>
              <li class="w60" rel="tab6">대전</li>
              <li class="w60" rel="tab7">광주</li>
              <li class="w60" rel="tab8">울산</li>
              <li class="w60" rel="tab9">경남</li>
              <li class="w60" rel="tab10">경북</li>
              <li class="w60" rel="tab18">충북</li>
              <li class="w60" rel="tab11">충남</li>
              <li class="w60" rel="tab12">전남</li>
              <li class="w60" rel="tab13">전북</li>
              <li class="w60" rel="tab14">강원</li>
              <li class="w60" rel="tab15">제주</li>
              <li class="w60" rel="tab16">세종</li>
            </ul>
            <!-- 탭컨텐츠 -->
            <div class="tab_container bon">
              <div id="tab17" class="tab_content">
                <table class="bbs_list01" style="width:945px;">
                  <caption>
                  서울
                  </caption>
                  <colgroup>
                  <col width="*" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  </colgroup>
                  <thead>
                    <tr>
                      <th colspan="9" class="agr"><div class="fl mgl20">서울특별시</div>
          <input type="text" class="inputTxt" style="width:120px;" /> 
          <input value="시.군.구 등록하기" type="button" class="btns01 mgr10" /></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><b>강북구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>도봉구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>노원구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>중랑구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>동대문구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>성북구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>종로구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>은평구</b></td>
                      <td><p class="predtxt">미사용</p></td>
                      <td><input value="사용시작" type="button" class="btnsb" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>서대문구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>마포구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>용산구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>중구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>성동구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>광진구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>강동구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>송파구</b></td>
                      <td><p class="predtxt">미사용</p></td>
                      <td><input value="사용시작" type="button" class="btnsb" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>강남구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>서초구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>동작구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>영등포구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>강서구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>양천구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>구로구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>금천구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>관악구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div id="tab2" class="tab_content">
                <table class="bbs_list01" style="width:945px;">
                  <caption>
                  부산광역시
                  </caption>
                  <colgroup>
                  <col width="*" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  </colgroup>
                  <thead>
                    <tr>
                      <th colspan="9" class="agr"><div class="fl mgl20">부산광역시</div>
          <input type="text" class="inputTxt" style="width:120px;" /> 
          <input value="시.군.구 등록하기" type="button" class="btns01 mgr10" /></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><b>기장군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>금정구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>북구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>강서구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>사상구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>부산진구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>연제구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>동래구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>해운대구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>수영구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>남구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>동구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>중구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>영도구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>서구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>사하구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div id="tab3" class="tab_content">
                <table class="bbs_list01" style="width:945px;">
                  <caption>
                  경기도
                  </caption>
                  <colgroup>
                  <col width="*" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  </colgroup>
                  <thead>
                    <tr>
                      <th colspan="9" class="agr"><div class="fl mgl20">경기도</div>
                        <input type="text" class="inputTxt" style="width:120px;" /> 
          <input value="시.군.구 등록하기" type="button" class="btns01 mgr10" /></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><b>김포시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>파주시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>연쳔군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>고양시 덕양구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>고양시 덕양구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>고양시 일산동구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>포천시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>동두천시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>양주시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>의정부시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>구리시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>남양주시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>가평군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>양평군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>여주시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>광주시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>하남시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>과천시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>성남시 수정구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>성남시 중원구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>성남시 분당구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>안양시 동안구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>안양시 만안구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>광명시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>부천시 오정구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>부천시 원미구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>부천시 소사구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>시흥시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>안산시 단원구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>안산시 상록구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>군포시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>이천시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>안성시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>수원시 영통구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>수원시 장안구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>수원시 팔달구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>수원시 권선구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>용인시 기흥구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>용인시 수지구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>용인시 처인구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>의왕시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>평택시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>오산시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>화성시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div id="tab4" class="tab_content">
                <table class="bbs_list01" style="width:945px;">
                  <caption>
                  인천시
                  </caption>
                  <colgroup>
                  <col width="*" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  </colgroup>
                  <thead>
                    <tr>
                      <th colspan="9" class="agr"><div class="fl mgl20">인천시</div>
                        <input type="text" class="inputTxt" style="width:120px;" /> 
          <input value="시.군.구 등록하기" type="button" class="btns01 mgr10" /></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><b>계양구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>부평구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>남동구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>연수구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>남구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>중구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>동구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>서구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>강화군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>옹진군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div id="tab5" class="tab_content">
                <table class="bbs_list01" style="width:945px;">
                  <caption>
                  대구광역시
                  </caption>
                  <colgroup>
                  <col width="*" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  </colgroup>
                  <thead>
                    <tr>
                      <th colspan="9" class="agr"><div class="fl mgl20">대구광역시</div>
                        <input type="text" class="inputTxt" style="width:120px;" /> 
          <input value="시.군.구 등록하기" type="button" class="btns01 mgr10" /></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><b>동구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>북구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>서구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>중구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>남구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>수성구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>달서구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>달성군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div id="tab6" class="tab_content">
                <table class="bbs_list01" style="width:945px;">
                  <caption>
                  대전시
                  </caption>
                  <colgroup>
                  <col width="*" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  </colgroup>
                  <thead>
                    <tr>
                      <th colspan="9" class="agr"><div class="fl mgl20">대전시</div>
                        <input type="text" class="inputTxt" style="width:120px;" /> 
          <input value="시.군.구 등록하기" type="button" class="btns01 mgr10" /></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><b>유성구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>대덕구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>동구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>중구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>서구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div id="tab7" class="tab_content">
                <table class="bbs_list01" style="width:945px;">
                  <caption>
                  광주광역시
                  </caption>
                  <colgroup>
                  <col width="*" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  </colgroup>
                  <thead>
                    <tr>
                      <th colspan="9" class="agr"><div class="fl mgl20">광주광역시</div>
                        <input type="text" class="inputTxt" style="width:120px;" /> 
          <input value="시.군.구 등록하기" type="button" class="btns01 mgr10" /></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><b>북구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>동구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>남구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>서구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>광산구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div id="tab8" class="tab_content">
                <table class="bbs_list01" style="width:945px;">
                  <caption>
                  울산광역시
                  </caption>
                  <colgroup>
                  <col width="*" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  </colgroup>
                  <thead>
                    <tr>
                      <th colspan="9" class="agr"><div class="fl mgl20">울산광역시</div>
                        <input type="text" class="inputTxt" style="width:120px;" /> 
          <input value="시.군.구 등록하기" type="button" class="btns01 mgr10" /></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><b>동구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>북구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>중구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>남구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>울주군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div id="tab9" class="tab_content">
                <table class="bbs_list01" style="width:945px;">
                  <caption>
                  부산광역시
                  </caption>
                  <colgroup>
                  <col width="*" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  </colgroup>
                  <thead>
                    <tr>
                      <th colspan="9" class="agr"><div class="fl mgl20">부산광역시</div>
                        <input type="text" class="inputTxt" style="width:120px;" /> 
          <input value="시.군.구 등록하기" type="button" class="btns01 mgr10" /></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><b>거창군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>함양군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>합천군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>창녕군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>밀양시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>양산시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>김해시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>창원시 의창구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>창원시 마산합포구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>창원시 마산회원구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>창원시 성산구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>창원시 진해구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>함안군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>의령군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>산청군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>하동군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>남해군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>사천시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>진주시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>고성군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>통영시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>거제시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div id="tab10" class="tab_content">
                <table class="bbs_list01" style="width:945px;">
                  <caption>
                  경상북도
                  </caption>
                  <colgroup>
                  <col width="*" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  </colgroup>
                  <thead>
                    <tr>
                      <th colspan="9" class="agr"><div class="fl mgl20">경상북도</div>
                        <input type="text" class="inputTxt" style="width:120px;" /> 
          <input value="시.군.구 등록하기" type="button" class="btns01 mgr10" /></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><b>영주시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>봉화군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>울진군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>영덕군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>영양군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>안동시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>예천군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>문경시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>상주시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>의성군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>청송군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>경주시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>포항시 북구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>포항시 남구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>청도군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>경산시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>영천시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>군위군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>구미시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>김천시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>칠곡군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>성주군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>고령군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>울릉군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div id="tab11" class="tab_content">
                <table class="bbs_list01" style="width:945px;">
                  <caption>
                  충청남도
                  </caption>
                  <colgroup>
                  <col width="*" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  </colgroup>
                  <thead>
                    <tr>
                      <th colspan="9" class="agr"><div class="fl mgl20">충청남도</div>
                        <input type="text" class="inputTxt" style="width:120px;" /> 
          <input value="시.군.구 등록하기" type="button" class="btns01 mgr10" /></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><b>천안시 동남구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>천안시 서북구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>아산시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>당진시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>서산시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>태안군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>홍성군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>예산군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>공주시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>금산군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>계룡시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>논산시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>부여군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>청양군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>보령시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>서천군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div id="tab12" class="tab_content">
                <table class="bbs_list01" style="width:945px;">
                  <caption>
                  전라남도
                  </caption>
                  <colgroup>
                  <col width="*" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  </colgroup>
                  <thead>
                    <tr>
                      <th colspan="9" class="agr"><div class="fl mgl20">전라남도</div>
                        <input type="text" class="inputTxt" style="width:120px;" /> 
          <input value="시.군.구 등록하기" type="button" class="btns01 mgr10" /></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><b>영광군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>함평군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>장성군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>담양군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>곡성군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>구례군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>광양시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>순천시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>화순군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>나주시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>영암군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>무안군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>목포시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>신안군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>진도군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>해남군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>완도군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>강진군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>장흥군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>보성군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>고흥군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>여수시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div id="tab13" class="tab_content">
                <table class="bbs_list01" style="width:945px;">
                  <caption>
                  전라북도
                  </caption>
                  <colgroup>
                  <col width="*" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  </colgroup>
                  <thead>
                    <tr>
                      <th colspan="9" class="agr"><div class="fl mgl20">전라북도</div>
                        <input type="text" class="inputTxt" style="width:120px;" /> 
          <input value="시.군.구 등록하기" type="button" class="btns01 mgr10" /></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><b>군산시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>김제시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>익산시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>전주시 덕진구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>전주시 완산구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>완주군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>진안군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>무주군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>장수군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>남원시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>임실군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>순창군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>정읍시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>부안군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>고창군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div id="tab14" class="tab_content">
                <table class="bbs_list01" style="width:945px;">
                  <caption>
                  강원도
                  </caption>
                  <colgroup>
                  <col width="*" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  </colgroup>
                  <thead>
                    <tr>
                      <th colspan="9" class="agr"><div class="fl mgl20">강원도</div>
                        <input type="text" class="inputTxt" style="width:120px;" /> 
          <input value="시.군.구 등록하기" type="button" class="btns01 mgr10" /></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><b>철원군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>화천군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>춘천시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>양구군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>인제군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>고성군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>속초시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>양양군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>홍천군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>횡성군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>평창군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>강릉시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>평창군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>강릉시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>동해시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>삼척시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>태백시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>정선군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>영월군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>원주시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div id="tab15" class="tab_content">
                <table class="bbs_list01" style="width:945px;">
                  <caption>
                  울산광역시
                  </caption>
                  <colgroup>
                  <col width="*" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  </colgroup>
                  <thead>
                    <tr>
                      <th colspan="9" class="agr"><div class="fl mgl20">울산광역시</div>
                        <input type="text" class="inputTxt" style="width:120px;" /> 
          <input value="시.군.구 등록하기" type="button" class="btns01 mgr10" /></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><b>제주시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>서귀포시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div id="tab16" class="tab_content">
                <table class="bbs_list01" style="width:945px;">
                  <caption>
                  충청북도
                  </caption>
                  <colgroup>
                  <col width="*" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  </colgroup>
                  <thead>
                    <tr>
                      <th colspan="9" class="agr"><div class="fl mgl20">세종시</div>
                        <input type="text" class="inputTxt" style="width:120px;" /> 
          <input value="시.군.구 등록하기" type="button" class="btns01 mgr10" /></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><b>세종특별자치시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div id="tab18" class="tab_content">
                <table class="bbs_list01" style="width:945px;">
                  <caption>
                  충청북도
                  </caption>
                  <colgroup>
                  <col width="*" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  </colgroup>
                  <thead>
                    <tr>
                      <th colspan="9" class="agr"><div class="fl mgl20">충청북도</div>
                        <input type="text" class="inputTxt" style="width:120px;" /> 
          <input value="시.군.구 등록하기" type="button" class="btns01 mgr10" /></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td><b>단양군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>제천시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>충주시</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>음성군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>진천군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>증평군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>괴산군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>청주시 상당구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>청주시 서원구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>청주시 청원구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>청주시 흥덕구</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>보은군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                    </tr>
                    <tr>
                      <td><b>옥천군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td><b>영동군</b></td>
                      <td>사용중</td>
                      <td><input value="사용중지" type="button" class="btns02" />
                        <input value="수정" type="button" class="btns" /></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
              </div>
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
        </div>
      </div>
      <!--출판사-->
      <div class="tabbertab">
        <h2>출판사</h2>
        <table class="bbs_list01 mgt30 mgb10" style="width:945px;">
          <caption>
          출판사
          </caption>
          <colgroup>
          <col width="*" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
          </colgroup>
          <thead>
            <tr>
              <th colspan="9" class="agr"><div class="fl mgl20">출판사</div>
                <input type="text" class="inputTxt" style="width:120px;" /> <input value="출판사 등록하기" type="button" class="btns01 mgr10" /></th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><b>개념원리</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>금성출판사</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>기탄교육</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
            </tr>
            <tr>
              <td><b>넥서스</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>능률교육</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>도서출판 길벗</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
            </tr>
            <tr>
              <td><b>마더텅</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>미래엔</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>비상교육</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
            </tr>
          </tbody>
        </table>
      </div>
      
      <!--분야(과목)-->
      <div class="tabbertab">
        <h2>분야(과목)</h2>
        <table class="bbs_list01 mgt30 mgb10" style="width:945px;">
          <caption>
          분야(과목)
          </caption>
          <colgroup>
          <col width="*" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
          </colgroup>
          <thead>
            <tr>
              <th colspan="9" class="agr"><div class="fl mgl20">분야(과목)</div>
                <input type="text" class="inputTxt" style="width:120px;" /> <input value="분야(과목) 등록하기" type="button" class="btns01 mgr10" /></th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><b>국어</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>영어</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>수학</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
            </tr>
            <tr>
              <td><b>사회</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>과학</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>도덕</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
            </tr>
            <tr>
              <td><b>역사</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>음악</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>미술</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
            </tr>
            <tr>
              <td><b>체육</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>기술</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>가정</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
            </tr>
            <tr>
              <td><b>한문</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>컴퓨터</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>토익</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
            </tr>
          </tbody>
        </table>
      </div>
      
      <!--대상-->
      <div class="tabbertab">
        <h2>대상</h2>
        <table class="bbs_list01 mgt30 mgb10" style="width:945px;">
          <caption>
          대상
          </caption>
          <colgroup>
          <col width="*" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
          </colgroup>
          <thead>
            <tr>
              <th colspan="9" class="agr"><div class="fl mgl20">대상</div>
                <input type="text" class="inputTxt" style="width:120px;" /> <input value="대상 등록하기" type="button" class="btns01 mgr10" /></th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><b>유치부</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>초등학교</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>중학교</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
            </tr>
            <tr>
              <td><b>고등학교</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>대학교</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>일반</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
            </tr>
          </tbody>
        </table>
      </div>
      
      <!--학년-->
      <div class="tabbertab">
        <h2>학년</h2>
        <table class="bbs_list01 mgt30 mgb10" style="width:945px;">
          <caption>
          학년
          </caption>
          <colgroup>
          <col width="*" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
                  <col width="125" />
                  <col width="70" />
                  <col width="115" />
          </colgroup>
          <thead>
            <tr>
              <th colspan="9" class="agr"><div class="fl mgl20">학년</div>
                <input type="text" class="inputTxt" style="width:120px;" /> <input value="학년 등록하기" type="button" class="btns01 mgr10" /></th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><b>2세</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>3세</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>4세</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
            </tr>
            <tr>
              <td><b>6세</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>6세</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>7세</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
            </tr>
            <tr>
              <td><b>1학년</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>2학년</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>3학년</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
            </tr>
            <tr>
              <td><b>4학년</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>5학년</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
              <td><b>6학년</b></td>
              <td>사용중</td>
              <td><input value="사용중지" type="button" class="btns02" />
                <input value="수정" type="button" class="btns" /></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    <script type="text/javascript">
tabberAutomatic(tabberOptions);
</script> 
    <!--/코드리스트--> 
    
  </div>
  <!--/contents--> 
<script type="text/javascript">

</script>
<%@ include file="../bottom.jsp" %>