<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String memberMid = session.getAttribute("sMid")==null ? "" : (String)session.getAttribute("sMid");
	if(memberMid.equals("")){
%>
<script>
	Swal.fire({
		  icon: 'error',
		  title: 'Oops...',
		  text: '잘못된 접근입니다.',
		  footer: '<a href="">로그인</a>'
		})
	location.href="${pageContext.request.contextPath}/";
</script>
<%}%>