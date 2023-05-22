<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%	String sMid = session.getAttribute("sMid")==null ? "" : (String)session.getAttribute("sMid"); %>
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
	#movie-main{
		background-color: #eee;
	}
	.detail-top{
		width:100%;
		height: 200px;
		background-color: white;
		border-bottom: 1.5px solid #ddd;
	}
	.detail-movie-top, .detail-bottom-container{
		margin-left:10%;
		margin-right:10%;
	}
	.detail-trailer{
			position: relative;
			width:100%;
			height:270px;
			background-color: blue;
		}
	.detail-poster{
		width:200px;
		float:left;
		margin-right:30px;
		margin-left:40px;
		transform: translateY(-160px);
	}
	.poster-img > img{
		width:100%;
		border: 4px solid white;
		border-radius: 7px;
	}
	.detail-text{
		display:inline-block;
		font-family: 'NEXON Lv1 Gothic OTF';
		padding-top: 15px;
		float:left;
		margin-right: 40px;
	}
	
	.detail-title {
		font-family: 'NEXON Lv1 Gothic OTF';
		font-weight: 1000;
	}
	#rating-result, #star-rating-result, #user-result{
		color: #aaa;
	}
	.bigger {
		font-size: 38px;
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
	.detail-movie-content{}
	.detail-bottom{
		background-color: white;
		display:flex;
		margin:30px;		
		padding:40px;
		border-radius: 7px;
		overflow: auto;
    padding: 40px;
	}
	.detail-bottom-text{
		width:100%;
		font-family: 'NEXON Lv1 Gothic OTF';
		padding-top: 15px;
		float:left;
	}
	.line{
		height: 160px;
    width: 1px;
    float: left;
    margin-top: 15px;
    background-color: #ccc;
    margin-right:40px;
	}
	.line-hr{
		height: 1px;
    width: 350px;
    float: left;
    margin-top: 15px;
    background-color: #ccc;
    margin-bottom:5px;
	}
	.detail-top-bottom{
		display: flex;
    flex-direction: column;
    flex-wrap: wrap;
    align-content: center;
	}
	/*      별점 레이팅          */
	.user-rating{
		margin-top: 15px;
	  font-family: 'NEXON Lv1 Gothic OTF';
    float: left;
    width: 320px;
    text-align: center;
    display: flex;
    flex-direction: column;
   }
	#user-rating-result{
		clear:both;
		margin-bottom:5px;
	}

	#starRatingValue, #movie-star-rating-checked{
	 	width: 100%;
		height: 100%;
    position: absolute;
    cursor: pointer;
    top: 10px;
    opacity: 0;
    left: 0;
	}
	#movie-star-rating-checked{
    top: 0;
    opacity:100;
    cursor: auto;
	}
	#star-rating-empty, #movie-star-rating {
		position: relative;
		color:#ccc;
		display:inline-block;
		font-size:32pt;
	}
	
	#movie-star-rating {
		font-size:16pt;
	}
	
	#star-rating-empty > span {
		position: absolute;
		color: orange;
		width: 0;
		top:0;
		left: 0;
		overflow:hidden;
		pointer-events: none;
	}
	
	#movie-star-rating-checked {
		position: absolute;
		color: orange;
		width: 0;
		top:0;
		left: 0;
		overflow:hidden;
		pointer-events: none;
	}
	
	
	/*미디어 쿼리*/
	
	</style>
<script>
	'use strict';
	$(document).ready(function(){
		
    $('#reviewModal').on('show.bs.modal', function (event) {
          var movieIdx = ${vo.idx};
      })
		
	});
  $("#movie-star-rating-checked").css("width", ${vo.rating}+"%");
  
	function rCheck(){
		let star = $("#starRatingValue").val();
		
		let query = {
			movieIdx : ${vo.idx},
			mid : "${sMid}",
			nickName : "${sNickName}",
			star : star
		}
		//이곳에 AJAX를 하나 더 추가 / DB에 저장된 값과 동일한 값을 클릭하면 별점이 삭제되도록, 단 코멘트가 있을 경우 삭제해서는 안됨 
		
		$.ajax({
			type: "post",
			url: "${ctp}/ReviewStarOk.re",
			data: query,
			success: function(res){
				if(res=="0") {
					Swal.fire({
						width:500,
					  position: 'center',
					  icon: 'error',
					  title: '별점 등록에 실패했습니다. 다시 시도해주세요',
					  showConfirmButton: false,
					  timer: 1500
					})
				}
				else if(res=="1") {
					Swal.fire({
						width:500,
					  position: 'center',
					  icon: 'success',
					  title: '별점이 성공적으로 등록되었습니다.',
					  showConfirmButton: false,
					  timer: 1500
					})
					setTimeout(function(){location.reload();},1500);
				}
			},
		error: function(){
			alert("전송오류");
		}
		});
		
}
		
