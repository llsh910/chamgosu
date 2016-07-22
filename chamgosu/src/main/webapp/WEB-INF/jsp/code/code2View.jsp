<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.util.Date, java.text.*, java.io.*, java.net.*, project.config.util.*"%>
<%
	List<Map<String, Object>> code2List = (List<Map<String, Object>>)request.getAttribute("code2View");
	String code1Name = RsUtil.checkNull(request.getAttribute("code1Name"));
	String code_idx = RsUtil.checkNull(request.getAttribute("code_idx"));
	String code_first = RsUtil.checkNull(request.getAttribute("code_first"));
	
%>

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