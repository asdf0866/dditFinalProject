<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  

	<!-- Spinner Start -->
	<div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
		<div class="spinner-grow text-primary" role="status"></div>
	</div>
	<!-- Spinner End -->

	<nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0 px-4 px-lg-5">
		<a href="/jobel/home" class="navbar-brand d-flex align-items-center">
			<h2 class="m-0 text-primary"><img class="img-fluid me-2" src="/resources/images/JOB을래_LOGO.png" alt="" style="width: 150px;"></h2>
		</a>
		
		<button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse justify-content-end" id="navbarCollapse">
			<div class="navbar-nav ml-auto py-4 py-lg-0">
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<a href="/jobel/adminHome" class="nav-item nav-link">관리자 메뉴</a>
				</sec:authorize>
				<a href="/jobel/home" class="nav-item nav-link active">홈</a>
				<a href="/jobel/recHome" class="nav-item nav-link">채용 공고</a>
				<div class="nav-item dropdown">
					<a href="/jobel/comRank" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">기업 정보</a>
					<div class="dropdown-menu shadow-sm m-0">
						<a href="/jobel/comRank" class="dropdown-item">기업 랭킹</a>
						<a href="/comCompare/list" class="dropdown-item">기업 비교</a>
					</div>
				</div>
				<div class="nav-item dropdown">
					<a href="/jobel/consulting_board" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">커뮤니티</a>
					<div class="dropdown-menu shadow-sm m-0">
						<a href="/jobel/consulting_board" class="dropdown-item">취업 상담 게시판</a>
						<a href="/jobel/reviewHome" class="dropdown-item">기업 리뷰 게시판</a>
					</div>
				</div>
				<div class="nav-item dropdown">
					<a href="/jobel/faq" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">고객 센터</a>
					<div class="dropdown-menu shadow-sm m-0">
						<a href="/jobel/faq" class="dropdown-item">자주 묻는 질문</a>
						<a href="/jobel/qna" class="dropdown-item">1:1 문의</a>
					</div>
				</div>
			</div>
			<div class="h-100 d-lg-inline-flex align-items-center d-none">
				<sec:authorize access="isAnonymous()">
					<a href="/jobel/login" class="btn bg-light rounded-pill text-primary mx-1 commonsMenu">로그인</a>
					<a href="/jobel/register" class="btn bg-light rounded-pill text-primary mx-1 commonsMenu">회원가입</a>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<form action="/jobel/logout" method="post">
						<input type="submit" class="btn bg-light rounded-pill text-primary mx-1 commonsMenu" value="로그아웃" />
						<sec:csrfInput/>
					</form>
					<sec:authorize access="!hasRole('ROLE_ADMIN')">
						<a href="/jobel/myPage" class="btn bg-light rounded-pill text-primary mx-1 commonsMenu">마이페이지</a>
					</sec:authorize>
				</sec:authorize>
				<a href="/jobel/co_menu" class="btn bg-light rounded-pill text-success mx-1 companyMenu">기업 메뉴</a>
			</div>
		</div>
	</nav>
