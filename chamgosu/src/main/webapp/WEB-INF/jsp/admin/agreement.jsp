<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>
<%
	
%>

 <!--contents-->
  <div id="contents">
    <h2>ㆍ이용약관 관리</h2>
    <table class="bbs_write01">
      <caption>약관관리</caption>
      <tbody>
        <tr>
          <td><select style="width:500px; height:29px" title="약관종류">
              <option>약관을 선택하세요</option>
              <option>참고수 이용약관 동의(필수)</option>
              <option>위탁영업 이용약관 동의(필수)</option>
              <option>전자금융거래 이용약관 동의(필수)</option>
              <option>개인정보 수집 및 이용 동의(필수)</option>
              <option>세금납부 관련 유의사항 확인(필수)</option>
              <option>개인정보의 제3자제공 동의(선택)</option>
              <option>개인정보의 취급 위탁 동의(선택)</option>
              <option>위치정보 이용약관 동의(선택)</option>
            </select> <input value="약관 수정하기" type="button" class="btnm" /></td>
        </tr>
        <tr>
          <td colspan="3">
          <!--에디터-->
          <textarea rows="25" class="inputTxt" style="width:98%;"></textarea>
          <!--/에디터-->
          </td>
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