<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<style>
	.cast-person{
		margin-top:15px;
		display:flex;
		width:300px;
		flex-direction:row;
		margin:10px;
		padding:10px;
		border-bottom: 1px solid #ddd;
	}
	.cast-img{
		margin-right:15px;
	}
	.cast-name{
		font-size:15pt;
	}
	.actorList{
		display: flex;
		flex-direction: column;
	}
	.actor-line-change{
		display: flex;
		flex-direction: row;
		justify-content: center;
	}
</style>

<div class="actor-line-change">
<c:set var="actor" value="${fn:split(vo.actor, '/')}"></c:set>
<div class="actorList">
<div class="cast-person">
		<div class="cast-img"><img src="${ctp}/images/member/noimage.png" width="50px"/></div>
		<div class="cast-text">
			<div class="cast-name"><b>${vo.director}</b></div>
			<div class="cast-sort"><font color="#ccc">감독</font></div>
		</div>
		<hr/>
	</div>
	<c:forEach var="actorValue" items="${actor}" begin="0" end="6" step="1" varStatus="st">
	<c:if test="${st.count % 4 ==0 }"></div><div class="actorList"></c:if>
		<div class="cast-person">
			<div class="cast-img"><img src="${ctp}/images/member/noimage.png" width="50px"/></div>
			<div class="cast-text">
				<div class="cast-name"><b>${actorValue}</b></div>
				<div class="cast-sort"><font color="#ccc">배우</font></div>
			</div>
			<hr/>
		</div>
	</c:forEach>
	</div></div>
