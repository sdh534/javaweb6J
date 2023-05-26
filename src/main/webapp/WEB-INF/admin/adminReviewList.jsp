<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<style>

	.aReview-list{
		padding:20px;
	}

	
h1{
  font-size: 30px;
  color: #000;
  text-transform: uppercase;
  font-weight: 300;
  text-align: center;
  margin-bottom: 15px;
}
table{
  width:100%;
  table-layout: fixed;
}
.tbl-header{
  background-color: rgba(0,0,0,0.3);
 }
.tbl-content{
  overflow-x:auto;
  margin-top: 0px;
  border: 1px solid rgba(0,0,0,0.3);
}
th{
  padding: 20px 15px;
  text-align: center;
  font-weight: 500;
  font-size: 12px;
  color: #000;
  text-transform: uppercase;
}
td{
  padding: 15px;
  text-align: center;
  vertical-align:middle;
  font-weight: 300;
  font-size: 12px;
  color: #000;
  border-bottom: solid 1px rgba(0,0,0,0.3);
  -webkit-line-clamp: 2;
}
.showBtn{
		color: #f74444;
		background: none;
		border: none;
}
.deleteBtn{
		background: #f74444;
    border: 1px solid #f74444;
    color: white;
    border-radius:5px;
}
.line-limit{
		display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    overflow: hidden;
}
.delRedCheck{
	background-color: rgba(255, 0, 0, 0.2 );
}
</style>
<script>
	'use strict';
	
	function reviewDelete(idx){
		Swal.fire({
			  title: '삭제 하시겠습니까?',
			  showDenyButton: true,
			  confirmButtonText: '확인',
			  denyButtonText: '취소',
			}).then((result) => {
			  if (result.isConfirmed) {
			    $.ajax({
			    	type: "post",
						url: "${ctp}/ReviewDeleteOk.re",
						data:{idx:idx},
						success: function(res){
						if(res==1){
							Swal.fire({
								width:500,
							  position: 'center',
							  icon: 'success',
							  title: '삭제 되었습니다.',
							  showConfirmButton: false,
							  timer: 1000
							})
							setTimeout(function(){location.href="javascript:reviewListPaging(${pageSize}, ${pag})";},1500);
						}
					}
			    });
		
					}
			  });
		}

</script>
<div class="container aReview-list">
<jsp:include page="/WEB-INF/admin/adminReviewModal.jsp"/>
  <h1>리뷰 리스트</h1>
  <table class="table table-borderless">
    <tr>
      <td class="text-right">
        <!-- 한페이지 분량처리 -->
        <select name="pageSize" id="pageSize" onchange="pageCheck(${pag})">
          <option <c:if test="${pageSize == 5}">selected</c:if>>5</option>
          <option <c:if test="${pageSize == 10}">selected</c:if>>10</option>
          <option <c:if test="${pageSize == 15}">selected</c:if>>15</option>
          <option <c:if test="${pageSize == 20}">selected</c:if>>20</option>
        </select> 건
      </td>
    </tr>
  </table>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>번호</th>
          <th>작성자</th>
          <th>작성 일자</th>
          <th>내용</th>
          <th>신고</th>
          <th>신고 사유</th>
          <th>삭제</th>
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
      	<c:forEach var="vo" items="${vos}">
		        <tr <c:if test="${vo.reviewDel!=0}"> class="delRedCheck" </c:if>>
		          <td>${vo.idx}</td>
		          <td>${vo.mid}</td>
		          <td>${fn:substring(vo.wDate,0,19)}</td>
		          <td><div class="line-limit">${vo.context}</div></td>
		          <td>${vo.reviewDel}</td>
		          <td>
			          <button class="showBtn" data-toggle="modal" data-target="#warnReasonModal" data-whatever="${vo.reviewDelContent}">
									<b>보기</b>
								</button>
							</td>
		          <td> 
		          	<button class="deleteBtn" onclick="reviewDelete(${vo.idx})">
									<b>삭제</b>
								</button>
								</td>
		        </tr>
      	</c:forEach>
      </tbody>
    </table>
  </div>
 <!-- 블록 페이징 처리 -->
  <div class="text-center m-4">
	  <ul class="pagination justify-content-center pagination-sm">
	    <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="javascript:reviewListPaging(${pageSize}, ${1})">첫페이지</a></li></c:if>
	    <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="javascript:reviewListPaging(${pageSize}, ${(curBlock-1)*blockSize + 1})">이전블록</a></li></c:if>
	    <c:forEach var="i" begin="${curBlock*blockSize + 1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
	      <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link text-white bg-secondary border-secondary" href="javascript:reviewListPaging(${pageSize}, ${i})">${i}</a></li></c:if>
	      <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="javascript:reviewListPaging(${pageSize}, ${i})">${i}</a></li></c:if>
	    </c:forEach>
	    <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AdminReviewList.ad?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li></c:if>
	    <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="javascript:reviewListPaging(${pageSize}, ${totPage})">마지막페이지</a></li></c:if>
	  </ul>
  </div>
</div>
<p><br/></p>
