<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>씨네톡 | 작성 리뷰목록</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="${ctp}/images/cinetalk.ico" rel="shortcut icon" type="image/x-icon">
	<jsp:include page="/include/bs4.jsp" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<style>	
	
		.container-list{
		display: flex;
    flex-direction: column;
    justify-content: center;
    align-content: center;
    flex-wrap: wrap;
		}
		.comment-list{
		width: 650px;
    position: relative;
    height: 250px;
    background-color: white;
    display: flex;
    flex-direction: row-reverse;
    margin-bottom: 20px;
    justify-content: space-between;
	}
	.comment-bottom{
		width: 65%;
		margin-left:20px;
		margin-top:20px;
		margin-right: 20px;
	}
	.comment-writer-img {
		width:50px;
		height: 50px;
		float: left;
		margin-right:10px;
		border-radius: 100%;
		overflow: hidden;
	}
	.comment-writer-img > img {
		width: 100%;
    height: 100%;
    object-fit: cover;
	}
	.comment-top {
		margin-bottom: 10px;
	}
	.review-like{
		font-weight: 900;
		font-family:"Font Awesome 5 Free";
		float:left;
		background: none;
    color: #f74444;
    margin-right: 10px;
	}
		.review-more{
		font-weight: 900;
		font-family:"Font Awesome 5 Free";
		float:right;
		background: none;
		margin-right: 10px;
    border: none;
	}
	
	#review-star-rating {
		position: relative;
		color:#ccc;
		display:inline-block;
		font-size:32pt;
	}
	
	#review-star-rating {
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
	
	#review-star-rating-checked {
		position: absolute;
		color: orange;
		width: 0;
		top:0;
		left: 0;
		overflow:hidden;
		pointer-events: none;
	}
	.comment-top-back{
		width:180px;
		height:100%;
	}
	.comment-top-back > img{
		height:100%;
		width:100%;
	}
	
		.mypage-back{
		position: absolute;
    top: 30px;
    left: -30px;
    width: 105%;
    height: 100%;
    z-index: -10;
    opacity: 0.6;
	}
	.mypage-back > img{
		position: relative;
		object-fit: cover;
    width: 105%;
    height: 95%;
    filter: blur(30px);
	}
	
	a{
		color: inherit !important;
  	text-decoration: none !important;
	}
	
	/*--- 파티클 ---*/
	 #particles-js{ 
	 position:absolute; 
	 width: 105%; height: 100%; 
	 top:30px;
	 left:-30px;
	 z-index:-1;
	 background-color: transparent;
	 background-repeat: no-repeat; background-size: cover; 
	 background-position: 50% 50%; } 
	 /* ---- stats.js ---- */
	  .count-particles{ background: #000022; position: absolute; top: 0; left: 0; width: 80px; color: #13E8E9; font-size: .8em; text-align: left; text-indent: 4px; line-height: 14px; padding-bottom: 2px; font-family: Helvetica, Arial, sans-serif; font-weight: bold; } 
	  .js-count-particles{ font-size: 1.1em; } 
	  #stats, .count-particles{ -webkit-user-select: none; margin-top: 5px; margin-left: 5px; } 
	  #stats{ border-radius: 3px 3px 0 0; overflow: hidden; } 
	  .count-particles{ border-radius: 0 0 3px 3px; }
	  
	</style>
	
	<script>
	$(document).ready(function(){
	particlesJS("particles-js", {"particles":{"number":{"value":80,"density":{"enable":true,"value_area":800}},"color":{"value":"#ffffff"},"shape":{"type":"circle","stroke":{"width":0,"color":"#000000"},"polygon":{"nb_sides":3},"image":{"src":"img/github.svg","width":100,"height":100}},"opacity":{"value":0.7,"random":false,"anim":{"enable":false,"speed":1,"opacity_min":0.2,"sync":false}},"size":{"value":3,"random":true,"anim":{"enable":false,"speed":12.181158184520175,"size_min":0.1,"sync":false}},"line_linked":{"enable":false,"distance":150,"color":"#ffffff","opacity":0.4,"width":1},"move":{"enable":true,"speed":6.413648243462092,"direction":"top-right","random":true,"straight":true,"out_mode":"out","bounce":false,"attract":{"enable":false,"rotateX":600,"rotateY":1200}}},"interactivity":{"detect_on":"canvas","events":{"onhover":{"enable":false,"mode":"repulse"},"onclick":{"enable":true,"mode":"push"},"resize":true},"modes":{"grab":{"distance":400,"line_linked":{"opacity":1}},"bubble":{"distance":400,"size":40,"duration":2,"opacity":8,"speed":3},"repulse":{"distance":200,"duration":0.4},"push":{"particles_nb":4},"remove":{"particles_nb":2}}},"retina_detect":true});
	});
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container-list">
<c:forEach var="vo" items="${rVos}" varStatus="st">
<a href="${ctp}/MoviePage.mo?idx=${vo.movieIdx}">
<c:if test="${vo.context!=''}">
	<div class="comment-list">
	<div class="comment-bottom">
	<div class="comment-writer-img"><img src="${ctp}/images/member/${sPhoto}"></div>
	<div class="comment-top">
		<div class="rating">
			<div class="review-more">
			<div class="review-like"><i class="fas fa-heart fa-sm"></i> ${vo.thumb}</div>
			<div class="review-more"><i class="far fa-ellipsis-v"></i></div>
			</div> 
			<div id="review-star-rating">
				★★★★★
				<span id="review-star-rating-checked" class="review${st.index}">★★★★★</span>
			</div>
			<script>$(".review${st.index}").css("width", ${vo.rating*20}+"%");</script>
		</div>
	<b>${vo.nickName}</b><font color="#ccc"> | ${fn:substring(vo.wDate,0,19)}</font>
	</div>
	<div>${vo.context}</div>
	</div>

<div class="comment-top-back"><img src="${mVos[st.index].poster}"></div>
</div>

</c:if>
</a>
</c:forEach>	
	
<div id="particles-js"><div class="mypage-back"><img src="${ctp}/images/member/${sPhoto}"></div></div>
</div>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>