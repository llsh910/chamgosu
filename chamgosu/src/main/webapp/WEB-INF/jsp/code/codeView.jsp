<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>
<%
	//코드 메인 페이지
	
	List<Map<String, Object>> indexCodeList = (List<Map<String, Object>>)request.getAttribute("indexCodeList");
	List<Map<String, Object>> code1List = (List<Map<String, Object>>)request.getAttribute("code1List");
	
	out.println("codeView jsp");
%>

<script type="text/javascript">

</script>
<%@ include file="../bottom.jsp" %>