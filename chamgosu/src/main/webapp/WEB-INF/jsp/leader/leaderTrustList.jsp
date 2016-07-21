<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>
<%
	List<Map<String, Object>> leaderList = (List<Map<String, Object>>)request.getAttribute("leaderList");

	Map<String, Object> pageInfo = (Map<String, Object>)request.getAttribute("pageInfo");
	String page_index = RsUtil.checkNull(pageInfo.get("page_index"));
	String totalCount = RsUtil.checkNull(pageInfo.get("totalCount"));
	String per_page = RsUtil.checkNull(pageInfo.get("per_page"));
	if(page_index.equals("")) page_index = "1";
%>
	<!--contents-->
  <div id="contents">
    <h2>ㆍ위탁영업 리더관리</h2>
    <form id="searchForm">
	    <input type="hidden" id="page_index" name="page_index"  value="<%=page_index%>" />
	    <!-- search -->
	    <div class="search">
	      <ul>
	        <li class="fl"> <span>리더명</span>
	          <input type="text" class="inputTxt" style="width:230px;" />
	          <select style="width:100px;" id="ld_groupgubn" name="ld_groupgubn">
	            <option value="">전체보기</option>
	            <option value="0" <%= WebUtil.isSelected("0", request.getParameter("ld_groupgubn"))%>>학원</option>
	            <option value="1" <%= WebUtil.isSelected("1", request.getParameter("ld_groupgubn"))%>>교습소</option>
	            <option value="2" <%= WebUtil.isSelected("2", request.getParameter("ld_groupgubn"))%>>공부방</option>
	            <option value="3" <%= WebUtil.isSelected("3", request.getParameter("ld_groupgubn"))%>>교육단체</option>
	          </select>
	          <select style="width:100px;" id="ld_comgubn" name="ld_comgubn">
	            <option value="0" <%= WebUtil.isSelected("0", request.getParameter("ld_comgubn"))%>>승인대기</option>
	            <option value="1" <%= WebUtil.isSelected("1", request.getParameter("ld_comgubn"))%>>승인완료</option>
	          </select> 
	          <input value="검색하기" type="button" class="btnm" onclick="searchSubmit()"/>
	        </li>
	      </ul>
	    </div>
	    <!-- /search -->
	    
	    <!--리스트 테이블영역--> 
	    <h4><span>총 리더수 : <%= totalCount%>명</span> 조회 리더 수 : <%= totalCount%>명
	      <p>
	        <select style="width:90px;" id="per_page" name="per_page" onchange="searchSubmit()">
	          <option value="10" <%= WebUtil.isSelected("10", request.getParameter("per_page"))%>>10개씩 보기</option>
	          <option value="20" <%= WebUtil.isSelected("20", request.getParameter("per_page"))%>>20개씩 보기</option>
	          <option value="50" <%= WebUtil.isSelected("50", request.getParameter("per_page"))%>>50개씩 보기</option>
	          <option value="100" <%= WebUtil.isSelected("100", request.getParameter("per_page"))%>>100개씩 보기</option>
	        </select>
	      </p>
	    </h4>
	    <table class="bbs_list01">
	      <caption>
	      리더 리스트
	      </caption>
	      <colgroup>
	      <col width="30" />
	      <col width="30" />
	      <col width="*" />
	      <col width="100" />
	      <col width="70" />
	      <col width="110" />
	      <col width="160" />
	      <col width="80" />
	      <col width="65" />
	      <col width="90" />
	      <col width="65" />
	      <col width="60" />
	      </colgroup>
	      
	      <thead>
	        <tr>
	          <th scope="col"><input type="checkbox" class="chk" id="checkall" /></th>
	          <th scope="col">번호</th>
	          <th scope="col">리더 ID</th>
	          <th scope="col">단체명</th>
	          <th scope="col">대표자명</th>
	          <th scope="col">연락처</th>
	          <th scope="col">메일주소</th>
	          <th scope="col">가입일</th>
	          <th scope="col">회원구분</th>
	          <th scope="col">총 수수료</th>
	          <th scope="col">승인여부</th>
	          <th scope="col">상세정보</th>
	        </tr>
	      </thead>
	      <tbody>
	      <%
	      	if(leaderList.size() > 0){	
	      	for(int i=0; i<leaderList.size(); i++){ %>
	      <tr>
	        <td><input type="checkbox" class="chk" name="chk" /></td>
	        <td><%= ((Integer.parseInt(totalCount) - ((Integer.parseInt(page_index)-1) * 10))- i)%></td>
	        <td><%= RsUtil.checkNull(leaderList.get(i).get("LD_ID"))%></td>
	        <td><%= RsUtil.checkNull(leaderList.get(i).get("LD_GROUPNM"))%></td>
	        <td><%= RsUtil.checkNull(leaderList.get(i).get("LD_NAME"))%></td>
	        <td><%= RsUtil.checkNull(leaderList.get(i).get("LD_HP"))%></td>
	        <td><a href="mailto:<%= RsUtil.checkNull(leaderList.get(i).get("LD_EMAIL"))%>"><%= RsUtil.checkNull(leaderList.get(i).get("LD_EMAIL"))%></a></td>
	        <td><%= RsUtil.checkNull(leaderList.get(i).get("REGDATE"))%></td>
	        <td><%= RsUtil.checkNull(leaderList.get(i).get("LD_GROUPGUBN"))%></td>
	        <td>10,000,000원</td>
	        <td><%= RsUtil.checkNull(leaderList.get(i).get("LD_COMGUBN"))%></td>
	        <td><input value="보기" type="button" class="btns01" onclick="popupOpen('leaderModifyData.do?ld_seq=<%= RsUtil.checkNull(leaderList.get(i).get("LD_SEQ"))%>')"/></td>
	      </tr>
	      <%}}else{ %>
	      	<tr>
	      		<td colspan="12">
	      			위탁엽업 리더가 존재하지 않습니다.
	      		</td>
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
    </form>
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