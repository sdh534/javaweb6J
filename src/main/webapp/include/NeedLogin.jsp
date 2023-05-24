<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<style>
 #modal-btn-login{
 	background-color: #f74444;
 	border: #f74444;
 }
  .modal{
  font-family: "GmarketSansMedium";
  }
  
  #login-btn-join{
  border: none;
  color: #f74444;
  background-color: white;
  }
  .swal2-title {
  font-size:15pt;
  }
  .need-btn {
		border: 1px solid #f74444;
		background-color: #f74444;
		border-radius: 15px;
		padding: 5px 100px;
		display: flex;
    justify-content: center;
		color: white;
  }
  .need-btn:nth-child(2){
		border: none;
		background-color: white;
  }
  .need-btn:nth-child(2) > button{
  	color: #f74444;
  }
  .need-btn > button{
		color: white;
  	background-color: transparent;
  	padding: 0;
  }
</style>

<script>
	'use strict';
	function need_off(){
		$("#needLoginModal").modal('hide');
	}
</script>

<div class="modal fade" id="needLoginModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header border-bottom-0">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="form-title text-center">
          <h4 style="font-weight: 1000;"><img src="${ctp}/images/cinetalk.png" style=" width:100px;"></h4>
        </div>
        <div class="d-flex flex-column text-center">
          <h4 style="font-weight: 1000; font-family: "GmarketSansMedium"; ">평가를 하기 위해서 로그인이 필요해요.<br/>회원가입 혹은 로그인 후 평가를 남겨보세요!</h4>
          <br/><br/>
    	</div>
	    <div class="modal-footer d-flex justify-content-center">
	      <div class="need-section">
	      	<button class="btn" data-toggle="modal" data-target="#loginModal" class="text-point"  onclick="need_off()"><div class="need-btn">로그인</div></button>
	      	<div class="need-btn mt-1"><button class="btn"  data-toggle="modal" data-target="#joinModal" class="text-point"  onclick="need_off()">회원가입</button></div>
	      </div>
	    </div>
  	</div>
	</div>
</div>
</div>