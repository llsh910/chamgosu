<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>
<%
	//출판관리 지역 리스트
	List<Map<String, Object>> supplyList = (List<Map<String, Object>>)request.getAttribute("supplyList");

	Map<String, Object> pageInfo = (Map<String, Object>)request.getAttribute("pageInfo");
	String page_index = RsUtil.checkNull(pageInfo.get("page_index"));
	String totalCount = RsUtil.checkNull(pageInfo.get("totalCount"));
	String per_page = RsUtil.checkNull(pageInfo.get("per_page"));
	if(page_index.equals("")) page_index = "1";
%>
	<!--contents-->
  <div id="contents">
    <h2>ㆍ상품 공급자별 취급품목(출판사별 영업지역)관리</h2>
    <!-- search -->
    <form id="searchForm">
    <input type="hidden" id="page_index" name="page_index"  value="<%=page_index%>" />
    <input type="hidden" id="sp_seq" name="sp_seq" />
    <div class="search">
      <ul>
        <li class="fl"> <span>업체명</span>
          <input type="text" class="inputTxt" style="width:230px;" id="search_businm" name="search_businm" value="<%= RsUtil.checkNull(request.getParameter("search_businm"))%>"/>
          <select style="width:100px;" title="업체유형" id="search_userating" name="search_userating">
            <option value="">전체보기</option>
            <option value="1" <%= WebUtil.isSelected("1", request.getParameter("search_userating"))%>>유료업체</option>
            <option value="0" <%= WebUtil.isSelected("0", request.getParameter("search_userating"))%>>무료업체</option>
            <option value="2" <%= WebUtil.isSelected("2", request.getParameter("search_userating"))%>>승인대기</option>
          </select>
          <input value="검색하기" type="button" class="btnm" onclick="searchSubmit()"/>
        </li>
      </ul>
    </div>
    <!-- /search -->
    
    <!--공급업체 리스트-->
    <h4><span>총 업체수 : <%= totalCount%>건</span> 조회업체 수 : <%= totalCount%>건
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
      공급업체리스트
      </caption>
      <colgroup>
      <col width="30" />
      <col width="30" />
      <col width="*" />
      <col width="135" />
      <col width="75" />
      <col width="120" />
      <col width="190" />
      <col width="90" />
      <col width="70" />
      <col width="100" />
      </colgroup>
      
      <thead>
        <tr>
          <th scope="col"><input type="checkbox" class="chk" id="checkall" /></th>
          <th scope="col">번호</th>
          <th scope="col">사업자등록번호(ID)</th>
          <th scope="col">업체명</th>
          <th scope="col">대표자명</th>
          <th scope="col">연락처</th>
          <th scope="col">메일주소</th>
          <th scope="col">등록일</th>
          <th scope="col">이용등급</th>
          <th scope="col">취급품목</th>
        </tr>
      </thead>
      <tbody>
      <%for(int i=0; i<supplyList.size(); i++){ %>
      	<tr>
	        <td><input type="checkbox" class="chk" name="chk" /></td>
	        <td><%= ((Integer.parseInt(totalCount) - ((Integer.parseInt(page_index)-1) * 10))- i)%></td>
	        <td><%= RsUtil.checkNull(supplyList.get(i).get("SP_ID"))%></td>
	        <td><%= RsUtil.checkNull(supplyList.get(i).get("SP_BUSINM"))%></td>
	        <td><%= RsUtil.checkNull(supplyList.get(i).get("SP_NAME"))%></td>
	        <td><%= RsUtil.checkNull(supplyList.get(i).get("SP_TEL"))%></td>
	        <td><a href="mailto:<%= RsUtil.checkNull(supplyList.get(i).get("SP_EMAIL"))%>"><%= RsUtil.checkNull(supplyList.get(i).get("SP_EMAIL"))%></a></td>
	        <td><%= RsUtil.checkNull(supplyList.get(i).get("SP_REGDATE"))%></td>
	        <td><%= RsUtil.checkNull(supplyList.get(i).get("SP_USERATING"))%></td>
	        <td><input value="조회 및 관리" type="button" class="btns01" onclick="popupOpen('supplyRegionListPop.do')" /></td>
      	</tr>
      <%} %>
        </tbody>
      
    </table>

    <script>
			$('.bbs_list01 tr:even').css("background","#f4f4f4");
			$('.bbs_list02 tr:even').css("background","#f4f4f4");
		</script> 
    
    <!-- paging -->
    <div class="paging"><%= WebUtil.printPageIndex4("", Integer.parseInt(page_index), Integer.parseInt(totalCount), Integer.parseInt(per_page), 10, "pageSearch", realPath) %></div>
    <!-- //paging --> 
    </form>
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