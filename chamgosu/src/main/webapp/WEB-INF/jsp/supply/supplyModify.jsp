<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>
<%

	Map<String, Object> supplyData = (Map<String, Object>)request.getAttribute("supplyData");
	String phone1 = RsUtil.checkNull(supplyData.get("SP_HP"));
	String tel1 = RsUtil.checkNull(supplyData.get("SP_TEL"));
	String fax1 = RsUtil.checkNull(supplyData.get("SP_FAX"));
	phone1 = WebUtil.tel(WebUtil.MaskClearString(phone1));
	String []phone = new String[3];
	if(!phone1.equals("")){
		phone = phone1.split("-");
	}else{
		phone[0] = "";
		phone[1] = "";
		phone[2] = "";
	}
	
	tel1 = WebUtil.tel(WebUtil.MaskClearString(tel1));
	String []tel = new String[3];
	if(!tel1.equals("")){
		tel = tel1.split("-");
	}else{
		tel[0] = "";
		tel[1] = "";
		tel[2] = "";
	}
	
	fax1 = WebUtil.tel(WebUtil.MaskClearString(fax1));
	String []fax = new String[3];
	if(!fax1.equals("")){
		fax = fax1.split("-");
	}else{
		fax[0] = "";
		fax[1] = "";
		fax[2] = "";
	}
	
	String email1 = RsUtil.checkNull(supplyData.get("SP_EMAIL"));
	
	String [] email = new String[2];

	if(email1.indexOf("@") > -1){
		email = email1.split("@");		
	}else{
		email[0] = "";
		email[1] = "";
	}
	
	String sp_compNumImg1 = RsUtil.checkNull(supplyData.get("SP_COMPNUMIMG"));
	String [] sp_compNumImg = new String[2];
	
	if(!sp_compNumImg1.equals("")){
		sp_compNumImg[1] = sp_compNumImg1.substring(14);
	}else{
		sp_compNumImg[0] = "";
		sp_compNumImg[1] = "";
	}
	
	
	String sp_bankBookImg1 = RsUtil.checkNull(supplyData.get("SP_BANKBOOKIMG"));
	String [] sp_bankBookImg = new String[2];
	
	if(!sp_bankBookImg1.equals("")){
		sp_bankBookImg[1] = sp_bankBookImg1.substring(14);
	}else{
		sp_bankBookImg[0] = "";
		sp_bankBookImg[1] = "";
	}
	
	String sp_logoImg1 = RsUtil.checkNull(supplyData.get("SP_LOGOIMG"));
	String [] sp_logoImg = new String[2];
	
	if(!sp_logoImg1.equals("")){
		sp_logoImg[1] = sp_logoImg1.substring(14);
	}else{
		sp_logoImg[0] = "";
		sp_logoImg[1] = "";
	}
