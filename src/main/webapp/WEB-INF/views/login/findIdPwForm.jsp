<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div class="find__form">
	<img src="https://image.freepik.com/free-vector/code-typing-concept-illustration_114360-3581.jpg" class="findFormImg">
	<div class="find__container" id="find__container">
		<div class="form__container find__id_container">
				<form action="/jobel/findId.do" method="post">
					<h1 style="margin-bottom: 50px">아이디 찾기</h1>
					<input type="text" name="name" placeholder="이름을 입력하세요.">
					<input type="text" name="email" placeholder="이메일을 입력하세요.">
					<button type="submit" style="margin-top:25px;">아이디 찾기</button>
					<sec:csrfInput/>
				</form>
			</div>
			<div class="form__container find__pw_container">
				<form action="/jobel/findPw.do" method="post">
					<h1 style="margin-bottom: 50px;">비밀번호 찾기</h1>
					<input type="text" name="memId" placeholder="아이디를 입력하세요.">
					<input type="text" name="name" placeholder="이름을 입력하세요.">
					<input type="text" name="email" placeholder="이메일을 입력하세요.">
					<button type="submit" style="margin-top:25px;">비밀번호 찾기</button>
					<sec:csrfInput/>
				</form>
		</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>아이디 찾기</h1>
					<p>아이디를 분실 하셨나요?</p>
					<p>돌아가고 싶을 땐 <span class="backWord">클릭!</span></p>
					<button class="ghost" id="findId">아이디 찾기</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>비밀번호 찾기</h1>
					<p>비밀번호를 분실 하셨나요?</p>
					<p>돌아가고 싶을 땐 <span class="backWord">클릭!</span></p>
					<button class="ghost" id="findPw">비밀번호 찾기</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function(){
		var findPwButton = $('#findPw');
		var findIdButton = $('#findId');
		var container = $('#find__container');

		findPwButton.on('click', function(){
			container.addClass("right-panel-active");
		});
		
		findIdButton.on('click', function(){
			container.removeClass("right-panel-active");
		});
		
		$('.backWord').on('click', function(){
			location.href = "/jobel/login";
		});
	});		//	$(function()) 종료

</script>