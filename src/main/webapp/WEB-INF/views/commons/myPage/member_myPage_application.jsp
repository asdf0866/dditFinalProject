<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

	<c:set value="${pagingVO.dataList }" var="applyList"/>
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
				<span class="mx-2 fw-bold fs-4">지원 현황 관리</span>
			</div>
			<div class="subContent">
				<div class="myResume">
					<div class="infoTitle">
						<span class='titleText'>지원한 공고</span>
					</div>
				</div>
				<ul class="infoContent infoContentHeader">
					<li class="col-1 text-center">번호</li>
					<li class="col-5 text-center">공고 제목</li>
					<li class="col-2 text-center">공고 기업</li>
					<li class="col-2 text-center">심사 단계</li>
					<li class="col-2 text-center text-wrap">공고 지원일</li>
				</ul>
				<c:choose>
					<c:when test="${applyList == '' or applyList == null or empty applyList }">
						<ul class="infoContent">
							<li>채용 지원한 기록이 존재하지 않습니다.</li>
						</ul>
						</c:when>
					<c:otherwise>
						<c:forEach items="${applyList }" var="application" varStatus="stat">
							<ul class="infoContent">
								<li class="col-1 text-center">
									${stat.count + ((pagingVO.currentPage-1) * pagingVO.screenSize) }
								</li>
								<li class="col-5 recTitle">
									<input type="hidden" value="${applyRecruitList[stat.index].recruitNo }" name="recruitNo"/>
									<c:set var="recTitle" value="${applyRecruitList[stat.index].title }" />
									<c:if test="${recTitle.length() <= 20 }">${recTitle }</c:if>
									<c:if test="${recTitle.length() > 20 }">${recTitle.substring(0, 20) }...</c:if>
								</li>
								<li class="col-2 text-center">${applyRecruitList[stat.index].coName }</li>
								<li class="col-2 text-center">
									<c:if test="${application.appStatCode == 'APPSTAT001' }">
										서류 접수
									</c:if>
									<c:if test="${application.appStatCode == 'APPSTAT002' }">
										서류 검토
									</c:if>
									<c:if test="${application.appStatCode == 'APPSTAT003' }">
										평가 / 검사 대기
									</c:if>
									<c:if test="${application.appStatCode == 'APPSTAT004' }">
										면접 대기
									</c:if>
								</li>
								<li class="col-2 text-center">
									<fmt:parseDate value="${application.appApplyYmd }" pattern="yyyyMMdd" var="appApplyYmd"/>
									<fmt:formatDate value="${appApplyYmd }" pattern="yyyy-MM-dd"/>
								</li>
							</ul>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<div class="pagingFooter">
					${pagingVO.getPagingHtml() }
				</div>
				<form id="applyPageForm" action="" method="get">
					<input type="hidden" name="menu" value="application">
					<input type="hidden" id="page" name="page" value="${pagingVO.currentPage }" />
				</form>
			</div>
		</div>
	</div>		<!-- content 끝 -->
	
	<script type="text/javascript">
	$(function(){
		//	페이징 처리 이벤트
		$('.pagingFooter').on('click', 'a', function(event){
			event.preventDefault();					//	a 태그의 이벤트 제거
			var pageNo = $(this).data("page");		//	페이지 번호
			
			$('#applyPageForm').find('#page').val(pageNo);
			$('#applyPageForm').submit();
		});		//	pagingArea onClick 이벤트 종료
		
		$('.recTitle').on('click', function(){
			var recNo = $(this).find('input[name:recruitNo]').val();
			location.href = "/jobel/recDetail?recruitNo=" + recNo;
			
		});
	});
	</script>