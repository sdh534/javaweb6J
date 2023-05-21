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

	#star-rating-range{
	 	width: 100%;
		height: 50%;
    position: absolute;
    cursor: pointer;
    top: 10px;
    opacity: 0;
    left: 0;
	}

	#star-rating-empty {
		position: relative;
		color:#ccc;
		display:inline-block;
		font-size:32pt;
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
	
	
	/*미디어 쿼리*/
	
	</style>
	<script>
		'use strict';
	
	</script>

</head>
<body id="movie-main">
<jsp:include page="/include/header.jsp"/>
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
					<span class="fa fa-xl fa-star checked"></span>
					<span class="fa fa-xl fa-star checked"></span>
					<span class="fa fa-xl fa-star checked"></span>
					<span class="fa fa-xl fa-star"></span>
					<span class="fa fa-xl fa-star"></span>
				</div>
			</div>
		<div class="line"></div>
		</div>
		<div class="user-rating">	 <!-- 이부분은...! 전송을 해야 하는 부분... AJAX 처리! -->
			<div id="user-rating-result">평가하기</div>
			<div id="star-rating">
				<div id="star-rating-empty">
					★★★★★
					<span id="star-rating-checked">★★★★★</span>
			  <input type="range" id="star-rating-range" value="0" step="1" min="0" max="10" onclick="rWrite()"/>
				</div>
			</div>
			<div class="line-hr"></div>
			<div class="detail-title ">
				<font style="font-size:17pt;">
				<button id="btn_review" data-toggle="modal" data-target="#reviewModal" class="btn" style="font-size:20pt;">
					<i class="fa-solid fa-pen fa-2xs"></i>&nbsp;&nbsp;코멘트				
				</button>
				<jsp:include page="/WEB-INF/movie/movieReview.jsp"/>
				</font>
			</div>
		</div>
	</div>
	<div class="detail-bottom-container">
		<div class="detail-bottom">
			<div class="detail-movie-content">
				<div class="detail-title" style="font-size:20pt;">기본 정보</div>
				<div class="detail-bottom-text">
				(영제명)<br/>
				(상영 시간) ・ (관람제한)<br/>
				${vo.rYear} ・ ${vo.country}	<br/>
				<br/>
				${vo.story}	
				<br/><br/>
				<hr/>
				<div class="detail-title" style="font-size:20pt;">출연 / 제작</div>
				<!-- 여기 테이블 넣으면 조을거가튼뎅... -->
				</div>
			</div>
		</div>
		</div>
	</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
	  <script>
	     	 	var width=0;
	     	 	let RangeValue = $("#star-rating-checked").val();
		      document.querySelector("#star-rating-range").addEventListener("mousemove",function(event){
		      		width =parseInt((event.offsetX+10)/20)*10;
		         $("#star-rating-checked").css("width", width+"%");
		         
		         $("#star-rating-range").on("click", function(){
			    	  const Toast = Swal.mixin({
			    		    toast: true,
			    		    position: 'center',
			    		    showConfirmButton: false,
			    		    timer: 1350,
			    		    timerProgressBar: true,
			    		    didOpen: (toast) => {
			    		        toast.addEventListener('mouseenter', Swal.stopTimer)
			    		        toast.addEventListener('mouseleave', Swal.resumeTimer)
			    		    }
			    		})
			    		Toast.fire({
			    		    icon: 'success',
			    		    title: '별점이 등록되었어요!'
			    		})
							$("#star-rating-checked").val(width);
				 			$("#user-rating-result").html("★ " + width/20); //이값을 DB로 전송 - AJAX처리 
				     	$("#star-rating-checked").css("width", width+"%");
	
						});
		      });
		      //DB연동하고 AJAX처리한 후에 다시 생각해보자!! 
		         $("#star-rating-checked").css("width", "0");
		    
				</script>
</body>
</html>