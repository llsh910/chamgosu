<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>
  <!--contents-->
  <div id="contents">
    <h2>ㆍ상품공급자 관리</h2>
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
      상품리스트
      </caption>
      <colgroup>
      <col width="30" />
      <col width="30" />
      <col width="*" />
      <col width="140" />
      <col width="80" />
      <col width="120" />
      <col width="190" />
      <col width="90" />
      <col width="70" />
      <col width="90" />
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
          <th scope="col">상세보기</th>
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
        <td><input value="상세보기" type="button" class="btns01" /></td>
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
        <td><input value="상세보기" type="button" class="btns01" /></td>
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
        <td><input value="상세보기" type="button" class="btns01" /></td>
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
        <td><input value="상세보기" type="button" class="btns01" /></td>
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
        <td><input value="상세보기" type="button" class="btns01" /></td>
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
        <td><input value="상세보기" type="button" class="btns01" /></td>
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
        <td><input value="상세보기" type="button" class="btns01" /></td>
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
        <td><input value="상세보기" type="button" class="btns01" /></td>
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
        <td><input value="상세보기" type="button" class="btns01" /></td>
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
        <td><input value="상세보기" type="button" class="btns01" /></td>
      </tr>
        </tbody>
      
    </table>
    
    <!--/스크롤되는 테이블영역--> 
    <script>
			$('.bbs_list01 tr:even').css("background","#f4f4f4");
			$('.bbs_list02 tr:even').css("background","#f4f4f4");
		</script> 
    
    <!-- paging -->
    <div class="paging"> <a href="#" class="btn"><img src="../img/btn_page_prev02.gif" alt="처음 페이지로 가기" /></a> <a href="#" class="btn"><img src="../img/btn_page_prev.gif" alt="이전 페이지로 가기" /></a> <span> <a href="#"><strong>1</strong></a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> </span> <a href="#" class="btn"><img src="../img/btn_page_next.gif" alt="다음 페이지로 가기" /></a> <a href="#" class="btn"><img src="../img/btn_page_next02.gif" alt="마지막 페이지로 가기" /></a> </div>
    <!-- //paging --> 
    
    <!--탭버튼-->
    <div id="tabwrap01">
      <ul class="tabs01">
        <li rel="tab1">신규등록</li>
        <li rel="tab2">엑셀파일 저장하기</li>
        <li rel="tab3">푸시보내기</li>
        <li rel="tab4">문자보내기</li>
        <li rel="tab5">메일보내기</li>
      </ul>
      <!-- 탭컨텐츠 -->
      <div class="tab_container01">
        <div id="tab1" class="tab_content01 agc"> 
          <!-- 신규등록 -->
          <table class="bbs_write01">
            <caption>
            사업자 정보
            </caption>
            <colgroup>
            <col width="150" />
            <col width="400" />
            <col width="150" />
            <col width="*" />
            </colgroup>
            <tbody>
              <tr>
                <th scope="row">* 아이디<br>
                  (사업자등록번호)</th>
                <td colspan="3"><input type="text" class="inputTxt" style="width:20%;" />
                  <input value="중복체크" type="button" class="btns01" />
                  ※'-'없이 입력하세요. 사업자등록번호로 ID가 부여됩니다.</td>
              </tr>
              <tr>
                <th scope="row">* 업체명</th>
                <td><input type="text" class="inputTxt" style="width:60%;" /></td>
                <th scope="row" class="bleft">* 대표자명</th>
                <td><input type="text" class="inputTxt" style="width:60%;" /></td>
              </tr>
              <tr>
                <th scope="row">* 비밀번호</th>
                <td><input type="password" class="inputTxt" style="width:60%;" />
                  <br>
                  ※신규 등록시 아이디(사업자등록번호)와 동일하게 설정됩니다.</td>
                <th scope="row" class="bleft">이용수수료</th>
                <td><select style="width:150px;">
                    <option>선택하세요</option>
                    <option>승인대기</option>
                    <option>승인완료</option>
                  </select></td>
              </tr>
            </tbody>
          </table>
          <br>
          <input value="등록하기" type="button" class="btn02" />
        </div>
        <!-- 엑셀파일 저장하기 -->
        <div id="tab2" class="tab_content01 agc">
          <input type="checkbox" class="chk" />
          사업자등록번호
          <input type="checkbox" class="chk" />
          업체명
          <input type="checkbox" class="chk" />
          대표자명
          <input type="checkbox" class="chk" />
          우편번호
          <input type="checkbox" class="chk" />
          기본주소
          <input type="checkbox" class="chk" />
          상세주소
          <input type="checkbox" class="chk" />
          회사전화
          <input type="checkbox" class="chk" />
          휴대전화
          <input type="checkbox" class="chk" />
          팩스번호
          <input type="checkbox" class="chk" />
          전자우편 <br>
          <input type="checkbox" class="chk" />
          취급품목 및 회사소개
          <input type="checkbox" class="chk" />
          은행계좌
          <input type="checkbox" class="chk" />
          기본공급율
          <input type="checkbox" class="chk" />
          배송방법
          <input type="checkbox" class="chk" />
          배송기준
          <input type="checkbox" class="chk" />
          교환 및 반품정책<br>
          <br>
          <input value="저장하기" type="button" class="btn02" />
        </div>
        <!-- 푸쉬보내기 -->
        <div id="tab3" class="tab_content01 agc"> 이미지 작업해서 통이미지로 삽입예정입니다.</div>
        <!-- 문자보내기 -->
        <div id="tab4" class="tab_content01 agc"> 문자내용작성 화면구성 확인 후 작업예정입니다.</div>
        <!-- 메일보내기 -->
        <div id="tab5" class="tab_content01 agc">
        <table class="bbs_write01">
            <caption>
            사업자 정보
            </caption>
            <colgroup>
            <col width="150" />
            <col width="*" />
            </colgroup>
            <tbody>
              <tr>
                <th scope="row">수신회원</th>
                <td><input type="text" class="inputTxt" style="width:60%;" /></td>
              </tr>
              <tr>
                <th scope="row">이메일 제목</th>
                <td><input type="text" class="inputTxt" style="width:60%;" /></td>
              </tr>
              <tr>
                <td colspan="2"><textarea rows="6" class="inputTxt" style="width:930px;">메일보낼 업체를 상단의 리스트에서 체크하고 메일내용을 입력하세요.</textarea></th>
              </tr>
            </tbody>
          </table>
          <br>
          <input value="보내기" type="button" class="btn02" />
        </div>
      </div>
      <!-- /탭컨텐츠 --> 
    </div>
    <script>
$(function () {

    $(".tab_content01").hide();
    $(".tab_content01:first").hide();

    $("ul.tabs01 li").click(function () {
        $("ul.tabs01 li").removeClass("active").css("color", "#fff");
        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
        $(this).addClass("active").css("color", "#fff");
        $(".tab_content01").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
    });
});
</script> 
    <!--/탭버튼--> 
    
  </div>
  <!--/contents--> 