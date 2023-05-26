<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<style>
 #modal-btn-review{
		color: #f74444;
		border: 1px solid;
 }
  .modal{
  font-family: "GmarketSansMedium";
  }
  .modal-footer{
  justify-content: space-between;
  }
  .reviewForm-title {
    align-items: center;
    display: flex;
    margin: -2rem 0rem 2rem;
	}
  #review-del{
  font-family: 'NEXON Lv1 Gothic OTF';
  width:100%;
  font-size:13pt;
  font-weight: 500;
  height:100px;
  }
  #login-btn-join{
  border: none;
  background-color: white;
  }
  .modal-content{
  	padding:20px;
  	border-radius: 1rem;
  }
  .spoiler-section{
  font-size: 12pt;
  }
  
  .far{
  font-weight: 900 !important;
  }
    	/*      별점 레이팅          */

	#starRatingValue2{
	 	width: 100%;
		height: 50%;
    position: absolute;
    cursor: pointer;
    top: 20px;
    opacity: 0;
    left: 0;
	}

	#star-rating-empty2 {
		position: relative;
		color:#ccc;
		display:inline-block;
		font-size:32pt;
		float:left;
	}
	#star-rating-empty2 > span {
		position: absolute;
		color: orange;
		width: 0;
		top:16px;
		left: 0;
		overflow:hidden;
		pointer-events: none;
	}
	input[type=checkbox]{
		display:none;
	}
	#toggle::before{
		content: "\f06e";
		font-size:20pt;
		font-family:"Font Awesome 5 Free";
		font-weight: 900;
		cursor:pointer;
	}
	:checked + #toggle::before{
		cursor:pointer;
		content: "\f070";
		color: #f74444;
		font-size:20pt;
		font-weight: 900;
		font-family:"Font Awesome 5 Free";
	}
.tooltip .arrow:before {
    border-top-color: #f74444 !important;
}

.tooltip .tooltip-inner {
    background-color: #f74444;
}
.row{
	border: 1px solid #ccc;
	padding: 10px;
}
</style>

<script>
	'use strict';
	var content;
	$(document).ready(function(){
	$('#warnReasonModal').on('show.bs.modal', function (event) {
		  var button = $(event.relatedTarget); // Button that triggered the modal
		  content = button.data('whatever'); // Extract info from data-* attributes
		  content = content.substring(0,content.length-1).split('/');
		  for(let i=0; i<content.length; i++){
			  $("#delContentList").append(
					  "<div class='row'><div class='col'>"+content[i].substring(0,content[i].indexOf(":"))+"</div>"
					  +"<div class='col'>"+content[i].substring(content[i].indexOf(":")+1,content[i].length)+"</div></div>"
			  );
		  }
		  });
	$('#warnReasonModal').on('hidden.bs.modal', function (event) {
			  $("#delContentList").html("");
		  });
	});
	
	function delCheck(){
		//여기 정규식 체크 (아이디, 비밀번호)
			
			let data = {
					reviewIdx : reviewIdx,
					mid : "${sMid}",
					warn: $("#review-del").val().trim(),
			}
			$.ajax({
				type: "post",
				url: "${ctp}/ReviewWarnComment.re",
				data: data,
				success: function(res){
					if(res=="0") {
						Swal.fire({
								width:500,
							  position: 'center',
							  icon: 'error',
						  	title: '신고는 한 번만 가능합니다!',
							  showConfirmButton: false,
							  timer: 1500
							})
					}
					else if(res=="1") {
						Swal.fire({
							width:500,
						  position: 'center',
						  icon: 'success',
							  title: '신고가 성공적으로 접수되었습니다.',
						  showConfirmButton: false,
						  timer: 1500
						})
					setTimeout(function(){location.reload();},1500);
					$('#warnModal').modal('hide');
					}
				},
				error: function(){
					alert("전송 실패!");
				}
			}); 
			
			
		}
</script>
 <c:set var="arr" value="${fn:split(delContent,'/')}"></c:set>
<div class="modal fade" id="warnReasonModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header border-bottom-0">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body text-center">
          <div class="reviewForm-title text-left">
            <h4 style="font-weight: 1000; font-size:20pt; float:left; margin-right:15px;">🚨리뷰 신고</h4>
          </div>
          <div class="row bg-dark text-white">
          	<div class="col">아이디</div>
          	<div class="col">신고 사유</div>
          </div>
					<div id="delContentList"></div>
        </div>
        <div class="modal-footer d-flex">
          <button type="button" id="modal-btn-review" class="btn btn-block btn-round" onclick="delCheck()">
          	삭제
          </button>
        </div>
      </div>
    </div>
</div>

