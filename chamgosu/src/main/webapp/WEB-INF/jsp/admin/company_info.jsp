<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>
<%
	Map<String, Object> companyinfo = (Map<String, Object>)request.getAttribute("companyinfo");
	String mainLogoName = "";
	String topLogoName = "";
	String bottomLogoName = "";
	String faviconLogoName = "";
	String ingamName = "";
	
	if(!RsUtil.checkNull(companyinfo.get("CF_INGAMIMG")).equals("")) ingamName = companyinfo.get("CF_INGAMIMG").toString().substring(14);
	if(!RsUtil.checkNull(companyinfo.get("CF_MAINLOGO")).equals("")) mainLogoName = companyinfo.get("CF_MAINLOGO").toString().substring(14);
	if(!RsUtil.checkNull(companyinfo.get("CF_TOPLOGO")).equals("")) topLogoName = companyinfo.get("CF_TOPLOGO").toString().substring(14);
	if(!RsUtil.checkNull(companyinfo.get("CF_BOTTOMLOGO")).equals("")) bottomLogoName = companyinfo.get("CF_BOTTOMLOGO").toString().substring(14);
	if(!RsUtil.checkNull(companyinfo.get("CF_FAVICON")).equals("")) faviconLogoName = companyinfo.get("CF_FAVICON").toString().substring(14);
	
%>
  
