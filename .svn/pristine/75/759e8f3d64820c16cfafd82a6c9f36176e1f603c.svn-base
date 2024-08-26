<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

	<div class="asideContainer">
		<div class="asideHeader">
			<div class="asideLogo">
				<a href="/jobel/home" class="icon-link">
					<span><img class="myPageLogo" src="/resources/images/JOB을래_LOGO.png"></span>
				</a>
			</div>
		</div>		<!-- asideHeader 끝 -->
		
		<div class="asideBody">
			<div class="asideMenuBar">
				<div class="asideMenu">
					<p class="asideMenuText">관리자 메뉴</p>
				</div>
				<hr/>
				<div class="asideMenu">
					<div class="asideItem">
						<a href="/jobel/adminHome?menu=memberManage" id="memberManage" class="asideItemText">일반 회원 관리</a>
					</div>
				</div>
				<div class="asideMenu">
					<div class="asideItem">
						<a href="/jobel/adminHome?menu=coMemberManage" id="coMemberManage" class="asideItemText">기업 회원 관리</a>
					</div>
				</div>
				<div class="asideMenu">
					<div class="asideItem">
						<a href="/jobel/adminHome?menu=signManage" id="signManage" class="asideItemText">승인 처리</a>
					</div>
				</div>
				<div class="asideMenu">
					<div class="asideItem">
						<a href="/jobel/adminHome?menu=alertManage" id="alertManage" class="asideItemText">신고 처리</a>
					</div>
				</div>
				<div class="asideMenu">
					<div class="asideItem">
						<a href="/jobel/faq" id="faqManage" class="asideItemText">문의 관리</a>
					</div>
				</div>
			</div>
			<div class="asideFooter">
				<div class="asideFooterMenu">
					<span id="logoutSpan">로그아웃</span>
					<span id="mainHomeSpan">메인 화면</span>
				</div>
				<form action="/jobel/logout" method="post" id="logoutForm"><sec:csrfInput/></form>
				<c:if test="${menu != null }">
					<c:set value="${menu }" var="selectMenu"></c:set>
				</c:if>
			</div>
		</div>		<!-- asideBody 끝 -->
	</div>		<!-- asideContainer 끝 -->
	
	<script type="text/javascript">
		$(function(){
			//	메뉴를 선택했다면 해당 메뉴를 강조시키는 함수
			if('${selectMenu}' != null && '${selectMenu}' != ""){
				var menuId = '#' + '${selectMenu}';
				$(menuId).parent().addClass('selected');
				$(menuId).addClass('selectedText');
			}
				
			var imgFile = $("#modalImgFile");						//	이미지 파일 담을 input
			var modalProfilePhoto = $("#modalProfilePhoto");		//	이미지 변경 모달의 프로필 사진
			var changeImage = false;
			
			//	로그아웃 클릭 이벤트
			$('#logoutSpan').on('click', function(){
				$('#logoutForm').submit();
			});
			
			//	메인 화면 클릭 이벤트
			$('#mainHomeSpan').on('click', function(){
				location.href = "/jobel/home";
			});
		});
	</script>
