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
td > img{
	width: 50px;
	height: 50px;
	border-radius: 50%;
	object-fit: cover;
}
</style>
<script>
	'use strict';

</script>
<div class="container aReview-list">
  <h1>회원 리스트</h1>
  <table class="table table-borderless">
    <tr>
      <td class="text-right">
        <!-- 한페이지 분량처리 -->
        <select name="pageSize" id="pageSize" onchange="mPageCheck(${pag})">
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
          <th>프로필</th>
          <th>아이디</th>
          <th>닉네임</th>
          <th>이메일</th>
          <th>등급</th>
          <th>탈퇴 신청</th>
          <th>탈퇴</th>
          <th>회원 페이지</th>
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
      	<c:forEach var="vo" items="${vos}">
		        <tr>
		          <td>
								<c:if test="${vo.photo=='noimage.jpg'}"><img src="${ctp}/images/noimage.jpg"></c:if>
								<c:if test="${vo.photo!='noimage.jpg'}"><img src="${ctp}/images/member/${vo.photo}" ></c:if>
							</td>
		          <td>${vo.mid}</td>
		          <td>${vo.nickName}</td>
		          <td>${vo.email }</td>
		          <td>${vo.m_level}</td>
		          <td>${vo.userDel}</td>
		          <td> 
		          	<button class="deleteBtn" onclick="reviewDelete(${vo.idx})">
									<b>탈퇴</b>
								</button>
								</td>
		          <td>
			          <button class="showBtn">
									<b>회원 페이지</b>
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
	    <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="javascript:memberListPaging(${pageSize}, ${1})">첫페이지</a></li></c:if>
	    <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="javascript:memberListPaging(${pageSize}, ${(curBlock-1)*blockSize + 1})">이전블록</a></li></c:if>
	    <c:forEach var="i" begin="${curBlock*blockSize + 1}" end="${curBlock*blockSize + blockSize}" varStatus="st">
	      <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link text-white bg-secondary border-secondary" href="javascript:memberListPaging(${pageSize}, ${i})">${i}</a></li></c:if>
	      <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="javascript:memberListPaging(${pageSize}, ${i})">${i}</a></li></c:if>
	    </c:forEach>
	    <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/AdminMemberList.ad?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li></c:if>
	    <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="javascript:memberListPaging(${pageSize}, ${totPage})">마지막페이지</a></li></c:if>
	  </ul>
  </div>
</div>
<p><br/></p>