</script>
</head>
<body id="movie-main">
<jsp:include page="/include/header.jsp"/>
<jsp:include page="/WEB-INF/review/movieReview.jsp"/>
	<div class="detail-trailer"></div>
	<div class="detail-top-bottom">
	<div class="detail-top">
		<div class="detail-movie-top">
			<div class="detail-poster"><div class="poster-img"><img src="${vo.poster}" alt="${vo.title}"></div></div>
			<div class="detail-text">
				<div class="detail-title bigger">${vo.title}</div>
				<div class="detail-content">${vo.rYear}・${vo.genre}・${vo.country}</div>
				<div class="rating"> 
					<div id="rating-result">별점</div>
					<div id="movie-star-rating">
						★★★★★
						<span id="movie-star-rating-checked">★★★★★</span>
					</div>
						&nbsp; &nbsp; <font size="4pt">${vo.rating}점</font>
						<script>$("#movie-star-rating-checked").css("width", ${vo.rating*20}+"%");</script>
				</div>
			</div>
		<div class="line"></div>
		</div>
		<div class="user-rating">	 <!-- 이부분은...! 전송을 해야 하는 부분... AJAX 처리! -->
			<div id="user-rating-result">
			<c:if test="${memberRVo.rating ==null }">평가하기</c:if>
			<c:if test="${memberRVo.rating !=null }">★ ${memberRVo.rating}</c:if>
			</div>
			<form name="starRating">
				<div id="star-rating">
					<div id="star-rating-empty">
						★★★★★
						<span id="star-rating-checked">★★★★★</span>
						<c:if test="${memberRVo.rating ==null }">
				  		<input type="range" name="starRatingValue" id="starRatingValue" value="0" step="1" min="0" max="10" onclick="rCheck()"/>
				  	</c:if>
						<c:if test="${memberRVo.rating !=null }">
				  		<input type="range" name="starRatingValue" id="starRatingValue" value="${memberRVo.rating}" step="1" min="0" max="10" onclick="rCheck()"/>
				  	</c:if>
					</div>
				</div>
			</form>
			<div class="line-hr"></div>
			<div class="detail-title">
				<font style="font-size:17pt;">
				<button id="btn_review" data-toggle="modal" data-target="#reviewModal" class="btn" style="font-size:20pt;">
					<i class="fa-solid fa-pen fa-2xs"></i>&nbsp;&nbsp;코멘트				
				</button>
				</font>
			</div>
		</div>
	</div>
	<div class="detail-bottom-container">
		<div class="detail-bottom">
			<div class="detail-movie-content">
				<div class="detail-title" style="font-size:20pt;">기본 정보</div>
				<div class="detail-bottom-text">
					${vo.runtime}분 | ${vo.rYear}년 ・ ${vo.country}	<br/>
					<br/>
					${vo.story}	
					<br/><br/>
					<hr/>
					<div class="detail-title" style="font-size:20pt;">출연 / 제작</div>
					<!-- 여기 테이블 넣으면 조을거가튼뎅... -->
					<br/><br/>
					<hr/>
					<div class="detail-title" style="font-size:20pt;">코멘트</div>
					<jsp:include page="/WEB-INF/review/movieReview.jsp"/>
					
				</div>
				</div>
			</div>
		</div>
		</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
  <script>
   	 	let width=0;
   	 	let RangeValue = $("#star-rating-checked").val();
  		width = ${memberRVo.rating*20};
      $("#star-rating-checked").css("width", width+"%");
      document.querySelector("#starRatingValue").addEventListener("mousemove",function(event){
	      	width =parseInt((event.offsetX+10)/20)*10;
	        $("#star-rating-checked").css("width", width+"%");
				 		$("#user-rating-result").html("★ " + width/20); //이값을 DB로 전송 - AJAX처리 
	         
	        $("#starRatingValue").on("click", function(){
						$("#star-rating-checked").val(width);
				    $("#star-rating-checked").css("width", width+"%");
				});
      });
      document.querySelector("#starRatingValue").addEventListener("mouseleave",function(event){
          $("#star-rating-checked").css("width", ${memberRVo.rating*20}+"%");
				 		$("#user-rating-result").html("★ " + ${memberRVo.rating}); //이값을 DB로 전송 - AJAX처리 
      });
	</script>
</body>
</html>