<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>study2</title>
	<jsp:include page="/include/bs4.jsp" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
		<h2>나와라 얍</h2>
		<p>${str}</p>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>