<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

	<div class="content w-100">
		<div class="header_top d-flex justify-content-end">
			<form action="/jobel/logout" method="post">
				<input type="submit" class="btn btn-sm btn-secondary mx-2" value="로그아웃" />
				<sec:csrfInput/>
			</form>
			<a href="/jobel/home" class="btn btn-sm btn-secondary">돌아가기</a>
		</div>
		
		<div class="subIndex">
			<div class="subHeader my-2">
				<span class="mx-2 fw-bold fs-4">이력서 관리</span>
			</div>
			<div class="subContent">
				<div class="myResume">
					<div class="infoTitle">
						<span class='titleText'>이력서 목록</span>
					</div>
					<a href="/jobel/resumeWrite" class="content_item_btn recWriteBtn">이력서 작성</a>
				</div>
				<ul class="infoContent infoContentHeader">
					<li class="col-1 text-center">번호</li>
					<li class="col-5">이력서 제목</li>
					<li class="col-2 text-center">이력서 등록일</li>
					<li class="col-2 text-center">이력서 공개 여부</li>
					<li class="col-2 text-center">이력서 상태</li>
				</ul>
				<c:choose>
					<c:when test="${resumeList == null or resumeList == '' or empty resumeList}">
						<ul class="infoContent">
							<li>저장한 이력서가 존재하지 않습니다.</li>
						</ul>
						</c:when>
					<c:otherwise>
						<c:forEach items="${resumeList }" var="resume" varStatus="stat">
							<ul class="infoContent">
								<li class="col-1 text-center">${stat.count }</li>
								<li class="col-5 rsmTitle">
									<input type="hidden" value="${resume.rsmNo }" name="rsmNo"/>
									${resume.rsmTitle }
								</li>
								<li class="col-2 text-center">
									<fmt:parseDate value="${resume.rsmRegYmd }" pattern="yyyyMMdd" var="rsmRegYmd"/>
									<fmt:formatDate value="${rsmRegYmd }" pattern="yyyy-MM-dd"/>
								</li>
								<li class="col-2 text-center">
									<c:choose>
										<c:when test="${resume.rsmRlsYn eq 'Y'}">공개</c:when>
										<c:when test="${resume.rsmRlsYn eq 'N'}">비공개</c:when>
									</c:choose>
								</li>
								<li class="col-2 text-center">
									<c:forEach items="${codeList }" var="code">
										<c:if test="${resume.rsmStatCode == code.commonCodeDetail }">
											<input type="hidden" value="${resume.rsmStatCode }" name="rsmStatCode"/>
											${code.commonDetailName }
										</c:if>
									</c:forEach>
								</li>
							</ul>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>		<!-- content 끝 -->

	<script type="text/javascript">
		$(function(){
			//	이력서 제목 클릭 이벤트
			$('.rsmTitle').on('click', function(){
				//	이동할 URL 경로
				var rsmUrl = "";
				
				//	이동 전 해당 이력서의 상태 확인
				var rsmStatCode = $(this).parents('.infoContent').find('input[name=rsmStatCode]').val();
				if(rsmStatCode == 'RSMTYPE001'){		//	임시저장의 이력서 경우 작성으로 이동
					rsmUrl = "/jobel/resumeWrite";
				} else {		//	작성 완료 된 이력서의 경우 상세보기로 이동
					var rsmNo = $(this).find('input[name=rsmNo]').val();		//	상세보기 할 이력서 번호
					rsmUrl = "/jobel/resumeInfo?rsmNo=" + rsmNo;
				}
				
				location.href = rsmUrl;
			});		//	.rsmTitle onClick 이벤트 종료
		});		//	$(function()) 종료
	</script>
