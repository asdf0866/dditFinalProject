<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set value="${pagingVO.dataList }" var="recList"/>
<main id="main" class="main">
	<div class="pagetitle">
		<h1>지원자 목록</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/jobel/co_home">Home</a></li>
				<li class="breadcrumb-item active">지원자 관리</li>
			</ol>
		</nav>
	</div><!-- End Page Title -->
	
	<section class="section">
		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="card-title">
							<h5 class="card-text" style="font-weight: 600;">공고 목록</h5>
						</div>
						<div class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">
							<div class="datatable-container">
								<table class="table text-center table-bordered">
									<thead>
										<tr>
											<th class="col-5">공고 제목</th>
											<th class="col-1">조회수</th>
											<th class="con-2">공고 등록일</th>
											<th class="col-2">채용 인원</th>
											<th class="col-2">지원자 수</th>
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${recList == null or empty recList}">
												<tr>
													<td colspan="5">
														<font style="font-weight: 600; font-size: 1.2rem;">등록한 공고가 없습니다.</font>
													</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach items="${recList }" var="recruit" varStatus="stat">
												<c:set var="appList" value="${recruit.appList }"/>
												<tr>
													<td>
														<a href="/jobel/co_app_detail?recruitNo=${recruit.recruitNo }">${recruit.title }</a>
													</td>
													<td>${recruit.hit }회</td>
													<td>
														<c:set var="regDate" value="${recruit.recruitRegYmd }" />
														<fmt:parseDate value="${regDate }" pattern="yyyyMMdd" var="fmtReg"/>
														<fmt:formatDate value="${fmtReg }" pattern="yyyy-MM-dd"/>
													</td>
													<td>${recruit.recruitCount }</td>
													<td>${appList.size() }명</td>
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

	<script type="text/javascript">
		$(function(){
			$('.datatable-pagination').on('click', 'a', function(event){
				event.preventDefault();					//	a 태그의 이벤트 제거
				var pageNo = $(this).data("page");		//	페이지 번호
				
				$('#pageForm').find('#page').val(pageNo);
				$('#pageForm').submit();
			});		//	pagingArea onClick 이벤트 종료
		});		//	$(function()) 종료
	</script>