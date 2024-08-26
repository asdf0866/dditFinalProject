<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

	<div class="login">
		<div class="login__content">
			<div class="login__img">
				<img src="https://image.freepik.com/free-vector/code-typing-concept-illustration_114360-3581.jpg" alt="user login">
			</div>
			
			<!-- login form -->
			<div class="login__forms">
				<form action="/login" class="login__register" id="login-in" method="post">
					<h1 class="login__title" id="homeTitle">JOB을래</h1>
					<div class="login__box">
						<i class='bx bx-user login__icon'></i>
						<input type="text" placeholder="아이디를 입력하세요." class="login__input" name="username" id="memId">
					</div>
					<div class="login__box">
						<i class='bx bx-lock login__icon'></i>
						<input type="password" placeholder="비밀번호를 입력하세요." class="login__input" name="password" id="memPassword">
					</div>
					<a href="/jobel/findIdPwForm" class="login__forgot">아이디 / 비밀번호 찾기</a>
					<a href="#" class="login__button" onclick="return submit()">로그인</a>
					<div>
						<span class="login__account login__account--account">계정이 없으신가요?</span>
						<a class="login__signin login__signin--signup" id="sign-up" href="/jobel/register">회원 가입</a>
					</div>
					<sec:csrfInput/>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			var home = $('#homeTitle');
			home.on('click', function(){
				location.href = "/jobel/home";
			});
			
			//	엔터키로 로그인하는 이벤트
			$('#memId, #memPassword').on('keydown', function(e){
				if (e.code == 'Enter'){
					$('.login__button').click();
				}
			});
		});
		function submit(){
			$('#login-in').submit();
		}
	</script>