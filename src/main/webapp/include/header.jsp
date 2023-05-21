<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<jsp:include page="/include/header_home.jsp"/>

<!-- 로그인&회원가입 모달 -->
<jsp:include page="/WEB-INF/member/memberLogin.jsp"/>
<jsp:include page="/WEB-INF/member/memberJoin.jsp"/>