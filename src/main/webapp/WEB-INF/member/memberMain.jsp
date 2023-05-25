<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>씨네톡 | 회원 페이지</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="${ctp}/images/cinetalk.ico" rel="shortcut icon" type="image/x-icon">
	<jsp:include page="/include/bs4.jsp" />
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
		width: 600px;
		height: 100%;
		background-color: white;
		margin: 0px auto;
		position: relative;
		display:flex;
		flex-direction: column;
	}
	
	.title {
		padding: 30px 25px 10px;
	}
	
	.cinema {
		margin-bottom: 0;
		color: #aaa;
		font-size: 22px;
	}
	.seiral{
	 	height: 180px;
	}
	.movie-title {
		font-family: 'PyeongChangPeace-Bold';
		font-size: 50px;
		float:left;
	}
	.logout{
		float:right;
		display:flex;
		flex-direction: column;
		flex-wrap: wrap;
    transform: translateY(-20px);
	}
	.logout > span {
		font-family: 'NEXON Lv1 Gothic OTF';
		letter-spacing: 15px;
    text-align: center;
    margin-left: 18px;
    transform: translateY(-10px);
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
		height: 180px;
		}
		table {
			border-collapse: collapse;
			margin: 0 auto;
		
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
		width: 600px;
	}
	.tooltip .arrow:before {
    border-top-color: #f74444 !important;
}

	.tooltip .tooltip-inner {
	  background-color: #f74444;
	}
	.swal2-styled.swal2-confirm{
		background-color: #f74444;
	}
	.swal2-styled.swal2-deny{
	 	background-color: #aaa;
	}
	.mypage-back{
		position: absolute;
    top: 30px;
    left: -30px;
    width: 105%;
    height: 105%;
    z-index: -10;
    opacity: 0.6;
	}
	.mypage-back > img{
		position: relative;
		object-fit: cover;
    width: 105%;
    height: 105%;
    filter: blur(30px);
	}
	
	#edit-profile{
		background:transparent;
		border:none;
		width:50px;
	}
	
	/*--- 파티클 ---*/
	 #particles-js{ 
	 position:absolute; 
	 width: 105%; height: 800px; 
	 top:30px;
	 left:-30px;
	 z-index:-1;
	 background-color: transparent;
	 background-repeat: no-repeat; background-size: cover; 
	 background-position: 50% 50%; } 
	 /* ---- stats.js ---- */
	  .count-particles{ background: #000022; position: absolute; top: 48px; left: 0; width: 80px; color: #13E8E9; font-size: .8em; text-align: left; text-indent: 4px; line-height: 14px; padding-bottom: 2px; font-family: Helvetica, Arial, sans-serif; font-weight: bold; } 
	  .js-count-particles{ font-size: 1.1em; } 
	  #stats, .count-particles{ -webkit-user-select: none; margin-top: 5px; margin-left: 5px; } 
	  #stats{ border-radius: 3px 3px 0 0; overflow: hidden; } 
	  .count-particles{ border-radius: 0 0 3px 3px; }
	</style>
	<script>
		'use strict';
		
		$(document).ready(function(){
			$('[data-toggle="tooltip"]').tooltip();
			
			particlesJS("particles-js", {"particles":{"number":{"value":80,"density":{"enable":true,"value_area":800}},"color":{"value":"#ffffff"},"shape":{"type":"circle","stroke":{"width":0,"color":"#000000"},"polygon":{"nb_sides":3},"image":{"src":"img/github.svg","width":100,"height":100}},"opacity":{"value":0.7,"random":false,"anim":{"enable":false,"speed":1,"opacity_min":0.2,"sync":false}},"size":{"value":3,"random":true,"anim":{"enable":false,"speed":12.181158184520175,"size_min":0.1,"sync":false}},"line_linked":{"enable":false,"distance":150,"color":"#ffffff","opacity":0.4,"width":1},"move":{"enable":true,"speed":6.413648243462092,"direction":"top-right","random":true,"straight":true,"out_mode":"out","bounce":false,"attract":{"enable":false,"rotateX":600,"rotateY":1200}}},"interactivity":{"detect_on":"canvas","events":{"onhover":{"enable":false,"mode":"repulse"},"onclick":{"enable":true,"mode":"push"},"resize":true},"modes":{"grab":{"distance":400,"line_linked":{"opacity":1}},"bubble":{"distance":400,"size":40,"duration":2,"opacity":8,"speed":3},"repulse":{"distance":200,"duration":0.4},"push":{"particles_nb":4},"remove":{"particles_nb":2}}},"retina_detect":true});
		});
		function logout(){
			Swal.fire({
				  title: '로그아웃 하시겠습니까?',
				  showDenyButton: true,
				  confirmButtonText: '확인',
				  denyButtonText: '취소',
				}).then((result) => {
				  if (result.isConfirmed) {
				    $.ajax({
				    	type: "post",
							url: "${ctp}/MemberLogoutOk.mem",
							success: function(res){
							if(res==1){
								Swal.fire({
									width:500,
								  position: 'center',
								  icon: 'success',
								  title: '로그아웃 되었습니다!',
								  showConfirmButton: false,
								  timer: 1500
								})
								setTimeout(function(){location.href="${ctp}/Main";},1500);
							}
						}
				    });
				  }
				})
			
		}
		
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
<div class="ticket">
	<div class="title">
		<p class="cinema">MY PAGE</p>
		<p class="movie-title">${vo.nickName}
		<button id="edit-profile"><i class="far fa-edit fa-2xs" style="color:#ccc;"></i></button>
		</p>
		<div class="logout">
			 <button type="button" id="logout" class="btn" onclick="logout()">
			 	<img src="${ctp}/images/barcode.png" style="width:150px"/>
			 </button>
			<span>로그아웃</span>
		</div>
	</div>
		<form name="profileForm" method="post" action="${ctp}/MemberPhotoUpdate.mem" enctype="multipart/form-data">
		<div class="profile-photo" >
		  
			<input type="file" name="profile" id="profile" accept=".png, .jpg, .gif, .jpeg" style="display:none" onchange="uploadImage()"/>
			<div data-toggle="tooltip" data-html="true" data-placement="top" title="프로필 사진을 <br/> 등록해보세요!">
			<div class="upload-btn"  onclick="onclick=document.profileForm.profile.click();"><i class="fa-solid fa-gear fa-2xl" style="color: #000000;"></i></div>
			</div>
			<div class="mypage-poster"> 
				<c:if test="${vo.photo!='noimage.jpg'}"><img src="${ctp}/images/member/${vo.photo}"></c:if>
				<c:if test="${vo.photo=='noimage.jpg'}"><img src="${ctp}/images/noimage.jpg"></c:if>
			</div>
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
			<td class="bigger"><a href="${ctp}/MemberReviewList.mem">${rCnt}</a></td>
			<td class="bigger">${vo.m_level}</td>
			<td >${vo.m_genre}</td>
		</tr>
	</table>
	<table>
		<tr>
			<th>평가 영화수</th>
			<th>별점 평균</th>
			<th>누적 시간</th>
		</tr>
		<tr>
			<td class="bigger">${mCnt}</td>
			<td><font size="5pt">⭐</font> 4.5</td>
			<td>19:30</td>
		</tr>
	</table>
	</div>
	<div class="holes-lower"></div>
	<div class="serial">
		<table class="info">
			<tr>
			<td class="bigger">✒소개글</td>
			</tr>
			</table>
	</div>
</div>
 
<!-- stats.js lib -->
<div id="particles-js"><div class="mypage-back"><img src="${ctp}/images/member/${vo.photo}"></div></div>
</div>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>