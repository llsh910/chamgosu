<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
  <style>
  	.backLayer {
  		position:absolute; 
  		width: 100%; 
  		height: 100%; 
  		margin: 0 auto; 
  		background:rgba(0,0,0,0.7);
  		display:none;
  	} 
  	#errorMsgModal {
  		position:fixed;
  		width:100%;
  		height:100%;
  		margin:0 auto;
  		background:rgba(0,0,0,0.7);
  		display:none;
  	}
  	.errorMsgModal-div {
  		margin: 0 30%;
  		background:rgba(255,255,255,1);
  		max-height: 300px;
		overflow-y: scroll;  		
	}
	.errorMsgCloseBtn{
		border:1px solid white; 
		color:white; 
		margin: 0 30%;
		font-size:15px;
		font-weight:bold;
	}
	
  </style>
  <div class="backLayer"><img src="<%= realPath%>/img/loding.gif" style="margin-left: 45%; margin-top: 20%;"></div>
<%
	List<Map<String, Object>> adminProductList = (List<Map<String, Object>>) request.getAttribute("adminProductList");
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
    <h2>ㆍ상품 관리</h2>
    <!-- search -->
    <form id="searchForm" method="post">
    	<input type="hidden" id="page_index" name="page_index" value="<%= page_index%>" />
	    <div class="search">
	      <ul>
	        <li class="fl"> <span>SEARCH</span>
	          <input type="text" class="inputTxt" style="width:320px;" id="mg_booknm" name="mg_booknm" value="<%= RsUtil.checkNull(request.getParameter("mg_booknm"))%>"/>
	          <input value="검색하기" type="button" class="btnm" onclick="searchSubmit()"/>
	        </li>
	        <li class="fr">
	          <input value="개별 상품등록" type="button" class="btnm01" onclick="popupOpen('product_update.do')"/>
	          <input value="엑셀파일 가져오기" type="button" class="btnm01" onclick="excelDownlod()" />
	          <input value="엑셀파일 저장하기" type="button" class="btnm01" onclick="$('.file_input_hidden').click()" />
	          <input type="file" name="excelFile" class="file_input_hidden" style="width:120px" onchange="excelUpdate()"/>
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
	                <% if(pbsCodeList.size() <= 7){ %>
	                <% for(int i=0; i<pbsCodeList.size(); i++){ %>
	                <td><input type="radio" class="chk" id="mg_pbs" name="mg_pbs" value="<%= RsUtil.checkNull(pbsCodeList.get(i).get("CODE_FIRST"))%>"/><%= RsUtil.checkNull(pbsCodeList.get(i).get("CODE_CODENAME"))%></td>
	                <%} %>
	                <% }else{ %>
	                <% for(int i=0; i<7; i++){ %>
	                <td><input type="radio" class="chk" id="mg_pbs" name="mg_pbs" value="<%= RsUtil.checkNull(pbsCodeList.get(i).get("CODE_FIRST"))%>"/><%= RsUtil.checkNull(pbsCodeList.get(i).get("CODE_CODENAME"))%></td>
	                <%} %>
	                <% } %>
              	  </tr>
	            </table>
	            <%if(pbsCodeList.size() > 7){ %>
           		 <a><%= pbsCodeList.size()%>개 <img src="<%= realPath%>/css/images/more.gif" alt="more"/></a>
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
	                  	<% for(int i=7; i<pbsCodeList.size(); i++){ int j=i; %>
	                  		<td><input type="radio" class="chk" id="mg_pbs" name="mg_pbs" value="<%= RsUtil.checkNull(pbsCodeList.get(i).get("CODE_FIRST"))%>"/><%= RsUtil.checkNull(pbsCodeList.get(i).get("CODE_CODENAME"))%></td>
	                  		
	                  		<% if(j != 7){ %>
	                  			<% if((j+1) % 7 == 0){ %>
	                  				</tr>
	                  				<tr>
	                  				<th scope="col"></th>
	                  			<% } %>
	                  		<% } %>	
	                  	<% } %>	
	                </table>
	              </li>
	            </ul>
	            <%} %>
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
	                <% if(subjCodeList.size() <= 7){ %>
	                <% for(int i=0; i<subjCodeList.size(); i++){ %>
	                <td><input type="radio" class="chk" id="mg_subject" name="mg_subject" value="<%= RsUtil.checkNull(subjCodeList.get(i).get("CODE_FIRST"))%>"/><%= RsUtil.checkNull(subjCodeList.get(i).get("CODE_CODENAME"))%></td>
	                <%} %>
	                <% }else{ %>
	                <% for(int i=0; i<7; i++){ %>
	                <td><input type="radio" class="chk" id="mg_subject" name="mg_subject" value="<%= RsUtil.checkNull(subjCodeList.get(i).get("CODE_FIRST"))%>"/><%= RsUtil.checkNull(subjCodeList.get(i).get("CODE_CODENAME"))%></td>
	                <%} %>
	                <% } %>
              	  </tr>
	            </table>
	            <%if(subjCodeList.size() > 7){ %>
           		 <a><%= subjCodeList.size()%>개 <img src="<%= realPath%>/css/images/more.gif" alt="more"/></a>
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
	                  	<% for(int i=7; i<subjCodeList.size(); i++){ int j=i; %>
	                  		<td><input type="radio" class="chk" id="mg_subject" name="mg_subject" value="<%= RsUtil.checkNull(subjCodeList.get(i).get("CODE_FIRST"))%>"/><%= RsUtil.checkNull(subjCodeList.get(i).get("CODE_CODENAME"))%></td>
	                  		
	                  		<% if(j != 7){ %>
	                  			<% if((j+1) % 7 == 0){ %>
	                  				</tr>
	                  				<tr>
	                  				<th scope="col"></th>
	                  			<% } %>
	                  		<% } %>	
	                  	<% } %>	
	                </table>
	              </li>
	            </ul>
	            <%} %>
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
	                <% if(gradeCodeList.size() <= 7){ %>
	                <% for(int i=0; i<gradeCodeList.size(); i++){ %>
	                <td><input type="radio" class="chk" id="mg_grade" name="mg_grade" value="<%= RsUtil.checkNull(gradeCodeList.get(i).get("CODE_FIRST"))%>"/><%= RsUtil.checkNull(gradeCodeList.get(i).get("CODE_CODENAME"))%></td>
	                <%} %>
	                <% }else{ %>
	                <% for(int i=0; i<7; i++){ %>
	                <td><input type="radio" class="chk" id="mg_grade" name="mg_grade" value="<%= RsUtil.checkNull(gradeCodeList.get(i).get("CODE_FIRST"))%>"/><%= RsUtil.checkNull(gradeCodeList.get(i).get("CODE_CODENAME"))%></td>
	                <%} %>
	                <% } %>
              	  </tr>
	            </table>
	            <%if(gradeCodeList.size() > 7){ %>
           		 <a><%= gradeCodeList.size()%>개 <img src="<%= realPath%>/css/images/more.gif" alt="more"/></a>
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
	                  	<% for(int i=7; i<gradeCodeList.size(); i++){ int j=i; %>
	                  		<td><input type="radio" class="chk" id="mg_grade" name="mg_grade" value="<%= RsUtil.checkNull(gradeCodeList.get(i).get("CODE_FIRST"))%>"/><%= RsUtil.checkNull(gradeCodeList.get(i).get("CODE_CODENAME"))%></td>
	                  		
	                  		<% if(j != 7){ %>
	                  			<% if((j+1) % 7 == 0){ %>
	                  				</tr>
	                  				<tr>
	                  				<th scope="col"></th>
	                  			<% } %>
	                  		<% } %>	
	                  	<% } %>	
	                </table>
	              </li>
	            </ul>
	            <%} %>
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
	                <% if(objCodeList.size() <= 7){ %>
	                <% for(int i=0; i<objCodeList.size(); i++){ %>
	                <td><input type="radio" class="chk" id="mg_object" name="mg_object" value="<%= RsUtil.checkNull(objCodeList.get(i).get("CODE_FIRST"))%>"/><%= RsUtil.checkNull(objCodeList.get(i).get("CODE_CODENAME"))%></td>
	                <%} %>
	                <% }else{ %>
	                <% for(int i=0; i<7; i++){ %>
	                <td><input type="radio" class="chk" id="mg_object" name="mg_object" value="<%= RsUtil.checkNull(objCodeList.get(i).get("CODE_FIRST"))%>"/><%= RsUtil.checkNull(objCodeList.get(i).get("CODE_CODENAME"))%></td>
	                <%} %>
	                <% } %>
              	  </tr>
	            </table>
	            <%if(objCodeList.size() > 7){ %>
           		 <a><%= objCodeList.size()%>개 <img src="<%= realPath%>/css/images/more.gif" alt="more"/></a>
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
	                  	<% for(int i=7; i<gradeCodeList.size(); i++){ int j=i; %>
	                  		<td><input type="radio" class="chk" id="mg_object" name="mg_object" value="<%= RsUtil.checkNull(objCodeList.get(i).get("CODE_FIRST"))%>"/><%= RsUtil.checkNull(objCodeList.get(i).get("CODE_CODENAME"))%></td>
	                  		
	                  		<% if(j != 7){ %>
	                  			<% if((j+1) % 7 == 0){ %>
	                  				</tr>
	                  				<tr>
	                  				<th scope="col"></th>
	                  			<% } %>
	                  		<% } %>	
	                  	<% } %>	
	                </table>
	              </li>
	            </ul>
	            <%} %>
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
	    
	    <h4><span>총 상품수 : <%= allCount%>건</span> 검색상품 수 : <%= totalCount%>건
	      <p>
	        <select style="width:90px;" id="per_page" name="per_page" onchange="searchSubmit()">
	          <option value="10" <%= WebUtil.isSelected("10", request.getParameter("per_page"))%>>10개씩 보기</option>
	          <option value="20" <%= WebUtil.isSelected("20", request.getParameter("per_page"))%>>20개씩 보기</option>
	          <option value="50" <%= WebUtil.isSelected("50", request.getParameter("per_page"))%>>50개씩 보기</option>
	          <option value="100" <%= WebUtil.isSelected("100", request.getParameter("per_page"))%>>100개씩 보기</option>
	        </select>
	      </p>
	    </h4>
	    <table class="bbs_list02">
	      <caption>
	      상품리스트 th
	      </caption>
	      <colgroup>
	      <col width="30" />
	      <col width="100" />
	      <col width="100" />
	      <col width="122" />
	      <col width="80" />
	      <col width="80" />
	      <col width="70" />
	      <col width="80" />
	      <col width="80" />
	      <col width="118" />
	      <col width="110" />
	      </colgroup>
	      <thead>
	        <tr>
	          <th scope="col"><input type="checkbox" class="chk" id="checkall"/></th>
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
	          <th scope="col">상세정보<br>
	            참고자료(url)</th>
	          <th scope="col">상품등록자별<br>
	            <input type="checkbox" class="chk" id="checkall01" onclick="checkAllBtn('Y')"/>
	              예
	              <input type="checkbox" class="chk" id="checkall02" onclick="checkAllBtn('N')"/>
	              아니오</td></th>
	          <th scope="col">수정/삭제</th>
	        </tr>
	      </thead>
	    </table>
	    <!--스크롤되는 테이블영역(책이미지 가로 80px 넘으면 안됩니다.-->
	    <div class="scy_line">
	      <table class="bbs_list02 botn">
	        <caption>
	        상품리스트
	        </caption>
	        <colgroup>
	        <col width="30" />
	        <col width="100" />
	        <col width="100" />
	        <col width="122" />
	        <col width="80" />
	        <col width="80" />
	        <col width="70" />
	        <col width="80" />
	        <col width="80" />
	        <col width="118" />
	        <col width="93" />
	        </colgroup>
	        <tbody>
	          <% 
	          	if(adminProductList.size() > 0){
	          		for(int i=0; i<adminProductList.size(); i++){%>
	          <tr>
	            <td><input type="checkbox" class="chk" name="chk" value="<%= RsUtil.checkNull(adminProductList.get(i).get("MG_SEQ"))%>" /></td>
	            <td>
	            	<img src="<%= realPath%><%= (RsUtil.checkNull(adminProductList.get(i).get("MG_BOOKIMG")).equals("") ? "/img/book_noimage.jpg" : "/bookimg/thumnail_" + RsUtil.checkNull(adminProductList.get(i).get("MG_BOOKIMG")) ) %>" alt="책 기본이미지">
	            </td>
	            <td><%= RsUtil.checkNull(adminProductList.get(i).get("MG_ISBN"))%></td>
	            <td><%= RsUtil.checkNull(adminProductList.get(i).get("MG_BOOKNM"))%><br>
	              (<%= RsUtil.checkNull(adminProductList.get(i).get("MG_BOOKSUBNM"))%>)</td>
	            <td><%= RsUtil.checkNull(adminProductList.get(i).get("MG_PBS"))%><br>
	             	 <%= RsUtil.checkNull(adminProductList.get(i).get("MG_BOOKWRITER"))%></td>
	            <td><%= MultiUtil.comma(RsUtil.checkNull(adminProductList.get(i).get("MG_PRICE")))%>원<br>
	             	 <%= RsUtil.checkNull(adminProductList.get(i).get("MG_SUBJECT"))%></td>
	            <td><%= RsUtil.checkNull(adminProductList.get(i).get("MG_OBJECT"))%><br />
	            	<%= RsUtil.checkNull(adminProductList.get(i).get("MG_GRADE"))%>
	            </td>
	            <td><%= RsUtil.checkNull(adminProductList.get(i).get("MG_BOOKISYEAR"))%></td>
	            <td  style="max-width: 80px; overflow:hidden; text-overflow: ellipsis; white-space: nowrap;"><%= RsUtil.checkNull(adminProductList.get(i).get("MG_MOREINF"))%><br>
	              <%= RsUtil.checkNull(adminProductList.get(i).get("MG_REFMAT"))%></td>
	            <td>본사 담당자<br>
	              <input type="checkbox" class="chk" name="chk01" id="chk01" value="T" <%= WebUtil.isChecked("T", RsUtil.checkNull(adminProductList.get(i).get("MG_APPLYCHK")))%> onclick="checkBtn('Y', this)"/>
	             		 예
	              <input type="checkbox" class="chk" name="chk02" id="chk02" value="F" <%= WebUtil.isChecked("F", RsUtil.checkNull(adminProductList.get(i).get("MG_APPLYCHK")))%> onclick="checkBtn('N', this)"/>
	              		아니오
	            </td>
	            <td><input value="수정" type="button" class="btns01" onclick="popupOpen('product_update.do?mg_seq=<%= RsUtil.checkNull(adminProductList.get(i).get("MG_SEQ"))%>')"/>
	              <input value="삭제" type="button" class="btns" onclick="productDelete('<%= RsUtil.checkNull(adminProductList.get(i).get("MG_SEQ"))%>')"/></td>
	          </tr>
	          <%}}else{ %>
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
	    <div class="paging"><%= WebUtil.printPageIndex4("", Integer.parseInt(page_index), Integer.parseInt(totalCount), Integer.parseInt(per_page), 10, "pageSearch", realPath) %></div>
	    <!-- //paging --> 
	    
	    <!-- 버튼 -->
	    <div class="btnarea">
	      <input value="일괄저장" type="button" class="btn02 mgr10" onclick="productListSave()" />
	      <input value="선택삭제" type="button" class="btn01" onclick="productDelete('')" />
	    </div>
    </form>
    <!-- /버튼 --> 
  </div>
  <!--/contents--> 
  <%@ include file="../bottom.jsp"%>
  <div id="errorMsgModal">
  	<div class="errorMsgModal-div"></div>
  	<button class="errorMsgCloseBtn" onclick="errorMsgClose()">닫기</button>
  </div>
  <script>
	var searchSubmit = function(){
		jQuery("#searchForm").submit();
	};
	
	var pageSearch = function(page_index){
		jQuery("#page_index").val(page_index);
		
		searchSubmit();
	};
		
	function checkAllBtn(chk){
		if(chk == "Y"){
			$("#checkall02").attr("checked", false);
			
			$("input[name=chk01]:checkbox").each(function(idx) {
				$(this).attr("checked", true);
			});
			
			$("input[name=chk02]:checkbox").each(function(idx) {
				$(this).attr("checked", false);
			});
		}else{
			$("#checkall01").attr("checked", false);
			
			$("input[name=chk01]:checkbox").each(function(idx) {
				$(this).attr("checked", false);
			});
			
			$("input[name=chk02]:checkbox").each(function(idx) {
				$(this).attr("checked", true);
			});
		}
	}
	
	
	function checkBtn(chk, chk_this){
		if(chk == "Y"){
			$(chk_this).next().attr("checked", false);
		}else{
			$(chk_this).prev().attr("checked", false);
		}
	}
	
	function productListSave(){
		var mg_seq = [];
		var applychk = [];
		$("input[name=chk]:checked").each(function(idx) {
			var chk02 = jQuery(this).parent().parent().find("input[name='chk01']").is(":checked");
			var chk03 = jQuery(this).parent().parent().find("input[name='chk02']").is(":checked");
			
			if(chk02 == true){
				applychk.push("T");
			}else{
				applychk.push("F");
			}
			
			var seq = $(this).val();
			mg_seq.push(seq);
		});
		
		var Url = "productApplyUpdate.do";
		jQuery.ajax({
            url: Url,
            type:'POST',
            data : {
            	"mg_seq[]" : mg_seq,
            	"applychk[]" : applychk
            },
            success: function(data){
            	if(data.msg == "success"){
            		alert("저장되었습니다.");	
            		location.reload();
            	}else{
            		alert("저장하는 과정에서 시스템오류가 발생하였습니다.");
            	}
			}
		}); 
	}
	function excelUpdate(){
		
		
		var result = confirm('데이터를 입력하시겠습니까?');
		if(!result)return;
		
		
		$(".backLayer").css("display","block");
		
		
		var Url = "mgExcelUpload.do";
		
		var options = {
	    	url : Url,
	    	type: 'post',
	    	contentType: 'application/x-www-form-urlencoded; charset=utf-8',
	    	success: function(data){
            	console.log(data);
            	
            	if(data.msg == "codeError"){
            		var errorMsg = "";
            		for(var i=0; i<data.errorList.length; i++){
            			errorMsg += data.errorList[i] + "<br />";
            		}
            		//alert("성공 : " + data.successCnt + ", " +"실패 : " + data.errorCnt + "\n" + errorMsg);
            		$("#errorMsgModal > div").html("성공 : " + data.successCnt + ", " +"실패 : " + data.errorCnt + "<br />" + errorMsg);
            		$("#errorMsgModal").css("display", "block");
            	}else if(data.msg == "success"){
            		alert("상품이 등록되었습니다.");
            		location.reload();
            	}else{
            		alert("엑셀 업로드 중 시스템 오류가 발생했습니다. 다시 시도하세요.");
            	}
            	
			},complete: function(err){
				$(".backLayer").css("display","none");
			}
		};
		jQuery("#searchForm").ajaxForm(options).submit();
		
		
	}
	
	function excelDownlod(){
		$(".backLayer").css("display","block");
		var Url = "mgExcelDownload.do";
		jQuery.ajax({
            url: Url,
            type:'POST',
            success: function(data){
            	if(data.msg == "success"){
            		
            		location.href = "<%= realPath%>/fileDown.do?filename="+data.fileName;
            		
      
    				
    				
            	}else{
            		
            		alert("엑셀 파일 가져오는 과정에서 시스템오류가 발생하였습니다.");
            		
            	}
			},complete: function(err){
				
				$(".backLayer").css("display","none");

			}
		
		}); 
		
	}
	
	function errorMsgClose(){
		$("#errorMsgModal").css("display", "none");
	}
	
	function productDelete(num){
		var mg_seq = [];
		if(num == ""){
			$("input[name=chk]:checked").each(function(idx) {
				mg_seq.push($(this).val());
			});
		}else{
			mg_seq.push(num);
		}
		console.log(mg_seq);
		var Url = "productDelete.do";
		jQuery.ajax({
            url: Url,
            type:'POST',
            data:{
            	"mg_seq[]" : mg_seq
            },
            success: function(data){
            	if(data.msg == "success"){
            		alert("삭제 완료했습니다.");
            		location.reload();
            	}else{
            		alert("시스템 오류가 발생하였습니다.");
            	}
            	
			}
		
		});
	}
  </script>