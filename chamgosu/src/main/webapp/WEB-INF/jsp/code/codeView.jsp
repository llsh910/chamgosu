<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>
<%
	//코드 메인 페이지
	
	List<Map<String, Object>> indexCodeList = (List<Map<String, Object>>)request.getAttribute("indexCodeList");
	List<Map<String, Object>> code1List = (List<Map<String, Object>>)request.getAttribute("code1List");
	
	
	List<Map<String, Object>> code2List = (List<Map<String, Object>>)request.getAttribute("code2List");
	
	String code1Name = RsUtil.checkNull(request.getAttribute("code1Name"));
	String code_idx = RsUtil.checkNull(request.getAttribute("code_idx"));
	String code_first = RsUtil.checkNull(request.getAttribute("code_first"));
%>
 <!--contents-->
  <div id="contents">
    <h2>ㆍ코드 관리</h2>
    
   <div class="tabberlive" id="">
   	<ul class="tabbernav">
   		<% if(indexCodeList != null && indexCodeList.size() > 0){ %>
	   		<% for(int i=0; i<indexCodeList.size(); i++){ String tabactive = ""; %>
	   		<% if(i == 0){ tabactive = "tabberactive"; } %>
		   	<li class="<%=tabactive%> nocssii" id="tabView<%=i%>"><a href="javascript:tabmenuClick('<%=RsUtil.checkNull(indexCodeList.get(i).get("CODE_IDX"))%>', '<%=i%>');" title="영업지역"><%=RsUtil.checkNull(indexCodeList.get(i).get("CODE_CODENAME"))%></a></li>
		   	<!-- <li class=""><a href="javascript:void(null);" title="출판사">출판사</a></li>
		   	<li class=""><a href="javascript:void(null);" title="분야(과목)">분야(과목)</a></li>
		   	<li class=""><a href="javascript:void(null);" title="대상">대상</a></li>
		   	<li class=""><a href="javascript:void(null);" title="학년">학년</a></li> -->
		   	<% } %>
	   	<% } %>
   	</ul>
   		<div id="viewChange">
      <div class="tabbertab " title="">
        <h2>영업지역</h2>
        <div class="tabberlive" id="tab1-1"><ul class="tabbernav"></ul> 
          <!--지역등록하기-->
          <div class="mgb20 agl">
          
          <form name="sidoSub" id="sidoSub" class="fl">
          		<input type="hidden" name="code_idx" value="<%=code_idx%>" />
	          <input type="text" class="inputTxt" name="code_codeName" id="code_codeName" style="width:120px;" /> 
	          <input value="시.도 등록하기" type="button" class="btns01 mgr15" onclick="code1Savesido('<%=code_idx%>')" />
          </form>
          
          <form name="sidoMoSub" id="sidoMoSub" class="fl">
          	<input type="hidden" name="code_idx" value="<%=code_idx%>" />
	          <select style="width:70px;" name="code_first">
	            <% if(code1List != null && code1List.size() > 0){ %>
		            	<% for(int i=0; i<code1List.size(); i++){ String active = ""; %>
		            		<option value="<%=RsUtil.checkNull(code1List.get(i).get("CODE_FIRST")) %>"><%=RsUtil.checkNull(code1List.get(i).get("CODE_CODENAME")) %></option>
		            	<% } %>
		            <% } %>
	          </select> →
	          <input type="text" class="inputTxt" name="code_codeName" style="width:120px;" /> 
	          <input value="시.도 수정하기" type="button" class="btns01 mgr15" onclick="code1ModifySido('<%=code_idx%>')" />
          </form>
          
           
          <%-- <select name="" id="" style="width:70px;">
          		<% if(code1List != null && code1List.size() > 0){ %>
	            	<% for(int i=0; i<code1List.size(); i++){ String active = ""; %>
	            		<option value="<%=RsUtil.checkNull(code1List.get(i).get("CODE_IDX")) %>'|<%=RsUtil.checkNull(code1List.get(i).get("CODE_FIRST")) %>"><%=RsUtil.checkNull(code1List.get(i).get("CODE_CODENAME")) %></option>
	            	<% } %>
	            <% } %>
          </select>
          <input value="시.도 삭제하기" type="button" class="btns01 mgr15"> --%>
          </div>
          <!--/지역등록하기-->
          
          <!--지역선택-->
          <div id="tabwrap">
            <ul class="tabs">
            	<% if(code1List != null && code1List.size() > 0){ %>
	            	<% for(int i=0; i<code1List.size(); i++){ String active = ""; %>
	            		<% if(i == 0){ active = "active"; } %>
	            		<li class="<%=active%> w60" id="regionBtn<%=i%>" onclick="code1Change('<%=RsUtil.checkNull(code1List.get(i).get("CODE_IDX")) %>', '<%=RsUtil.checkNull(code1List.get(i).get("CODE_FIRST")) %>', '<%=i%>')"><%=RsUtil.checkNull(code1List.get(i).get("CODE_CODENAME")) %></li>
	            	<% } %>
            	<% } %>
            </ul>
            <!-- 탭컨텐츠 -->
            <div class="tab_container bon">
              <div id="tab1" class="tab_content" style="display: block;">
                <table class="bbs_list01" style="width:945px;">
                  <caption>
                  <%=code1Name%>
                  </caption>
                  <colgroup>
                  <col width="*">
                  <col width="70">
                  <col width="115">
                  <col width="125">
                  <col width="70">
                  <col width="115">
                  <col width="125">
                  <col width="70">
                  <col width="115">
                  </colgroup>
                  <thead>
                    <tr>
                      <th colspan="9" class="agr"><div class="fl mgl20"><%=code1Name%></div>
	                      <form name="code2subGu" id="code2subGu" class="fr">
	                      	<input type="hidden" name="code_idx" value="<%=code_idx%>" />
	                      	<input type="hidden" name="code_first" value="<%=code_first%>" />
					          <input type="text" class="inputTxt" name="code_codeName" style="width:120px;" /> 
					          <input value="등록" type="button" class="btns01 mgr10" onclick="code2GuSave('<%=code_idx%>', '<%=code_first%>')" />
				          </form>
			          </th>
                    </tr>
                  </thead>
                  <tbody>
                  	<% if(code2List != null && code2List.size() > 0){ %>
                  		<tr>
		            	<% for(int i=0; i<code2List.size(); i++){ int j=i; %>
		            		 
		                      <td>
		                      	<form name="sub<%=i%>" id="sub<%=i%>">
		                      		<input type="hidden" name="code_idx" value="<%=code_idx%>" />
		                      		<input type="hidden" name="code_first" value="<%=code_first%>" />
		                      		<input type="hidden" name="code_two" value="<%=RsUtil.checkNull(code2List.get(i).get("CODE_TWO"))%>" />
		                      		<b><input type="text" name="code_codeName" value="<%=RsUtil.checkNull(code2List.get(i).get("CODE_CODENAME"))%>"style="width:50px;" /></b>
		                      	</form>
		                      </td>
		                      <td><%=RsUtil.checkNull(code2List.get(i).get("USENAME"))%></td>
		                      <td>
		                      	<input value="<%=RsUtil.checkNull(code2List.get(i).get("BTNNAME"))%>" type="button" class="<%=RsUtil.checkNull(code2List.get(i).get("BTNCLNAME"))%>" onclick="code2UseSave('<%=RsUtil.checkNull(code2List.get(i).get("CODE_IDX"))%>', '<%=RsUtil.checkNull(code2List.get(i).get("CODE_FIRST"))%>', '<%=RsUtil.checkNull(code2List.get(i).get("CODE_TWO"))%>', '<%=RsUtil.checkNull(code2List.get(i).get("CODE_ISUSE"))%>')" />
		                      	<input value="수정" type="button" class="btns" onclick="code2Modify('<%=i%>', '<%=code_idx%>', '<%=code_first%>')" />
		
		                      </td>
		   
		                    <% if((j+1) % 3 == 0){ %>
		                    	</tr><tr>
		                    <% } %>
		            	<% } %>
		            	
		            <% } %>
           
                  </tbody>
                </table>
              </div>
              
            </div>
            <!-- /탭컨텐츠 --> 
          </div>

          <!--/지역선택--> 
        </div>
      </div>
      </div>
     
    </div>
    
  </div>
  <!--/contents--> 
