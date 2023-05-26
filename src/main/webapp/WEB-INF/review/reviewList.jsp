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
	.dropdown-menu > li{
		font-family: "GmarketSansMedium";
		font-size:8pt;
		padding: 10px;
	}
	.dropdown-menu > li:nth-child(1){
		border-bottom: 1px solid #bbb;
	}
	.moreBtn{
		padding: 0;
		border: none;
		background-color: transparent;
		width:100%;
		height:100%;
	}
	.spoiler-filtering{
		filter: blur(5px);
	}
	.review-context{
		position:relative;
	}
	.spoiler-btn{
		position: absolute;
		cursor: pointer;
    width: 200px;
    height: auto;
    z-index: 1;
    left: 50%;
    top: 50%;
    padding: 10px;
    background-color: white;
    border: 2px solid #f74444;
    color:#f74444;
    border-radius: 30px;
    transform: translate(-50%, -50%);
	}
	.spoiler-btn:hover{
		background: #f74444;
    border: 1px solid #f74444;
    color: white;
	}
	
</style>
<script>
	'use strict';
	$(document).ready(function(){
		$(".spoiler-btn").click(function(){
					$(".spoiler-filtering").css("filter","blur(0px)");
					$(".spoiler-btn").css("display","none");
		});
	});
	function likeReview(reviewIdx){
		if("${sMid}"==""){
			$('#needLoginModal').modal('show');
			return false;
		}
		
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
<jsp:include page="/WEB-INF/review/reviewDelModal.jsp"/>
<c:forEach var="vo2" items="${rVos}" varStatus="st">
<c:if test="${vo2.context!=''}">
<div class="comment-list">
	<div class="comment-writer-img">
		<c:if test="${vo2.photo=='noimage.jpg'}"><img src="${ctp}/images/noimage.jpg"></c:if>
		<c:if test="${vo2.photo!='noimage.jpg'}"><img src="${ctp}/images/member/${vo2.photo}"></c:if>
	</div>
	<div class="comment-top">
		<div class="rating">
			<div class="review-more">
			<button class="review-like" onclick="likeReview(${vo2.idx})" value="${vo2.idx}" ><i class="fas fa-heart fa-sm"></i> ${vo2.thumb}</button>
			<button class="review-more" type="button" id="moreMenu" data-toggle="dropdown"><i class="far fa-ellipsis-v"></i></button>
			<ul class="dropdown-menu text-center" aria-labelledby="moreMenu">
		    <c:if test="${sMid == vo2.mid }">
			    <li><button class="moreBtn" data-toggle="modal" data-target="#reviewModal"  >
						<i class="fa-solid fa-pen fa-2xs"></i>&nbsp;수정				
					</button></li>
				</c:if>
		    <li><button class="moreBtn" data-toggle="modal" data-target="#warnModal" data-whatever="${vo2.idx}">
					<i class="fas fa-ban fa-2xs"></i> &nbsp; 신고		
				</button></li>
		  </ul>
			</div> 
			<div id="review-star-rating">
				★★★★★
				<span id="review-star-rating-checked" class="review${st.index}">★★★★★</span>
			</div>
			<script>$(".review${st.index}").css("width", ${vo2.rating*20}+"%");</script>
		</div>
	<b>${vo2.nickName}</b><font color="#ccc"> | ${fn:substring(vo2.wDate,0,19)}</font>
	</div>
	<div class="review-context">
	<c:if test="${vo2.spoiler ==1}">
		<button class="spoiler-btn">	<i class="far fa-eye-slash"></i> 스포일러가 있어요! </button>
		<div class="spoiler-filtering">
			<div>${vo2.context}</div>
		</div>
	</c:if>
	<c:if test="${vo2.spoiler ==0}">
		<div>${vo2.context}</div>
	</c:if>
	</div>
	</div>
</c:if>
</c:forEach>