%>
	<!--contents-->
  <div id="contents">
    <h2>ㆍ상품공급자 관리</h2>
    <h3>상품공급자 상세보기</h3>
    <form id="updateForm" name="updateForm">
    	<input type="hidden" id="sp_seq" name="sp_seq" value="<%= RsUtil.checkNull(supplyData.get("SP_SEQ"))%>" />
    	<input type="hidden" id="sp_compNumImg" name="sp_compNumImg" value="<%= sp_compNumImg1%>" />
    	<input type="hidden" id="sp_bankBookImg" name="sp_bankBookImg" value="<%= sp_bankBookImg1%>" />
    	<input type="hidden" id="sp_logoImg" name="sp_logoImg" value="<%= sp_logoImg1%>" />
	    <table class="bbs_write01">
	      <caption>
	      사업자 정보
	      </caption>
	      <colgroup>
	      <col width="150" />
	      <col width="410" />
	      <col width="150" />
	      <col width="*" />
	      </colgroup>
	      <tbody>
	        <tr>
	          <th scope="row">* 아이디<br>
	            (사업자등록번호)</th>
	          <td><input type="text" class="inputTxt" name="sp_id" id="sp_id" style="width:40%;" value="<%= RsUtil.checkNull(supplyData.get("SP_ID"))%>"/>
	            <input value="중복체크" type="button" name="chkID_btn" id="chkID_btn" class="btns01" onclick="idChk()"/>
	            <br>
	            ※ '-'없이 입력하세요. 사업자등록번호로 ID가 부여됩니다.</td>
	          <th scope="row" class="bleft">이용등급</th>
	          <td><select style="width:150px;" id="sp_userating" name="sp_userating">
	              <option value="">선택하세요</option>
	              <option value="1" <%= WebUtil.isSelected("1", RsUtil.checkNull(supplyData.get("SP_USERATING")))%>>유료업체</option>
	              <option value="0" <%= WebUtil.isSelected("0", RsUtil.checkNull(supplyData.get("SP_USERATING")))%>>무료업체</option>
	              <option value="2" <%= WebUtil.isSelected("2", RsUtil.checkNull(supplyData.get("SP_USERATING")))%>>승인대기</option>
	            </select></td>
	        </tr>
	        <tr>
	          <th scope="row">* 업체명</th>
	          <td><input type="text" name="sp_businm" id="sp_businm" class="inputTxt" style="width:60%;" value="<%= RsUtil.checkNull(supplyData.get("SP_BUSINM"))%>" /></td>
	          <th scope="row" class="bleft">* 대표자명</th>
	          <td><input type="text" name="sp_name" id="sp_name" class="inputTxt" style="width:60%;" value="<%= RsUtil.checkNull(supplyData.get("SP_NAME"))%>"/></td>
	        </tr>
	        <tr>
	          <th scope="row">* 현재 비밀번호</th>
	          <td colspan="3"><input type="password" name="pass" id="pass" class="inputTxt" style="width:150px;" value="<%= RsUtil.checkNull(supplyData.get("SP_PWD"))%>"/>
	            ※ 신규 등록시 아이디(사업자등록번호)와 동일하게 설정됩니다.</td>
	        </tr>
	        <tr>
	          <th scope="row">변경할 비밀번호</th>
	          <td><input type="password" name="sp_pwd" id="sp_pwd" class="inputTxt" style="width:150px;" />
	            <span><br>
	            - 반드시 8~20자의 영문, 숫자, 특수문자 중 2가지 이상으로 조합해야 합니다. <br>
	            - 동일한 문자열을 연속 배치할 수 없습니다. 예) aaa, 111 <br>
	            - 아이디와 4자리 이상 동일한 문자열을 사용할 수 없습니다.</span></td>
	          <th scope="row" class="bleft">비밀번호 재입력</th>
	          <td><input type="password" name="rePass" id="rePass" class="inputTxt" style="width:150px;" /></td>
	        </tr>
	        <tr>
	          <th scope="row">* 주소</th>
	          <td colspan="3"><input type="text" id="sp_post" name="sp_post" class="inputTxt" style="width:100px;" title="우편번호 입력"  value="<%= RsUtil.checkNull(supplyData.get("SP_POST"))%>"/>
	            <input value="우편번호찾기" type="button" class="btns" />
	            <input type="text" id="sp_address" name="sp_address" class="inputTxt" style="width:400px;"  value="<%= RsUtil.checkNull(supplyData.get("SP_ADDRESS"))%>"/>
	          	<input type="text" id="sp_detailAddress" name="sp_detailAddress" class="inputTxt" style="width:400px;"  value="<%= RsUtil.checkNull(supplyData.get("SP_DETAILADDRESS"))%>"/>  
	          </td>
	        </tr>
	        <tr>
	          <th scope="row">* 전화번호</th>
	          <td colspan="3"><select style="width:70px;" id="tel1">
	              <option value='' <%= WebUtil.isSelected("", RsUtil.checkNull(tel[0]))%>>선택</option>
	              <option value='02' <%= WebUtil.isSelected("02", RsUtil.checkNull(tel[0]))%>>02</option>
	              <option value='031' <%= WebUtil.isSelected("031", RsUtil.checkNull(tel[0]))%>>031</option>
	              <option value='032' <%= WebUtil.isSelected("032", RsUtil.checkNull(tel[0]))%>>032</option>
	              <option value='033' <%= WebUtil.isSelected("033", RsUtil.checkNull(tel[0]))%>>033</option>
	              <option value='041' <%= WebUtil.isSelected("041", RsUtil.checkNull(tel[0]))%>>041</option>
	              <option value='042' <%= WebUtil.isSelected("042", RsUtil.checkNull(tel[0]))%>>042</option>
	              <option value='043' <%= WebUtil.isSelected("043", RsUtil.checkNull(tel[0]))%>>043</option>
	              <option value='051' <%= WebUtil.isSelected("051", RsUtil.checkNull(tel[0]))%>>051</option>
	              <option value='052' <%= WebUtil.isSelected("052", RsUtil.checkNull(tel[0]))%>>052</option>
	              <option value='053' <%= WebUtil.isSelected("053", RsUtil.checkNull(tel[0]))%>>053</option>
	              <option value='054' <%= WebUtil.isSelected("054", RsUtil.checkNull(tel[0]))%>>054</option>
	              <option value='055' <%= WebUtil.isSelected("055", RsUtil.checkNull(tel[0]))%>>055</option>
	              <option value='061' <%= WebUtil.isSelected("061", RsUtil.checkNull(tel[0]))%>>061</option>
	              <option value='062' <%= WebUtil.isSelected("062", RsUtil.checkNull(tel[0]))%>>062</option>
	              <option value='063' <%= WebUtil.isSelected("063", RsUtil.checkNull(tel[0]))%>>063</option>
	              <option value='064' <%= WebUtil.isSelected("064", RsUtil.checkNull(tel[0]))%>>064</option>
	              <option value='070' <%= WebUtil.isSelected("070", RsUtil.checkNull(tel[0]))%>>070</option>
	              <option value='080' <%= WebUtil.isSelected("080", RsUtil.checkNull(tel[0]))%>>080</option>
	              <option value='0502' <%= WebUtil.isSelected("0502", RsUtil.checkNull(tel[0]))%>>0502</option>
	              <option value='0505' <%= WebUtil.isSelected("0505", RsUtil.checkNull(tel[0]))%>>0505</option>
	              <option value='0506' <%= WebUtil.isSelected("0506", RsUtil.checkNull(tel[0]))%>>0506</option>
	              <option value='0303' <%= WebUtil.isSelected("0303", RsUtil.checkNull(tel[0]))%>>0303</option>
	            </select>
	            <input type="number" style="ime-mode:disabled; width:70px;" id="tel2" onkeypress="return digit_check(event)" onkeyup="ChkByte(this,4);" class="inputTxt" value="<%= RsUtil.checkNull(tel[1])%>"/>
	            <input type="number" style="ime-mode:disabled; width:70px;" id="tel3" onkeypress="return digit_check(event)" onkeyup="ChkByte(this,4);" class="inputTxt" value="<%= RsUtil.checkNull(tel[2])%>"/>
	            <input type="hidden" id="sp_tel" name="sp_tel" value="<%= RsUtil.checkNull(supplyData.get("SP_TEL"))%>" />
	            </td>
	        </tr>
	        <tr>
	          <th scope="row">* 휴대폰 번호</th>
	          <td colspan="3"><select style="width:70px;" id="hp1">
	              <option value='' <%= WebUtil.isSelected("", RsUtil.checkNull(phone[0]))%>>선택</option>
	              <option value='010' <%= WebUtil.isSelected("010", RsUtil.checkNull(phone[0]))%>>010</option>
	              <option value='011' <%= WebUtil.isSelected("011", RsUtil.checkNull(phone[0]))%>>011</option>
	              <option value='016' <%= WebUtil.isSelected("016", RsUtil.checkNull(phone[0]))%>>016</option>
	              <option value='017' <%= WebUtil.isSelected("017", RsUtil.checkNull(phone[0]))%>>017</option>
	              <option value='018' <%= WebUtil.isSelected("018", RsUtil.checkNull(phone[0]))%>>018</option>
	              <option value='019' <%= WebUtil.isSelected("019", RsUtil.checkNull(phone[0]))%>>019</option>
	            </select>
	            <input type="number" style="ime-mode:disabled; width:70px;" id="hp2" onkeypress="return digit_check(event)" onkeyup="ChkByte(this,4);" class="inputTxt" value="<%= RsUtil.checkNull(phone[1])%>" />
	            <input type="number" style="ime-mode:disabled; width:70px;" id="hp3" onkeypress="return digit_check(event)" onkeyup="ChkByte(this,4);" class="inputTxt" value="<%= RsUtil.checkNull(phone[2])%>"/>
	            <input type="hidden" id="sp_hp" name="sp_hp" value="<%= RsUtil.checkNull(supplyData.get("SP_HP"))%>" />
	            </td>
	        </tr>
	        <tr>
	          <th scope="row">FAX 번호</th>
	          <td colspan="3"><select style="width:70px;" id="fax1">
	              <option value='' <%= WebUtil.isSelected("", RsUtil.checkNull(fax[0]))%>>선택</option>
	              <option value='02' <%= WebUtil.isSelected("02", RsUtil.checkNull(fax[0]))%>>02</option>
	              <option value='031' <%= WebUtil.isSelected("031", RsUtil.checkNull(fax[0]))%>>031</option>
	              <option value='032' <%= WebUtil.isSelected("032", RsUtil.checkNull(fax[0]))%>>032</option>
	              <option value='033' <%= WebUtil.isSelected("033", RsUtil.checkNull(fax[0]))%>>033</option>
	              <option value='041' <%= WebUtil.isSelected("041", RsUtil.checkNull(fax[0]))%>>041</option>
	              <option value='042' <%= WebUtil.isSelected("042", RsUtil.checkNull(fax[0]))%>>042</option>
	              <option value='043' <%= WebUtil.isSelected("043", RsUtil.checkNull(fax[0]))%>>043</option>
	              <option value='051' <%= WebUtil.isSelected("051", RsUtil.checkNull(fax[0]))%>>051</option>
	              <option value='052' <%= WebUtil.isSelected("052", RsUtil.checkNull(fax[0]))%>>052</option>
	              <option value='053' <%= WebUtil.isSelected("053", RsUtil.checkNull(fax[0]))%>>053</option>
	              <option value='054' <%= WebUtil.isSelected("054", RsUtil.checkNull(fax[0]))%>>054</option>
	              <option value='055' <%= WebUtil.isSelected("055", RsUtil.checkNull(fax[0]))%>>055</option>
	              <option value='061' <%= WebUtil.isSelected("061", RsUtil.checkNull(fax[0]))%>>061</option>
	              <option value='062' <%= WebUtil.isSelected("062", RsUtil.checkNull(fax[0]))%>>062</option>
	              <option value='063' <%= WebUtil.isSelected("063", RsUtil.checkNull(fax[0]))%>>063</option>
	              <option value='064' <%= WebUtil.isSelected("064", RsUtil.checkNull(fax[0]))%>>064</option>
	              <option value='070' <%= WebUtil.isSelected("070", RsUtil.checkNull(fax[0]))%>>070</option>
	              <option value='080' <%= WebUtil.isSelected("080", RsUtil.checkNull(fax[0]))%>>080</option>
	              <option value='0502' <%= WebUtil.isSelected("0502", RsUtil.checkNull(fax[0]))%>>0502</option>
	              <option value='0505' <%= WebUtil.isSelected("0505", RsUtil.checkNull(fax[0]))%>>0505</option>
	              <option value='0506' <%= WebUtil.isSelected("0506", RsUtil.checkNull(fax[0]))%>>0506</option>
	              <option value='0303' <%= WebUtil.isSelected("0303", RsUtil.checkNull(fax[0]))%>>0303</option>
	            </select>
	            <input type="number" style="ime-mode:disabled; width:70px;" id="fax2" onkeypress="return digit_check(event)" onkeyup="ChkByte(this,4);" class="inputTxt" value="<%= RsUtil.checkNull(fax[1])%>"/>
	            <input type="number" style="ime-mode:disabled; width:70px;" id="fax3" onkeypress="return digit_check(event)" onkeyup="ChkByte(this,4);" class="inputTxt" value="<%= RsUtil.checkNull(fax[2])%>"/>
	            <input type="hidden" id="sp_fax" name="sp_fax" value="<%= RsUtil.checkNull(supplyData.get("SP_FAX"))%>" />
	           </td>
	            
	        </tr>
	        <tr>
	          <th scope="row">* 이메일(계산서발급률)</th>
	          <td colspan="3"><input type="text" name="email1" id="email1" class="inputTxt" style="width:100px;" value="<%= RsUtil.checkNull(email[0])%>"/>
	            @
	            <input type="text" class="inputTxt" id="email2" name="email2" style="width:100px;" value="<%= RsUtil.checkNull(email[1])%>"/>
	            <select style="width:110px;" id="email3" name="email3" onchange="domainChange()">
	              <option value=''>직접입력</option>
	              <option value='chollian.net'>chollian.net</option>
	              <option value='daum.net'>daum.net</option>
	              <option value='dreamwiz.com'>dreamwiz.com</option>
	              <option value='empal.com'>empal.com</option>
	              <option value='freechal.com'>freechal.com</option>
	              <option value='gmail.com'>gmail.com</option>
	              <option value='hanafos.com'>hanafos.com</option>
	              <option value='hanmail.net'>hanmail.net</option>
	              <option value='hotmail.com'>hotmail.com</option>
	              <option value='kebi.com'>kebi.com</option>
	              <option value='korea.com'>korea.com</option>
	              <option value='lycos.co.kr'>lycos.co.kr</option>
	              <option value='nate.com'>nate.com</option>
	              <option value='naver.com'>naver.com</option>
	              <option value='netian.com'>netian.com</option>
	              <option value='paran.com'>paran.com</option>
	              <option value='unitel.co.kr'>unitel.co.kr</option>
	              <option value='yahoo.co.kr'>yahoo.co.kr</option>
	            </select>
	            <input type="hidden" id="sp_email" name="sp_email" value="<%= RsUtil.checkNull(supplyData.get("SP_EMAIL"))%>" />
	            </td>
	        </tr>
	        <tr>
	          <th scope="row">* 취급품목 및 회사소개</th>
	          <td colspan="3"><textarea rows="3" class="inputTxt" style="width:80%;" id="sp_compIntro" name="sp_compIntro"><%= RsUtil.checkNull(supplyData.get("SP_COMPINTRO"))%></textarea>
	            200자 내외</td>
	        </tr>
	        <tr>
	          <th scope="row">* 계좌번호</th>
	          <td colspan="3">은행
	            <input type="text" class="inputTxt mgr15" style="width:70px;" id="sp_bankNm" name="sp_bankNm" value="<%= RsUtil.checkNull(supplyData.get("SP_BANKNM"))%>"/>
	            계좌
	            <input type="number" style="ime-mode:disabled; width:200px;" id="sp_bankNum" name="sp_bankNum" onkeypress="return digit_check(event)" class="inputTxt mgr15" value="<%= RsUtil.checkNull(supplyData.get("SP_BANKNUM"))%>" />
	            예금주
	            <input type="text" class="inputTxt" style="width:90px;"  id="sp_bankDepNm" name="sp_bankDepNm" value="<%= RsUtil.checkNull(supplyData.get("SP_BANKDEPNM"))%>"/></td>
	        </tr>
	        <tr>
	          <th scope="row">* 기본공급률</th>
	          <td colspan="3"><input type="text" id="sp_orgRate" name="sp_orgRate" onkeyup="lfn_keychk(this)"  style="ime-mode:disabled; width:35px;" class="inputTxt" value="<%= RsUtil.checkNull(supplyData.get("SP_ORGRATE"))%>"/>
	            % <span>(상품 등록시 자동적으로 적용되는 당사에 대한 공급율이며 추후 상품별 또는 전체 수정이 가능합니다.)</span></td>
	        </tr>
	        <tr>
	          <th scope="row">* 증빙서류</th>
	          <td colspan="3"><input type="text" class="file_input_textbox" id="fileName" style="width:300px" value="<%= (sp_compNumImg[1].equals("")?"사업자등록증 사본" : sp_compNumImg[1])%>" readonly >
	            <div class="file_input_div mgr15" style="width:80px"> <img src="<%= realPath%>/img/open.gif" class="file_input_img_btn" alt="open" />
	              <input type="file" name="file_1" class="file_input_hidden" onchange="javascript: document.getElementById('fileName').value = this.value; javascript:fileChange('sp_compNumImg', this.name);"/>
	            </div>
	            <input type="text" class="file_input01_textbox" id="fileName01" style="width:300px" value="<%= (sp_bankBookImg[1].equals("")?"통장사본" : sp_bankBookImg[1])%>" readonly >
	            <div class="file_input01_div mgr15" style="width:80px"> <img src="<%= realPath%>/img/open.gif" class="file_input01_img_btn" alt="open" />
	              <input type="file" name="file_2" class="file_input01_hidden" onchange="javascript: document.getElementById('fileName01').value = this.value; javascript:fileChange('sp_bankBookImg', this.name);"/>
	            </div>
	            <input type="text" class="file_input02_textbox" id="fileName02" style="width:300px" value="<%= (sp_logoImg[1].equals("")?"회사로고" : sp_logoImg[1])%>" readonly >
	            <div class="file_input02_div mgr15" style="width:80px"> <img src="<%= realPath%>/img/open.gif" class="file_input02_img_btn" alt="open" />
	              <input type="file" name="file_3" class="file_input02_hidden" onchange="javascript: document.getElementById('fileName02').value = this.value; javascript:fileChange('sp_logoImg', this.name);"/>
	            </div></td>
	        </tr>
	        <tr>
	          <th scope="row">배송정책</th>
	          <td colspan="3"><div class="delivery"><strong>배송방법 : </strong>
	              <input type="radio" class="rdo mgl10" name="sp_dvrType" value="0" <%= WebUtil.isChecked("0", RsUtil.checkNull(supplyData.get("SP_DVRTYPE")))%> onclick="dvrChange(this.value)"/>
	              직원방문
	              <input type="radio" class="rdo mgl20" name="sp_dvrType" value="1" <%= WebUtil.isChecked("1", RsUtil.checkNull(supplyData.get("SP_DVRTYPE")))%> onclick="dvrChange(this.value)"/>
	              택배수령
	              <input type="text" class="inputTxt" style="width:90px;" id="sp_dvrPrice2" name="sp_dvrPrice2" value="<%= RsUtil.checkNull(supplyData.get("SP_DVRPRICE2"))%>" disabled="disabled"/>
	              <select style="width:70px;" id="sp_sendType" name="sp_sendType" disabled="disabled">
	                <option value="0" <%= WebUtil.isSelected("0", RsUtil.checkNull(supplyData.get("SP_SENDTYPE")))%>>선불</option>
	                <option value="1" <%= WebUtil.isSelected("1", RsUtil.checkNull(supplyData.get("SP_SENDTYPE")))%>>착불</option>
	              </select>
	              <input type="radio" class="rdo mgl20" name="sp_dvrType" value="2" <%= WebUtil.isChecked("2", RsUtil.checkNull(supplyData.get("SP_DVRTYPE")))%> onclick="dvrChange(this.value)"/>
	              방문수령
	              <input type="radio" class="rdo mgl20" name="sp_dvrType" value="3" <%= WebUtil.isChecked("3", RsUtil.checkNull(supplyData.get("SP_DVRTYPE")))%> onclick="dvrChange(this.value)"/>
	              기타
	              <input type="text" class="inputTxt" style="width:120px;" id="sp_dvrTypeEtc" name="sp_dvrTypeEtc" value="<%= RsUtil.checkNull(supplyData.get("SP_DVRTYPEETC"))%>"  disabled="disabled"/>
	            </div>
	            <strong>배송기준 : </strong>
	            <input type="radio" class="rdo mgl10" name="sp_dvrStandard"  value="0" <%= WebUtil.isChecked("0", RsUtil.checkNull(supplyData.get("SP_DVRSTANDARD")))%> onclick="dvrStandardChange(this.value)"/>
	            무료배송
	            <input type="radio" class="rdo mgl20" name="sp_dvrStandard"  value="1" <%= WebUtil.isChecked("1", RsUtil.checkNull(supplyData.get("SP_DVRSTANDARD")))%> onclick="dvrStandardChange(this.value)"/>
	            <input type="number" style="ime-mode:disabled; width:90px;" id="sp_dvrPrice" name="sp_dvrPrice" onkeypress="return digit_check(event)" class="inputTxt" disabled="disabled" value="<%= RsUtil.checkNull(supplyData.get("SP_DVRPRICE"))%>"/>
	            원 이상 무료배송
	            <input type="radio" class="rdo mgl20" name="sp_dvrStandard"  value="2" <%= WebUtil.isChecked("2", RsUtil.checkNull(supplyData.get("SP_DVRSTANDARD")))%> onclick="dvrStandardChange(this.value)"/>
	            착불 </td>
	        </tr>
	        <tr>
	          <th scope="row">교환 및 반품정책</th>
	          <td colspan="3"><input type="radio" class="rdo" name="sp_dvrReturn" value="0"  <%= WebUtil.isChecked("0", RsUtil.checkNull(supplyData.get("SP_DVRRETURN")))%> onclick="dvrReChange(this.value)"/>
	            직원방문
	            <input type="radio" class="rdo mgl33" name="sp_dvrReturn"  value="1"  <%= WebUtil.isChecked("1", RsUtil.checkNull(supplyData.get("SP_DVRRETURN")))%> onclick="dvrReChange(this.value)"/>
	            택배수령
	            <input type="text" class="inputTxt" style="width:90px;"  id="sp_dvrRePrice" name="sp_dvrRePrice" value="<%= RsUtil.checkNull(supplyData.get("SP_DVRREPRICE"))%>"  disabled="disabled" />
	            <select style="width:70px;" id="sp_dvrReType" name="sp_dvrReType" disabled="disabled">
	              <option value="0" <%= WebUtil.isSelected("0", RsUtil.checkNull(supplyData.get("SP_DVRRETYPE")))%>>선불</option>
	              <option value="1" <%= WebUtil.isSelected("1", RsUtil.checkNull(supplyData.get("SP_DVRRETYPE")))%>>착불</option>
	            </select>
	            <input type="radio" class="rdo mgl33" name="sp_dvrReturn"  value="2"  <%= WebUtil.isChecked("2", RsUtil.checkNull(supplyData.get("SP_DVRRETURN")))%> onclick="dvrReChange(this.value)"/>
	            당사 직접방문
	            <input type="radio" class="rdo mgl33" name="sp_dvrReturn"  value="3"  <%= WebUtil.isChecked("3", RsUtil.checkNull(supplyData.get("SP_DVRRETURN")))%> onclick="dvrReChange(this.value)"/>
	            기타
	            <input type="text" class="inputTxt" style="width:150px;" id="sp_dvrReturnEtc" name="sp_dvrReturnEtc" value="<%= RsUtil.checkNull(supplyData.get("SP_DVRRETURNETC"))%>" disabled="disabled"/></td>
	        </tr>
	      </tbody>
	    </table>
	    
	    <!-- 버튼 -->
	    <div class="btnarea">
	      <input value="저 장" type="button" class="btn02 mgr10" onclick="updateSP()"/>
	      <input value="취 소" type="button" class="btn01" />
	    </div>
    </form>
    <!-- /버튼 --> 
  </div>
  <!--/contents--> 
