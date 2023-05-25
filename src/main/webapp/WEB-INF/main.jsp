<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>씨네톡  |  홈</title>
	<jsp:include page="/include/bs4.jsp" />
	<link href="${ctp}/images/cinetalk.ico" rel="shortcut icon" type="image/x-icon">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
  .full-screen{
  	display:flex;
  	flex-direction: column;
  	align-items: center;
  	margin-top: 15px;
  }
  .container{
  	padding:0;
  }
  li {
 	 	list-style: none;
  }
  .movie_list{
  	display:block;
  }
  .recent-movie {
  	float: left;
  	width: 20%;
  	padding: 7px;
  }
  .movie-title{
	  margin-top: 5px;
	  font-family: "GmarketSansMedium";
	  font-size: 20px;
  }
  .poster {
  	width: 100%;
  }
  .poster-img > img{
	position: relative;
	height: 320px;
  width: 100%;
  border-radius: 7px;
  }
  h3{
   font-family: "GmarketSansMedium";
   font-weight: 1000;
   margin-left: 25px;
  }
  .text-point{
  	color: #f74444;
  }
  .carousel-inner{
   width: 100%;
  }
  .carousel-control-next, .carousel-control-prev{
  width: 5%;
  transform: translateX(-5px);
  height: 30%;
  top:35%;
  filter: drop-shadow(5px 5px 5px #000);
  opacity: .7;
  }
	.carousel-item{ 
		margin-left:-2%;
	}
	.carousel{
	width: 80%;
	}
	.poster-ranking{
	position: absolute;
	display:flex;
	flex-direction: column;
	align-items: center;
	top: 10px;
	margin-left: 5px;
	padding:5px;
	width:30px;
	background-color: rgba(0,0,0, 0.7);
	border-radius: 7px;
	color: white;
	}
	
	.movie-year-country{
	font-size:10pt;
	}
	
	@media (max-width: 960px) {
 		.poster-img > img{
		position: relative;
		height: 220px;
	  width: 100%;
	  border-radius: 7px;
  	}
}
  </style>
  <script>
  
  $(document).ready(function(){
	  $(".Movie_Carousel1").carousel("pause");
	  

	  // Enable Carousel Controls
	  $("#prev-control1").click(function(){
	    $(".Movie_Carousel1").carousel("prev");
	  });
	  $("#next-control1").click(function(){
	    $(".Movie_Carousel1").carousel("next");
	  });
	  
 
	  $(".Movie_Carousel2").carousel("pause");
	  
	  // Enable Carousel Controls
	  $("#prev-control2").click(function(){
	    $(".Movie_Carousel2").carousel("prev");
	  });
	  $("#next-control2").click(function(){
	    $(".Movie_Carousel2").carousel("next");
	  });
	  
	  $(".Movie_Carousel3").carousel("pause");
	  
	  // Enable Carousel Controls
	  $("#prev-control3").click(function(){
	    $(".Movie_Carousel3").carousel("prev");
	  });
	  $("#next-control3").click(function(){
	    $(".Movie_Carousel3").carousel("next");
	  });
	  
 
  });
  	
  </script>
</head>


<body>
	<jsp:include page="/include/header.jsp"/>
	<div class="full-screen" >
	
			<!-- 처음 Carousel -->
		<div class="Movie_Carousel1 carousel slide" data-interval="500">
	  <!-- The slideshow -->
	  <div class="carousel-inner">
		  <h3 style="font-family: 'GmarketSansMedium'">💥화제의 감독 <font color="#f74444">크리스토퍼 놀란</font></h3>
	       <c:forEach var="movie_items" items="${main1_vos}" varStatus="st1"> 
		    	<!-- 1~5위 -->
		    	<c:if test="${st1.first}"> <!-- 처음일때만 열어줌 -->
		    		<div class="carousel-item active">
		    		<ul class="movie_list">
		    	</c:if>
			    	<li class="recent-movie">
				    	<a href="${ctp}/MoviePage.mo?idx=${movie_items.idx}">
				    		<div class="poster">
						      <div class="poster-img"><img src="${movie_items.poster}" alt="${movie_items.title}"></div>
					    		<div class="poster-ranking">${st1.count}</div>
						      <div class="movie-infor">
							      <div class="movie-title">${movie_items.title}</div>
							      <div class="movie-year-country">${movie_items.rYear} ・ ${movie_items.country}</div>
							      <span>평균 ★ ${movie_items.rating}</span>
						      </div>
					      </div>
				      </a>
			      </li>
			       <!-- carousel-item active 닫고 새로운 carousel-item생성 -->
			     	<c:if test="${st1.count%5==0 && !st1.last}"></ul></div><div class="carousel-item"><ul class="movie_list"></c:if> 
			    	<c:if test="${st1.last}"></ul></div></c:if><!-- carousel-item 닫음 -->
			     </c:forEach>
		  
		  <!-- Left and right controls -->
		  <a class="carousel-control-prev"  id="prev-control1" href="#Movie_Carousel1" >
		   <i class="fas fa-chevron-circle-left fa-2x"></i>
		  </a>
		  <a class="carousel-control-next"  id="next-control1" href="#Movie_Carousel1" >
		   <i class="fas fa-chevron-circle-right fa-2x"></i>
		  </a>
	  </div> <!-- carousel - inner 닫힘 -->
	  </div>
	  
	  			<!--  Carousel 2 -->
		<div class="Movie_Carousel2 carousel slide" data-interval="500">
	  <!-- Indicators -->
	  <!-- The slideshow -->
	  <div class="carousel-inner">
		  <h3 style="font-family: 'GmarketSansMedium'">🎶노래해요! <font color="#f74444">OST가 좋은 </font>영화 모음집</h3>
	       <c:forEach var="movie_items2" items="${main2_vos}" varStatus="st2"> 
		    	<!-- 1~5위 -->
		    	<c:if test="${st2.first}"> <!-- 처음일때만 열어줌 -->
		    		<div class="carousel-item active">
		    		<ul class="movie_list">
		    	</c:if>
			    	<li class="recent-movie">
				    	<a href="${ctp}/MoviePage.mo?idx=${movie_items2.idx}">
				    		<div class="poster">
						      <div class="poster-img"><img src="${movie_items2.poster}" alt="${movie_items2.title}"></div>
					    		<div class="poster-ranking">${st2.count}</div>
						      <div class="movie-infor">
							      <div class="movie-title">${movie_items2.title}</div>
							      <div class="movie-year-country">${movie_items2.rYear} ・ ${movie_items2.country}</div>
							      <span>평균 ★ ${movie_items2.rating}</span>
						      </div>
					      </div>
				      </a>
			      </li>
			       <!-- carousel-item active 닫고 새로운 carousel-item생성 -->
			     	<c:if test="${st2.count%5==0 && !st2.last}"></ul></div><div class="carousel-item"><ul class="movie_list"></c:if> 
			    	<c:if test="${st2.last}"></ul></div></c:if><!-- carousel-item 닫음 -->
			     </c:forEach>
		  
		  <!-- Left and right controls -->
		  <a class="carousel-control-prev" id="prev-control2" href="#Movie_Carousel2" >
		    <i class="fas fa-chevron-circle-left fa-2x"></i>
		  </a>
		  <a class="carousel-control-next control2"  id="next-control2" href="#Movie_Carousel2" >
		    <i class="fas fa-chevron-circle-right fa-2x"></i>
		  </a>
	  </div> <!-- carousel - inner 닫힘 -->
	  </div>
	  
	  
	  			<!-- 처음 Carousel -->
		<div class="Movie_Carousel3 carousel slide" data-interval="500">
	  <!-- The slideshow -->
	  <div class="carousel-inner">
		  <h3 style="font-family: 'GmarketSansMedium'">✨최근 리뷰가 <font color="#f74444">등록된 영화</font></h3>
	       <c:forEach var="movie_items" items="${main3_vos}" begin="0" end="9" step="1" varStatus="st3"> 
		    	<!-- 1~5위 -->
		    	<c:if test="${st3.first}"> <!-- 처음일때만 열어줌 -->
		    		<div class="carousel-item active">
		    		<ul class="movie_list">
		    	</c:if>
			    	<li class="recent-movie">
				    	<a href="${ctp}/MoviePage.mo?idx=${movie_items.idx}">
				    		<div class="poster">
						      <div class="poster-img"><img src="${movie_items.poster}" alt="${movie_items.title}"></div>
					    		<div class="poster-ranking">${st3.count}</div>
						      <div class="movie-infor">
							      <div class="movie-title">${movie_items.title}</div>
							      <div class="movie-year-country">${movie_items.rYear} ・ ${movie_items.country}</div>
							      <span>평균 ★ ${movie_items.rating}</span>
						      </div>
					      </div>
				      </a>
			      </li>
			       <!-- carousel-item active 닫고 새로운 carousel-item생성 -->
			     	<c:if test="${st3.count%5==0 && !st3.last}"></ul></div><div class="carousel-item"><ul class="movie_list"></c:if> 
			    	<c:if test="${st3.last}"></ul></div></c:if><!-- carousel-item 닫음 -->
			     </c:forEach>
		  
		  <!-- Left and right controls -->
		  <a class="carousel-control-prev"  id="prev-control3" href="#Movie_Carousel3" >
		   <i class="fas fa-chevron-circle-left fa-2x"></i>
		  </a>
		  <a class="carousel-control-next"  id="next-control3" href="#Movie_Carousel3" >
		   <i class="fas fa-chevron-circle-right fa-2x"></i>
		  </a>
	  </div> <!-- carousel - inner 닫힘 -->
	  </div>
	  
	  
	</body>
<jsp:include page="/include/footer.jsp"/>

</html>