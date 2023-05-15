<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
 #modal-btn-login{
 	background-color: #f74444;
 }
  .modal{
  font-family: "GmarketSansMedium";
  }
  .join-text{
  text-align: left;
  }
  #join-btn-login{
  border: none;
  background-color: white;
  }
</style>

<script>
	'use strict';
	function join_off(){
		$('#joinModal').modal('hide');
	}
	function loginCheck(){
		//여기 정규식 체크 (아이디, 비밀번호, 비밀번호 재확인, 이메일, 생년월일, 닉네임)
		
		let data = {
			mid : mid,
			pwd : pwd
		}
		
		$.ajax({
			type: "post",
			url: "${ctp}/MemberJoinOk.mem",
			data: data,
			success: function(){
				
				location.reload();
			}
		});
	}
</script>

<div class="modal fade" id="joinModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header border-bottom-0">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="form-title text-center">
          <h4 style="font-weight: 1000;">회원가입</h4>
        </div>
        <div class="d-flex flex-column">
          <form name="join-form">
            <div class="form-group mb-3">
            	<span class="join-text">아이디</span>
              <input type="text" class="form-control" id="mid" placeholder="아이디">
            </div>
            <div class="form-group mb-3">
            	<span class="join-text">닉네임</span>
              <input type="text" class="form-control" id="nickName" placeholder="닉네임">
            </div>
            <div class="form-group mb-3">
            	<span class="join-text">비밀번호</span>
              <input type="password" class="form-control" id="pwd1" placeholder="비밀번호">
            </div>
            <div class="form-group mb-3">
            	<span class="join-text">비밀번호 재확인</span>
              <input type="password" class="form-control" id="pwd2" placeholder="비밀번호 재확인">
            </div>
            <div class="form-group">
            	<span class="join-text">이메일</span>
              <input type="password" class="form-control" id="email" placeholder="이메일">
            </div>
            <button type="button" id="modal-btn-login" class="btn btn-info btn-block btn-round" onclick="joinCheck()">회원가입</button>
          </form>
          
          <div class="text-center text-muted delimiter">or use a social network</div>
          <div class="d-flex justify-content-center social-buttons">
            <button type="button" class="btn btn-secondary btn-round" data-toggle="tooltip" data-placement="top" title="Twitter">
              <i class="fab fa-twitter"></i>
            </button>
            <button type="button" class="btn btn-secondary btn-round" data-toggle="tooltip" data-placement="top" title="Facebook">
              <i class="fab fa-facebook"></i>
            </button>
            <button type="button" class="btn btn-secondary btn-round" data-toggle="tooltip" data-placement="top" title="Linkedin">
              <i class="fab fa-linkedin"></i>
            </button>
        	</div>
      	</div>
    	</div>
	    <div class="modal-footer d-flex justify-content-center">
	      <div class="signup-section">이미 가입하셨나요? 
	        <button data-toggle="modal" data-target="#loginModal" class="text-point" id="join-btn-login" onclick="join_off()">로그인</button>
	      </div>
	    </div>
  	</div>
	</div>
</div>