<%@ include file="../bottom.jsp" %>
<script>
	$(document).ready(function(){
		var dvrType = $(":input:radio[name='sp_dvrType']:checked").val();
		var dvrStandardType =  $(":input:radio[name='sp_dvrStandard']:checked").val();
		var dvrReType =  $(":input:radio[name='sp_dvrReturn']:checked").val();
		dvrChange(dvrType);
		dvrStandardChange(dvrStandardType);
		dvrReChange(dvrReType);
	})
	//************
	//수정함수-S.D.W
	//************
	function updateSP(){
		var f = document.updateForm;
		f.sp_hp.value = f.hp1.value + f.hp2.value + f.hp3.value;
		f.sp_fax.value = f.fax1.value + f.fax2.value + f.fax3.value;
		f.sp_tel.value = f.tel1.value + f.tel2.value + f.tel3.value;
		if(f.sp_pwd.value != ""){
			f.sp_pwd.value = f.pass.value;
		}
		
		if(f.email2.value != ""){
			f.sp_email.value = f.email1.value + "@" + f.email2.value;	
		}else{
			f.sp_email.value = f.email1.value + "@" + f.email3.value;
		}
		
		var Url = "supplyModifySave.do";
		jQuery.ajax({
            url: Url,
            type:'POST',
            data : $("#updateForm").serialize()
            ,
            success: function(data){
            	if(data.msg == "success"){
            		alert("공급처가 수정 되었습니다.");
            		location.reload();
            	}else{
            		alert("수정하는 과정에서 오류가 발생했습니다.");
            	}
			}
		})
	}
	
	//************
	//아이디체크 함수ㅜ-S.D.W
	//************
	function idChk(){
		var Url = "supplyIdChk.do";
		jQuery.ajax({
            url: Url,
            type:'POST',
            data : {
            	"sp_id" : $("#sp_id").val()
            },
            success: function(data){
            	if(data.msg == "success"){
            		alert("사용가능한 아이디(사업자등록번호) 입니다.");
            	}else{
            		alert("이미 존재하는 아이디(사업자등록번호) 입니다.");
            	}
			}
		})
	}
	
	//************
	//이메일 체인지 함수ㅜ-S.D.W
	//************
	function domainChange(){
		if($("#email3").val() != ""){
			$("#email2").attr("disabled", "disabled");
			$("#email2").val("");
			
		}else{
			$("#email2").removeAttr("disabled");
			$("#email3").val("");
		}
	}
	
	
	//************
	//파일 변경 함수ㅜ-S.D.W
	//************
	function fileChange(name, thisName){
		var columnName = "#" + name;
		
		var options = {
	    	url : 'spFileUpload.do',
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
		jQuery("#updateForm").ajaxForm(options).submit();
	}
	
	//************
	//배송방법 radio 박스-S.D.W
	//************
	function dvrChange(val){
		console.log(123);
		if(val == "1"){
			$("#sp_dvrPrice2").removeAttr("disabled");
			$("#sp_sendType").removeAttr("disabled");
			$("#sp_dvrTypeEtc").attr("disabled", "disabled");
		}else if(val == "3"){
			$("#sp_dvrTypeEtc").removeAttr("disabled");
			$("#sp_dvrPrice2").attr("disabled", "disabled");
			$("#sp_sendType").attr("disabled", "disabled");
		}else{
			$("#sp_dvrTypeEtc").attr("disabled", "disabled");
			$("#sp_dvrPrice2").attr("disabled", "disabled");
			$("#sp_sendType").attr("disabled", "disabled");
		}
	}
	
	//************
	//배송기준 radio 박스-S.D.W
	//************
	function dvrStandardChange(val){
		if(val == "1"){
			$("#sp_dvrPrice").removeAttr("disabled");
		}else{
			$("#sp_dvrPrice").attr("disabled", "disabled");
		}
	}
	
	//************
	//교환반품 radio 박스-S.D.W
	//************
	
	function dvrReChange(val){
		if(val == "1"){
			$("#sp_dvrRePrice").removeAttr("disabled");
			$("#sp_dvrReType").removeAttr("disabled");
			$("#sp_dvrReturnEtc").attr("disabled", "disabled");
		}else if(val == "3"){
			$("#sp_dvrReturnEtc").removeAttr("disabled");
			$("#sp_dvrRePrice").attr("disabled", "disabled");
			$("#sp_dvrReType").attr("disabled", "disabled");
		}else{
			$("#sp_dvrReturnEtc").attr("disabled", "disabled");
			$("#sp_dvrRePrice").attr("disabled", "disabled");
			$("#sp_dvrReType").attr("disabled", "disabled");
		}
	}
	
	
	
</script>