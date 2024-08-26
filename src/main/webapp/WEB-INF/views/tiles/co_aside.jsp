<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">
		<ul class="sidebar-nav" id="sidebar-nav">
			<li class="nav-item">
				<a class="nav-link " href="/jobel/co_home">
					<i class="bi bi-grid"></i>
					<span>대시보드</span>
				</a>
			</li>
			<!-- 대시보드 끝 -->
			
			<li class="nav-item">
				<a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-journal-text"></i>
					<span>채용 공고</span>
					<i class="bi bi-chevron-down ms-auto"></i>
				</a>
				<ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
					<li>
						<a href="/jobel/co_rec_list">
							<i class="bi bi-circle"></i>
							<span>공고 목록</span>
						</a>
					</li>
					<li>
						<a href="/jobel/co_rec_write">
							<i class="bi bi-circle"></i>
							<span>공고 등록</span>
						</a>
					</li>
				</ul>
			</li>
			<!-- 채용 공고 탭 끝 -->
			
			<li class="nav-item">
				<a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-layout-text-window-reverse"></i>
					<span>지원자 관리</span>
					<i class="bi bi-chevron-down ms-auto"></i>
				</a>
				<ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
					<li>
						<a href="/jobel/co_apply_list">
							<i class="bi bi-circle"></i>
							<span>공고별 현황</span>
						</a>
					</li>
					<li>
						<a href="tables-data.html">
							<i class="bi bi-circle"></i>
							<span>지원 현황</span>
						</a>
					</li>
				</ul>
			</li>
			<!-- 지원자 관리 끝 -->
			
			<li class="nav-item">
				<a class="nav-link collapsed" href="/jobel/co_review_list">
					<i class="bi bi-menu-button-wide"></i>
					<span>리뷰 관리</span>
				</a>
			</li>
			<!-- 리뷰 관리 끝 -->		
			
			<li class="nav-heading">MY PAGES</li>
			<li class="nav-item">
				<a class="nav-link collapsed" href="/jobel/co_mem_pw_check">
					<i class="bi bi-person"></i>
					<span>회원 정보</span>
				</a>
			</li>
			<!-- 마이페이지 회원정보 끝 -->
		</ul>
	</aside>
	<!-- End Sidebar-->