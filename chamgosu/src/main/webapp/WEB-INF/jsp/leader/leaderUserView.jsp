<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../popup_top.jsp" %>
<%
	Map<String, Object> userView = (Map<String, Object>)request.getAttribute("userView");
%>
<!--contents-->
  <div id="popcon">
  <h3>구매자 회원정보 상세보기</h3>
    <!--리더 상세보기-->
    <table class="bbs_write01">
      <caption>
      구매자 회원정보 상세보기
      </caption>
      <colgroup>
      <col width="150" />
      <col width="250" />
      <col width="150" />
      <col width="*" />
      </colgroup>
      <tbody>
      	<tr>
          <th scope="row">* 아이디</th>
          <td colspan="3"><%= RsUtil.checkNull(userView.get("US_LOGINID"))%></td>
        </tr>
        <tr>
        <th scope="row" class="bleft">* 이름</th>
          <td><%= RsUtil.checkNull(userView.get("US_NAME"))%></td>
          <th scope="row" class="bleft">이메일</th>
          <td><%= RsUtil.checkNull(userView.get("US_EMAIL"))%></td>
        </tr>
        <tr>
          <th scope="row">* 현재 비밀번호</th>
          <td colspan="3"><%= RsUtil.checkNull(userView.get("US_LOGINPASS"))%></td>
        </tr>
        <tr>
          <th scope="row">* 전화번호</th>
          <td><%= WebUtil.tel(RsUtil.checkNull(userView.get("US_TELNO1")))%></td>
          <th scope="row" class="bleft">* 휴대폰번호</th>
          <td><%= WebUtil.tel(RsUtil.checkNull(userView.get("US_TELNO2")))%></td>
        </tr>
        <tr>
          <th scope="row">* 주소</th>
          <td colspan="3">(<%= RsUtil.checkNull(userView.get("US_ZIP"))%>)<%= RsUtil.checkNull(userView.get("US_ADDR1")) + " " + RsUtil.checkNull(userView.get("US_ADDR2"))%></td>
        </tr>
        <tr>
          <th scope="row" class="bleft">총 적립금</th>
          <td colspan="3"><%= MultiUtil.comma(RsUtil.checkNull(userView.get("US_INPOINT")))%>원</td>
        </tr>
        <tr>
          <th scope="row">* 이메일 수신동의</th>
          <td colspan="2">메일 수신 회원에게는 매주 이메일 특가상품 등 다양한 이벤트 정보를 드립니다. <br>
            이벤트와 쇼핑에 대한 정보를 이메일로 받아보시겠습니까? <br>
            <span class="redtxt">(이메일 수신거부와 상관없이 거래 관련 이메일, 회사의 주요정책 관련 공지메일 등은 발송됩니다.)</span></td>
          <td class="agr"><input type="radio" class="rdo" name="rdo01" <%= WebUtil.isChecked("Y", RsUtil.checkNull(userView.get("US_EMAILCHK")))%> disabled="disabled" />
            예
            <input type="radio" class="rdo mgl10" name="rdo01" <%= WebUtil.isChecked("N", RsUtil.checkNull(userView.get("US_EMAILCHK")))%> disabled="disabled"/>
            아니오</td>
        </tr>
        <tr>
          <th scope="row">* 문자 수신동의</th>
          <td colspan="2">특가상품, 쿠폰, 이벤트 등에 대한 정보를 모바일 알림(Push)으로 받을 수 있습니다.<br>
            <span class="redtxt">(이메일 수신거부와 상관없이 거래 관련 이메일, 회사의 주요정책 관련 공지메일 등은 발송됩니다.)</span></td>
          <td class="agr"><input type="radio" class="rdo" name="rdo"  <%= WebUtil.isChecked("N", RsUtil.checkNull(userView.get("US_SMS")))%> disabled="disabled"/>
            예
            <input type="radio" class="rdo mgl10" name="rdo" <%= WebUtil.isChecked("N", RsUtil.checkNull(userView.get("US_SMS")))%> disabled="disabled"/>
            아니오</td>
        </tr>
      </tbody>
    </table>
    
  </div>
  <!--/contents--> 
<%@ include file="../popup_bottom.jsp" %>