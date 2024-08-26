<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set value="${pagingVO.dataList }" var="reviewList"/>
<main id="main" class="main">
	<div class="pagetitle">
		<h1>리뷰 목록</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/jobel/co_home">Home</a></li>
				<li class="breadcrumb-item active">리뷰 관리</li>
			</ol>
		</nav>
	</div><!-- End Page Title -->
	
	<section class="section">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="card-title">
							<h5 class="card-text" style="font-weight: 600;">기업 평점</h5>
						</div>
						<div class="card-container d-flex justify-content-evenly">
							<div class="card col-2">
								<div class="card-header">
									복지 점수(${scoreMap.get('WELFARE') }점)
								</div>
								<div class="card-body">
									<div class="starArea" id="welfare_evl">
										<c:forEach begin="0" end="4" step="1" varStatus="stat">
											<c:choose>
												<c:when test="${stat.count <= scoreMap.get('WELFARE') }">
													<span class="star on"></span>
												</c:when>
												<c:otherwise>
													<span class="star"></span>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="card col-2">
								<div class="card-header">
									급여 점수(${scoreMap.get('SALARY') }점)
								</div>
								<div class="card-body">
									<div class="starArea" id="salary_evl">
										<c:forEach begin="0" end="4" step="1" varStatus="stat">
											<c:choose>
												<c:when test="${stat.count <= scoreMap.get('SALARY') }">
													<span class="star on"></span>
												</c:when>
												<c:otherwise>
													<span class="star"></span>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="card col-2">
								<div class="card-header">
									사내문화 점수(${scoreMap.get('CULTURE') }점)
								</div>
								<div class="card-body">
									<div class="starArea" id="culture_evl">
										<c:forEach begin="0" end="4" step="1" varStatus="stat">
											<c:choose>
												<c:when test="${stat.count <= scoreMap.get('CULTURE') }">
													<span class="star on"></span>
												</c:when>
												<c:otherwise>
													<span class="star"></span>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="card col-2">
								<div class="card-header">
									자기개발 점수(${scoreMap.get('IMPROVE') }점)
								</div>
								<div class="card-body">
									<div class="starArea" id="improve_evl">
										<c:forEach begin="0" end="4" step="1" varStatus="stat">
											<c:choose>
												<c:when test="${stat.count <= scoreMap.get('IMPROVE') }">
													<span class="star on"></span>
												</c:when>
												<c:otherwise>
													<span class="star"></span>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="card col-2">
								<div class="card-header">
									경영진 점수(${scoreMap.get('MANAGE') }점)
								</div>
								<div class="card-body">
									<div class="starArea" id="manage_evl">
										<c:forEach begin="0" end="4" step="1" varStatus="stat">
											<c:choose>
												<c:when test="${stat.count <= scoreMap.get('MANAGE') }">
													<span class="star on"></span>
												</c:when>
												<c:otherwise>
													<span class="star"></span>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
						<hr/>
						<div class="card-title">
							<h5 class="card-text" style="font-weight: 600;">리뷰 목록</h5>
						</div>
						<div class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">
							<div class="datatable-container">
								<table class="table text-center table-bordered">
									<thead>
										<tr>
											<th class="col-1">번호</th>
											<th class="col-6">리뷰 제목</th>
											<th class="col-1">조회수</th>
											<th class="con-2">리뷰 작성일</th>
											<th class="col-2">평점</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${reviewList == null or empty reviewList}">
												<tr>
													<td colspan="5">
														<font style="font-weight: 600; font-size: 1.2rem;">작성된 리뷰가 없습니다.</font>
													</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${reviewList }" var="review" varStatus="stat">
												<tr>
													<td>${stat.count }</td>
													<td>${review.title }</td>
													<td>${review.hit }</td>
													<td>
														<fmt:parseDate value="${review.wrtDt }" var="wrtDt" pattern="yyyy-MM-dd HH:mm:ss"/>
														<fmt:formatDate value="${wrtDt }" pattern="yyyy-MM-dd HH:mm:ss"/>
													</td>
													<td>
														${review.getAvgScore() }
													</td>
												</tr>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
							<div class="datatable-bottom">
								<div class="datatable-info">
								</div>
								<nav class="datatable-pagination">
									${pagingVO.getPagingHtml() }
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<form id="pageForm" action="" method="get">
			<input type="hidden" id="page" name="page" value="${pagingVO.currentPage }" />
		</form>
	</section>
</main>

	<script>
	//	페이징 처리 이벤트
		$(function(){
			$('.datatable-pagination').on('click', 'a', function(event){
				event.preventDefault();					//	a 태그의 이벤트 제거
				var pageNo = $(this).data("page");		//	페이지 번호
				
				$('#pageForm').find('#page').val(pageNo);
				$('#pageForm').submit();
			});		//	pagingArea onClick 이벤트 종료
		});		//	$(function()) 종료
	</script>