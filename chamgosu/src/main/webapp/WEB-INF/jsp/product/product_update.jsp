<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../popup_top.jsp" %>
<%
	List<Map<String, Object>> pbsCodeList = (List<Map<String, Object>>)request.getAttribute("pbsCodeList");
%>
<div id="popup_wrap01"> 
  <h3 class="mgt10 mgb10 mgl10">개별상품 등록 및 수정</h3> 
  
  
  <form id="updateProduct">
    <table class="bbs_write01">
      <caption>
      개별상품 등록 및 수정
      </caption>
      <colgroup>
      <col width="95" />
      <col width="280" />
      <col width="80" />
      <col width="*" />
      </colgroup>
      <tbody>
        <tr>
          <th scope="row">ISBN코드</th>
          <td colspan="3"><input type="text" class="inputTxt" id="MG_ISBN" name="MG_ISBN" style="width:90%;" /></td>
        </tr>
        <tr>
          <th scope="row">교재명</th>
          <td colspan="3"><input type="text" class="inputTxt" id="MG_BOOKNM" name="MG_BOOKNM" style="width:90%;" /></td>
        </tr>
        <tr>
          <th scope="row">(부제목)</th>
          <td colspan="3"><input type="text" class="inputTxt" id="MG_BOOKSUBNM" name="MG_BOOKSUBNM" style="width:90%;" /></td>
        </tr>
        <tr>
          <th scope="row">저자명</th>
          <td><input type="text" class="inputTxt" id="MG_BOOKWRITER" name="MG_BOOKWRITER" style="width:100px;" /></td>
          <th scope="row" class="bleft">발행연도</th>
          <td><input type="text" class="inputTxt" id="MG_BOOKISYEAR" name="MG_BOOKISYEAR" style="width:80px;" /> 년</td>
        </tr>
        <tr>
          <th scope="row">정가</th>
          <td><input type="text" class="inputTxt" id="MG_PRICE" name="MG_PRICE" style="width:100px;" /> 원</td>
          <th scope="row" class="bleft">상품등록일</th>
          <td><input type="text" class="inputTxt" id="REGDATE" name="REGDATE" style="width:80px;" /> </td>
        </tr>
	       <tr>
	        <th scope="row">상품이미지</th>
	          <td><img src="../img/book_noimage.jpg" alt="기본이미지" class="mgb10"><br><input type="text" id="fileName" class="file_input_textbox" style="width:120px" readonly >
	            <div class="file_input_div" style="width:80px"> <img src="../img/open.gif" class="file_input_img_btn" alt="open" />
	              <input type="file" name="file_1" class="file_input_hidden" style="width:120px" onchange="javascript: document.getElementById('fileName').value = this.value"/>
	            </div>이미지 사이즈는 세로 상관없이 가로80px입니다.</td>
	          <th scope="row" class="bleft">상품승인</th>
	          <td><input type="checkbox" class="chk" />
	              예
	              <input type="checkbox" class="chk" />
	              아니오</td>
	        </tr>
        <tr>
          <th scope="row">상세정보</th>
          <td colspan="3"><textarea rows="5" class="inputTxt" id="MG_MOREINF" name="MG_MOREINF" style="width:90%;"></textarea></td>
        </tr>
        <tr>
          <th scope="row">참고자료(url)</th>
          <td colspan="3"><input type="text" class="inputTxt" id="MG_REFMAT" name="MG_REFMAT" style="width:90%;" /></td>
        </tr>
      </tbody>
    </table>
    
    <!-- detail -->
    <div class="dibp">
        <ul>
          <li class="popmenu">
            <table style="width:600px">
              <colgroup>
              <col width="115" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              </colgroup>
              <tr>
                <th scope="col">출판사별</th>
                <%for(int i=0; i<pbsCodeList.size(); i++){ %>
                <td><input type="radio" class="chk" id="MG_PBS" name="MG_PBS" value="<%= RsUtil.checkNull(pbsCodeList.get(i).get("CODE_FIRST"))%>"/><%= RsUtil.checkNull(pbsCodeList.get(i).get("CODE_CODENAME"))%></td>
                <%} %>
              </tr>
            </table>
            <a>40개 <img src="<%= realPath%>/css/images/more.gif" alt="more"/></a>
            <ul class="hide">
              <li>
                <table style="width:600px">
              <colgroup>
              <col width="115" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
                  </colgroup>
                  <tr>
                    <th scope="col"></th>
                    <td><input type="radio" class="chk" />
                      천재교육</td>
                    <td><input type="radio" class="chk" />
                      비상교육</td>
                    <td><input type="radio" class="chk" />
                      신사고</td>
                    <td><input type="radio" class="chk" />
                      개념정리</td>
                    <td><input type="radio" class="chk" />
                      길벗</td>
                  </tr>
                  <tr>
                    <th scope="col"></th>
                    <td><input type="radio" class="chk" />
                      천재교육</td>
                    <td><input type="radio" class="chk" />
                      비상교육</td>
                    <td><input type="radio" class="chk" />
                      신사고</td>
                    <td><input type="radio" class="chk" />
                      개념정리</td>
                    <td><input type="radio" class="chk" />
                      길벗</td>
                  </tr>
                </table>
              </li>
            </ul>
          </li>
          <li class="popmenu">
            <table style="width:600px">
              <colgroup>
              <col width="115" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              </colgroup>
              <tr>
                <th scope="col">분야(과목)별</th>
                <td><input type="radio" class="chk" id="MG_SUBJECT" name="MG_SUBJECT" value="00001"/>
                  국어</td>
                <td><input type="radio" class="chk" id="MG_SUBJECT" name="MG_SUBJECT" value="00002"/>
                  수학</td>
                <td><input type="radio" class="chk" id="MG_SUBJECT" name="MG_SUBJECT" value="00003"/>
                  영어</td>
                <td><input type="radio" class="chk" id="MG_SUBJECT" name="MG_SUBJECT" value="00004"/>
                  사회</td>
                <td><input type="radio" class="chk" id="MG_SUBJECT" name="MG_SUBJECT" value="00005"/>
                  과학</td>
              </tr>
            </table>
            <a>40개 <img src="<%= realPath%>/css/images/more.gif" alt="more"/></a>
            <ul class="hide">
              <li>
                <table style="width:600px">
              <colgroup>
              <col width="115" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
                  </colgroup>
                  <tr>
                    <th scope="col"></th>
                    <td><input type="radio" class="chk" />
                      국어</td>
                    <td><input type="radio" class="chk" />
                      수학</td>
                    <td><input type="radio" class="chk" />
                      영어</td>
                    <td><input type="radio" class="chk" />
                      사회</td>
                    <td><input type="radio" class="chk" />
                      과학</td>
                  </tr>
                  <tr>
                    <th scope="col"></th>
                    <td><input type="radio" class="chk" />
                      국어</td>
                    <td><input type="radio" class="chk" />
                      수학</td>
                    <td><input type="radio" class="chk" />
                      영어</td>
                    <td><input type="radio" class="chk" />
                      사회</td>
                    <td><input type="radio" class="chk" />
                      과학</td>
                  </tr>
                </table>
              </li>
            </ul>
          </li>
          <li class="popmenu">
            <table style="width:600px">
              <colgroup>
              <col width="115" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              </colgroup>
              <tr>
                <th scope="col">대상별</th>
                <td><input type="radio" class="chk" id="MG_OBJECT" name="MG_OBJECT" value="00001"/>
                  유치부</td>
                <td><input type="radio" class="chk" id="MG_OBJECT" name="MG_OBJECT" value="00002"/>
                  초등학생</td>
                <td><input type="radio" class="chk" id="MG_OBJECT" name="MG_OBJECT" value="00003"/>
                  중학생</td>
                <td><input type="radio" class="chk" id="MG_OBJECT" name="MG_OBJECT" value="00004"/>
                  고등학생</td>
                <td><input type="radio" class="chk" id="MG_OBJECT" name="MG_OBJECT" value="00005"/>
                  대학생</td>
              </tr>
            </table>
            <a>40개 <img src="<%= realPath%>/css/images/more.gif" alt="more"/></a>
            <ul class="hide">
              <li>
                <table style="width:600px">
              <colgroup>
              <col width="115" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
                  </colgroup>
                  <tr>
                    <th scope="col"></th>
                    <td><input type="radio" class="chk" />
                      유치부</td>
                    <td><input type="radio" class="chk" />
                      초등학생</td>
                    <td><input type="radio" class="chk" />
                      중학생</td>
                    <td><input type="radio" class="chk" />
                      고등학생</td>
                    <td><input type="radio" class="chk" />
                      대학생</td>
                  </tr>
                  <tr>
                    <th scope="col"></th>
                    <td><input type="radio" class="chk" />
                      유치부</td>
                    <td><input type="radio" class="chk" />
                      초등학생</td>
                    <td><input type="radio" class="chk" />
                      중학생</td>
                    <td><input type="radio" class="chk" />
                      고등학생</td>
                    <td><input type="radio" class="chk" />
                      대학생</td>
                  </tr>
                </table>
              </li>
            </ul>
          </li>
          <li class="popmenu">
            <table style="width:600px">
              <colgroup>
              <col width="115" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              </colgroup>
              <tr>
                <th scope="col">학년별</th>
                <td><input type="radio" class="chk" id="MG_GRADE" name="MG_GRADE" value="00001"/>
                  1학년</td>
                <td><input type="radio" class="chk" id="MG_GRADE" name="MG_GRADE" value="00002"/>
                  2학년</td>
                <td><input type="radio" class="chk" id="MG_GRADE" name="MG_GRADE" value="00003"/>
                  3학년</td>
                <td><input type="radio" class="chk" id="MG_GRADE" name="MG_GRADE" value="00004"/>
                  4학년</td>
                <td><input type="radio" class="chk" id="MG_GRADE" name="MG_GRADE" value="00005"/>
                  4학년</td>
              </tr>
            </table>
            <a>40개 <img src="<%= realPath%>/css/images/more.gif" alt="more"/></a>
            <ul class="hide">
              <li>
                <table style="width:600px">
              <colgroup>
              <col width="115" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
                  </colgroup>
                  <tr>
                    <th scope="col"></th>
                    <td><input type="radio" class="chk" />
                      1학년</td>
                    <td><input type="radio" class="chk" />
                      2학년</td>
                    <td><input type="radio" class="chk" />
                      3학년</td>
                    <td><input type="radio" class="chk" />
                      4학년</td>
                    <td><input type="radio" class="chk" />
                      4학년</td>
                  </tr>
                </table>
              </li>
            </ul>
          </li>
          <li class="popmenu">
            <table style="width:600px">
              <colgroup>
              <col width="115" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              </colgroup>
              <tr>
                <th scope="col">상품공급자별</th>
                <td><input type="radio" class="chk" id="MG_ISBN" name="MG_ISBN" value="00001"/>
                  국영수책마당</td>
                <td><input type="radio" class="chk" id="MG_ISBN" name="MG_ISBN" value="00002"/>
                  으뜸학원</td>
                <td><input type="radio" class="chk" id="MG_ISBN" name="MG_ISBN" value="00003"/>
                  빨간펜</td>
                <td><input type="radio" class="chk" id="MG_ISBN" name="MG_ISBN" value="00004"/>
                  한국문고</td>
                <td><input type="radio" class="chk" id="MG_ISBN" name="MG_ISBN" value="00005"/>
                  영재교육책</td>
              </tr>
            </table>
            <a>40개 <img src="<%= realPath%>/css/images/more.gif" alt="more"/></a>
            <ul class="hide">
              <li>
                <table style="width:600px">
              <colgroup>
              <col width="115" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
              <col width="97" />
                  </colgroup>
                  <tr>
                    <th scope="col"></th>
                    <td><input type="radio" class="chk" />
                      국영수책마당</td>
                    <td><input type="radio" class="chk" />
                      으뜸학원</td>
                    <td><input type="radio" class="chk" />
                      빨간펜</td>
                    <td><input type="radio" class="chk" />
                      한국문고</td>
                    <td><input type="radio" class="chk" />
                      영재교육책</td>
                  </tr>
                  <tr>
                    <th scope="col"></th>
                    <td><input type="radio" class="chk" />
                      국영수책마당</td>
                    <td><input type="radio" class="chk" />
                      으뜸학원</td>
                    <td><input type="radio" class="chk" />
                      빨간펜</td>
                    <td><input type="radio" class="chk" />
                      한국문고</td>
                    <td><input type="radio" class="chk" />
                      영재교육책</td>
                  </tr>
                </table>
              </li>
            </ul>
          </li>
        </ul>
      </div>
      <script>
    $(document).ready(function(){
        $(".popmenu>a").click(function(){
            $(this).next("ul").toggleClass("hide");
        });
    });
</script> 
<!-- /detail -->
    
    <!-- 버튼 -->
  <div class="btnarea">
      <input value="저장" type="button" class="btn02 mgr10" onclick="updateProduct()" />
      <input value="닫기" type="button" class="btn01" onclick="window.close()" />
    </div>
    <!-- /버튼 --> 
</form>
</div>

<script>
	function updateProduct(){
		var Url = "updateProduct.do";
		jQuery.ajax({
            url: Url,
            type:'POST',
            data : $("#updateProduct").serialize()
            ,
            success: function(data){
            	console.log(data);
            	if(data.msg == "success"){
            		alert("개별상품이 등록 되었습니다.");
            		
            	}else{
            		alert("등록하는 과정에서 오류가 발생했습니다.");
            	}
			}
		})
	}
</script>
<%@ include file="../popup_bottom.jsp" %>