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
  .carousel-control-next, .carousel-control-prev{
  width:10%
  }
	.carousel-item{ 
		margin-left:-2%;
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
	  
 
  });
  	
  </script>
</head>


<body>
	<jsp:include page="/include/header.jsp"/>
	<div class="full-screen" style="margin:10px 70px 0 70px">
	
			<!-- 처음 Carousel -->
		<div class="Movie_Carousel1 carousel slide" data-interval="500">
	  <!-- Indicators -->
	  <ul class="carousel-indicators" >
	    <li data-target="#demo" data-slide-to="0" class="active"></li>
	    <li data-target="#demo" data-slide-to="1"></li>
	  </ul>
	  <!-- The slideshow -->
	  <div class="carousel-inner">
		  <h3>💥화제의 감독 <font color="#f74444">크리스토퍼 놀란</font></h3>
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
		    <span class="carousel-control-prev-icon"></span>
		  </a>
		  <a class="carousel-control-next"  id="next-control1" href="#Movie_Carousel1" >
		    <span class="carousel-control-next-icon"></span>
		  </a>
	  </div> <!-- carousel - inner 닫힘 -->
	  
	  
	  			<!--  Carousel 2 -->
		<div class="Movie_Carousel2 carousel slide" data-interval="500">
	  <!-- Indicators -->
	  <ul class="carousel-indicators" >
	    <li data-target="#demo" data-slide-to="0" class="active"></li>
	    <li data-target="#demo" data-slide-to="1"></li>
	  </ul>
	  <!-- The slideshow -->
	  <div class="carousel-inner">
		  <h3>🎶노래해요! <font color="#f74444">OST가 좋은 </font>영화 모음집</h3>
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
		    <span class="carousel-control-prev-icon"></span>
		  </a>
		  <a class="carousel-control-next control2"  id="next-control2" href="#Movie_Carousel2" >
		    <span class="carousel-control-next-icon"></span>
		  </a>
	  </div> <!-- carousel - inner 닫힘 -->
	  
	  
	  
	</div>
</div>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>