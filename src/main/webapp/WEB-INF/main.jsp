<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>씨네톡  |  홈</title>
	<jsp:include page="/include/bs4.jsp" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
  .container{
  	padding:0;
  }
  .movie_list {
 	 	list-style: none;
  
  }
  .recent_movie {
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
	border: 1px solid black;
	border-radius: 7px;
	color: white;
	
	}
  </style>
  <script>
  $(document).ready(function(){
	  $(".Movie_Carousel").carousel("pause");
	  
	// Enable Carousel Indicators
	  $(".item1").click(function(){
	    $(".Movie_Carousel").carousel(0);
	  });
	  $(".item2").click(function(){
	    $(".Movie_Carousel").carousel(1);
	  });
	  $(".item3").click(function(){
	    $(".Movie_Carousel").carousel(2);
	  });
	    
	  // Enable Carousel Controls
	  $(".carousel-control-prev").click(function(){
	    $(".Movie_Carousel").carousel("prev");
	  });
	  $(".carousel-control-next").click(function(){
	    $(".Movie_Carousel").carousel("next");
	  });
	  
 
  });
  	
  </script>
</head>


<body>
	<jsp:include page="/include/header.jsp"/>
	<div class="container-xl" style="margin-top:30px">
	<!-- 로그인&회원가입 모달 -->
	<jsp:include page="/WEB-INF/member/memberLogin.jsp"/>
	<jsp:include page="/WEB-INF/member/memberJoin.jsp"/>
	
	<!-- 처음 Carousel -->
	<div class="Movie_Carousel carousel slide" data-interval="500">
  <!-- Indicators -->
  <ul class="carousel-indicators" >
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner">
	  <h3>최근 리뷰 <font color="#f74444">TOP 20</font></h3>
	    <div class="carousel-item active">
		    <ul class="movie_list">
		    	<li class="recent_movie">
			    	<a href="#">
			    		<div class="poster">
				      	<div class="poster-img"><img src="${ctp}/images/m_babylon_2023.jpg" alt="Los Angeles"></div>
			    			<div class="poster-ranking">1</div>
				      </div>
				      <div class="movie-title">바빌론</div>
				      <div class="movie-year-country">2023 ・ 미국</div>
				      <span>평균 ★ 5.0</span>
			      </a>
		      </li>
		    	<li class="recent_movie">
			    	<a href="#">
							<div class="poster">
				      	<div class="poster-img"><img src="${ctp}/images/m_babylon_2023.jpg" alt="Los Angeles"></div>
				      </div>		      <div class="movie-title">영화 제목</div>
				      <div class="movie-year-country">2023 ・ 국가이름</div>
				      <span>평균 ★ 5.0</span>
			      </a>
		      </li>
		    	<li class="recent_movie">
			    	<a href="#">
				    	<div class="poster">
				      	<div class="poster-img"><img src="${ctp}/images/m_babylon_2023.jpg" alt="Los Angeles"></div>
				      </div>
				      <div class="movie-title">영화 제목</div>
				      <div class="movie-year-country">2023 ・ 국가이름</div>
				      <span>평균 ★ 5.0</span>
			      </a>
		      </li>
		    	<li class="recent_movie">
			    	<a href="#">
				      	<div class="poster">
				      	<div class="poster-img"><img src="${ctp}/images/m_babylon_2023.jpg" alt="Los Angeles"></div>
				      </div>
				      <div class="movie-title">영화 제목</div>
				      <div class="movie-year-country">2023 ・ 국가이름</div>
				      <span>평균 ★ 5.0</span>
			      </a>
		      </li>
		    	<li class="recent_movie">
			    	<a href="#">
				     	<div class="poster">
				      	<div class="poster-img"><img src="${ctp}/images/m_babylon_2023.jpg" alt="Los Angeles"></div>
				      </div>
				      <div class="movie-title">영화 제목</div>
				      <div class="movie-year-country">2023 ・ 국가이름</div>
				      <span>평균 ★ 5.0</span>
			      </a>
		      </li>
		     </ul>
	    </div>
	    <div class="carousel-item">
	      <img src="chicago.jpg" alt="Chicago">
	      <img src="chicago.jpg" alt="Chicago">
	      <img src="chicago.jpg" alt="Chicago">
	    </div>
	    <div class="carousel-item">
	      <img src="ny.jpg" alt="New York">
	      <img src="ny.jpg" alt="New York">
	      <img src="ny.jpg" alt="New York">
	    </div>
  </div>

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#Movie_Carousel" >
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#Movie_Carousel" >
    <span class="carousel-control-next-icon"></span>
  </a>
	</div>
	
		<!-- 처음 Carousel -->
	<div class="Movie_Carousel carousel slide" data-interval="500">
  <!-- Indicators -->
  <ul class="carousel-indicators" >
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner">
	  <h3>최근 리뷰 <font color="#f74444">TOP 20</font></h3>
	    <div class="carousel-item active">
		    <ul class="movie_list">
		    	<li class="recent_movie">
			    	<a href="#">
			    		<div class="poster">
				      	<div class="poster-img"><img src="${ctp}/images/m_babylon_2023.jpg" alt="Los Angeles"></div>
			    			<div class="poster-ranking">1</div>
				      </div>
				      <div class="movie-title">바빌론</div>
				      <div class="movie-year-country">2023 ・ 미국</div>
				      <span>평균 ★ 5.0</span>
			      </a>
		      </li>
		    	<li class="recent_movie">
			    	<a href="#">
							<div class="poster">
				      	<div class="poster-img"><img src="${ctp}/images/m_babylon_2023.jpg" alt="Los Angeles"></div>
				      </div>		      <div class="movie-title">영화 제목</div>
				      <div class="movie-year-country">2023 ・ 국가이름</div>
				      <span>평균 ★ 5.0</span>
			      </a>
		      </li>
		    	<li class="recent_movie">
			    	<a href="#">
				    	<div class="poster">
				      	<div class="poster-img"><img src="${ctp}/images/m_babylon_2023.jpg" alt="Los Angeles"></div>
				      </div>
				      <div class="movie-title">영화 제목</div>
				      <div class="movie-year-country">2023 ・ 국가이름</div>
				      <span>평균 ★ 5.0</span>
			      </a>
		      </li>
		    	<li class="recent_movie">
			    	<a href="#">
				      	<div class="poster">
				      	<div class="poster-img"><img src="${ctp}/images/m_babylon_2023.jpg" alt="Los Angeles"></div>
				      </div>
				      <div class="movie-title">영화 제목</div>
				      <div class="movie-year-country">2023 ・ 국가이름</div>
				      <span>평균 ★ 5.0</span>
			      </a>
		      </li>
		    	<li class="recent_movie">
			    	<a href="#">
				     	<div class="poster">
				      	<div class="poster-img"><img src="${ctp}/images/m_babylon_2023.jpg" alt="Los Angeles"></div>
				      </div>
				      <div class="movie-title">영화 제목</div>
				      <div class="movie-year-country">2023 ・ 국가이름</div>
				      <span>평균 ★ 5.0</span>
			      </a>
		      </li>
		     </ul>
	    </div>
	    <div class="carousel-item">
	      <img src="chicago.jpg" alt="Chicago">
	      <img src="chicago.jpg" alt="Chicago">
	      <img src="chicago.jpg" alt="Chicago">
	    </div>
	    <div class="carousel-item">
	      <img src="ny.jpg" alt="New York">
	      <img src="ny.jpg" alt="New York">
	      <img src="ny.jpg" alt="New York">
	    </div>
  </div>

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#Movie_Carousel" >
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#Movie_Carousel" >
    <span class="carousel-control-next-icon"></span>
  </a>
	</div>
	
		<!-- 처음 Carousel -->
	<div class="Movie_Carousel carousel slide" data-interval="500">
  <!-- Indicators -->
  <ul class="carousel-indicators" >
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner">
	  <h3>최근 리뷰 <font color="#f74444">TOP 20</font></h3>
	    <div class="carousel-item active">
		    <ul class="movie_list">
		    	<li class="recent_movie">
			    	<a href="#">
			    		<div class="poster">
				      	<div class="poster-img"><img src="${ctp}/images/m_babylon_2023.jpg" alt="Los Angeles"></div>
			    			<div class="poster-ranking">1</div>
				      </div>
				      <div class="movie-title">바빌론</div>
				      <div class="movie-year-country">2023 ・ 미국</div>
				      <span>평균 ★ 5.0</span>
			      </a>
		      </li>
		    	<li class="recent_movie">
			    	<a href="#">
							<div class="poster">
				      	<div class="poster-img"><img src="${ctp}/images/m_babylon_2023.jpg" alt="Los Angeles"></div>
				      </div>		      <div class="movie-title">영화 제목</div>
				      <div class="movie-year-country">2023 ・ 국가이름</div>
				      <span>평균 ★ 5.0</span>
			      </a>
		      </li>
		    	<li class="recent_movie">
			    	<a href="#">
				    	<div class="poster">
				      	<div class="poster-img"><img src="${ctp}/images/m_babylon_2023.jpg" alt="Los Angeles"></div>
				      </div>
				      <div class="movie-title">영화 제목</div>
				      <div class="movie-year-country">2023 ・ 국가이름</div>
				      <span>평균 ★ 5.0</span>
			      </a>
		      </li>
		    	<li class="recent_movie">
			    	<a href="#">
				      	<div class="poster">
				      	<div class="poster-img"><img src="${ctp}/images/m_babylon_2023.jpg" alt="Los Angeles"></div>
				      </div>
				      <div class="movie-title">영화 제목</div>
				      <div class="movie-year-country">2023 ・ 국가이름</div>
				      <span>평균 ★ 5.0</span>
			      </a>
		      </li>
		    	<li class="recent_movie">
			    	<a href="#">
				     	<div class="poster">
				      	<div class="poster-img"><img src="${ctp}/images/m_babylon_2023.jpg" alt="Los Angeles"></div>
				      </div>
				      <div class="movie-title">영화 제목</div>
				      <div class="movie-year-country">2023 ・ 국가이름</div>
				      <span>평균 ★ 5.0</span>
			      </a>
		      </li>
		     </ul>
	    </div>
	    <div class="carousel-item">
	      <img src="chicago.jpg" alt="Chicago">
	      <img src="chicago.jpg" alt="Chicago">
	      <img src="chicago.jpg" alt="Chicago">
	    </div>
	    <div class="carousel-item">
	      <img src="ny.jpg" alt="New York">
	      <img src="ny.jpg" alt="New York">
	      <img src="ny.jpg" alt="New York">
	    </div>
  </div>

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#Movie_Carousel" >
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#Movie_Carousel" >
    <span class="carousel-control-next-icon"></span>
  </a>
	</div>
	
	
	
	</div>
	<jsp:include page="/include/footer.jsp"/>

</body>
</html>