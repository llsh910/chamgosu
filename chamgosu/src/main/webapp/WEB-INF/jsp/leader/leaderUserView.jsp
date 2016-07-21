<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>
<%
	Map<String, Object> userView = (Map<String, Object>)request.getAttribute("userView");

	String tel1 = RsUtil.checkNull(userView.get("US_TELNO1"));
	String phone1 = RsUtil.checkNull(userView.get("US_TELNO2"));
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
	
	String email1 = RsUtil.checkNull(userView.get("US_EMAIL"));
	
	String [] email = new String[2];
	
	if(email1.indexOf("@") > -1){
		email = email1.split("@");		
	}else{
		email[0] = "";
		email[1] = "";
	}
%>
<!--contents-->
  <div id="contents">
    <h2>ㆍ구매회원 관리</h2>
    <h3>구매자 회원정보 상세보기</h3>
    <form id="updateForm" name="updateForm">
    <input type="hidden" id="us_userid" name="us_userid" value="<%= RsUtil.checkNull(userView.get("US_USERID"))%>" />
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
          <td colspan="3"><input type="text" class="inputTxt" name="us_loginid" id="us_loginid" style="width:20%;" value="<%= RsUtil.checkNull(userView.get("US_LOGINID"))%>" />
            <input value="중복체크" type="button" name="chkID_btn" id="chkID_btn" class="btns01" /></td>
        </tr>
        <tr>
          <th scope="row" class="bleft">* 회원명</th>
          <td colspan="3"><input type="text" name="us_name" id="us_name" class="inputTxt" style="width:100px;"  value="<%= RsUtil.checkNull(userView.get("US_NAME"))%>"/> <input value="본인인증" type="button" class="btns01" /></td>
        </tr>
        <tr>
          <th scope="row">* 현재 비밀번호</th>
          <td colspan="3"><input type="password" name="pass" id="pass" class="inputTxt" style="width:150px;"  value="<%= RsUtil.checkNull(userView.get("US_LOGINPASS"))%>"/>
            ※ 신규 등록시 아이디(사업자등록번호)와 동일하게 설정됩니다.</td>
        </tr>
        <tr>
          <th scope="row">변경할 비밀번호</th>
          <td colspan="3"><input type="password" name=us_loginpass id="us_loginpass" class="inputTxt" style="width:150px;" />
            <span><br>
            - 반드시 8~20자의 영문, 숫자, 특수문자 중 2가지 이상으로 조합해야 합니다. <br>
            - 동일한 문자열을 연속 배치할 수 없습니다. 예) aaa, 111 <br>
            - 아이디와 4자리 이상 동일한 문자열을 사용할 수 없습니다.</span></td>
        </tr>
        <tr>
          <th scope="row" class="bleft">비밀번호 재입력</th>
          <td colspan="3"><input type="password" name="rePass" id="rePass" class="inputTxt" style="width:150px;" /></td>
        </tr>
        <tr>
          <th scope="row">* 주소</th>
          <td colspan="3"><input type="text" id="us_zip" name="us_zip" class="inputTxt" style="width:100px;" title="우편번호 입력" value="<%= RsUtil.checkNull(userView.get("US_ZIP"))%>"/>
            <input value="우편번호찾기" type="button" class="btns" />
            <input type="text" class="inputTxt" style="width:210px;" id="us_addr1" name="us_addr1" value="<%= RsUtil.checkNull(userView.get("US_ADDR1"))%>"/> <input type="text" id="us_addr2" name="us_addr2" class="inputTxt" style="width:180px;" id="us_addr2" name="us_addr2" value="<%= RsUtil.checkNull(userView.get("US_ADDR2"))%>"/></td>
        </tr>
        <tr>
          <th scope="row">* 전화번호</th>
          <td colspan="3"><select style="width:70px;" id="tel1" name="tel1">
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
            <input type="number"  id="tel2" name="tel2" style="ime-mode:disabled; width:70px;" onkeypress="return digit_check(event)" onkeyup="ChkByte(this,4);" class="inputTxt"  value="<%= RsUtil.checkNull(tel[1])%>"/>
            <input type="number"  id="tel3" name="tel3" style="ime-mode:disabled; width:70px;" onkeypress="return digit_check(event)" onkeyup="ChkByte(this,4);" class="inputTxt"  value="<%= RsUtil.checkNull(tel[2])%>"/>
            <input type="hidden" id="us_telno1" name="us_telno1" value="<%= RsUtil.checkNull(userView.get("US_TELNO1"))%>" />
            </td>
            
        </tr>
        <tr>
          <th scope="row">* 휴대폰 번호</th>
          <td colspan="3"><select style="width:70px;"  id="hp1" name="hp1">
              <option value='' <%= WebUtil.isSelected("", RsUtil.checkNull(phone[0]))%>>선택</option>
              <option value='010' <%= WebUtil.isSelected("010", RsUtil.checkNull(phone[0]))%>>010</option>
              <option value='011' <%= WebUtil.isSelected("011", RsUtil.checkNull(phone[0]))%>>011</option>
              <option value='016' <%= WebUtil.isSelected("016", RsUtil.checkNull(phone[0]))%>>016</option>
              <option value='017' <%= WebUtil.isSelected("017", RsUtil.checkNull(phone[0]))%>>017</option>
              <option value='018' <%= WebUtil.isSelected("018", RsUtil.checkNull(phone[0]))%>>018</option>
              <option value='019' <%= WebUtil.isSelected("019", RsUtil.checkNull(phone[0]))%>>019</option>
            </select>
            <input type="number" id="hp2" name="hp2" style="ime-mode:disabled; width:70px;" onkeypress="return digit_check(event)" onkeyup="ChkByte(this,4);" class="inputTxt"  value="<%= RsUtil.checkNull(phone[1])%>"/>
            <input type="number" id="hp3" name="hp3" style="ime-mode:disabled; width:70px;" onkeypress="return digit_check(event)" onkeyup="ChkByte(this,4);" class="inputTxt"  value="<%= RsUtil.checkNull(phone[2])%>"/>
            <input type="hidden" id="us_telno2" name="us_telno2" value="<%= RsUtil.checkNull(userView.get("US_TELNO2"))%>" />
            </td>
        </tr>
        <tr>
          <th scope="row">* 이메일</th>
          <td colspan="3"><input type="text" id="email1" name="email1" class="inputTxt" style="width:100px;" value="<%= email[0]%>" />
            @
            <input type="text" class="inputTxt" id="email2" name="email2" style="width:100px;" value="<%=email[1]%>"/>
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
            <input type="hidden" id="us_email" name="us_email" value="<%= RsUtil.checkNull(userView.get("US_EMAIL"))%>" />
           </td>
        </tr>
        <tr>
          <th scope="row">총 적립금</th>
          <td colspan="3"><input type="number" id="us_inpoint" name="us_inpoint" style="ime-mode:disabled; width:100px;" onkeypress="return digit_check(event)" class="inputTxt" value="<%= RsUtil.checkNull(userView.get("US_INPOINT"))%>"/> 원</td>
        </tr>
        <tr>
          <th scope="row">* 이메일 수신동의</th>
          <td colspan="2">메일 수신 회원에게는 매주 이메일 특가상품 등 다양한 이벤트 정보를 드립니다. <br>
