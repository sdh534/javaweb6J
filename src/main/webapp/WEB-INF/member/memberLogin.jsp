<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<style>
 #modal-btn-login{
 	background-color: #f74444;
 }
  .modal{
  font-family: "GmarketSansMedium";
  }
  
  #login-btn-join{
  border: none;
  background-color: white;
  }
</style>

<script>
	'use strict';
	function login_off(){
		$('#loginModal').modal('hide');
	}
	function loginCheck(){
		//여기 정규식 체크 (아이디, 비밀번호)
		
		let data = {
				mid: $("#mid").val().trim(),
				pwd: $("#pwd").val().trim(),
		}
		
		$.ajax({
			type: "post",
			url: "${ctp}/MemberLoginOk.mem",
			data: data,
			success: function(res){
				if(res=="0") alert("아이디 정보가 존재하지 않습니다.");
				else if(res=="1") alert("비밀번호가 일치하지 않습니다.");
				else{
					alert("로그인 성공!");
					location.reload();
				}
			},
			error: function(){
				alert("전송 실패!");
			}
		});
	}
</script>

<div class="modal fade" id="loginModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header border-bottom-0">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="form-title text-center">
          <h4 style="font-weight: 1000;">로그인</h4>
        </div>
        <div class="d-flex flex-column text-center">
          <form name="login-form">
            <div class="form-group">
              <input type="mid" class="form-control" id="mid" placeholder="아이디">
            </div>
            <div class="form-group">
              <input type="password" class="form-control" id="pwd" placeholder="비밀번호">
            </div>
            <button type="button" id="modal-btn-login" class="btn btn-info btn-block btn-round" onclick="loginCheck()">Login</button>
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
	      <div class="signup-section">계정이 없으신가요? 
	      <button data-toggle="modal" data-target="#joinModal" class="text-point" id="login-btn-join" onclick="login_off()">회원가입</button>
	      </div>
	    </div>
  	</div>
	</div>
</div>