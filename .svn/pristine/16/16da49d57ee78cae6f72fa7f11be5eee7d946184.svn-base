<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

	<c:set value="${pagingVO.dataList }" var="consultList"/>
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
				<span class="mx-2 fw-bold fs-4">취업상담</span>
			</div>
			<div class="subContent">
				<div class="myResume">
					<div class="infoTitle">
						<span class='titleText'>내 상담 글</span>
					</div>
				</div>
				<ul class="infoContent infoContentHeader">
					<li class="col-1 text-center">번호</li>
					<li class="col-5 text-center">제목</li>
					<li class="col-2 text-center">조회수</li>
					<li class="col-2 text-center">작성일</li>
					<li class="col-2 text-center text-wrap"> - </li>
				</ul>
				<c:choose>
					<c:when test="${consultList == '' or consultList == null }">
						<ul class="infoContent">
							<li>작성한 취업상담 글이 없습니다.</li>
						</ul>
						</c:when>
					<c:otherwise>
						<c:forEach items="${consultList }" var="consult" varStatus="stat">
							<ul class="infoContent">
								<li class="col-1 text-center">
									${pagingVO.totalRecord - (stat.count + ((pagingVO.currentPage-1) * pagingVO.screenSize)) + 1 }
								</li>
								<li class="col-5 recTitle">
									<input type="hidden" value="${consult.boardNo }" name="boardNo"/>
									<c:set var="consultTitle" value="${consult.title }" />
									<c:if test="${consultTitle.length() <= 20 }">${consultTitle }</c:if>
									<c:if test="${consultTitle.length() > 20 }">${consultTitle.substring(0, 20) }...</c:if>
								</li>
								<li class="col-2 text-center">${consult.hit }</li>
								<li class="col-2 text-center">
									<fmt:formatDate value="${consult.wrtDt}" pattern="yyyy-MM-dd" />
								</li>
								<li class="col-2 text-center">
									<button type="button" class="content_item_btn detailBtn" value="${consult.boardNo }" style="float:none;">상세보기</button>
								</li>
							</ul>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<div class="pagingFooter">
					${pagingVO.getPagingHtml() }
				</div>
				<form id="applyPageForm" action="" method="get">
					<input type="hidden" name="menu" value="myConsulting">
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
		
		//	상세보기 버튼 클릭 이벤트
		$('.detailBtn').on('click', function(){
			var qnaNo = $(this).val();
			location.href = "/jobel/detail?boardNo=" + qnaNo;
		});		//	.detailBtn onClick 이벤트 종료
	});
	</script>