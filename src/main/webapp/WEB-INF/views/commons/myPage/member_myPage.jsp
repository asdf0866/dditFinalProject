<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

	<div class="content w-100">
		<div class="header_top d-flex justify-content-end">
			<form action="/jobel/logout" method="post">
				<input type="submit" class="btn btn-sm btn-secondary mx-2" value="로그아웃" />
				<sec:csrfInput/>
			</form>
			<a href="/jobel/home" class="btn btn-sm btn-secondary">돌아가기</a>
		</div>
		
		<!-- 계정 정보 -->
		<div class="content_item">
			<a href="/jobel/myPage?menu=viewProfile" class="content_item_title">
				<span class="item_title">계정 정보</span>
			</a>
			<ul class="content_item_row">
				<li>
					<i class="item_icon bx bx-user"></i>
					<span class="item_text">${member.name }</span>
<!-- 					<a href="" class="content_item_btn">수정</a> -->
				</li>
				<li>
					<i class="item_icon bx bx-phone"></i>
					<span class="item_text">
						<c:set var="myTelno" value="${member.telno }" />
						${myTelno.substring(0,3) } - ${myTelno.substring(3,7) } - ${myTelno.substring(7) }
					</span>
<!-- 					<button type="button" class="content_item_btn">수정</button> -->
				</li>
				<li>
					<i class="item_icon bx bx-envelope"></i>
					<span class="item_text">${member.email }</span>
<!-- 					<button type="button" class="content_item_btn">수정</button> -->
				</li>
			</ul>
		</div>	<!-- 계정 정보 끝 -->
		
		<!-- 이력서 정보 -->
		<div class="content_item">
			<a href="/jobel/myPage?menu=viewResume" class="content_item_title">
				<span class="item_title">이력서 관리</span>
			</a>
			<ul class="content_item_row">
				<li>
					<i class="item_icon bx bx-file"></i>
					<span class="item_text">새 이력서 등록</span>
					<button type="button" class="content_item_btn" onclick="location.href='/jobel/resumeWrite';">이동</button>
				</li>
				<li>
					<i class="item_icon bx bx-file-find"></i>
					<span class="item_text">내 이력서 관리</span>
					<button type="button" class="content_item_btn" onclick="location.href='/jobel/myPage?menu=viewResume';">이동</button>
				</li>
			</ul>
		</div>	<!-- 이력서 정보 끝 -->
		
		<!-- 관심 등록 관리 -->
		<div class="content_item">
			<a href="" class="content_item_title">
				<span class="item_title">관심 등록</span>
			</a>
			<ul class="content_item_row">
				<li>
					<i class="item_icon bx bx-notification"></i>
					<span class="item_text">관심 공고</span>
					<button type="button" class="content_item_btn" onclick="location.href='/jobel/myPage?menu=interest';">이동</button>
				</li>
				<li>
					<i class="item_icon bx bx-buildings"></i>
					<span class="item_text">관심 기업</span>
					<button type="button" class="content_item_btn">버튼</button>
				</li>
			</ul>
		</div>	<!-- 관심 등록 끝 -->
		
		<!-- 게시판 관리 -->
		<div class="content_item">
			<a href="" class="content_item_title">
				<span class="item_title">내 게시글</span>
			</a>
			<ul class="content_item_row">
				<li>
					<i class="item_icon bx bx-task"></i>
					<span class="item_text">1:1 문의 확인</span>
					<button type="button" class="content_item_btn" onclick="location.href='/jobel/myPage=?menu=myQna&currentPage=1';">버튼</button>
				</li>
				<li>
					<i class="item_icon bx bx-briefcase-alt"></i>
					<span class="item_text">취업상담 글 확인</span>
					<button type="button" class="content_item_btn">버튼</button>
				</li>
			</ul>
		</div>	<!-- 게시판 관리 끝 -->
	</div>	<!-- Content 끝 -->