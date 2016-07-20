<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.util.Date, java.text.*, java.io.*, java.net.*, project.config.util.*"%>
<%@ include file="../popup_top.jsp" %>
<%
	//출판지역관리 팝업페이지
	List<Map<String, Object>> supplyRegionList = (List<Map<String, Object>>)request.getAttribute("supplyRegionList");
	
	Map<String, Object> pageInfo = (Map<String, Object>)request.getAttribute("pageInfo");
	String page_index = RsUtil.checkNull(pageInfo.get("page_index"));
	String totalCount = RsUtil.checkNull(pageInfo.get("totalCount"));
	String per_page = RsUtil.checkNull(pageInfo.get("per_page"));
	if(page_index.equals("")) page_index = "1";
%>

 <!--contents-->
  <div id="popcon">
    <!--업체 개별 리스트-->
    <form id="searchForm">
	    <input type="hidden" id="page_index" name="page_index"  value="<%=page_index%>" />
	    <h4>업체명 : 아이러브스터디 (111-12-50135)  <select style="width:80px;">
	          <option>승인</option>
	          <option>미승인</option>
	          <option>승인대기</option>
	        </select>
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
	      업체 개별 리스트
	      </caption>
	      <colgroup>
	      <col width="30" />
	      <col width="30" />
	      <col width="*" />
	      <col width="100" />
	      <col width="110" />
	      <col width="90" />
	      <col width="90" />
	      <col width="60" />
	      <col width="60" />
	      <col width="100" />
	      </colgroup>
	      <tbody>
	      <thead>
	        <tr>
	          <th scope="col"><input type="checkbox" class="chk" id="checkall01" /></th>
	          <th scope="col">번호</th>
	          <th scope="col">출판사</th>
	          <th scope="col">영업지역(시도)</th>
	          <th scope="col">영업지역(시구군)</th>
	          <th scope="col">요청일자</th>
	          <th scope="col">처리일자</th>
	          <th scope="col"><input type="checkbox" class="chk" id="checkall02" />승인</th>
	          <th scope="col"><input type="checkbox" class="chk" id="checkall03" />미승인</th>
	          <th scope="col">개별선택메뉴</th>
	        </tr>
	      </thead>
	      <%for(int i=0; i<supplyRegionList.size(); i++){ %>
		      <tr>
		        <td><input type="checkbox" class="chk" name="chk01" /></td>
		        <td>1</td>
		        <td><%= RsUtil.checkNull(supplyRegionList.get(i).get("PR_PBS"))%></td>
		        <td><%= RsUtil.checkNull(supplyRegionList.get(i).get("REGION1"))%></td>
		        <td><%= RsUtil.checkNull(supplyRegionList.get(i).get("REGION2"))%></td>
		        <td><%= RsUtil.checkNull(supplyRegionList.get(i).get("PR_REGDATE"))%></td>
		        <td><%= RsUtil.checkNull(supplyRegionList.get(i).get("PR_OKDATE"))%></td>
		        <td><input type="checkbox" class="chk" name="chk02" /></td>
		        <td><input type="checkbox" class="chk" name="chk03" /></td>
		        <td><input value="저장" type="button" class="btns01" />
		              <input value="삭제" type="button" class="btns" /></td>
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
    <!-- 버튼 -->
    <div class="btnarea">
      <input value="저장" type="button" class="btn02 mgr10" />
      <input value="삭제" type="button" class="btn01" />
    </div>
    <!-- /버튼 -->
    
  </div>
  <!--/contents--> 
  <%@ include file="../popup_bottom.jsp" %>
  <script>
	var searchSubmit = function(){
		jQuery("#searchForm").submit();
	};
	
	var pageSearch = function(page_index){
		jQuery("#page_index").val(page_index);
		
		searchSubmit();
	};
	
	
</script>