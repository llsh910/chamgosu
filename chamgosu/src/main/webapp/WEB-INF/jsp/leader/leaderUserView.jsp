<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>
<%
	Map<String, Object> userView = (Map<String, Object>)request.getAttribute("userView");
%>
<%= userView %>
<!--contents-->
  <div id="contents">
    <h2>ㆍ구매회원 관리</h2>
    <h3>구매자 회원정보 상세보기</h3>
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
          <td colspan="3"><input type="text" class="inputTxt" name="chkid" id="chkid" style="width:20%;" value="<%= RsUtil.checkNull(userView.get("US_LOGINID"))%>" />
            <input value="중복체크" type="button" name="chkID_btn" id="chkID_btn" class="btns01" /></td>
        </tr>
        <tr>
          <th scope="row" class="bleft">* 회원명</th>
          <td colspan="3"><input type="text" name="name01" id="name01" class="inputTxt" style="width:100px;"  value="<%= RsUtil.checkNull(userView.get("US_NAME"))%>"/> <input value="본인인증" type="button" class="btns01" /></td>
        </tr>
        <tr>
          <th scope="row">* 현재 비밀번호</th>
          <td colspan="3"><input type="password" name="pass" id="pass" class="inputTxt" style="width:150px;"  value="<%= RsUtil.checkNull(userView.get("US_LOGINPASS"))%>"/>
            ※ 신규 등록시 아이디(사업자등록번호)와 동일하게 설정됩니다.</td>
        </tr>
        <tr>
          <th scope="row">변경할 비밀번호</th>
          <td colspan="3"><input type="password" name="newpass" id="newpass" class="inputTxt" style="width:150px;" />
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
          <td colspan="3"><input type="text" id="post1" name="post1" class="inputTxt" style="width:100px;" title="우편번호 입력" value="<%= RsUtil.checkNull(userView.get("US_ZIP"))%>"/>
            <input value="우편번호찾기" type="button" class="btns" />
            <input type="text" class="inputTxt" style="width:210px;" value="<%= RsUtil.checkNull(userView.get("US_ADDR1"))%>"/> <input type="text" id="addrDetail" name="addrDetail" class="inputTxt" style="width:180px;" value="<%= RsUtil.checkNull(userView.get("US_ADDR2"))%>"/></td>
        </tr>
        <tr>
          <th scope="row">* 전화번호</th>
          <td colspan="3"><select style="width:70px;">
              <option value=''>선택</option>
              <option value='02'>02</option>
              <option value='031'>031</option>
              <option value='032'>032</option>
              <option value='033'>033</option>
              <option value='041'>041</option>
              <option value='042'>042</option>
              <option value='043'>043</option>
              <option value='051'>051</option>
              <option value='052'>052</option>
              <option value='053'>053</option>
              <option value='054'>054</option>
              <option value='055'>055</option>
              <option value='061'>061</option>
              <option value='062'>062</option>
              <option value='063'>063</option>
              <option value='064'>064</option>
              <option value='070'>070</option>
              <option value='080'>080</option>
              <option value='0502'>0502</option>
              <option value='0505'>0505</option>
              <option value='0506'>0506</option>
              <option value='0303'>0303</option>
            </select>
            <input type="number" style="ime-mode:disabled; width:70px;" onkeypress="return digit_check(event)" onkeyup="ChkByte(this,4);" class="inputTxt" />
            <input type="number" style="ime-mode:disabled; width:70px;" onkeypress="return digit_check(event)" onkeyup="ChkByte(this,4);" class="inputTxt" /></td>
        </tr>
        <tr>
          <th scope="row">* 휴대폰 번호</th>
          <td colspan="3"><select style="width:70px;">
              <option value=''>선택</option>
              <option value='010'>010</option>
              <option value='011'>011</option>
              <option value='016'>016</option>
              <option value='017'>017</option>
              <option value='018'>018</option>
              <option value='019'>019</option>
            </select>
            <input type="number" style="ime-mode:disabled; width:70px;" onkeypress="return digit_check(event)" onkeyup="ChkByte(this,4);" class="inputTxt" />
            <input type="number" style="ime-mode:disabled; width:70px;" onkeypress="return digit_check(event)" onkeyup="ChkByte(this,4);" class="inputTxt" /></td>
        </tr>
        <tr>
          <th scope="row">* 이메일</th>
          <td colspan="3"><input type="text" name="emailID" id="emailID" class="inputTxt" style="width:100px;" />
            @
            <input type="text" class="inputTxt" name="emailDomain" style="width:100px;" />
            <select style="width:110px;">
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
            </select></td>
        </tr>
        <tr>
          <th scope="row">총 적립금</th>
          <td colspan="3"><input type="number" style="ime-mode:disabled; width:100px;" onkeypress="return digit_check(event)" class="inputTxt" value="<%= RsUtil.checkNull(userView.get("US_LOGINPASS"))%>"/> 원</td>
        </tr>
        <tr>
          <th scope="row">* 이메일 수신동의</th>
          <td colspan="2">메일 수신 회원에게는 매주 이메일 특가상품 등 다양한 이벤트 정보를 드립니다. <br>
이벤트와 쇼핑에 대한 정보를 이메일로 받아보시겠습니까? <br>
<span class="redtxt">(이메일 수신거부와 상관없이 거래 관련 이메일, 회사의 주요정책 관련 공지메일 등은 발송됩니다.)</span>
</td>
		<td class="agr"><input type="radio" class="rdo" name="rdo" /> 예 <input type="radio" class="rdo mgl10" name="rdo" /> 아니오</td>
        </tr>
        <tr>
          <th scope="row">* 문자 수신동의</th>
          <td colspan="2">특가상품, 쿠폰, 이벤트 등에 대한 정보를 모바일 알림(Push)으로 받을 수 있습니다.<br>
<span class="redtxt">(이메일 수신거부와 상관없이 거래 관련 이메일, 회사의 주요정책 관련 공지메일 등은 발송됩니다.)</span>
</td>
		<td class="agr"><input type="radio" class="rdo" name="rdo" /> 예 <input type="radio" class="rdo mgl10" name="rdo" /> 아니오</td>
        </tr>
      </tbody>
    </table>
    
    
    <!-- 버튼 -->
    <div class="btnarea">
      <input value="저 장" type="button" class="btn02 mgr10" />
      <input value="취 소" type="button" class="btn01" />
    </div>
    <!-- /버튼 --> 
  </div>
  <!--/contents--> 
<%@ include file="../bottom.jsp" %>