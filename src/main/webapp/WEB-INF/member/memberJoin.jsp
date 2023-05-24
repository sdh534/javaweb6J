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
  .join-text{
  text-align: left;
  }
  #join-btn-login{
  border: none;
  color:#f74444;
  background-color: white;
  }
  #modal-btn-join{
  color:white;
  background-color: #f74444;
 	border: #f74444;
  }
  .form_warn, .check_id, .check_email {
    margin-left: 5px;
    font-size: 8pt;
    text-align: left;
    color:rgb(229, 66, 66);
    display: none;
	}
	

</style>

<script>
	'use strict';
	
	let flag_id = false;
	let flag_pwd = false;
	let flag_email = false;
	let flag_nickName = false;
	
	function join_off(){
		$('#joinModal').modal('hide');
	}

	
	function RegCheck(){
	let regPwd = /(?=.*[0-9a-zA-Z!@#$%^&*_]).{8,20}$/;
	let regMid = /^[a-zA-Z0-9_]{4,20}$/; //아이디는 영대소문자와 숫자, 언더바만 허용 (4-20자)
	let regNickName = /^[가-힣]+$/;
	let regEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	 
		$(document).ready(function(){
			$("#pwd1").on("change keyup paste", function(){
			  	let pwd1 = joinForm.pwd1.value.trim();
			  	
			    if(regPwd.test(pwd1)){
			    	warn_pwd1.style.display = "none";
			    }
			    else{
			    	warn_pwd1.style.display = "block";
			      return false;
			    }
			});
			$("#pwd2").on("change keyup paste", function(){
			  	let pwd1 = joinForm.pwd1.value.trim();
			  	let pwd2 = joinForm.pwd2.value.trim();
			  	
			    if(pwd2==pwd1){
			    	warn_pwd2.style.display = "none";
			    	flag_pwd = true;
			    }
			    else{
			    	warn_pwd2.style.display = "block";
			    	flag_pwd = false;
			      return false;
			    }
			});
			$("#mid1").on("change keyup paste", function(){
				//여기 정규식 체크 (아이디, 비밀번호, 비밀번호 재확인, 이메일, 생년월일, 닉네임)
		  	let mid = joinForm.mid1.value.trim();
		  	
		    if(regMid.test(mid)){
					warn_id.style.display = "none";
		    	//중복되는 아이디가 있는지 실시간검사
		    	$.ajax({
		    		type: "post",
						url: "${ctp}/MemberIdCheck.mem",
						data: {mid : mid},
						success: function(res){
							if(res=="OK"){ //중복검사 통과
								check_id.style.display="none";
								flag_id = true;
							}
							else{ //중복검사 통과 실패
								check_id.style.display="block";
								flag_pwd = false;
								return false;
							}
						},
						error: function(){
							alert("전송 실패!");
						}
		    	})
		    }
		    else{
		    	warn_id.style.display = "block";
					check_id.style.display="none";
					flag_id = false;
		      return false;
		    }
			});
			$("#nickName").on("change keyup paste", function(){
				//여기 정규식 체크 (아이디, 비밀번호, 비밀번호 재확인, 이메일, 생년월일, 닉네임)
		  	let nickName = joinForm.nickName.value.trim();
		  	
		    if(regNickName.test(nickName)){
		    	warn_nickName.style.display = "none";
		    	//중복된 닉네임이 있는지 실시간 검사
		    		//중복되는 아이디가 있는지 실시간검사
		    	$.ajax({
		    		type: "post",
						url: "${ctp}/MemberNickNameCheck.mem",
						data: {nickName : nickName},
						success: function(res){
							if(res=="OK"){ //중복검사 통과
								check_nickName.style.display="none";
								flag_nickName = true;
							}
							else{ //중복검사 통과 실패
								check_nickName.style.display="block";
								flag_nickName = false;
								return false;
							}
						},
						error: function(){
							alert("전송 실패!");
						}
		    	})
		    	
		    	
		    }
		    else{
		    	warn_nickName.style.display = "block";
					check_nickName.style.display="none";
					flag_nickName = false;
		      return false;
		    }
			});
			
			$("#email").on("change keyup paste", function(){
				let email = joinForm.email.value.trim();
			    if(regEmail.test(email)){
			    	warn_email.style.display = "none";
			    	flag_email = true;
			    }
			    else{
			    	warn_email.style.display = "block";
			    	flag_email = false;
			      return false;
			    }
				});
			
		});
	}
	RegCheck();
	
	function joinCheck(){
		if(!flag_email || !flag_id || !flag_pwd || !flag_nickName){
			alert("잘못 입력한 값이 있습니다. 체크해주세요!");
			return false;
		}
		
		let data = {
				mid: $("#mid1").val().trim(),
				nickName: $("#nickName").val().trim(),
				pwd: $("#pwd2").val().trim(),
				email: $("#email").val().trim(),
		}

		$.ajax({
			type: "post",
			url: "${ctp}/MemberJoinOk.mem",
			data: data,
			success: function(msg){
				alert(msg);
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
          <form name="joinForm">
            <div class="form-group mb-1">
            	<span class="join-text">아이디</span>
              <input type="text" class="form-control" id="mid1" placeholder="아이디" autofocus>
              <span class="form_warn" id="warn_id">4~20자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.</span>
              <span class="form_warn" id="check_id">중복된 아이디입니다.</span>
            </div>
            <div class="form-group mb-1">
            	<span class="join-text">닉네임</span>
              <input type="text" class="form-control" id="nickName" placeholder="닉네임">
              <span class="form_warn"  id="warn_nickName">한글만 사용하세요. (특수기호, 공백 사용 불가)</span>
              <span class="form_warn" id="check_nickName">중복된 닉네임입니다.</span>
            </div>
            <div class="form-group mb-1">
            	<span class="join-text">비밀번호</span>
              <input type="password" class="form-control" id="pwd1" placeholder="비밀번호" >
              <span class="form_warn"  id="warn_pwd1">8~16자 영문 대소문자, 숫자, 특수문자를 사용하세요.</span>
            </div>
            <div class="form-group mb-1">
            	<span class="join-text">비밀번호 재확인</span>
              <input type="password" class="form-control" id="pwd2" placeholder="비밀번호 재확인">
              <span class="form_warn" id="warn_pwd2">비밀번호가 일치하지 않습니다.</span>
            </div>
            <div class="form-group mb-1">
            	<span class="join-text">이메일</span>
              <input type="text" class="form-control" id="email" placeholder="이메일">
              <span class="form_warn" id="warn_email">이메일 주소를 다시 확인해주세요.</span>
            </div>
            <button type="button" id="modal-btn-join" class="btn btn-block btn-round mt-3" onclick="joinCheck()">회원가입</button>
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