<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String errorMsg = (String)session.getAttribute("errorMsg");
	if(errorMsg!=null){
%>
<script type="text/javascript">
	alert('<%=errorMsg%>');
</script>
<%} %>
<meta http-equiv="refresh" content="1;URL=http://121.40.248.99:80/bcc_gaoxy/">