<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>
<%

	Map<String, Object> supplyData = (Map<String, Object>)request.getAttribute("supplyData");
%>
	<!--contents-->
  <div id="contents">
    <h2>ㆍ상품공급자 관리</h2>
    <h3>상품공급자 상세보기</h3>
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
          <td><input type="text" class="inputTxt" name="chkid" id="chkid" style="width:40%;" value="<%= RsUtil.checkNull(supplyData.get("SP_ID"))%>"/>
            <input value="중복체크" type="button" name="chkID_btn" id="chkID_btn" class="btns01" />
            <br>
            ※ '-'없이 입력하세요. 사업자등록번호로 ID가 부여됩니다.</td>
          <th scope="row" class="bleft">이용등급</th>
          <td><select style="width:150px;">
              <option value="">선택하세요</option>
              <option value="1" <%= WebUtil.isSelected("1", RsUtil.checkNull(supplyData.get("SP_USERATING")))%>>유료업체</option>
              <option value="0" <%= WebUtil.isSelected("0", RsUtil.checkNull(supplyData.get("SP_USERATING")))%>>무료업체</option>
              <option value="2" <%= WebUtil.isSelected("2", RsUtil.checkNull(supplyData.get("SP_USERATING")))%>>승인대기</option>
            </select></td>
        </tr>
        <tr>
          <th scope="row">* 업체명</th>
          <td><input type="text" name="name" id="name" class="inputTxt" style="width:60%;" value="<%= RsUtil.checkNull(supplyData.get("SP_BUSINM"))%>" /></td>
          <th scope="row" class="bleft">* 대표자명</th>
          <td><input type="text" name="name01" id="name01" class="inputTxt" style="width:60%;" value="<%= RsUtil.checkNull(supplyData.get("SP_NAME"))%>"/></td>
        </tr>
        <tr>
          <th scope="row">* 현재 비밀번호</th>
          <td colspan="3"><input type="password" name="pass" id="pass" class="inputTxt" style="width:150px;" value="<%= RsUtil.checkNull(supplyData.get("SP_PWD"))%>"/>
            ※ 신규 등록시 아이디(사업자등록번호)와 동일하게 설정됩니다.</td>
        </tr>
        <tr>
          <th scope="row">변경할 비밀번호</th>
          <td><input type="password" name="newpass" id="newpass" class="inputTxt" style="width:150px;" />
            <span><br>
            - 반드시 8~20자의 영문, 숫자, 특수문자 중 2가지 이상으로 조합해야 합니다. <br>
            - 동일한 문자열을 연속 배치할 수 없습니다. 예) aaa, 111 <br>
            - 아이디와 4자리 이상 동일한 문자열을 사용할 수 없습니다.</span></td>
          <th scope="row" class="bleft">비밀번호 재입력</th>
          <td><input type="password" name="rePass" id="rePass" class="inputTxt" style="width:150px;" /></td>
        </tr>
        <tr>
          <th scope="row">* 주소</th>
          <td colspan="3"><input type="text" id="post1" name="post1" class="inputTxt" style="width:100px;" title="우편번호 입력"  value="<%= RsUtil.checkNull(supplyData.get("SP_POST"))%>"/>
            <input value="우편번호찾기" type="button" class="btns" />
            <input type="text" id="addrDetail" name="addrDetail" class="inputTxt" style="width:400px;"  value=""/></td>
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
            <input type="number" style="ime-mode:disabled; width:70px;" onkeypress="return digit_check(event)" onkeyup="ChkByte(this,3);" class="inputTxt" />
            <input type="number" style="ime-mode:disabled; width:70px;" onkeypress="return digit_check(event)" onkeyup="ChkByte(this,4);" class="inputTxt" /></td>
        </tr>
        <tr>
          <th scope="row">FAX 번호</th>
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
          <th scope="row">* 이메일(계산서발급률)</th>
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
          <th scope="row">* 취급품목 및 회사소개</th>
          <td colspan="3"><textarea rows="3" class="inputTxt" style="width:80%;"><%= RsUtil.checkNull(supplyData.get("SP_COMPINTRO"))%></textarea>
            200자 내외</td>
        </tr>
        <tr>
          <th scope="row">* 계좌번호</th>
          <td colspan="3">은행
            <input type="text" class="inputTxt mgr15" style="width:70px;" value="<%= RsUtil.checkNull(supplyData.get("SP_BANKNM"))%>"/>
            계좌
            <input type="number" style="ime-mode:disabled; width:200px;" onkeypress="return digit_check(event)" class="inputTxt mgr15" value="<%= RsUtil.checkNull(supplyData.get("SP_BANKNUM"))%>" />
            예금주
            <input type="text" class="inputTxt" style="width:90px;" /></td>
        </tr>
        <tr>
          <th scope="row">* 기본공급률</th>
          <td colspan="3"><input type="text" name="reserve" onkeyup="lfn_keychk(this)"  style="ime-mode:disabled; width:35px;" class="inputTxt" value="<%= RsUtil.checkNull(supplyData.get("SP_ORGRATE"))%>"/>
            % <span>(상품 등록시 자동적으로 적용되는 당사에 대한 공급율이며 추후 상품별 또는 전체 수정이 가능합니다.)</span></td>
        </tr>
        <tr>
          <th scope="row">* 증빙서류</th>
          <td colspan="3"><input type="text" class="file_input_textbox" id="fileName" style="width:300px" value="사업자등록증 사본" readonly >
            <div class="file_input_div mgr15" style="width:80px"> <img src="../img/open.gif" class="file_input_img_btn" alt="open" />
              <input type="file" name="file_1" class="file_input_hidden" onchange="javascript: document.getElementById('fileName').value = this.value"/>
            </div>
            <input type="text" class="file_input01_textbox" id="fileName01" style="width:300px" value="통장사본" readonly >
            <div class="file_input01_div mgr15" style="width:80px"> <img src="../img/open.gif" class="file_input01_img_btn" alt="open" />
              <input type="file" name="file_2" class="file_input01_hidden" onchange="javascript: document.getElementById('fileName01').value = this.value"/>
            </div>
            <input type="text" class="file_input02_textbox" id="fileName02" style="width:300px" value="회사로고" readonly >
            <div class="file_input02_div mgr15" style="width:80px"> <img src="../img/open.gif" class="file_input02_img_btn" alt="open" />
              <input type="file" name="file_3" class="file_input02_hidden" onchange="javascript: document.getElementById('fileName02').value = this.value"/>
            </div></td>
        </tr>
        <tr>
          <th scope="row">배송정책</th>
          <td colspan="3"><div class="delivery"><strong>배송방법 : </strong>
              <input type="radio" class="rdo mgl10" name="change01" value="0"/>
              직원방문
              <input type="radio" class="rdo mgl20" name="change01" value="1"/>
              택배수령
              <input type="text" class="inputTxt" style="width:90px;" value="2" />
              <select style="width:70px;">
                <option>선불</option>
                <option>착불</option>
              </select>
              <input type="radio" class="rdo mgl20" name="change01" value="2"/>
              방문수령
              <input type="radio" class="rdo mgl20" name="change01" value="3"/>
              기타
              <input type="text" class="inputTxt" style="width:120px;" value="<%= RsUtil.checkNull(supplyData.get("SP_DVRTYPEETC"))%>"/>
            </div>
            <strong>배송기준 : </strong>
            <input type="radio" class="rdo mgl10" name="change02"  value="0"/>
            무료배송
            <input type="radio" class="rdo mgl20" name="change02"  value="1"/>
            <input type="number" style="ime-mode:disabled; width:90px;" onkeypress="return digit_check(event)" class="inputTxt"  value="<%= RsUtil.checkNull(supplyData.get("SP_DVRPRICE"))%>"/>
            원 이상 무료배송
            <input type="radio" class="rdo mgl20" name="change02"  value="2"/>
            착불 </td>
        </tr>
        <tr>
          <th scope="row">교환 및 반품정책</th>
          <td colspan="3"><input type="radio" class="rdo" name="change" value="0"/>
            직원방문
            <input type="radio" class="rdo mgl33" name="change"  value="1"/>
            택배수령
            <input type="text" class="inputTxt" style="width:90px;"  value="<%= RsUtil.checkNull(supplyData.get("SP_DVRREPRICE"))%>"/>
            <select style="width:70px;">
              <option>선불</option>
              <option>착불</option>
            </select>
            <input type="radio" class="rdo mgl33" name="change"  value="3"/>
            당사 직접방문
            <input type="radio" class="rdo mgl33" name="change"  value="4"/>
            기타
            <input type="text" class="inputTxt" style="width:150px;" /></td>
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