<script type="text/javascript">

	var tabmenuClick1 = function(indexCd){
		jQuery.ajax({
			type : "POST",
			url : "code1View.do",
			data : {"code_idx" : indexCd},
			dataType : "html",
			cache : false,
			async : true,
			error : function(data){
				alert("서버에 접속 할 수 없습니다. 다시 시도해 주십시오");
			},
			success : function(result){
				var j_html = jQuery.trim(result);
				//alert(j_html);
				jQuery("#viewChange").html(j_html);
				
				//
		    }
		});
	};	

	var tabmenuClick = function(indexCd, idx){
		jQuery.ajax({
			type : "POST",
			url : "code1View.do",
			data : {"code_idx" : indexCd},
			dataType : "html",
			cache : false,
			async : true,
			error : function(data){
				alert("서버에 접속 할 수 없습니다. 다시 시도해 주십시오");
			},
			success : function(result){
				var j_html = jQuery.trim(result);
				//alert(j_html);
				jQuery("#viewChange").html(j_html);
				
				jQuery(".nocssii").removeClass("tabberactive");
				jQuery("#tabView" + idx).addClass("tabberactive");
				//
		    }
		});
	};

	var code2GuSave = function(code_idx, code_first){
		jQuery.ajax({
			type : "POST",
			url : "code2Save.do",
			data : jQuery("#code2subGu").serialize(),
			dataType : "json",
			cache : false,
			async : true,
			error : function(data){
				alert("서버에 접속 할 수 없습니다. 다시 시도해 주십시오");
			},
			success : function(result){
				var j_html = jQuery.trim(result.msg);
				if(j_html == "success"){
					alert("등록완료했습니다.");
					code1Change2(code_idx, code_first);
				}
		    }
		});
	};
	
	
	var code1ModifySido = function(code_idx){
		jQuery.ajax({
			type : "POST",
			url : "code1ModifySave.do",
			data : jQuery("#sidoMoSub").serialize(),
			dataType : "json",
			cache : false,
			async : true,
			error : function(data){
				alert("서버에 접속 할 수 없습니다. 다시 시도해 주십시오");
			},
			success : function(result){
				var j_html = jQuery.trim(result.msg);
				if(j_html == "success"){
					alert("수정완료했습니다.");
					tabmenuClick1(code_idx);
				}
		    }
		});
	};

	 var code1Savesido = function(code_idx){
		 jQuery.ajax({
				type : "POST",
				url : "code1Save.do",
				data : jQuery("#sidoSub").serialize(),
				dataType : "json",
				cache : false,
				async : true,
				error : function(data){
					alert("서버에 접속 할 수 없습니다. 다시 시도해 주십시오");
				},
				success : function(result){
					var j_html = jQuery.trim(result.msg);
					if(j_html == "success"){
						alert("등록완료했습니다.");
						tabmenuClick1(code_idx);
					}
			    }
			});
	 };
	 
	 
	 var code1UseSave = function(indexCd, code1, isuse){
		 jQuery.ajax({
				type : "POST",
				url : "code1UseSave.do",
				data : {"code_idx" : indexCd, "code_first" : code1, "code_isuse" : isuse},
				dataType : "json",
				cache : false,
				async : true,
				error : function(data){
					alert("서버에 접속 할 수 없습니다. 다시 시도해 주십시오");
				},
				success : function(result){
					var j_html = jQuery.trim(result.msg);
					if(j_html == "success"){
						alert("변경완료했습니다.");
						tabmenuClick1(indexCd);
					}
			    }
			});
	 };

	var code2UseSave = function(indexCd, code1, code2, isuse){
		jQuery.ajax({
			type : "POST",
			url : "code2UseSave.do",
			data : {"code_idx" : indexCd, "code_first" : code1, "code_two" : code2, "code_isuse" : isuse},
			dataType : "json",
			cache : false,
			async : true,
			error : function(data){
				alert("서버에 접속 할 수 없습니다. 다시 시도해 주십시오");
			},
			success : function(result){
				var j_html = jQuery.trim(result.msg);
				if(j_html == "success"){
					alert("변경완료했습니다.");
					code1Change2(code_idx, code_first);
				}
		    }
		});
	};
	
	
	var code1Modify = function(idx, code_idx){
		jQuery.ajax({
			type : "POST",
			url : "code1ModifySave.do",
			data : jQuery("#sub"+idx).serialize(),
			dataType : "json",
			cache : false,
			async : true,
			error : function(data){
				alert("서버에 접속 할 수 없습니다. 다시 시도해 주십시오");
			},
			success : function(result){
				var j_html = jQuery.trim(result.msg);
				if(j_html == "success"){
					alert("수정완료했습니다.");
					tabmenuClick1(code_idx);
				}
				//alert(j_html);
		    }
		});
	};
	
	
	
	var code2Modify = function(idx, code_idx, code_first){
		jQuery.ajax({
			type : "POST",
			url : "code2ModifySave.do",
			data : jQuery("#sub"+idx).serialize(),
			dataType : "json",
			cache : false,
			async : true,
			error : function(data){
				alert("서버에 접속 할 수 없습니다. 다시 시도해 주십시오");
			},
			success : function(result){
				var j_html = jQuery.trim(result.msg);
				if(j_html == "success"){
					alert("수정완료했습니다.");
					code1Change2(code_idx, code_first);
				}
				//alert(j_html);
		    }
		});
	};
	
	
	var code1Change = function(indexCd, code1, idx){
		jQuery.ajax({
			type : "POST",
			url : "code2View.do",
			data : {"code_idx" : indexCd, "code_first" : code1},
			dataType : "html",
			cache : false,
			async : true,
			error : function(data){
				alert("서버에 접속 할 수 없습니다. 다시 시도해 주십시오");
			},
			success : function(result){
				var j_html = jQuery.trim(result);
				//alert(j_html);
				jQuery("#tab1").html(j_html);
				
				jQuery(".w60").removeClass("active");
				jQuery("#regionBtn" + idx).addClass("active");
		    }
		});
	};
	
	
	var code1Change2 = function(indexCd, code1){
		jQuery.ajax({
			type : "POST",
			url : "code2View.do",
			data : {"code_idx" : indexCd, "code_first" : code1},
			dataType : "html",
			cache : false,
			async : true,
			error : function(data){
				alert("서버에 접속 할 수 없습니다. 다시 시도해 주십시오");
			},
			success : function(result){
				var j_html = jQuery.trim(result);
				//alert(j_html);
				jQuery("#tab1").html(j_html);
				
		    }
		});
	};
	
</script>
<%@ include file="../bottom.jsp" %>