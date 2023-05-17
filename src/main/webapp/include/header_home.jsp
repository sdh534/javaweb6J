<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
		//NULL값 방지용으로 pageContext로 받아와야함 
		int level = session.getAttribute("sLevel")==null ? 99: Integer.parseInt(session.getAttribute("sLevel")+"");
		pageContext.setAttribute("level", level);
%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<style>
	.header-login{
	position:fixed; 
	width:100%;
	height:60px;
	float:right; 
	display: flex;
  justify-content: flex-end;
  z-index: 1;
  top: 0px;
  background-color:white;
  border: 1.5px solid #ddd;
	}
	ul{
		display:flex;
		justify-content: flex-end;
		align-items:center;
	}
	#header-search{
		display:flex;
	  padding-left: 15px;
	  margin-right: 25px;
    position: relative;
    width: 380px;
    height: 32px;
    font-size: 11pt;
    border: none;
    background-color: #f2f2f2;;
	}
	#searchWord{
    width: 320px;
    height: 32px;
    font-size: 11pt;
    border: none;
    background-color: #f2f2f2;;
	}
	#btn_login{
		font-family: "GmarketSansMedium";
	}
	#btn_login:hover{
		color: #f74444;
	}
	#btn_join{
		font-family: "GmarketSansMedium";
		color: #f74444;
		border: 1px solid;
	}
	#btn_join:hover{
		background-color: #f74444;
		color: white;
	}
	.modal-header .close {
  margin-top: -1.5rem;
	}

	.form-title {
	  margin: -2rem 0rem 2rem;
	}
	
	.btn-round {
	  border-radius: 3rem;
	}
	
	.delimiter {
	  padding: 1rem;
	}
	.social-buttons .btn {
  margin: 0 0.5rem 1rem;
	}

	.signup-section {
 	padding: 0.3rem 0rem;
	}	
	
	#btn_mypage{
	 	background-image: url("${ctp}/images/member/noimage.jpg");
	 	background-size : contain;
	 	border: none;
	  width:40px;
	  height:40px;
	  border-radius: 100%;
	}
	
	.profile_btn{
		margin-right:25px;
	}
</style>

<script>
$("#btn_login").click(function(){
	$('#loginModal').modal('show');
 });
$("#btn_join").click(function(){
	$('#joinModal').modal('show');
 });
</script>
	<div class="text-center" style="position:static; height:60px;" >
	  <div class="header-login">
	  	<ul style="list-style:none; margin-bottom:0px">
	  	<li>
	  	<form name="searchForm">
	  		<div id="header-search" >
	  		<label>
	  			<i class="fas fa-search"></i>
	  			<input type="text" name="searchWord" id="searchWord" placeholder="찾고자 하는 영화, 단어, 유저를 검색해보세요." />
	  		</label>
	  		</div>
	  	</form>
	  	</li>
	  	<c:if test="${level==99}">
  	  	<li><button id="btn_login" data-toggle="modal" data-target="#loginModal" class="btn" style="margin-right:25px;">로그인</button></li>
  			<li><button id="btn_join" data-toggle="modal" data-target="#joinModal" class="btn" style="margin-right:25px;">회원가입</button></li>
	  	</c:if>
	  	<c:if test="${level<=3}">
	  		<div class="profile_btn" >
  	  		<li><button id="btn_mypage" onclick="location.href='${ctp}/MemberMain.mem';"></button></li>
  	  	</div>
	  	</c:if>
	  	</ul>
	  </div>
	</div>
	
