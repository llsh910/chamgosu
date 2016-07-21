<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.util.Date, java.text.*, java.io.*, java.net.*, project.config.util.*"%>
<%@ include file="../popup_top.jsp" %>
<%
	Map<String, Object> leaderViewData = (Map<String, Object>)request.getAttribute("leaderViewData");
%>
<!--contents-->
  <div id="popcon">
    <h3>리더 정보 상세보기</h3>
    <!--리더 상세보기-->
    <table class="bbs_write01">
      <caption>
      리더 정보
      </caption>
      <colgroup>
      <col width="150" />
      <col width="250" />
      <col width="150" />
      <col width="*" />
      </colgroup>
      <tbody>
        <tr>
          <th scope="row">* 아이디<br></th>
          <td><%= RsUtil.checkNull(leaderViewData.get("LD_ID"))%></td>
          <th scope="row" class="bleft">승인여부</th>
          <td><input name="ld_comgubn" type="radio" class="rdo" <%= WebUtil.isChecked("1", RsUtil.checkNull(leaderViewData.get("LD_COMGUBN")))%>  disabled="disabled"/>
            승인완료
            <input type="radio" class="rdo mgl20" name="ld_comgubn" <%= WebUtil.isChecked("0", RsUtil.checkNull(leaderViewData.get("LD_COMGUBN")))%>  disabled="disabled"/>
          승인대기</td>
        </tr>
        <tr>
          <th scope="row">* 단체명</th>
          <td><%= RsUtil.checkNull(leaderViewData.get("LD_GROUPNM"))%></td>
          <th scope="row" class="bleft">* 대표자명</th>
          <td><%= RsUtil.checkNull(leaderViewData.get("LD_NAME"))%>
            </td>
        </tr>
        <tr>
          <th scope="row">* 현재 비밀번호</th>
          <td colspan="3"><%= RsUtil.checkNull(leaderViewData.get("LD_PWD"))%></td>
        </tr>
        <tr>
          <th scope="row">* 전화번호</th>
          <td><%= WebUtil.tel(RsUtil.checkNull(leaderViewData.get("LD_TEL")))%></td>
          <th scope="row" class="bleft">* 휴대폰번호</th>
          <td><%= WebUtil.tel(RsUtil.checkNull(leaderViewData.get("LD_HP")))%></td>
        </tr>
        <tr>
          <th scope="row">* FAX번호</th>
          <td><%= WebUtil.tel(RsUtil.checkNull(leaderViewData.get("LD_FAX")))%></td>
          <th scope="row">* 이메일</th>
          <td><%= RsUtil.checkNull(leaderViewData.get("LD_EMAIL"))%></td>
        </tr>
        <tr>
          <th scope="row">* 주소</th>
          <td colspan="3">(<%= RsUtil.checkNull(leaderViewData.get("LD_POST"))%>)<%= RsUtil.checkNull(leaderViewData.get("LD_ADDRESS")) + " " + RsUtil.checkNull(leaderViewData.get("LD_ADDRESSDETAIL"))%></td>
        </tr>
              <tr>
          <th scope="row">* 단체소개</th>
          <td colspan="3"><%= RsUtil.checkNull(leaderViewData.get("LD_GROUPINFO"))%></td>
        </tr>
        <tr>
          <th scope="row">* 지급계좌정보<br>
            (본인실명인증계좌)</th>
          <td colspan="3"><%= RsUtil.checkNull(leaderViewData.get("LD_BANKNM"))%> <%= RsUtil.checkNull(leaderViewData.get("LD_BANKNUM"))%> <%= RsUtil.checkNull(leaderViewData.get("LD_BANKMEMNM"))%></td>
        </tr>
        <tr>
          <th scope="row">* 사업자등록번호<br>
          </th>
          <td><%= RsUtil.checkNull(leaderViewData.get("LD_COMPNUM"))%></td>
          <th>* 주민등록번호</th>
          <td><%= RsUtil.checkNull(leaderViewData.get("LD_JUMIN"))%></td>
        </tr>
        <tr>
          <th scope="row">총 수수료</th>
          <td>1,000,000원</td>
          <th scope="row" class="bleft">총 적립금</th>
          <td>1,000,000원</td>
        </tr>
        <tr>
          <th scope="row">* 증빙서류</th>
          <td colspan="3">
          	<%if(!RsUtil.checkNull(leaderViewData.get("LD_COMPNUMIMG")).equals("")) {%>
          	<a href="<%=realPath%>/fileDown.do?filename=<%= RsUtil.checkNull(leaderViewData.get("LD_COMPNUMIMG"))%>">사업자등록증 이미지 다운로드</a><br>
          	<%}else{%>
          	사업자등록증 이미지가 없습니다.<br />
          	<%}
          	if(!RsUtil.checkNull(leaderViewData.get("LD_BANKBOOKIMG")).equals("")) {
          	%>
          	<a href="<%=realPath%>/fileDown.do?filename=<%= RsUtil.checkNull(leaderViewData.get("LD_BANKBOOKIMG"))%>">통장사본 이미지 다운로드</a><br>
          	<%}else{%>
          	통장사본 이미지가 없습니다.<br />
          	<%
          	}
          	if(!RsUtil.checkNull(leaderViewData.get("LD_LOGOIMG")).equals("")) {
          	%>
          	<a href="<%=realPath%>/fileDown.do?filename=<%= RsUtil.checkNull(leaderViewData.get("LD_LOGOIMG"))%>">로고이미지 다운로드</a>
          	<%}else{ %>
          	로고이미지가 없습니다.
          	<%} %>
          	</td>
        </tr>
        <tr>
          <th scope="row">* 이메일 수신동의</th>
          <td colspan="2">메일 수신 회원에게는 매주 이메일 특가상품 등 다양한 이벤트 정보를 드립니다. <br>
            이벤트와 쇼핑에 대한 정보를 이메일로 받아보시겠습니까? <br>
            <span class="redtxt">(이메일 수신거부와 상관없이 거래 관련 이메일, 회사의 주요정책 관련 공지메일 등은 발송됩니다.)</span></td>
          <td class="agr"><input type="radio" class="rdo" name="rdo01" <%= WebUtil.isChecked("Y", RsUtil.checkNull(leaderViewData.get("LD_EMAILSENDCHK")))%> disabled="disabled" />
            예
            <input type="radio" class="rdo mgl10" name="rdo01" <%= WebUtil.isChecked("N", RsUtil.checkNull(leaderViewData.get("LD_EMAILSENDCHK")))%> disabled="disabled"/>
            아니오</td>
        </tr>
        <tr>
          <th scope="row">* 문자 수신동의</th>
          <td colspan="2">특가상품, 쿠폰, 이벤트 등에 대한 정보를 모바일 알림(Push)으로 받을 수 있습니다.<br>
            <span class="redtxt">(이메일 수신거부와 상관없이 거래 관련 이메일, 회사의 주요정책 관련 공지메일 등은 발송됩니다.)</span></td>
          <td class="agr"><input type="radio" class="rdo" name="rdo" <%= WebUtil.isChecked("Y", RsUtil.checkNull(leaderViewData.get("LD_SNSCHK")))%>  disabled="disabled"/>
            예
            <input type="radio" class="rdo mgl10" name="rdo" <%= WebUtil.isChecked("N", RsUtil.checkNull(leaderViewData.get("LD_SNSCHK")))%> disabled="disabled"/>
            아니오</td>
        </tr>
      </tbody>
    </table>
    
  </div>
  <!--/contents--> 
  <%@ include file="../popup_bottom.jsp" %>
  