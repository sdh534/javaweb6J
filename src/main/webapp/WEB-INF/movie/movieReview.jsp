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
  #review{
  height:500px;
  }
  #login-btn-join{
  border: none;
  background-color: white;
  }
  
  .spoiler-section{
  font-size: 12pt;
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
				review: $("#review").val().trim(),
		}
		
		$.ajax({
			type: "post",
			url: "${ctp}/MemberLoginOk.mem",
			data: data,
			success: function(res){
				if(res=="0") alert("아이디 정보가 존재하지 않습니다.");
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

<div class="modal fade" id="reviewModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header border-bottom-0">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="form-title text-left">
          <h4 style="font-weight: 1000;">${vo.title}</h4>
        </div>
        <div class="d-flex flex-column">
          <form name="review-form">
            <div class="form-group">
              <input type="text" class="form-control" id="review" placeholder="작품에 대한 감상을 자유롭게 작성해주세요.">
            </div>
          </form>
      	</div>
    	</div>
	    <div class="modal-footer d-flex justify-content-center">
	      <div class="spoiler-section text-left">스포일러가 있다면? <i class="fal fa-eye-slash fa-xs"></i>
	      <button data-toggle="modal" data-target="#joinModal" class="text-point text-right" id="login-btn-join" onclick="login_off()">회원가입</button>
	      </div>
	    </div>
  	</div>
	</div>
</div>