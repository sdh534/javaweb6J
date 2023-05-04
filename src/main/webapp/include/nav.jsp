<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- <a class="navbar-brand" href="http://localhost:9090/javaweb/">Home</a> -->
  <a class="navbar-brand" href="http://192.168.50.95:9090/javaweb/">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/GuestList.gu">Guest</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/BoardList.bo">Board</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">PDS</a>
      </li>
      <li>
			  <div class="dropdown">
			    <button type="button" class="btn text-light dropdown-toggle" data-toggle="dropdown">Study1</button>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="${pageContext.request.contextPath}/study/0428_database/login.jsp">로그인연습</a>
			      <a class="dropdown-item" href="${pageContext.request.contextPath}/mapping/Test1">URL 매핑(디렉토리 패턴)</a>
			      <a class="dropdown-item" href="${pageContext.request.contextPath}/mapping/Test5.do">URL 매핑(확장자 패턴)</a>
			      <a class="dropdown-item" href="${pageContext.request.contextPath}/mapping2/Test5.mi">URL 매핑(확장자 패턴)</a>
			      <a class="dropdown-item" href="${pageContext.request.contextPath}/mapping2/Login.re">로그인연습 2</a>
			      <a class="dropdown-item" href="${pageContext.request.contextPath}/mapping2/Password.st">암호화 연습</a>
			    </div>
			  </div>  
      </li>   
      <li>
			  <div class="dropdown">
			    <button type="button" class="btn text-light dropdown-toggle" data-toggle="dropdown">Study2</button>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="#">URL 매핑</a>
			      <a class="dropdown-item" href="#">로그인 연습3</a>
			      <a class="dropdown-item" href="#">Link 3</a>
			    </div>
			  </div>  
      </li>   
      <li>
			  <div class="dropdown">
			    <button type="button" class="btn text-light dropdown-toggle" data-toggle="dropdown">Information</button>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="#">회원정보수정</a>
			      <a class="dropdown-item" href="#">회원리스트</a>
			      <a class="dropdown-item" href="#">회원탈퇴</a>
			    </div>
			  </div>  
      </li>   
    </ul>
  </div>
</nav>