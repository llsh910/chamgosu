<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>
<%
	List<Map<String, Object>> agreementList = (List<Map<String, Object>>)request.getAttribute("agreementList");
%>

 <!--contents-->
  <div id="contents">
    <h2>ㆍ이용약관 관리</h2>
    <form id="updateForm">
	    <input type="hidden" id="AM_SEQ" name="AM_SEQ" value="" />
	    <input type="hidden" id="AM_CATEGORY" name="AM_CATEGORY" value="" />
	    <table class="bbs_write01">
	      <caption>약관관리</caption>
	      <tbody>
	        <tr>
	          <td><select style="width:500px; height:29px" title="약관종류" id="agreementCate" onchange="agreementView()">
	              <option value="">약관을 선택하세요</option>
	              <%for(int i=0; i<agreementList.size(); i++){ %>
	              <option value="<%= RsUtil.checkNull(agreementList.get(i).get("AM_SEQ"))%>"><%= RsUtil.checkNull(agreementList.get(i).get("AM_CATEGORY"))%></option>
	              <%} %>
	            </select> <input value="약관 수정하기" type="button" class="btnm" /></td>
	        </tr>
	        <tr>
	          <td colspan="3">
	          <!--에디터-->
	          <textarea rows="25" class="inputTxt" style="width:98%;" id="AM_CONTENT" name="AM_CONTENT"></textarea>
	          <!--/에디터-->
	          </td>
	        </tr>
	      </tbody>
	    </table>
	    
	    <!-- 버튼 -->
	    <div class="btnarea">
	      <input value="저 장" type="button" class="btn02 mgr10" onclick="updateAgreement()"/>
	      <input value="취 소" type="button" class="btn01" />
	    </div>
    </form>
    <!-- /버튼 --> 
  </div>
  <!--/contents--> 
  <%@ include file="../bottom.jsp" %>
  <script>
  	function agreementView(){
  		var seq = $("#agreementCate").val();
  		var Url = "agreementView.do";
		jQuery.ajax({
            url: Url,
            type:'POST',
            data : {
            	"AM_SEQ" : seq
            }
            ,
            success: function(data){
            	if(data.msg == "success"){
            		$("#AM_CONTENT").val(data.agreementView.AM_CONTENT);
            		$("#AM_SEQ").val(data.agreementView.AM_SEQ);
            		$("#AM_CATEGORY").val(data.agreementView.AM_CATEGORY);
            	}else{
            		alert("이용약관 불러오는 과정에서 시스템오류가 발생했습니다.");
            	}
            		
			}
		}); 
  	}
  	
  	function updateAgreement(){
  		var Url = "agreementUpdate.do";
		jQuery.ajax({
            url: Url,
            type:'POST',
            data : $("#updateForm").serialize()
            ,
            success: function(data){
            	if(data.msg == "success"){
            		alert("저장 완료하였습니다.");
            	}else{
            		alert("저장하는 과정에서 시스템오류가 발생하였습니다.");
            	}
			}
		}); 
  	}
  </script>