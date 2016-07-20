<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>
<%
	List<Map<String, Object>> leaderList = (List<Map<String, Object>>)request.getAttribute("leaderList");

	Map<String, Object> pageInfo = (Map<String, Object>)request.getAttribute("pageInfo");
	String page_index = RsUtil.checkNull(pageInfo.get("page_index"));
	String totalCount = RsUtil.checkNull(pageInfo.get("totalCount"));
	String per_page = RsUtil.checkNull(pageInfo.get("per_page"));
	if(page_index.equals("")) page_index = "1";
%>

<%@ include file="../bottom.jsp" %>