<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../popup_top.jsp" %>
<%
	//상품 정보(수정 시)
	Map<String, Object> adminProduct = (Map<String, Object>)request.getAttribute("adminProduct");

	//출판사 코드 리스트
	List<Map<String, Object>> pbsCodeList = (List<Map<String, Object>>)request.getAttribute("pbsCodeList");

	//분야(과목)별 코드 리스트
	List<Map<String, Object>> subjCodeList = (List<Map<String, Object>>)request.getAttribute("subjCodeList");
	
	//대상별 코드 리스트
	List<Map<String, Object>> objCodeList = (List<Map<String, Object>>)request.getAttribute("objCodeList");
	
	//학년별 코드리스트
	List<Map<String, Object>> gradeCodeList = (List<Map<String, Object>>)request.getAttribute("gradeCodeList");
	
	String update_type = (String)request.getAttribute("update_type");
	String pdtType = RsUtil.checkNull(request.getParameter("pdtType"));
	 
%>
<div id="popup_wrap01"> 
  <h3 class="mgt10 mgb10 mgl10">개별상품 등록 및 수정</h3> 
  
  
  <form id="updateProduct">
  	<input type="hidden" id="MG_BOOKIMG" name="MG_BOOKIMG" value="<%= RsUtil.checkNull(adminProduct.get("MG_BOOKIMG"))%>" />
  	<input type="hidden" id="update_type" name="update_type" value="<%= RsUtil.checkNull(update_type)%>" />
  	<input type="hidden" id="mg_seq" name="mg_seq" value="<%= RsUtil.checkNull(adminProduct.get("MG_SEQ"))%>">
  	<input type="hidden" id="pdtType" name="pdtType" value="<%= pdtType%>">
  	<input type="hidden" id="RG_SEQ" name="RG_SEQ" value="<%= RsUtil.checkNull(adminProduct.get("RG_SEQ"))%>">
    <table class="bbs_write01">
      <caption>
      개별상품 등록 및 수정
      </caption>
      <colgroup>
      <col width="95" />
      <col width="280" />
      <col width="80" />
      <col width="*" />
      </colgroup>
      <tbody>
        <tr>
          <th scope="row">ISBN코드</th>
          <td colspan="3"><input type="text" class="inputTxt" id="MG_ISBN" name="MG_ISBN" style="width:90%;" value="<%= RsUtil.checkNull(adminProduct.get("MG_ISBN"))%>" /></td>
        </tr>
        <tr>
          <th scope="row">교재명</th>
          <td colspan="3"><input type="text" class="inputTxt" id="MG_BOOKNM" name="MG_BOOKNM" style="width:90%;" value="<%= RsUtil.checkNull(adminProduct.get("MG_BOOKNM"))%>" /></td>
        </tr>
        <tr>
          <th scope="row">(부제목)</th>
          <td colspan="3"><input type="text" class="inputTxt" id="MG_BOOKSUBNM" name="MG_BOOKSUBNM" style="width:90%;" value="<%= RsUtil.checkNull(adminProduct.get("MG_BOOKSUBNM"))%>"/></td>
        </tr>
        <tr>
          <th scope="row">저자명</th>
          <td><input type="text" class="inputTxt" id="MG_BOOKWRITER" name="MG_BOOKWRITER" style="width:100px;" value="<%= RsUtil.checkNull(adminProduct.get("MG_BOOKWRITER"))%>"/></td>
          <th scope="row" class="bleft">발행연도</th>
          <td><input type="text" class="inputTxt" id="MG_BOOKISYEAR" name="MG_BOOKISYEAR" style="width:80px;" value="<%= RsUtil.checkNull(adminProduct.get("MG_BOOKISYEAR"))%>"/> 년</td>
        </tr>
        <tr>
          <th scope="row">정가</th>
          <td><input type="text" class="inputTxt" id="MG_PRICE" name="MG_PRICE" style="width:100px;" value="<%= RsUtil.checkNull(adminProduct.get("MG_PRICE"))%>"/> 원</td>
          <th scope="row" class="bleft">상품등록일</th>
          <td><input type="text" class="inputTxt" id="REGDATE" name="REGDATE" style="width:80px;" value="<%= RsUtil.checkNull(adminProduct.get("REGDATE"))%>"/> </td>
        </tr>
        <% if(pdtType.equals("region")){ %>
        <tr>
        	<th>상품등록자명</th>
        	<td><input type="text" class="inputTxt" id="SP_BUSINM" name="SP_BUSINM" style="width:100px;" value="<%= RsUtil.checkNull(adminProduct.get("SP_NAME"))%>"/></td>
        	<th>상품공급자명</th>
        	<td><input type="text" class="inputTxt" id="SP_NAME" name="SP_NAME" style="width:100px;" value="<%= RsUtil.checkNull(adminProduct.get("SP_BUSINM"))%>"/></td>
        </tr>
        <tr>
        	<th>상품공급률</th>
        	<td colspan="3"><input type="text" class="inputTxt" id="RG_SPRATE" name="RG_SPRATE" style="width:100px;" value="<%= RsUtil.checkNull(adminProduct.get("RG_SPRATE"))%>"/>%</td>
        </tr>
        <%} %>
	       <tr>
	        <th scope="row">상품이미지</th>
	          <td>
	          	<img src="<%= realPath + RsUtil.checkNull(adminProduct.get("thumnail_image"))%>" alt="기본이미지" id="img_thumnailBox" class="mgb10"><br><input type="text" id="fileName" class="file_input_textbox" style="width:120px" value="<%= RsUtil.checkNull(adminProduct.get("oriFileName"))%>" readonly >
	            <div class="file_input_div" style="width:80px"> <img src="<%= realPath%>/img/open.gif" class="file_input_img_btn" alt="open" />
	              <input type="file" name="file_1" class="file_input_hidden" style="width:120px" onchange="javascript: document.getElementById('fileName').value = this.value; fileChange()" value="<%= RsUtil.checkNull(adminProduct.get("MG_BOOKIMG"))%>"/>
	            </div>이미지 사이즈는 세로 상관없이 가로80px입니다.</td>
	          <th scope="row" class="bleft">상품승인</th>
	          <td><input type="checkbox" class="chk" name="MG_APPLYCHK" id="MG_APPLYCHK" value="T" <%= WebUtil.isChecked("T", RsUtil.checkNull(adminProduct.get("MG_APPLYCHK")))%>/>
	              예
	              <input type="checkbox" class="chk" name="MG_APPLYCHK" id="MG_APPLYCHK" value="F" <%= WebUtil.isChecked("F", RsUtil.checkNull(adminProduct.get("MG_APPLYCHK")))%>/>
	              아니오</td>
	        </tr>
        <tr>
          <th scope="row">상세정보</th>
          <td colspan="3"><textarea rows="5" class="inputTxt" id="MG_MOREINF" name="MG_MOREINF" style="width:90%;"><%= RsUtil.checkNull(adminProduct.get("MG_MOREINF"))%></textarea></td>
        </tr>
        <tr>
          <th scope="row">참고자료(url)</th>
          <td colspan="3"><input type="text" class="inputTxt" id="MG_REFMAT" name="MG_REFMAT" style="width:90%;" value="<%= RsUtil.checkNull(adminProduct.get("MG_REFMAT"))%>"/></td>
        </tr>
      </tbody>
    </table>
    
    <!-- detail -->
    <div class="dibp">
        <ul>
          <li class="popmenu">
            <table style="width:600px">
              <colgroup>
              <col width="115" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              </colgroup>
              <tr>
                <th scope="col">출판사별</th>
                <% if(pbsCodeList.size() <= 5){ %>
                <% for(int i=0; i<pbsCodeList.size(); i++){ %>
                <td><input type="radio" class="chk" id="MG_PBS" name="MG_PBS" value="<%= RsUtil.checkNull(pbsCodeList.get(i).get("CODE_FIRST"))%>" <%= WebUtil.isChecked(RsUtil.checkNull(pbsCodeList.get(i).get("CODE_FIRST")), RsUtil.checkNull(adminProduct.get("MG_PBS")))%>/><%= RsUtil.checkNull(pbsCodeList.get(i).get("CODE_CODENAME"))%></td>
                <%} %>
                <% }else{ %>
                <% for(int i=0; i<5; i++){ %>
                <td><input type="radio" class="chk" id="MG_PBS" name="MG_PBS" value="<%= RsUtil.checkNull(pbsCodeList.get(i).get("CODE_FIRST"))%>" <%= WebUtil.isChecked(RsUtil.checkNull(pbsCodeList.get(i).get("CODE_FIRST")), RsUtil.checkNull(adminProduct.get("MG_PBS")))%>/><%= RsUtil.checkNull(pbsCodeList.get(i).get("CODE_CODENAME"))%></td>
                <%} %>
                <% } %>
              </tr>
            </table>
            <%if(pbsCodeList.size() > 5){ %>
            <a><%= pbsCodeList.size()%>개 <img src="<%= realPath%>/css/images/more.gif" alt="more"/></a>
            <ul class="hide">
              <li>
                <table style="width:600px">
              <colgroup>
              <col width="115" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
                  </colgroup>
                  	<tr>
                  		<th scope="col"></th>
                  	<% for(int i=5; i<pbsCodeList.size(); i++){ int j=i; %>
                  		<td><input type="radio" class="chk" id="MG_PBS" name="MG_PBS" value="<%= RsUtil.checkNull(pbsCodeList.get(i).get("CODE_FIRST"))%>"<%= WebUtil.isChecked(RsUtil.checkNull(pbsCodeList.get(i).get("CODE_FIRST")), RsUtil.checkNull(adminProduct.get("MG_PBS")))%>/><%= RsUtil.checkNull(pbsCodeList.get(i).get("CODE_CODENAME"))%></td>
                  		
                  		<% if(j != 5){ %>
                  			<% if((j+1) % 5 == 0){ %>
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
          <li class="popmenu">
            <table style="width:600px">
              <colgroup>
              <col width="115" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              </colgroup>
              <tr>
                <th scope="col">분야(과목)별</th>
                <% if(subjCodeList.size() <= 5){ %>
                <% for(int i=0; i<subjCodeList.size(); i++){ %>
                <td><input type="radio" class="chk" id="MG_SUBJECT" name="MG_SUBJECT" value="<%= RsUtil.checkNull(subjCodeList.get(i).get("CODE_FIRST"))%>" <%= WebUtil.isChecked(RsUtil.checkNull(subjCodeList.get(i).get("CODE_FIRST")), RsUtil.checkNull(adminProduct.get("MG_SUBJECT")))%>/><%= RsUtil.checkNull(subjCodeList.get(i).get("CODE_CODENAME"))%></td>
                <%} %>
                <% }else{ %>
                <% for(int i=0; i<5; i++){ %>
                <td><input type="radio" class="chk" id="MG_SUBJECT" name="MG_SUBJECT" value="<%= RsUtil.checkNull(subjCodeList.get(i).get("CODE_FIRST"))%>" <%= WebUtil.isChecked(RsUtil.checkNull(subjCodeList.get(i).get("CODE_FIRST")), RsUtil.checkNull(adminProduct.get("MG_SUBJECT")))%>/><%= RsUtil.checkNull(subjCodeList.get(i).get("CODE_CODENAME"))%></td>
                <%} %>
                <% } %>
              </tr>
            </table>
            <%if(subjCodeList.size() > 5){ %>
            <a><%= subjCodeList.size()%>개 <img src="<%= realPath%>/css/images/more.gif" alt="more"/></a>
            <ul class="hide">
              <li>
                <table style="width:600px">
              <colgroup>
              <col width="115" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
                  </colgroup>
                  	<tr>
                  		<th scope="col"></th>
                  	<% for(int i=5; i<subjCodeList.size(); i++){ int j=i; %>
                  		<td><input type="radio" class="chk" id="MG_SUBJECT" name="MG_SUBJECT" value="<%= RsUtil.checkNull(subjCodeList.get(i).get("CODE_FIRST"))%>" <%= WebUtil.isChecked(RsUtil.checkNull(subjCodeList.get(i).get("CODE_FIRST")), RsUtil.checkNull(adminProduct.get("MG_SUBJECT")))%>/><%= RsUtil.checkNull(subjCodeList.get(i).get("CODE_CODENAME"))%></td>
                  		
                  		<% if(j != 5){ %>
                  			<% if((j+1) % 5 == 0){ %>
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
          <li class="popmenu">
            <table style="width:600px">
              <colgroup>
              <col width="115" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              </colgroup>
              <tr>
                <th scope="col">대상별</th>
                <% if(objCodeList.size() <= 5){ %>
                <% for(int i=0; i<objCodeList.size(); i++){ %>
                <td><input type="radio" class="chk" id="MG_OBJECT" name="MG_OBJECT" value="<%= RsUtil.checkNull(objCodeList.get(i).get("CODE_FIRST"))%>" <%= WebUtil.isChecked(RsUtil.checkNull(objCodeList.get(i).get("CODE_FIRST")), RsUtil.checkNull(adminProduct.get("MG_OBJECT")))%>/><%= RsUtil.checkNull(objCodeList.get(i).get("CODE_CODENAME"))%></td>
                <%} %>
                <% }else{ %>
                <% for(int i=0; i<5; i++){ %>
                <td><input type="radio" class="chk" id="MG_OBJECT" name="MG_OBJECT" value="<%= RsUtil.checkNull(objCodeList.get(i).get("CODE_FIRST"))%>" <%= WebUtil.isChecked(RsUtil.checkNull(objCodeList.get(i).get("CODE_FIRST")), RsUtil.checkNull(adminProduct.get("MG_OBJECT")))%>/><%= RsUtil.checkNull(objCodeList.get(i).get("CODE_CODENAME"))%></td>
                <%} %>
                <% } %>
              </tr>
            </table>
            <%if(objCodeList.size() > 5){ %>
            <a><%= objCodeList.size()%>개 <img src="<%= realPath%>/css/images/more.gif" alt="more"/></a>
            <ul class="hide">
              <li>
                <table style="width:600px">
              <colgroup>
              <col width="115" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
                  </colgroup>
                  	<tr>
                  		<th scope="col"></th>
                  	<% for(int i=5; i<objCodeList.size(); i++){ int j=i; %>
                  		<td><input type="radio" class="chk" id="MG_OBJECT" name="MG_OBJECT" value="<%= RsUtil.checkNull(objCodeList.get(i).get("CODE_FIRST"))%>" <%= WebUtil.isChecked(RsUtil.checkNull(objCodeList.get(i).get("CODE_FIRST")), RsUtil.checkNull(adminProduct.get("MG_OBJECT")))%>/><%= RsUtil.checkNull(objCodeList.get(i).get("CODE_CODENAME"))%></td>
                  		
                  		<% if(j != 5){ %>
                  			<% if((j+1) % 5 == 0){ %>
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
          <li class="popmenu">
            <table style="width:600px">
              <colgroup>
              <col width="115" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              </colgroup>
              <tr>
                <th scope="col">학년별</th>
                <% if(gradeCodeList.size() <= 5){ %>
                <% for(int i=0; i<gradeCodeList.size(); i++){ %>
                <td><input type="radio" class="chk" id="MG_GRADE" name="MG_GRADE" value="<%= RsUtil.checkNull(gradeCodeList.get(i).get("CODE_FIRST"))%>" <%= WebUtil.isChecked(RsUtil.checkNull(gradeCodeList.get(i).get("CODE_FIRST")), RsUtil.checkNull(adminProduct.get("MG_GRADE")))%>/><%= RsUtil.checkNull(gradeCodeList.get(i).get("CODE_CODENAME"))%></td>
                <%} %>
                <% }else{ %>
                <% for(int i=0; i<5; i++){ %>
                <td><input type="radio" class="chk" id="MG_GRADE" name="MG_GRADE" value="<%= RsUtil.checkNull(gradeCodeList.get(i).get("CODE_FIRST"))%>" <%= WebUtil.isChecked(RsUtil.checkNull(gradeCodeList.get(i).get("CODE_FIRST")), RsUtil.checkNull(adminProduct.get("MG_GRADE")))%>/><%= RsUtil.checkNull(gradeCodeList.get(i).get("CODE_CODENAME"))%></td>
                <%} %>
                <% } %>
              </tr>
            </table>
            <%if(gradeCodeList.size() > 5){ %>
            <a><%= gradeCodeList.size()%>개 <img src="<%= realPath%>/css/images/more.gif" alt="more"/></a>
            <ul class="hide">
              <li>
                <table style="width:600px">
              <colgroup>
              <col width="115" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
                  </colgroup>
                  	<tr>
                  		<th scope="col"></th>
                  	<% for(int i=5; i<gradeCodeList.size(); i++){ int j=i; %>
                  		<td><input type="radio" class="chk" id="MG_GRADE" name="MG_GRADE" value="<%= RsUtil.checkNull(gradeCodeList.get(i).get("CODE_FIRST"))%>" <%= WebUtil.isChecked(RsUtil.checkNull(gradeCodeList.get(i).get("CODE_FIRST")), RsUtil.checkNull(adminProduct.get("MG_GRADE")))%>/><%= RsUtil.checkNull(gradeCodeList.get(i).get("CODE_CODENAME"))%></td>
                  		
                  		<% if(j != 5){ %>
                  			<% if((j+1) % 5 == 0){ %>
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
          <!-- <li class="popmenu">
            <table style="width:600px">
              <colgroup>
              <col width="115" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              </colgroup>
              <tr>
                <th scope="col">상품공급자별</th>
                <td><input type="radio" class="chk" id="" name="" value="00001"/>
                  국영수책마당</td>
                <td><input type="radio" class="chk" id="" name="" value="00002"/>
                  으뜸학원</td>
                <td><input type="radio" class="chk" id="" name="" value="00003"/>
                  빨간펜</td>
                <td><input type="radio" class="chk" id="" name="" value="00004"/>
                  한국문고</td>
                <td><input type="radio" class="chk" id="" name="" value="00005"/>
                  영재교육책</td>
              </tr>
            </table>
            <a>40개 <img src="<%= realPath%>/css/images/more.gif" alt="more"/></a>
            <ul class="hide">
              <li>
                <table style="width:600px">
              <colgroup>
              <col width="115" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
                  </colgroup>
                  <tr>
                    <th scope="col"></th>
                    <td><input type="radio" class="chk" />
                      국영수책마당</td>
                    <td><input type="radio" class="chk" />
                      으뜸학원</td>
                    <td><input type="radio" class="chk" />
                      빨간펜</td>
                    <td><input type="radio" class="chk" />
                      한국문고</td>
                    <td><input type="radio" class="chk" />
                      영재교육책</td>
                  </tr>
                  <tr>
                    <th scope="col"></th>
                    <td><input type="radio" class="chk" />
                      국영수책마당</td>
                    <td><input type="radio" class="chk" />
                      으뜸학원</td>
                    <td><input type="radio" class="chk" />
                      빨간펜</td>
                    <td><input type="radio" class="chk" />
                      한국문고</td>
                    <td><input type="radio" class="chk" />
                      영재교육책</td>
                  </tr>
                </table>
              </li>
            </ul>
          </li>-->
        </ul>
      </div>
      <script>
    $(document).ready(function(){
        $(".popmenu>a").click(function(){
            $(this).next("ul").toggleClass("hide");
        });
    });
</script> 
<!-- /detail -->
    
    <!-- 버튼 -->
  <div class="btnarea">
      <input value="저장" type="button" class="btn02 mgr10" onclick="updateProduct()" />
      <input value="닫기" type="button" class="btn01" onclick="window.close()" />
    </div>
    <!-- /버튼 --> 
</form>
</div>

<script>
	function updateProduct(){
		var Url = "updateProduct.do";
		jQuery.ajax({
            url: Url,
            type:'POST',
            data : $("#updateProduct").serialize()
            ,
            success: function(data){
            	console.log(data);
            	if(data.msg == "success"){
            		if($("#update_type").val() == "insert"){
            			alert("개별상품이 등록 되었습니다.");
            		}else{
            			alert("개별상품이 수정 되었습니다.");
            		}
            		location.reload();
            	}else{
            		if($("#update_type").val() == "insert"){
            			alert("등록하는 과정에서 오류가 발생했습니다.");
            		}else{
            			alert("수정하는 과정에서 오류가 발생했습니다.");
            		}
            		
            	}
			}
		})
	}
	
	function fileChange(){
		var options = {
	    	url : 'goodImgFileUpload.do',
	    	type: 'post',
	    	contentType: 'application/x-www-form-urlencoded; charset=utf-8',
	    	dataType : "json",
	    	success:function(data){
	    		console.log(data);
	    		if(data.msg == "success"){
	    			$("#img_thumnailBox").attr("src", "<%= realPath%>/bookimg/"+data.img_thumnail);
	    			$("#MG_BOOKIMG").val(data.imageName);
	    		}else{
	    			alert("사진업로드 중 오류가 발생하였습니다.");
	    		}
	    	}
		};
		jQuery("#updateProduct").ajaxForm(options).submit();
	}
</script>
<%@ include file="../popup_bottom.jsp" %>