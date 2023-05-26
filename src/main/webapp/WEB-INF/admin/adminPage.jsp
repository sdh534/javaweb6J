<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/include/bs4.jsp" />
	<title>씨네톡 | 관리자</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="${ctp}/images/cinetalk.ico" rel="shortcut icon" type="image/x-icon">
	<style>
		.adminLayout{
			display:flex;
			flex-direction:row;
		}
		.adminLeft{
			background-color: #13171b;
	    width: 15%;
		}
		.adminRight{
			width: 85%;
		}
	</style>
	<script>
		'use strict'
		$(document).ready(function(){
			home();
		});
		function home(){
			$("#adminContent").load("${ctp}/AdminHome.ad");
		}
		function reviewList(){
			$("#adminContent").load("${ctp}/AdminReviewList.ad");
		}
		function memberList(){
			$("#adminContent").load("${ctp}/AdminMemberList.ad");
		}
		function reviewListPaging(pageSize, pag){
			$("#adminContent").load("${ctp}/AdminReviewList.ad?pageSize="+pageSize+"&pag="+pag);
		}
		function memberListPaging(pageSize, pag){
			$("#adminContent").load("${ctp}/AdminMemberList.ad?pageSize="+pageSize+"&pag="+pag);
		}
   function pageCheck(pag) {
    	let pageSize = document.getElementById("pageSize").value;
    	$("#adminContent").load("${ctp}/AdminReviewList.ad?pag="+pag+"&pageSize="+pageSize);
    }
   function mPageCheck(pag) {
    	let pageSize = document.getElementById("pageSize").value;
    	$("#adminContent").load("${ctp}/AdminMemberList.ad?pag="+pag+"&pageSize="+pageSize);
    }
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<div class="adminLayout">
	<jsp:include page="/WEB-INF/admin/adminLeft.jsp"/>
	<div class="adminRight">
		<div id="adminContent"></div>
	</div>
</div>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>