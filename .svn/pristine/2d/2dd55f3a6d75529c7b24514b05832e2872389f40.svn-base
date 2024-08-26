<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

	<sec:authentication property="principal.member" var="member"/>
	<!-- Start Header -->
	<header id="header" class="header fixed-top d-flex align-items-center">
	
	<!-- Start Logo -->
	<div class="d-flex align-items-center justify-content-between">
		<a href="/jobel/co_home" class="logo d-flex align-items-center">
			<img src="${pageContext.request.contextPath }/resources/niceadmin/img/logo.png" alt="">
			<span class="d-none d-lg-block">JOB을래</span>
		</a>
		<i class="bi bi-list toggle-sidebar-btn"></i>
	</div>
	<!-- End Logo -->

	<nav class="header-nav ms-auto">
		<ul class="d-flex align-items-center">
		
			<!-- Start Search Icon-->
			<li class="nav-item d-block d-lg-none">
				<a class="nav-link nav-icon search-bar-toggle " href="#">
					<i class="bi bi-search"></i>
				</a>
			</li>
			<!-- End Search Icon-->

			
			<li class="nav-item dropdown pe-3">
				<a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
					<img src="${pageContext.request.contextPath }/resources/niceadmin/img/profile-img.jpg" alt="Profile" class="rounded-circle">
					<span class="d-none d-md-block dropdown-toggle ps-2">${member.memId }</span>
				</a>
				<!-- End Profile Iamge Icon -->
				<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
					<li class="dropdown-header">
						<h6>${member.name }</h6>
						<span>${member.jobName }</span>
					</li>
					<li>
						<hr class="dropdown-divider">
					</li>
					<li>
						<a class="dropdown-item d-flex align-items-center" href="/jobel/co_mem_pw_check">
							<i class="bi bi-person"></i>
							<span>내 정보 확인</span>
						</a>
					</li>
					<li>
						<hr class="dropdown-divider">
					</li>
					<li>
						<a class="dropdown-item d-flex align-items-center" href="#">
							<i class="bi bi-gear"></i>
							<span>계정 설정</span>
						</a>
					</li>
					<li>
						<hr class="dropdown-divider">
					</li>
					<li>
						<hr class="dropdown-divider">
					</li>
					<li>
						<form action="/jobel/logout" method="post">
							<span class="dropdown-item d-flex align-items-center">
								<i class="bi bi-box-arrow-right"></i>
								<label id="logout" for="logoutInput">로그아웃</label>
								<input type="submit" id="logoutInput" value="로그아웃" style="display:none;" />
								<sec:csrfInput/>
							</span>
						</form>
					</li>
				</ul>
				<!-- End Profile Dropdown Items -->
			</li>
			<!-- End Profile Nav -->
		</ul>
	</nav>
	<!-- End Icons Navigation -->

	</header>
	<!-- End Header -->