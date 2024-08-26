<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<c:if test="${param.memId == null }">
	<script type="text/javascript">
		alert("데이터가 만료되었습니다.");
		location.href = "/jobel/login";
	</script>
</c:if>

<div class="find__form">
	<img src="https://image.freepik.com/free-vector/code-typing-concept-illustration_114360-3581.jpg" class="findFormImg">
	<div class="find__container" id="find__container">
		<div class="form__container find__id_container">
				<form action="" method="post">
					<h1 style="margin-bottom: 50px">비밀번호 변경</h1>
					<input type="password" name="password" placeholder="새로운 비밀번호를 입력하세요.">
					<input type="password" name="checkPassword" placeholder="변경할 비밀번호를 다시 입력하세요.">
					<div id="errorMsg"></div>
					<button type="button" style="margin-top:25px;" disabled="disabled" id="changePwBtn">변경하기</button>
					<sec:csrfInput/>
				</form>
			</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
				</div>
				<div class="overlay-panel overlay-right">
					<h1>(주)잡을래</h1>
					<p>비밀번호는 신중하게 정해주세요.</p>
					<p><span class="backWord">홈페이지로 돌아가기</span></p>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function(){
		
		$('#changePwBtn').on('click', function(){
			var memId = '${param.memId}';
			var password = $('input[name=password]').val();
			console.log(memId);
			$.ajax({
				url : "/jobel/changePassword",
				type : "post",
				beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
					xhr.setRequestHeader(header, token);
				},
				data : {
					memId : memId,
					memPassword : password,
				},
				success : function(res){
					if(res == "SUCCESS"){
						alert("비밀번호 변경이 완료되었습니다.");
						location.href = "/jobel/login";
					}
				}, error : function(xhr){
					alert("비밀번호 변경에 실패했습니다. 잠시 후 다시 시도해주세요.");
					console.log("에러 코드 : " + xhr.status);
				}
			});		//	$.ajax() 종료
		});
		
		//	비밀번호 일치 여부 확인
		$('input[name=checkPassword]').on('keyup', function(){
			var password = $('input[name=password]').val();
			
			if(password == "" || password == null){		//	비밀번호를 입력하지 않음
				$('#errorMsg').html("<font color='red'>비밀번호를 입력해주세요.</font>");
				$('#changePwBtn').attr('disabled', true);
				return false;
			}
			
			var checkPw = $('input[name=checkPassword]').val();
			if(password != checkPw){		//	비밀번호가 일치하지 않음
				$('#errorMsg').html("<font color='red'>비밀번호가 일치하지 않습니다.</font>");
				$('#changePwBtn').attr('disabled', true);
				return false;
			}
			
			if(password == checkPw) {		//	비밀번호 일치
				$('#errorMsg').html("");
				$('#changePwBtn').attr('disabled', false);
			}
		});		//	비밀번호 일치 여부 검증 이벤트 종료
		
		//	홈페이지로 돌아가기 버튼 클릭 이벤트
		$('.backWord').on('click', function(){
			location.href = "/jobel/home";
		});
	});		//	$(function()) 종료
</script>