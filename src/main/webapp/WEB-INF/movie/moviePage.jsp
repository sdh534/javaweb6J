<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>씨네톡 | ${vo.title}</title>
	<jsp:include page="/include/bs4.jsp" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="${ctp}/images/cinetalk.ico" rel="shortcut icon" type="image/x-icon">
	
	<style>
	@font-face {
    font-family: 'NEXON Lv1 Gothic OTF';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	.detail-top{
		height: 500px;
	}
	.detail-movie-top{
	
	}
	.detail-trailer{
			position: relative;
			width:100%;
			height:270px;
			background-color: blue;
		}
	.detail-poster{
		position: absolute;
		top:250px;
		padding-left:5%;
		margin-right:10px;
	}
	.poster-img > img{
		width:80%;
		border: 4px solid white;
		border-radius: 7px;
	}
	.detail-text{
		width:450px;
		font-family: 'NEXON Lv1 Gothic OTF';
		margin-left: 280px;
		padding-top: 15px;
		float:left;
	}
	
	.detail-title {
		font-weight: 1000;
	}
	#rating-result, #star-rating-result, #user-result{
		color: #aaa;
	}
	.bigger {
		font-size: 48px;
	}
	.checked {
  color: orange;
	}
	
	.user-rating {
		font-family: 'NEXON Lv1 Gothic OTF';
		float:right;
	}
	input[type=checkbox], input[type=radio]{
		width:30px;
		height:30px;
	}
	/*      별점 레이팅          */
	</style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
	<div class="detail-trailer"></div>
<div class="container">
<div class="detail-top">
	<div class="detail-movie-top">
	<div class="detail-poster"><div class="poster-img"><img src="${vo.poster}" alt="${vo.title}"></div></div>
	<div class="detail-text">
		<div class="detail-title bigger">${vo.title}</div>
		<div class="detail-content">${vo.rYear}・${vo.genre}・${vo.country}</div>
		<div class="rating"> 
			<div id="rating-result">별점</div>
			<span class="fa fa-xl fa-star checked"></span>
			<span class="fa fa-xl fa-star checked"></span>
			<span class="fa fa-xl fa-star checked"></span>
			<span class="fa fa-xl fa-star"></span>
			<span class="fa fa-xl fa-star"></span>
		</div>
	</div></div>
		<div class="user-rating">	 <!-- 이부분은...! 전송을 해야 하는 부분... AJAX 처리! -->
			<div id="user-result">평가하기</div>
				<div class="startRadio">
					<label class="startRadio__box">
						<input type="radio" name="star" id="">
						<span class="startRadio__img"><span class="blind">별 1개</span></span>
					</label>
					<label class="startRadio__box">
						<input type="radio" name="star" id="">
						<span class="startRadio__img"><span class="blind">별 1.5개</span></span>
					</label>
					<label class="startRadio__box">
						<input type="radio" name="star" id="">
						<span class="startRadio__img"><span class="blind">별 2개</span></span>
					</label>
					<label class="startRadio__box">
						<input type="radio" name="star" id="">
						<span class="startRadio__img"><span class="blind">별 2.5개</span></span>
					</label>
					<label class="startRadio__box">
						<input type="radio" name="star" id="">
						<span class="startRadio__img"><span class="blind">별 3개</span></span>
					</label>
					<label class="startRadio__box">
						<input type="radio" name="star" id="">
						<span class="startRadio__img"><span class="blind">별 3.5개</span></span>
					</label>
					<label class="startRadio__box">
						<input type="radio" name="star" id="">
						<span class="startRadio__img"><span class="blind">별 4개</span></span>
					</label>
					<label class="startRadio__box">
						<input type="radio" name="star" id="">
						<span class="startRadio__img"><span class="blind">별 4.5개</span></span>
					</label>
					<label class="startRadio__box">
						<input type="radio" name="star" id="">
						<span class="startRadio__img"><span class="blind">별 5개</span></span>
					</label>
					<label class="startRadio__box">
						<input type="radio" name="star" id="">
						<span class="startRadio__img"><span class="blind">별 5.5개</span></span>
					</label>
				</div>
			</div>
	</div>

		
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>