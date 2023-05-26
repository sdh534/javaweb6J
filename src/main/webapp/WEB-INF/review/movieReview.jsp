<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  #review{
  font-family: 'NEXON Lv1 Gothic OTF';
  width:100%;
  font-size:13pt;
  font-weight: 500;
  height:500px;
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
</style>

<script>
	'use strict';


	$(document).ready(function(){
		$('[data-toggle="tooltip"]').tooltip();
		$(document).mouseup(function (e){
			  var LayerPopup = $("#reviewModal");
			  if(LayerPopup.has(e.target).length === 0){
				  $('.modal-dialog').modal('hide');
			  }
			});
		
	});
	
	function reviewCheck(){
		//여기 정규식 체크 (아이디, 비밀번호)
		
		let data = {
				movieIdx : ${vo.idx},
				mid : "${sMid}",
				nickName : "${sNickName}",
				star : $("#starRatingValue2").val(),
				review: $("#review").val().trim(),
				spoiler: $("#toggleBtn").is(":checked")
		}
		$.ajax({
			type: "post",
			url: "${ctp}/ReviewUpdateComment.re",
			data: data,
			success: function(res){
				if(res=="0") {
					Swal.fire({
							width:500,
						  position: 'center',
						  icon: 'error',
						  title: '코멘트 저장에 실패했습니다.',
						  showConfirmButton: false,
						  timer: 1500
						})
				}
				else if(res=="1") {
					Swal.fire({
						width:500,
					  position: 'center',
					  icon: 'success',
					  title: '코멘트 저장 성공!',
					  showConfirmButton: false,
					  timer: 1500
					})
				setTimeout(function(){location.reload();},1500);
				$('#reviewModal').modal('hide');
				}
			},
			error: function(){
				alert("전송 실패!");
			}
		}); 
	}
	

	function rCheck2(){
		let star = $("#starRatingValue2").val();
		
		let query = {
			movieIdx : ${vo.idx},
			mid : "${sMid}",
			nickName : "${sNickName}",
			star : star,
		}
		//이곳에 AJAX를 하나 더 추가 / DB에 저장된 값과 동일한 값을 클릭하면 별점이 삭제되도록, 단 코멘트가 있을 경우 삭제해서는 안됨 
		
		$.ajax({
			type: "post",
			url: "${ctp}/ReviewStarOk.re",
			data: query,
			error: function(){
			alert("전송오류");
		}
		});
		
		}
</script>

  <form name="review-form">
<div class="modal fade" id="reviewModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header border-bottom-0">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="reviewForm-title text-left">
            <h4 style="font-weight: 1000; font-size:20pt; float:left; margin-right:15px;">${vo.title}</h4>
            <div id="star-rating2">
             <div id="star-rating-empty2">
                <font style="font-size:20pt;">★★★★★</font>
                <span id="star-rating-checked2" style="font-size:20pt;">★★★★★</span>
                <c:if test="${memberRVo.rating ==null }">
                  <input type="range" name="starRatingValue2" id="starRatingValue2" value="0" step="1" min="0" max="10" onclick="rCheck2()" />
                </c:if>
                <c:if test="${memberRVo.rating !=null }">
                  <input type="range" name="starRatingValue2" id="starRatingValue2" value="${memberRVo.rating*2}" step="1" min="0" max="10" onclick="rCheck2()" />
                </c:if>
              </div>
            </div>
          </div>
          <div class="d-flex flex-column">
            <div class="form-group">
            	<c:if test="${memberRVo.context != null}">
              	<textarea class="form-control" id="review">${memberRVo.context}</textarea>
            	</c:if>
            	<c:if test="${memberRVo.context ==null}">
              	<textarea class="form-control" id="review" placeholder="작품에 대한 감상을 자유롭게 작성해주세요."></textarea>
            	</c:if>
            </div>
          </div>
        </div>
        <div class="modal-footer d-flex">
          <div class="spoiler-section text-left" data-toggle="tooltip" data-html="true" data-placement="top" title="스포일러가 있는 <br/> 코멘트를 가려보세요!">
            <div>스포일러가 있다면?
             <input type="checkbox" name="toggleBtn" id="toggleBtn" <c:if test="${memberRVo.spoiler==1}">checked</c:if> /><label for="toggleBtn" id="toggle"></label></div>
          </div>
          <button type="button" id="modal-btn-review" class="btn btn-block btn-round" onclick="reviewCheck()">
          	<c:if test="${memberRVo.context==null}">등록</c:if>
          	<c:if test="${memberRVo.context!=null}">수정</c:if>
          </button>
        </div>
      </div>
    </div>
</div>
  </form>


<script>
 	 	let width2=0;
 	 	let clickCheck2=0;
 	 	let RangeValue2 = $("#star-rating-checked2").val();
		width2 = ${memberRVo.rating*20};
    $("#star-rating-checked2").css("width", ${memberRVo.rating*20}+"%");
    document.querySelector("#starRatingValue2").addEventListener("mouseover",function(event){
				clickCheck2=0;
	      document.querySelector("#starRatingValue2").addEventListener("mousemove",function(event){
		      	width2 = parseInt((event.offsetX)/12.7)*10+10;
	    	  	/* console.log(event.offsetX); 
	    	  	console.log(width2); */
		        $("#star-rating-checked2").css("width", width2+"%");
		        $("#starRatingValue2").on("click", function(){
		        	clickCheck2 = 1;
						});
		});
	  		document.querySelector("#starRatingValue2").addEventListener("mouseleave",function(event){
      	if(clickCheck2==1){
			    $("#star-rating-checked2").css("width", width2+"%");
			    console.log($("#starRatingValue2").val());
		    }
      	else {
  				$("#star-rating-checked2").css("width", $("#starRatingValue2").val()*10+"%");
      	}
		});
    });
</script>