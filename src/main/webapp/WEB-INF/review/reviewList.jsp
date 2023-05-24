<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<script>
	//리뷰 좋아요

	//더보기 - 신고 / 수정 팝업 구현 
</script>
<style>
	.comment-list{
		width: 100%;
		height: auto;
		background-color:white;
		border: 1.5px solid #eee;
		border-radius: 10px;
		padding:20px;
		float: left;
		margin-bottom:10px;
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
    border: 1px solid #f74444;
    border-radius: 10px;
    color: #f74444;
    margin-right: 10px;
	}
	.review-like:hover{
		background: #f74444;
    border: 1px solid #f74444;
    border-radius: 10px;
    color: white;
    margin-right: 10px;
	}
		.review-more{
		font-weight: 900;
		font-family:"Font Awesome 5 Free";
		float:right;
		background: none;
    border: none;
	}
</style>
<script>
	'use strict';
	function likeReview(reviewIdx){
		console.log(reviewIdx);
		$.ajax({
			type: "post",
			url: "${ctp}/ReviewLikeCheck.re",
			data: {idx: reviewIdx},
			success:function(res){
				if(res=="0") {
					Swal.fire({
						width:500,
					  position: 'center',
					  icon: 'error',
					  title: '이미 좋아요 버튼을 누르셨습니다!',
					  showConfirmButton: false,
					})
				}
				else location.reload();
			},
			error: function(){
				alert("전송오류!")
			}
			
		});
	}
</script>
<c:forEach var="vo2" items="${rVos}" varStatus="st">
<div class="comment-list">
	<div class="comment-writer-img"><img src="${ctp}/images/member/${vo2.photo}"></div>
	<div class="comment-top">
		<div class="rating">
			<div class="review-more">
			<button class="review-like" id="" onclick="likeReview(${vo2.idx})" value="${vo2.idx}" ><i class="fas fa-heart fa-sm"></i> ${vo2.thumb}</button>
			<button class="review-more" onclick="moreBtn()" value="${vo2.idx}" ><i class="far fa-ellipsis-v"></i></button>
			</div> 
			<div id="review-star-rating">
				★★★★★
				<span id="review-star-rating-checked" class="review${st.index}">★★★★★</span>
			</div>
			<script>$(".review${st.index}").css("width", ${vo2.rating*20}+"%");</script>
		</div>
	<b>${vo2.nickName}</b><font color="#ccc"> | ${fn:substring(vo2.wDate,0,19)}</font>
	</div>
	<div>${vo2.context}</div>
</div>
</c:forEach>