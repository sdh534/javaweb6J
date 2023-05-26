<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
	<div class="adminLeft">
			<ul class="nav flex-column">
		    <li class="nav-item">
		      <a class="nav-link" href="javascript:home()">홈</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="javascript:reviewList()">리뷰 리스트</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="javascript:memberList()">회원 리스트</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" href="#">영화DB 조회</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link disabled" href="#">로그아웃</a>
		    </li>
  		</ul>
	</div>