<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<style>

	#header-search{
		display:flex;
	  margin: 0 25px 15px 0;
	  padding-left: 15px;
    position: relative;
    width: 380px;
    height: 40px;
    font-size: 13pt;
    border: none;
    background-color: #f2f2f2;;
	}
	#searchWord{
	 margin-bottom: 15px;
    width: 320px;
    height: 40px;
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
	  <div class="header-login" style="position:relative; float:right; top:25%;">
	  	<ul style="list-style:none; display:flex; vertical-align:center">
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
	  	<li><button id="btn_login" data-toggle="modal" data-target="#loginModal" class="btn" style="margin-right:25px;">로그인</button></li>
	  	<li><button id="btn_join" data-toggle="modal" data-target="#joinModal" class="btn" style="margin-right:25px;">회원가입</button></li>
	  	</ul>
	  </div>
	</div>
	