<!--contents-->
  <div id="contents">
    <h2>ㆍ회사정보</h2>
    <h3>쇼핑몰 타이틀</h3>
     <form id="insertForm">
     
     	<!-- 사진 정보 -->
     	<input type="hidden" id="CF_INGAMIMG" name="CF_INGAMIMG" value="<%= RsUtil.checkNull(companyinfo.get("CF_INGAMIMG"))%>" />
     	<input type="hidden" id="CF_MAINLOGO" name="CF_MAINLOGO" value="<%= RsUtil.checkNull(companyinfo.get("CF_MAINLOGO"))%>" />
     	<input type="hidden" id="CF_TOPLOGO" name="CF_TOPLOGO" value="<%= RsUtil.checkNull(companyinfo.get("CF_TOPLOGO"))%>" />
     	<input type="hidden" id="CF_BOTTOMLOGO" name="CF_BOTTOMLOGO" value="<%= RsUtil.checkNull(companyinfo.get("CF_BOTTOMLOGO"))%>" />
     	<input type="hidden" id="CF_FAVICON" name="CF_FAVICON" value="<%= RsUtil.checkNull(companyinfo.get("CF_FAVICON"))%>" />
     	
     	
	    <table class="bbs_write01">
	      <caption>
	      쇼핑몰 타이틀
	      </caption>
	      <colgroup>
	      <col width="150" />
	      <col width="*" />
	      </colgroup>
	     
	      <tbody>
	        <tr>
	          <th scope="row">쇼핑몰 타이틀</th>
	          <td><input type="text" class="inputTxt" style="width:90%;" id="CF_SITENAME" name="CF_SITENAME" value="<%= RsUtil.checkNull(companyinfo.get("CF_SITENAME"))%>"/></td>
	        </tr>
	        <tr>
	          <th scope="row">검색 키워드</th>
	          <td><input type="text" class="inputTxt" style="width:90%;" id="CF_SEARCHKEY" name="CF_SEARCHKEY" value="<%= RsUtil.checkNull(companyinfo.get("CF_SEARCHKEY"))%>"/></td>
	        </tr>
	        <tr>
	          <th scope="row">소개글</th>
	          <td><input type="text" class="inputTxt" style="width:90%;" id="CF_INTRO1" name="CF_INTRO1" value="<%= RsUtil.checkNull(companyinfo.get("CF_INTRO1"))%>"/></td>
	        </tr>
	      </tbody>
	    </table>
	    
	    <h3>사업자 정보</h3>
	    <table class="bbs_write01">
	      <caption>
	      사업자 정보
	      </caption>
	      <colgroup>
	      <col width="150" />
	      <col width="270" />
	      <col width="150" />
	      <col width="*" />
	      </colgroup>
	      <tbody>
	        <tr>
	          <th scope="row">사업자등록번호</th>
	          <td><input type="number" style="ime-mode:disabled; width:70%;" onkeypress="return digit_check(event)" class="inputTxt"  id="CF_COMPNUM" name="CF_COMPNUM" value="<%= RsUtil.checkNull(companyinfo.get("CF_COMPNUM"))%>"/></td>
	          <th scope="row" class="bleft">인감</th>
	          <td><img src="<%=realPath + "/" +RsUtil.checkNull(companyinfo.get("INGAMTHNMNAIL"))%>" alt="기본이미지" class="mgb10"> 이미지 사이즈(100X100)<br>
	            <input type="text" id="fileName" class="file_input_textbox" style="width:120px" value="<%= ingamName%>" readonly >
	            <div class="file_input_div" style="width:110px"> <img src="../img/open.gif" class="file_input_img_btn" alt="open" />
	              <input type="file" name="file_1" class="file_input_hidden" style="width:100px" onchange="javascript: document.getElementById('fileName').value = this.value; fileChange('CF_INGAMIMG', this.name)"/>
	            </div></td>
	        </tr>
	        <tr>
	          <th scope="row">상호</th>
	          <td><input type="text" class="inputTxt" style="width:90%;" id="CF_MUTUAL" name="CF_MUTUAL" value="<%= RsUtil.checkNull(companyinfo.get("CF_MUTUAL"))%>"/></td>
	          <th scope="row" class="bleft">대표자명</th>
	          <td><input type="text" class="inputTxt" style="width:100px;" id="CF_MEMNAME" name="CF_MEMNAME" value="<%= RsUtil.checkNull(companyinfo.get("CF_MEMNAME"))%>"/></td>
	        </tr>
	        <tr>
	          <th scope="row">주소</th>
	          <td colspan="3"><input type="text" class="inputTxt" style="width:100px;" title="우편번호 입력" id="CF_ZIPCODE" name="CF_ZIPCODE" value="<%= RsUtil.checkNull(companyinfo.get("CF_ZIPCODE"))%>"/>
	            <input value="우편번호찾기" type="button" class="btns" />
	            <input type="text" class="inputTxt" style="width:210px;" id="CF_ADDR1" name="CF_ADDR1" value="<%= RsUtil.checkNull(companyinfo.get("CF_ADDR1"))%>"/><input type="text" id="CF_ADDR2" name="CF_ADDR2" class="inputTxt" style="width:180px;" value="<%= RsUtil.checkNull(companyinfo.get("CF_ADDR2"))%>"/></td>
	        </tr>
	        <tr>
	          <th scope="row" class="bleft">업태</th>
	          <td><input type="text" class="inputTxt" style="width:100px;" id="CF_CONDITIONS" name="CF_CONDITIONS" value="<%= RsUtil.checkNull(companyinfo.get("CF_CONDITIONS"))%>"/></td>
	          <th scope="row" class="bleft">종목</th>
	          <td><input type="text" class="inputTxt" style="width:100px;" id="CF_ITEM" name="CF_ITEM" value="<%= RsUtil.checkNull(companyinfo.get("CF_ITEM"))%>"/></td>
	        </tr>
	        <tr>
	          <th scope="row" class="bleft">전화번호</th>
	          <td><input type="number" style="ime-mode:disabled; width:70%;" onkeypress="return digit_check(event)" class="inputTxt" id="CF_TELNO1" name="CF_TELNO1" value="<%= RsUtil.checkNull(companyinfo.get("CF_TELNO1"))%>"/></td>
	          <th scope="row" class="bleft">팩스번호</th>
	          <td><input type="number" style="ime-mode:disabled; width:60%;" onkeypress="return digit_check(event)" class="inputTxt" id="CF_FAX" name="CF_FAX" value="<%= RsUtil.checkNull(companyinfo.get("CF_FAX"))%>"/></td>
	        </tr>
	        <tr>
	        	<th scope="row" class="bleft">이메일</th>
	        	<td colspan="3"><input type="text" class="inputTxt" style="width:300px;" id="CF_EMAIL" name="CF_EMAIL" value="<%= RsUtil.checkNull(companyinfo.get("CF_EMAIL"))%>"/></td>
	        </tr>
	      </tbody>
	    </table>
	    
	    <h3>결재 수수료</h3>
	    <table class="bbs_write01">
	      <caption>
	      결재 수수료
	      </caption>
	      <colgroup>
	      <col width="150" />
	      <col width="*" />
	      </colgroup>
	      <tbody>
	        <tr>
	          <th scope="row">카드 수수료</th>
	          <td><input type="text" onkeyup="lfn_keychk(this)"  style="ime-mode:disabled; width:35px;" class="inputTxt" id="CF_CARD" name="CF_CARD" value="<%= RsUtil.checkNull(companyinfo.get("CF_CARD"))%>"/>
	            %</td>
	        </tr>
	        <tr>
	          <th scope="row">계좌이체 수수료</th>
	          <td><input type="text" onkeyup="lfn_keychk(this)"  style="ime-mode:disabled; width:35px;" class="inputTxt" id="CF_BANK" name="CF_BANK" value="<%= RsUtil.checkNull(companyinfo.get("CF_BANK"))%>"/>
	            %</td>
	        </tr>
	        <tr>
	          <th scope="row">가상계좌 수수료</th>
	          <td><input type="text" onkeyup="lfn_keychk(this)"  style="ime-mode:disabled; width:35px;" class="inputTxt" id="CF_VIRTUAL" name="CF_VIRTUAL" value="<%= RsUtil.checkNull(companyinfo.get("CF_VIRTUAL"))%>"/>
	            %</td>
	        </tr>
	        <tr>
	          <th scope="row">휴대폰 수수료</th>
	          <td><input type="text" onkeyup="lfn_keychk(this)"  style="ime-mode:disabled; width:35px;" class="inputTxt" id="CF_PHONE" name="CF_PHONE" value="<%= RsUtil.checkNull(companyinfo.get("CF_PHONE"))%>"/>
	            %</td>
	        </tr>
	      </tbody>
	    </table>
	    
	<h3>사이트 이미지 관리</h3>
	    <table class="bbs_write01">
	      <caption>
	      사이트 이미지 관리
	      </caption>
	      <colgroup>
	      <col width="150" />
	      <col width="*" />
	      </colgroup>
	      <tbody>
	        <tr>
	          <th scope="row">메인로고</th>
	          <td><input type="text" id="fileName04" class="file_input01_textbox" value="<%= mainLogoName%>" readonly >
	            <div class="file_input01_div fl" style="width:80px"> <img src="../img/open.gif" class="file_input01_img_btn" alt="open" />
	              <input type="file" name="file_04" class="file_input01_hidden" onchange="javascript: document.getElementById('fileName04').value = this.value; fileChange('CF_MAINLOGO', this.name)"/> 
	            </div><div class="fl mgl10">※ 이미지 사이즈는 가로174픽셀, 세로104픽셀입니다.</div></td>
	        </tr>
	        <tr>
	          <th scope="row">상단로고</th>
	          <td><input type="text" id="fileName01" class="file_input02_textbox" value="<%= topLogoName%>" readonly >
	            <div class="file_input02_div fl" style="width:80px"> <img src="../img/open.gif" class="file_input02_img_btn" alt="open" />
	              <input type="file" name="file_2" class="file_input02_hidden" onchange="javascript: document.getElementById('fileName01').value = this.value; fileChange('CF_TOPLOGO', this.name)"/> 
	            </div><div class="fl mgl10">※ 이미지 사이즈는 가로75~210픽셀, 세로42픽셀입니다.</div></td>
	        </tr>
	        <tr>
	          <th scope="row">하단로고</th>
	          <td><input type="text" id="fileName02" class="file_input03_textbox" value="<%= bottomLogoName%>" readonly >
	            <div class="file_input03_div fl" style="width:80px"> <img src="../img/open.gif" class="file_input03_img_btn" alt="open" />
	              <input type="file" name="file_3" class="file_input03_hidden" onchange="javascript: document.getElementById('fileName02').value = this.value; fileChange('CF_BOTTOMLOGO', this.name)"/> 
	            </div><div class="fl mgl10">※ 이미지 사이즈는 가로42픽셀, 세로42픽셀입니다.</div></td>
	        </tr>
	        <tr>
	          <th scope="row">파비콘이미지</th>
	          <td><input type="text" id="fileName03" class="file_input04_textbox" value="<%= faviconLogoName%>" readonly >
	            <div class="file_input04_div fl" style="width:80px"> <img src="../img/open.gif" class="file_input04_img_btn" alt="open" />
	              <input type="file" name="file_4" class="file_input04_hidden" onchange="javascript: document.getElementById('fileName03').value = this.value; fileChange('CF_FAVICON', this.name)"/> 
	            </div><div class="fl mgl10">※ 이미지 사이즈는 가로16픽셀, 세로16픽셀입니다.</div></td>
	        </tr>
	        <tr>
	          <th scope="row">Copyright</th>
	          <td><textarea rows="7" class="inputTxt" style="width:90%;" id="CF_COPYRIGHT" name="CF_COPYRIGHT"><%= RsUtil.checkNull(companyinfo.get("CF_COPYRIGHT"))%></textarea></td>
	        </tr>
	      </tbody>
	    </table>
    
    <!-- 버튼 -->
    <div class="btnarea">
      <input value="저 장" type="button" class="btn02 mgr10" onclick="uppdateCompanyInfo()"/>
      <input value="취 소" type="reset" class="btn01" />
    </div>
    </form>
    <!-- /버튼 --> 
  </div>
  <!--/contents--> 
<%@ include file="../bottom.jsp" %>
<script>
	function uppdateCompanyInfo(){
		var Url = "updateCompanyInfo.do";
		jQuery.ajax({
		    url: Url,
		    type:'POST',
		    data :  $("#insertForm").serialize()
		    ,
		    success: function(data){
		    	console.log(data);
			}
		}); 
	}
	
	function fileChange(name, thisName){
		var columnName = "#" + name;
		
		var options = {
	    	url : 'companyFileUpload.do',
	    	type: 'post',
	    	contentType: 'application/x-www-form-urlencoded; charset=utf-8',
	    	dataType : "json",
	    	data : {
	    		"inputName" : thisName
	    	},
	    	success:function(data){
	    		if(data.msg == "success"){
	    			$(columnName).val(data.imageName);
	    		}else{
	    			alert("파일 업로드 시스템 오류 ::");
	    		}
	    	}
		};
		jQuery("#insertForm").ajaxForm(options).submit();
	}
</script>
