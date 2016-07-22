<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.util.Date, java.text.*, java.io.*, java.net.*, project.config.util.*"%>
<%
	List<Map<String, Object>> indexCodeList = (List<Map<String, Object>>)request.getAttribute("indexCodeList");
	List<Map<String, Object>> code1List = (List<Map<String, Object>>)request.getAttribute("code1List");
	
	
	List<Map<String, Object>> code2List = (List<Map<String, Object>>)request.getAttribute("code2List");
	
	String code1Name = RsUtil.checkNull(request.getAttribute("code1Name"));
	String code_idx = RsUtil.checkNull(request.getAttribute("code_idx"));
	String code_first = RsUtil.checkNull(request.getAttribute("code_first"));
	
	String indexCdName = RsUtil.checkNull(request.getAttribute("indexCdName"));

%>
<% if(code_idx.equals("01")){ %>
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
          
           
         <%--  <select name="" id="" style="width:70px;">
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
	                      <form name="sidoSub" id="sidoSub" class="fr">
	                      	<input type="hidden" name="code_idx" value="<%=code_idx%>" />
	                      	<input type="hidden" name="code_first" value="<%=code_first%>" />
					          <input type="text" class="inputTxt" name="code_codeName" style="width:120px;" /> 
					          <input value="등록" type="button" class="btns01 mgr10" onclick="code1Savesido('<%=code_idx%>', '<%=code_first%>')" />
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
<% }else{ %>
	<div class="tabbertab tabbertabhide" title="" style="display:block;">
		
        <h2><%=indexCdName%></h2>
        <div class="tabberlive" id="tab1-1"><ul class="tabbernav"></ul> 
        <table class="bbs_list01 mgt30 mgb10" style="width:945px;">
          <caption>
          <%=indexCdName%>
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
              <th colspan="9" class="agr"><div class="fl mgl20"><%=indexCdName%></div>
                <!-- <input type="text" class="inputTxt" style="width:120px;"> <input value="" type="button" class="btns01 mgr10"> -->
                <form name="sidoSub" id="sidoSub" class="fr">
	                      	<input type="hidden" name="code_idx" value="<%=code_idx%>" />
					          <input type="text" class="inputTxt" name="code_codeName" style="width:120px;" /> 
					          <input value="등록" type="button" class="btns01 mgr10" onclick="code1Savesido('<%=code_idx%>')" />
				          </form>
                </th>
            </tr>
          </thead>
          <tbody>
            <% if(code1List != null && code1List.size() > 0){ %>
                  		<tr>
		            	<% for(int i=0; i<code1List.size(); i++){ int j=i; %>
		            		 
		                      <td>
		                      	<form name="sub<%=i%>" id="sub<%=i%>">
		                      		<input type="hidden" name="code_idx" value="<%=code_idx%>" />
		                      		<input type="hidden" name="code_first" value="<%=RsUtil.checkNull(code1List.get(i).get("CODE_FIRST"))%>" />
		                      		<b><input type="text" name="code_codeName" value="<%=RsUtil.checkNull(code1List.get(i).get("CODE_CODENAME"))%>"style="width:50px;" /></b>
		                      	</form>
		                      </td>
		                      <td><%=RsUtil.checkNull(code1List.get(i).get("USENAME"))%></td>
		                      <td>
		                      	<input value="<%=RsUtil.checkNull(code1List.get(i).get("BTNNAME"))%>" type="button" class="<%=RsUtil.checkNull(code1List.get(i).get("BTNCLNAME"))%>" onclick="code1UseSave('<%=RsUtil.checkNull(code1List.get(i).get("CODE_IDX"))%>', '<%=RsUtil.checkNull(code1List.get(i).get("CODE_FIRST"))%>', '<%=RsUtil.checkNull(code1List.get(i).get("CODE_ISUSE"))%>')" /> 
		                      	<input value="수정" type="button" class="btns" onclick="code1Modify('<%=i%>', '<%=code_idx%>')" />
		
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
<% } %>
