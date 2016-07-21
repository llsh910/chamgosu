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
          <th scope="row">* 아이디<br>
            (사업자등록번호)</th>
          <td>123-02-12345</td>
          <th scope="row" class="bleft">승인여부</th>
          <td><input name="rdo02" type="radio" class="rdo" checked />
            승인완료
            <input type="radio" class="rdo mgl20" name="rdo" />
          승인대기</td>
        </tr>
        <tr>
          <th scope="row">* 단체명</th>
          <td>천재수학</td>
          <th scope="row" class="bleft">* 대표자명</th>
          <td>최고수
            </td>
        </tr>
        <tr>
          <th scope="row">* 현재 비밀번호</th>
          <td colspan="3">123546ky
            <br>신규 등록시 아이디(사업자등록번호)와 동일하게 설정됩니다.</td>
        </tr>
        <tr>
          <th scope="row">* 전화번호</th>
          <td>010-4565-1234</td>
          <th scope="row" class="bleft">* 휴대폰번호</th>
          <td>010-6354-1234</td>
        </tr>
        <tr>
          <th scope="row">* FAX번호</th>
          <td>055-3654-1234</td>
          <th scope="row">* 이메일</th>
          <td>dgksdg@dfg.com</td>
        </tr>
        <tr>
          <th scope="row">* 주소</th>
          <td colspan="3">서울시 강남구 대치동 은마아파트 1170-502</td>
        </tr>
              <tr>
          <th scope="row">* 단체소개</th>
          <td colspan="3">윈도우 10 무료 업그레이드 기간이 7월 29일까지로 마감됩니다. 그 이후 부터는 이전 버전의 윈도우 사용자는 무료가 아닌, 일정 금액(119달러, 약 13만원)을 지불하고 윈도우10으로 업그레이드해야 합니다. 아직 업그레이드를 하지 않은 분들은 서둘러야 합니다. 윈도우 10이 최종적인 운영체제이며, 지속적으로 공개될 업데이트와 신기능을 무료로 사용할 수 있습니다. </td>
        </tr>
        <tr>
          <th scope="row">* 지급계좌정보<br>
            (본인실명인증계좌)</th>
          <td colspan="3">하나은행 123-0712-25916 이승민</td>
        </tr>
        <tr>
          <th scope="row">* 주민등록번호<br>
            또는 사업자등록번호</th>
          <td colspan="3">871230-1264267</td>
        </tr>
        <tr>
          <th scope="row">총 수수료</th>
          <td>1,000,000원</td>
          <th scope="row" class="bleft">총 적립금</th>
          <td>1,000,000원</td>
        </tr>
        <tr>
          <th scope="row">* 증빙서류</th>
          <td colspan="3"><a href="#">사업자등록증.pdf</a><br><a href="#">우리네 통장사본.pdf</a><br><a href="#">로고이미지.pdf</a></td>
        </tr>
        <tr>
          <th scope="row">* 이메일 수신동의</th>
          <td colspan="2">메일 수신 회원에게는 매주 이메일 특가상품 등 다양한 이벤트 정보를 드립니다. <br>
            이벤트와 쇼핑에 대한 정보를 이메일로 받아보시겠습니까? <br>
            <span class="redtxt">(이메일 수신거부와 상관없이 거래 관련 이메일, 회사의 주요정책 관련 공지메일 등은 발송됩니다.)</span></td>
          <td class="agr"><input type="radio" class="rdo" name="rdo01" checked />
            예
            <input type="radio" class="rdo mgl10" name="rdo" />
            아니오</td>
        </tr>
        <tr>
          <th scope="row">* 문자 수신동의</th>
          <td colspan="2">특가상품, 쿠폰, 이벤트 등에 대한 정보를 모바일 알림(Push)으로 받을 수 있습니다.<br>
            <span class="redtxt">(이메일 수신거부와 상관없이 거래 관련 이메일, 회사의 주요정책 관련 공지메일 등은 발송됩니다.)</span></td>
          <td class="agr"><input type="radio" class="rdo" name="rdo" checked />
            예
            <input type="radio" class="rdo mgl10" name="rdo" />
            아니오</td>
        </tr>
      </tbody>
    </table>
    
  </div>
  <!--/contents--> 
  <%@ include file="../popup_bottom.jsp" %>
  