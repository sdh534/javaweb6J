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
	.mypage-poster > img{ 
	text-align: center; 
  width: 100%;
  height: 100%;
  object-fit: cover;
	background-position:center;
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
	.mypage-poster{
		height: 300px;
	}
	.profile-photo{
		position:relative;
		width: 660px;
	}
	</style>
	<script>
		'use strict';
		function uploadImage(){
	    let profile = profileForm.profile.value;
	    let ext = profile.substring(profile.lastIndexOf(".")+1).toUpperCase();
			let maxSize = 1024 * 1024 * 10; // 업로드 가능파일은 5MB
			
			var form = $("#profileForm")[0];
			var formData = new FormData(form);
			console.log(formData);
			formData.append("profile", $("#profile")[0].files[0]);
			
			let fileSize = document.getElementById("profile").files[0].size;
			if(fileSize > maxSize) {
				alert("업로드할 파일의 최대용량은 5MByte 입니다.")
			}
			$(document).ready(function(){
				$.ajax({
					url: "${ctp}/MemberPhotoUpdate.mem",
					enctype: 'multipart/form-data',
			    contentType:  false,
			    processData: false,
			    type: 'POST', 
			    data: formData,
			    success: function() {
					Swal.fire({
						width:500,
					  position: 'center',
					  icon: 'success',
					  title: '업로드 성공!',
					  showConfirmButton: false,
					  timer: 1500
					})
					setTimeout(function(){location.reload();},1500);
			    },
					error: function(){
						console.log('error');
					}
				}); 
					//profileForm.submit();
			});
			
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/include/loginCheck.jsp"/>
<div class="container">
		<!--
Inspired by: https://dribbble.com/shots/1166639-Movie-Ticket/attachments/152161
-->
<div class="ticket">
	<div class="title">
		<p class="cinema">MY PAGE</p>
		<p class="movie-title">${vo.nickName}</p>
	</div>
		<form name="profileForm" method="post" action="${ctp}/MemberPhotoUpdate.mem" enctype="multipart/form-data">
		<div class="profile-photo" >
			<input type="file" name="profile" id="profile" accept=".png, .jpg, .gif, .jpeg" style="display:none" onchange="uploadImage()"/>
			<div class="upload-btn"  onclick="onclick=document.profileForm.profile.click();"><i class="fa-solid fa-gear fa-2xl" style="color: #000000;"></i></div>
			<div class="mypage-poster"> <img src="${ctp}/images/member/${vo.photo}"></div>
		</div>
		</form>
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