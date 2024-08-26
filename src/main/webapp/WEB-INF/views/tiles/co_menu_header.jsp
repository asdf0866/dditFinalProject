<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
	<div class="container-fluid">
		<a class="navbar-brand fs-4 mx-5" href="/jobel/home">JOB을래?</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="navbar-nav me-auto mb-2 mb-md-0">
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="/jobel/co_menu">기업 홈페이지</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/jobel/co_home">대시보드</a>
				</li>
				<li class="nav-item">
					<a class="nav-link disabled" aria-disabled="true">Disabled</a>
				</li>
			</ul>
			<div class="d-flex">
				<sec:authorize access="isAnonymous()">
					<a href="/jobel/co_register" class="btn btn-outline-light mx-1 fs-5 btn-sm">회원가입</a>
					<a href="/jobel/login" class="btn btn-outline-light mx-1 fs-5 btn-sm">로그인</a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<form action="/jobel/logout" method="post">
						<a href="/jobel/co_mem_page" class="btn btn-outline-light mx-1 fs-5 btn-sm">마이 페이지</a>
						<input type="submit" class="btn btn-outline-light mx-1 fs-5 btn-sm" value="로그아웃" />
						<sec:csrfInput/>
					</form>
				</sec:authorize>
			</div>
		</div>
	</div>
</nav>