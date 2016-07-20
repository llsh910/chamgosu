<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>
<%
	List<Map<String, Object>> userList = (List<Map<String, Object>>)request.getAttribute("userList");

	Map<String, Object> pageInfo = (Map<String, Object>)request.getAttribute("pageInfo");
	String page_index = RsUtil.checkNull(pageInfo.get("page_index"));
	String totalCount = RsUtil.checkNull(pageInfo.get("totalCount"));
	String per_page = RsUtil.checkNull(pageInfo.get("per_page"));
	if(page_index.equals("")) page_index = "1";
%>
	<!--contents-->
  <div id="contents">
    <h2>ㆍ구매회원 관리</h2>
    <!-- search -->
    <div class="search">
      <ul>
        <li class="fl">
          <input type="text" class="inputTxt" style="width:230px;" />
          <select style="width:100px;">
            <option>구매자ID</option>
            <option>이름</option>
            <option>연락처</option>
          </select>
          <input value="검색하기" type="button" class="btnm" />
        </li>
      </ul>
    </div>
    <!-- /search -->
    
    <!--리스트 테이블영역--> 
    <h4><span>총 회원수 : <%= totalCount%>명</span> 검색 회원 수 : <%= totalCount%>명
      <p>
        <select style="width:90px;">
          <option>10개씩 보기</option>
          <option>20개씩 보기</option>
          <option>50개씩 보기</option>
          <option>100개씩 보기</option>
        </select>
      </p>
    </h4>
    <table class="bbs_list01">
      <caption>
      구매회원리스트
      </caption>
      <colgroup>
      <col width="30" />
      <col width="30" />
      <col width="*" />
      <col width="100" />
      <col width="140" />
      <col width="210" />
      <col width="110" />
      <col width="100" />
      <col width="70" />
      </colgroup>
      
      <thead>
        <tr>
          <th scope="col"><input type="checkbox" class="chk" id="checkall" /></th>
          <th scope="col">번호</th>
          <th scope="col">구매자 ID</th>
          <th scope="col">구매자 이름</th>
          <th scope="col">휴대폰 번호</th>
          <th scope="col">메일주소</th>
          <th scope="col">가입일</th>
          <th scope="col">총 적립금</th>
          <th scope="col">상세정보</th>
        </tr>
      </thead>
      <tbody>
      <% 
      if(userList.size() > 0){
      	for(int i=0; i<userList.size(); i++){%>
      <tr>
        <td><input type="checkbox" class="chk" name="chk" /></td>
        <td>1</td>
        <td><%= RsUtil.checkNull(userList.get(i).get("US_LOGINID"))%></td>
        <td><%= RsUtil.checkNull(userList.get(i).get("US_NAME"))%></td>
        <td><%= RsUtil.checkNull(userList.get(i).get("US_TELNO2"))%></td>
        <td><a href="mailto:<%= RsUtil.checkNull(userList.get(i).get("US_EMAIL"))%>"><%= RsUtil.checkNull(userList.get(i).get("US_EMAIL"))%></a></td>
        <td><%= RsUtil.checkNull(userList.get(i).get("REGDATE"))%></td>
        <td><%= RsUtil.checkNull(userList.get(i).get("US_INPOINT"))%>원</td>
        <td><input value="보기" type="button" class="btns01" /></td>
      </tr>
      <%}}else{ %>
      	<tr>
      		<td colspan="9">구매회원이 존재하지 않습니다.</td>
      	</tr>
      <%} %>
        </tbody>
      
    </table>
    
    <!--/리스트 테이블영역--> 
    <script>
			$('.bbs_list01 tr:even').css("background","#f4f4f4");
			$('.bbs_list02 tr:even').css("background","#f4f4f4");
		</script> 
    
    <!-- paging -->
    <div class="paging"><%= WebUtil.printPageIndex4("", Integer.parseInt(page_index), Integer.parseInt(totalCount), Integer.parseInt(per_page), 10, "pageSearch", realPath) %></div>
    <!-- //paging --> 
    
    <!--탭버튼-->
    <div id="tabwrap01">
      <ul class="tabs01">
        <li rel="tab2">엑셀파일 저장하기</li>
        <li rel="tab3">푸시보내기</li>
        <li rel="tab4">문자보내기</li>
        <li rel="tab5">메일보내기</li>
      </ul>
      <!-- 탭컨텐츠 -->
      <div class="tab_container01">
        
        <!-- 엑셀파일 저장하기 -->
        <div id="tab2" class="tab_content01 agc">
          <input type="checkbox" class="chk" />
          사업자등록번호
          <input type="checkbox" class="chk" />
          업체명
          <input type="checkbox" class="chk" />
          대표자명
          <input type="checkbox" class="chk" />
          우편번호
          <input type="checkbox" class="chk" />
          기본주소
          <input type="checkbox" class="chk" />
          상세주소
          <input type="checkbox" class="chk" />
          회사전화
          <input type="checkbox" class="chk" />
          휴대전화
          <input type="checkbox" class="chk" />
          팩스번호
          <input type="checkbox" class="chk" />
          전자우편 <br>
          <input type="checkbox" class="chk" />
          취급품목 및 회사소개
          <input type="checkbox" class="chk" />
          은행계좌
          <input type="checkbox" class="chk" />
          기본공급율
          <input type="checkbox" class="chk" />
          배송방법
          <input type="checkbox" class="chk" />
          배송기준
          <input type="checkbox" class="chk" />
          교환 및 반품정책<br>
          <br>
          <input value="저장하기" type="button" class="btn02" />
        </div>
        <!-- 푸쉬보내기 -->
        <div id="tab3" class="tab_content01 agc"> 이미지 작업해서 통이미지로 삽입예정입니다.</div>
        <!-- 문자보내기 -->
        <div id="tab4" class="tab_content01 agc"> 문자내용작성 화면구성 확인 후 작업예정입니다.</div>
        <!-- 메일보내기 -->
        <div id="tab5" class="tab_content01 agc">
        <table class="bbs_write01">
            <caption>
            사업자 정보
            </caption>
            <colgroup>
            <col width="150" />
            <col width="*" />
            </colgroup>
            <tbody>
              <tr>
                <th scope="row">수신회원</th>
                <td><input type="text" class="inputTxt" style="width:60%;" /></td>
              </tr>
              <tr>
                <th scope="row">이메일 제목</th>
                <td><input type="text" class="inputTxt" style="width:60%;" /></td>
              </tr>
              <tr>
                <td colspan="2"><textarea rows="6" class="inputTxt" style="width:930px;">메일보낼 업체를 상단의 리스트에서 체크하고 메일내용을 입력하세요.</textarea></th>
              </tr>
            </tbody>
          </table>
          <br>
          <input value="보내기" type="button" class="btn02" />
        </div>
      </div>
      <!-- /탭컨텐츠 --> 
    </div>
    <script>
$(function () {

    $(".tab_content01").hide();
    $(".tab_content01:first").hide();

    $("ul.tabs01 li").click(function () {
        $("ul.tabs01 li").removeClass("active").css("color", "#fff");
        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
        $(this).addClass("active").css("color", "#fff");
        $(".tab_content01").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
    });
});
</script> 
    <!--/탭버튼--> 
    
  </div>
  <!--/contents--> 
<%@ include file="../bottom.jsp" %>
<script>
	var searchSubmit = function(){
		jQuery("#searchForm").submit();
	};
	
	var pageSearch = function(page_index){
		jQuery("#page_index").val(page_index);
		
		searchSubmit();
	};
</script>