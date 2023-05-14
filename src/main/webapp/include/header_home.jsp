<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    font-size: 12pt;
    border: none;
    background-color: #f2f2f2;;
	}
</style>
	<div class="text-center" style="position:static; margin-bottom:0px; height:80px;" >
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
	  	<li><a href="#"  class="btn" style="margin-right:25px;">로그인</a></li>
	  	<li><a href="#" class="btn btn-outline-primary" style="margin-right:25px;">회원가입</a></li>
	  	</ul>
	  </div>
	</div>