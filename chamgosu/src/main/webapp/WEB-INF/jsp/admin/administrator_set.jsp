<%@page import="project.config.util.WebUtil"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="project.config.util.RsUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String,Object>> administorList = (List<Map<String,Object>>)request.getAttribute("administorList");
	Map<String, Object> pageInfo = (Map<String, Object>)request.getAttribute("pageInfo");
	String page_index = RsUtil.checkNull(pageInfo.get("page_index"));
	String totalCount = RsUtil.checkNull(pageInfo.get("totalCount"));
	String per_page = RsUtil.checkNull(pageInfo.get("per_page"));
	if(page_index.equals("")) page_index = "1";
%>

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
    <form id="updateAdministor">
    <input type="hidden" id="US_MASTER" name="US_MASTER" value="T" />
    <div class="btnarea-r">
      <input value="신규등록" type="button" onclick="insertAdmin()" class="btnm" />
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
          <td><input type="text" class="inputTxt" id="US_LOGINID" name="US_LOGINID" style="width:90%;" /></td>
          <th scope="row" class="bleft">비밀번호</th>
          <td><input type="password" class="inputTxt" id="US_LOGINPASS" name="US_LOGINPASS" style="width:90%;" /></td>
        </tr>
        <tr>
          <th scope="row">담당자명</th>
          <td><input type="text" class="inputTxt" id="US_NAME" name="US_NAME" style="width:90%;" /></td>
          <th scope="row" class="bleft">휴대전화</th>
          <td><input type="text" class="inputTxt" id="US_TELNO1" name="US_TELNO1" style="width:90%;" /></td>
        </tr>
        <tr>
          <th scope="row">직통전화</th>
          <td><input type="text" class="inputTxt" id="US_TELNO2" name="US_TELNO2" style="width:90%;" /></td>
          <th scope="row" class="bleft" rowspan="2">접속권한</th>
          <td rowspan="2">
          	<select style="width:200px;" id="US_LEV" name="US_LEV" title="접속권한">
              <option>선택하세요</option>
              <option value="웹마스터">웹마스터</option>
              <option value="상품관리">상품관리</option>
              <option value="거래처관리">거래처관리</option>
              <option value="회원관리">회원관리</option>
              <option value="매출관리">매출관리</option>
              <option value="정산관리">정산관리</option>
              <option value="Message">Message관리</option>
              <option value="경영관리">경영관리</option>
            </select></td>
        </tr>
        <tr>
          <th scope="row">이메일</th>
          <td><input type="text" class="inputTxt" id="US_EMAIL" name="US_EMAIL" style="width:90%;" /></td>
        </tr>
        <tr>
          <th scope="row">메모</th>
          <td colspan="3"><textarea rows="4" class="inputTxt" id="US_MEMO" name="US_MEMO" style="width:95%;"></textarea></td>
        </tr>
      </tbody>
    </table>
    
    <!-- 버튼 -->
    <div class="btnarea">
      <input value="저 장" type="button" class="btn02 mgr10" />
      <input value="취 소" type="button" class="btn01" />
    </div>
    </form>
    <!-- /버튼 --> 
    
    
    
    <!--list-->
   <form id="searchForm">
   	<input type="hidden" id="page_index" name="page_index"  value="<%=page_index%>">
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
      	<% for(int i=0; i < administorList.size(); i++){ %>
        <tr>
          <td>1</td>
          <td><%= RsUtil.checkNull(administorList.get(i).get("US_LEV"))%></td>
          <td><%= RsUtil.checkNull(administorList.get(i).get("US_LOGINID"))%></td>
          <td><%= RsUtil.checkNull(administorList.get(i).get("US_NAME"))%></td>
          <td><%= RsUtil.checkNull(administorList.get(i).get("US_LEV"))%></td>
          <td><%= RsUtil.checkNull(administorList.get(i).get("REGDATE"))%></td>
          <td><input value="수정" type="button" class="btns01" />
            <input value="삭제" type="button" class="btns" /></td>
        </tr>
        <%} %>
      </tbody>
    </table>
    <script>
			$('.bbs_list01 tr:even').css("background","#f4f4f4");
	</script>
    <!--/list--> 
    
    <!-- paging -->
    <div class="paging"><%= WebUtil.printPageIndex4("", Integer.parseInt(page_index), Integer.parseInt(totalCount), Integer.parseInt(per_page), 10, "pageSearch", realPath) %></div>
    <!-- //paging --> 
    </form>
    
  </div>
  <!--/contents--> 
</div>
</body>
<script>
	function insertAdmin(){
		var Url = "updateAdministrator.do";
		jQuery.ajax({
            url: Url,
            type:'POST',
            data : $("#updateAdministor").serialize()
            ,
            success: function(data){
            	if(data.msg == "success"){
            		alert("관리자 신규등록 되었습니다.");
            		location.reload();
            	}else{
            		alert("등록하는 과정에서 오류가 발생했습니다.");
            	}
			}
		}); 
	}
	
	var searchSubmit = function(){
		jQuery("#searchForm").submit();
	};
	
	var pageSearch = function(page_index){
		jQuery("#page_index").val(page_index);
		
		searchSubmit();
	};

</script>