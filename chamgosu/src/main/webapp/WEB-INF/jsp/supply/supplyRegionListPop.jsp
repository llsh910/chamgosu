<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.util.Date, java.text.*, java.io.*, java.net.*, project.config.util.*"%>
<%@ include file="../popup_top.jsp" %>
<%
	//출판지역관리 팝업페이지
	List<Map<String, Object>> supplyRegionList = (List<Map<String, Object>>)request.getAttribute("supplyRegionList");
	
	/* Map<String, Object> pageInfo = (Map<String, Object>)request.getAttribute("pageInfo");
	String page_index = RsUtil.checkNull(pageInfo.get("page_index"));
	String totalCount = RsUtil.checkNull(pageInfo.get("totalCount"));
	String per_page = RsUtil.checkNull(pageInfo.get("per_page"));
	if(page_index.equals("")) page_index = "1"; */
%>

 <!--contents-->
  <div id="popcon">
    <!--업체 개별 리스트-->
    <h4>업체명 : 아이러브스터디 (111-12-50135)  <select style="width:80px;">
          <option>승인</option>
          <option>미승인</option>
          <option>승인대기</option>
        </select>
      <p>
        <select style="width:90px;">
          <option>10개씩 보기</option>
          <option>20개씩 보기</option>
          <option>50개씩 보기</option>
          <option>100개씩 보기</option>
        </select>
      </p>
    </h4>
    <table class="bbs_list01">
      <caption>
      업체 개별 리스트
      </caption>
      <colgroup>
      <col width="30" />
      <col width="30" />
      <col width="*" />
      <col width="100" />
      <col width="110" />
      <col width="90" />
      <col width="90" />
      <col width="60" />
      <col width="60" />
      <col width="100" />
      </colgroup>
      <tbody>
      <thead>
        <tr>
          <th scope="col"><input type="checkbox" class="chk" id="checkall01" /></th>
          <th scope="col">번호</th>
          <th scope="col">출판사</th>
          <th scope="col">영업지역(시도)</th>
          <th scope="col">영업지역(시구군)</th>
          <th scope="col">요청일자</th>
          <th scope="col">처리일자</th>
          <th scope="col"><input type="checkbox" class="chk" id="checkall02" />승인</th>
          <th scope="col"><input type="checkbox" class="chk" id="checkall03" />미승인</th>
          <th scope="col">개별선택메뉴</th>
        </tr>
      </thead>
      <tr>
        <td><input type="checkbox" class="chk" name="chk01" /></td>
        <td>1</td>
        <td>천재교육(교판)</td>
        <td>경기도</td>
        <td>광명시</td>
        <td>2016.07.30</td>
        <td>2016.07.30</td>
        <td><input type="checkbox" class="chk" name="chk02" /></td>
        <td><input type="checkbox" class="chk" name="chk03" /></td>
        <td><input value="저장" type="button" class="btns01" />
              <input value="삭제" type="button" class="btns" /></td>
      </tr>
      <tr>
        <td><input type="checkbox" class="chk" name="chk01" /></td>
        <td>1</td>
        <td>천재교육(교판)</td>
        <td>경기도</td>
        <td>광명시</td>
        <td>2016.07.30</td>
        <td>2016.07.30</td>
        <td><input type="checkbox" class="chk" name="chk02" /></td>
        <td><input type="checkbox" class="chk" name="chk03" /></td>
        <td><input value="저장" type="button" class="btns01" />
              <input value="삭제" type="button" class="btns" /></td>
      </tr>
      <tr>
        <td><input type="checkbox" class="chk" name="chk01" /></td>
        <td>1</td>
        <td>천재교육(교판)</td>
        <td>경기도</td>
        <td>광명시</td>
        <td>2016.07.30</td>
        <td>2016.07.30</td>
        <td><input type="checkbox" class="chk" name="chk02" /></td>
        <td><input type="checkbox" class="chk" name="chk03" /></td>
        <td><input value="저장" type="button" class="btns01" />
              <input value="삭제" type="button" class="btns" /></td>
      </tr>
      <tr>
        <td><input type="checkbox" class="chk" name="chk01" /></td>
        <td>1</td>
        <td>천재교육(교판)</td>
        <td>경기도</td>
        <td>광명시</td>
        <td>2016.07.30</td>
        <td>2016.07.30</td>
        <td><input type="checkbox" class="chk" name="chk02" /></td>
        <td><input type="checkbox" class="chk" name="chk03" /></td>
        <td><input value="저장" type="button" class="btns01" />
              <input value="삭제" type="button" class="btns" /></td>
      </tr>
      <tr>
        <td><input type="checkbox" class="chk" name="chk01" /></td>
        <td>1</td>
        <td>천재교육(교판)</td>
        <td>경기도</td>
        <td>광명시</td>
        <td>2016.07.30</td>
        <td>2016.07.30</td>
        <td><input type="checkbox" class="chk" name="chk02" /></td>
        <td><input type="checkbox" class="chk" name="chk03" /></td>
        <td><input value="저장" type="button" class="btns01" />
              <input value="삭제" type="button" class="btns" /></td>
      </tr>
      <tr>
        <td><input type="checkbox" class="chk" name="chk01" /></td>
        <td>1</td>
        <td>천재교육(교판)</td>
        <td>경기도</td>
        <td>광명시</td>
        <td>2016.07.30</td>
        <td>2016.07.30</td>
        <td><input type="checkbox" class="chk" name="chk02" /></td>
        <td><input type="checkbox" class="chk" name="chk03" /></td>
        <td><input value="저장" type="button" class="btns01" />
              <input value="삭제" type="button" class="btns" /></td>
      </tr>
      <tr>
        <td><input type="checkbox" class="chk" name="chk01" /></td>
        <td>1</td>
        <td>천재교육(교판)</td>
        <td>경기도</td>
        <td>광명시</td>
        <td>2016.07.30</td>
        <td>2016.07.30</td>
        <td><input type="checkbox" class="chk" name="chk02" /></td>
        <td><input type="checkbox" class="chk" name="chk03" /></td>
        <td><input value="저장" type="button" class="btns01" />
              <input value="삭제" type="button" class="btns" /></td>
      </tr>
     <tr>
        <td><input type="checkbox" class="chk" name="chk01" /></td>
        <td>1</td>
        <td>천재교육(교판)</td>
        <td>경기도</td>
        <td>광명시</td>
        <td>2016.07.30</td>
        <td>2016.07.30</td>
        <td><input type="checkbox" class="chk" name="chk02" /></td>
        <td><input type="checkbox" class="chk" name="chk03" /></td>
        <td><input value="저장" type="button" class="btns01" />
              <input value="삭제" type="button" class="btns" /></td>
      </tr>
      <tr>
        <td><input type="checkbox" class="chk" name="chk01" /></td>
        <td>1</td>
        <td>천재교육(교판)</td>
        <td>경기도</td>
        <td>광명시</td>
        <td>2016.07.30</td>
        <td>2016.07.30</td>
        <td><input type="checkbox" class="chk" name="chk02" /></td>
        <td><input type="checkbox" class="chk" name="chk03" /></td>
        <td><input value="저장" type="button" class="btns01" />
              <input value="삭제" type="button" class="btns" /></td>
      </tr>
      <tr>
        <td><input type="checkbox" class="chk" name="chk01" /></td>
        <td>1</td>
        <td>천재교육(교판)</td>
        <td>경기도</td>
        <td>광명시</td>
        <td>2016.07.30</td>
        <td>2016.07.30</td>
        <td><input type="checkbox" class="chk" name="chk02" /></td>
        <td><input type="checkbox" class="chk" name="chk03" /></td>
        <td><input value="저장" type="button" class="btns01" />
              <input value="삭제" type="button" class="btns" /></td>
      </tr>
        </tbody>
    </table>

    <script>
			$('.bbs_list01 tr:even').css("background","#f4f4f4");
			$('.bbs_list02 tr:even').css("background","#f4f4f4");
		</script> 
    
    <!-- paging -->
    <div class="paging"> <a href="#" class="btn"><img src="../img/btn_page_prev02.gif" alt="처음 페이지로 가기" /></a> <a href="#" class="btn"><img src="../img/btn_page_prev.gif" alt="이전 페이지로 가기" /></a> <span> <a href="#"><strong>1</strong></a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> </span> <a href="#" class="btn"><img src="../img/btn_page_next.gif" alt="다음 페이지로 가기" /></a> <a href="#" class="btn"><img src="../img/btn_page_next02.gif" alt="마지막 페이지로 가기" /></a> </div>
    <!-- //paging --> 
    
    <!-- 버튼 -->
    <div class="btnarea">
      <input value="저장" type="button" class="btn02 mgr10" />
      <input value="삭제" type="button" class="btn01" />
    </div>
    <!-- /버튼 -->
    
  </div>
  <!--/contents--> 
  <%@ include file="../popup_bottom.jsp" %>