<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>
 <!--contents-->
  <div id="contents">
    <h2>ㆍ상품 공급자별 취급품목(출판사별 영업지역)관리</h2>
    <!-- search -->
    <div class="search">
      <ul>
        <li class="fl"> <span>업체명</span>
          <input type="text" class="inputTxt" style="width:230px;" />
          <select style="width:100px;" title="업체유형">
            <option>전체보기</option>
            <option>유료업체</option>
            <option>무료업체</option>
            <option>승인대기</option>
          </select>
          <input value="검색하기" type="button" class="btnm" />
        </li>
      </ul>
    </div>
    <!-- /search -->
    
    <!--공급업체 리스트-->
    <h4><span>총 업체수 : 100건</span> 조회업체 수 : 100건
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
      공급업체리스트
      </caption>
      <colgroup>
      <col width="30" />
      <col width="30" />
      <col width="*" />
      <col width="135" />
      <col width="75" />
      <col width="120" />
      <col width="190" />
      <col width="90" />
      <col width="70" />
      <col width="100" />
      </colgroup>
      
      <thead>
        <tr>
          <th scope="col"><input type="checkbox" class="chk" id="checkall" /></th>
          <th scope="col">번호</th>
          <th scope="col">사업자등록번호(ID)</th>
          <th scope="col">업체명</th>
          <th scope="col">대표자명</th>
          <th scope="col">연락처</th>
          <th scope="col">메일주소</th>
          <th scope="col">등록일</th>
          <th scope="col">이용등급</th>
          <th scope="col">취급품목</th>
        </tr>
      </thead>
      <tbody>
      <tr>
        <td><input type="checkbox" class="chk" name="chk" /></td>
        <td>1</td>
        <td>111-11-12345</td>
        <td>아이러브스터디</td>
        <td>홍길동</td>
        <td>011-123-1256</td>
        <td><a href="mailto:chamgosu@chamgosu.com">chamgosu@chamgosu.com</a></td>
        <td>2016.07.30</td>
        <td>유료업체</td>
        <td><input value="조회 및 관리" type="button" class="btns01" /></td>
      </tr>
      <tr>
        <td><input type="checkbox" class="chk" name="chk" /></td>
        <td>1</td>
        <td>111-11-12345</td>
        <td>아이러브스터디</td>
        <td>홍길동</td>
        <td>011-123-1256</td>
        <td><a href="mailto:chamgosu@chamgosu.com">chamgosu@chamgosu.com</a></td>
        <td>2016.07.30</td>
        <td>유료업체</td>
        <td><input value="조회 및 관리" type="button" class="btns01" /></td>
      </tr>
      <tr>
        <td><input type="checkbox" class="chk" name="chk" /></td>
        <td>1</td>
        <td>111-11-12345</td>
        <td>아이러브스터디</td>
        <td>홍길동</td>
        <td>011-123-1256</td>
        <td><a href="mailto:chamgosu@chamgosu.com">chamgosu@chamgosu.com</a></td>
        <td>2016.07.30</td>
        <td>유료업체</td>
        <td><input value="조회 및 관리" type="button" class="btns01" /></td>
      </tr>
      <tr>
        <td><input type="checkbox" class="chk" name="chk" /></td>
        <td>1</td>
        <td>111-11-12345</td>
        <td>아이러브스터디</td>
        <td>홍길동</td>
        <td>011-123-1256</td>
        <td><a href="mailto:chamgosu@chamgosu.com">chamgosu@chamgosu.com</a></td>
        <td>2016.07.30</td>
        <td>유료업체</td>
        <td><input value="조회 및 관리" type="button" class="btns01" /></td>
      </tr>
      <tr>
        <td><input type="checkbox" class="chk" name="chk" /></td>
        <td>1</td>
        <td>111-11-12345</td>
        <td>아이러브스터디</td>
        <td>홍길동</td>
        <td>011-123-1256</td>
        <td><a href="mailto:chamgosu@chamgosu.com">chamgosu@chamgosu.com</a></td>
        <td>2016.07.30</td>
        <td>유료업체</td>
        <td><input value="조회 및 관리" type="button" class="btns01" /></td>
      </tr>
      <tr>
        <td><input type="checkbox" class="chk" name="chk" /></td>
        <td>1</td>
        <td>111-11-12345</td>
        <td>아이러브스터디</td>
        <td>홍길동</td>
        <td>011-123-1256</td>
        <td><a href="mailto:chamgosu@chamgosu.com">chamgosu@chamgosu.com</a></td>
        <td>2016.07.30</td>
        <td>유료업체</td>
        <td><input value="조회 및 관리" type="button" class="btns01" /></td>
      </tr>
      <tr>
        <td><input type="checkbox" class="chk" name="chk" /></td>
        <td>1</td>
        <td>111-11-12345</td>
        <td>아이러브스터디</td>
        <td>홍길동</td>
        <td>011-123-1256</td>
        <td><a href="mailto:chamgosu@chamgosu.com">chamgosu@chamgosu.com</a></td>
        <td>2016.07.30</td>
        <td>유료업체</td>
        <td><input value="조회 및 관리" type="button" class="btns01" /></td>
      </tr>
      <tr>
        <td><input type="checkbox" class="chk" name="chk" /></td>
        <td>1</td>
        <td>111-11-12345</td>
        <td>아이러브스터디</td>
        <td>홍길동</td>
        <td>011-123-1256</td>
        <td><a href="mailto:chamgosu@chamgosu.com">chamgosu@chamgosu.com</a></td>
        <td>2016.07.30</td>
        <td>유료업체</td>
        <td><input value="조회 및 관리" type="button" class="btns01" /></td>
      </tr>
      <tr>
        <td><input type="checkbox" class="chk" name="chk" /></td>
        <td>1</td>
        <td>111-11-12345</td>
        <td>아이러브스터디</td>
        <td>홍길동</td>
        <td>011-123-1256</td>
        <td><a href="mailto:chamgosu@chamgosu.com">chamgosu@chamgosu.com</a></td>
        <td>2016.07.30</td>
        <td>유료업체</td>
        <td><input value="조회 및 관리" type="button" class="btns01" /></td>
      </tr>
      <tr>
        <td><input type="checkbox" class="chk" name="chk" /></td>
        <td>1</td>
        <td>111-11-12345</td>
        <td>아이러브스터디</td>
        <td>홍길동</td>
        <td>011-123-1256</td>
        <td><a href="mailto:chamgosu@chamgosu.com">chamgosu@chamgosu.com</a></td>
        <td>2016.07.30</td>
        <td>유료업체</td>
        <td><input value="조회 및 관리" type="button" class="btns01" /></td>
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
      <col width="120" />
      <col width="120" />
      <col width="100" />
      <col width="100" />
      <col width="70" />
      <col width="70" />
      <col width="110" />
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
        <td><input value="수정" type="button" class="btns01" />
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
        <td><input value="수정" type="button" class="btns01" />
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
        <td><input value="수정" type="button" class="btns01" />
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
        <td><input value="수정" type="button" class="btns01" />
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
        <td><input value="수정" type="button" class="btns01" />
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
        <td><input value="수정" type="button" class="btns01" />
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
        <td><input value="수정" type="button" class="btns01" />
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
        <td><input value="수정" type="button" class="btns01" />
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
        <td><input value="수정" type="button" class="btns01" />
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
        <td><input value="수정" type="button" class="btns01" />
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