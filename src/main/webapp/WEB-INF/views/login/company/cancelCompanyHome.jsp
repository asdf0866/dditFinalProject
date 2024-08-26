<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

	<div class="login">
		<div class="login_box">
			<div class="left" style="width: 48%;">
				<div class="container">
					<div class="text-center my-5">
						<div class="col-md-12 row">
							<div class="col-12 mt-5">
								<c:if test="${stat == 'wait' }">
									<p class="mainText">현재 승인 대기 중입니다.</p>
									<p class="subText">상태 : 승인 대기</p>
									<p class="subText">자세한 사항은 고객센터로 문의주세요.</p>
									<p class="miniText mt-5">(주)잡을래 / EMAIL : ddit@gmail.com</p>
									<p class="miniText">TEL : 042-222-8202 / FAX : 042-222-8202</p>
								</c:if>
								<c:if test="${stat == 'cancel' }">
									<p class="mainText">요청이 반려되었습니다.</p>
									<p class="subText">반려 사유 : 서류 미흡</p>
									<p class="miniText mt-5">(주)잡을래 / EMAIL : ddit@gmail.com</p>
									<p class="miniText">TEL : 042-222-8202 / FAX : 042-222-8202</p>
								</c:if>
							</div>
							<div class="col-12 d-flex justify-content-around mt-5">
								<form action="/jobel/logout" method="post">
									<button type="submit" class="btn btn-primary mt-5">돌아가기</button>
									<sec:csrfInput/>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="right" style="width: 52%;">
				<img src="${pageContext.request.contextPath }/resources/images/default/oops.jpg" class='rightImage' alt="">
			</div>
		</div>
	</div>
	
<script type="text/javascript">
	$(function(){
		//	헤더 안 보이게 숨기기
		$('body').find('nav').css('display', 'none');
	});		//	$(function()) 종료
</script>