<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<style>
	@font-face {
	    font-family: 'PyeongChangPeace-Bold';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-02@1.0/PyeongChangPeace-Bold.woff2') format('woff2');
	    font-weight: 700;
	    font-style: normal;
	}
	.mypage-poster{ 
	text-align: center; 
	width:auto;
	height:300px;
	background-size:cover;
	background-position:center;
	background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/25240/only-god-forgives.jpg");
	}
	
	.ticket {
		width: 60%;
		height: 100%;
		background-color: white;
		margin: 5px auto;
		position: relative;
	}
	
	.title {
		padding: 30px 25px 10px;
	}
	
	.cinema {
		margin-bottom: 0;
		color: #aaa;
		font-size: 22px;
	}
	
	.movie-title {
		font-family: 'PyeongChangPeace-Bold';
		font-size: 50px;
	}
	.info {
		font-family: "GmarketSansMedium";
		padding: 15px 25px;
	}
	table {
		width: 100%;
		font-size: 18px;
		margin-bottom: 15px;
		
		tr {
			margin-bottom: 10px;
		}
		
		th:nth-of-type(1) {
			text-align: left;
			width: 18%;
		}
		th:nth-of-type(2) {
			width: 40%;
		}
		th:nth-of-type(3) {
			width: 15%;
		}
		}
		
		td {
			width: 33%;
			font-size: 32px;
		}
	}
	.bigger {
		font-size: 48px;
	}
	.serial {
		padding: 25px;
		table {
			border-collapse: collapse;
			margin: 0 auto;
		}
		td {
			width: 3px;
			height: 50px;
		}
	}
	.numbers {
		td {
			font-size: 16px;
			text-align: center;
		}
	}
	.upload-btn{
		width:50px;
		height:50px;
		cursor: pointer;
		position:absolute;
		top:15px;
		right:-5px;
	}
	.profile-photo{
		position:relative;
	}
	</style>
	<script>
		'use strict';
		
		function uploadImage(){
	    let fName = uploadform.profile.value;

			$.ajax({
				url: '${ctp}/MemberPhotoUpadte.mem',
				type: 'POST',
				data: fName,
				contentType: false,
				processData: false,
				success: function(){
					alert:("프로필 사진이 업데이트 되었습니다.;")
				}
			});
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<div class="container">
		<!--
Inspired by: https://dribbble.com/shots/1166639-Movie-Ticket/attachments/152161
-->
<div class="ticket">
	<div class="title">
		<p class="cinema">MY PAGE</p>
		<p class="movie-title">${vo.nickName}</p>
	</div>
	<div class="profile-photo" >
		<form name="uploadform" enctype="multipart/form-data">
			<input type="file" name="profile" id="profile" accept=".png, .jpg, .gif, .jpeg" style="display:none" onchange="uploadImage()"/>
			<div class="upload-btn"  onclick="onclick=document.uploadform.profile.click();"><i class="fa-solid fa-gear fa-2xl" style="color: #000000;"></i></div>
			<div class="mypage-poster">
			</div>
		</form>
	</div>
	<div class="info">
	<table>
		<tr>
			<th>작성 리뷰수</th>
			<th>등급</th>
			<th>선호 장르</th>
		</tr>
		<tr>
			<td class="bigger">0</td>
			<td class="bigger">${vo.m_level}</td>
			<td >${vo.m_genre}</td>
		</tr>
	</table>
	<table>
		<tr>
			<th>별점 평균</th>
			<th>감상 시간</th>
		</tr>
		<tr>
			<td><font size="5pt">⭐</font> 4.5</td>
			<td>19:30</td>
		</tr>
	</table>
	</div>
	<div class="holes-lower"></div>
	<div class="serial">
		<table class="info"><tr></tr></table>
			<tr>
				<tr>
			<td class="bigger">소개글</td>
			</tr>
	</div>
</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>