이벤트와 쇼핑에 대한 정보를 이메일로 받아보시겠습니까? <br>
<span class="redtxt">(이메일 수신거부와 상관없이 거래 관련 이메일, 회사의 주요정책 관련 공지메일 등은 발송됩니다.)</span>
</td>
		<td class="agr"><input type="radio" class="rdo" name="us_emailchk" value="Y" <%= WebUtil.isChecked("Y", RsUtil.checkNull(userView.get("US_EMAILCHK")))%>/> 예 <input type="radio" class="rdo mgl10" name="us_emailchk" value="N" <%= WebUtil.isChecked("N", RsUtil.checkNull(userView.get("US_EMAILCHK")))%>/> 아니오</td>
        </tr>
        <tr>
          <th scope="row">* 문자 수신동의</th>
          <td colspan="2">특가상품, 쿠폰, 이벤트 등에 대한 정보를 모바일 알림(Push)으로 받을 수 있습니다.<br>
<span class="redtxt">(이메일 수신거부와 상관없이 거래 관련 이메일, 회사의 주요정책 관련 공지메일 등은 발송됩니다.)</span>
</td>
		<td class="agr"><input type="radio" class="rdo" name="us_sms" value="Y" <%= WebUtil.isChecked("Y", RsUtil.checkNull(userView.get("US_SMS")))%>/> 예 <input type="radio" class="rdo mgl10" name="us_sms" value="N" <%= WebUtil.isChecked("N", RsUtil.checkNull(userView.get("US_SMS")))%>/> 아니오</td>
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
	//************
	//수정함수-S.D.W
	//************
	function updateSP(){
		var f = document.updateForm;
		f.us_telno2.value = f.hp1.value + f.hp2.value + f.hp3.value;
		f.us_telno1.value = f.tel1.value + f.tel2.value + f.tel3.value;
		if(f.us_loginpass.value == ""){
			f.us_loginpass.value = f.pass.value;
		}
		console.log(f.email2.value);
		if(f.email2.value != ""){
			f.us_email.value = f.email1.value + "@" + f.email2.value;	
		}else{
			f.us_email.value = f.email1.value + "@" + f.email3.value;
		}
		
		var Url = "leaderUserModifyData.do";
		jQuery.ajax({
            url: Url,
            type:'POST',
            data : $("#updateForm").serialize()
            ,
            success: function(data){
            	if(data.msg == "success"){
            		alert("구매자가 수정 되었습니다.");
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
	/* function idChk(){
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
	} */
	
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
	
	
	
</script>