<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<div class="container-fluid hero-header bg-light py-5 mb-5">
		<div class="container py-5">
			<div class="row g-5 align-items-center">
				<div class="col-lg-6">
					<h1 class="display-4 mb-3 animated slideInDown">1:1 문의게시판</h1>
					<nav aria-label="breadcrumb animated slideInDown">
						<ol class="breadcrumb mb-0">
							<li class="breadcrumb-item"><a href="/jobel/home" style="text-decoration: none; color:black;">Home</a></li>
							<li class="breadcrumb-item"><a href="/jobel/faq" style="text-decoration: none; color:black;">Faq</a></li>
							<li class="breadcrumb-item active" aria-current="page">Qna</li>
						</ol>
					</nav>
				</div>
				<div class="col-lg-6 animated fadeIn">
					<img class="img-fluid animated pulse infinite" style="animation-duration: 3s;" src="resources/cryptocurrency/img/hero-2.png" alt="">
				</div>
			</div>
		</div>
	</div>
	
		<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="">
					<div class="card-header">
						<div class="card-tools">
						</div>
						<h3 class="card-title" align="center">1:1 문의게시판</h3>
						<!-- 로그인한 사용자만 글쓰기 버튼 활성화하기 -->
<%-- 						<c:if test="${sessionScope.memId != null }"> --%>
							<div align="right">
								<a href="/jobel/qnaInsertForm" class="btn btn-primary">등록</a>
<!-- 							</div> -->
<%-- 						</c:if> --%>
<!-- 						<div align="right"> -->
<%-- 							<span class="badge bg-dark-subtle border border-dark-subtle text-dark-emphasis rounded-pill">전체 ${pagingVo.totalRecord }건</span> --%>
<!-- 						</div> -->
					</div>
					<div class="card-body mt-3">
						<div align="right">
							<form action="" class="input-group input-group-sm" method="get" id="searchForm" style="width: 440px;">
								<input type="hidden" name="page" id="page">
								<select class="form-control" name="searchType">
									<option value="title" <c:if test="${searchType eq 'title' }">selected</c:if>>제목</option>
									<option value="writer" <c:if test="${searchType eq 'writer' }">selected</c:if>>작성자</option>
								</select>
								<input type="text" name="searchWord" class="form-control float-right" 
									value="${searchWord }" placeholder="Search">
								<div class="input-group-append">
									<button type="submit" class="btn btn-primary">
										<i class="fas fa-search"></i>검색
									</button>
								</div>
							</form>
						</div>
						<div class="mt-2">
							<table class="table">
								<thead class="table-primary">
									<tr>
										<th style="width: 6%">No</th>
										<th style="width: px">제목</th>
										<th style="width: 12%">작성자</th>
										<th style="width: 12%">작성일</th>
										<th style="width: 10%">조회수</th>
									</tr>
								</thead>
								<tbody class="tbody">
									<c:set value="${pagingVo.dataList }" var="qnaList"/>
									<c:choose>
										<c:when test="${empty qnaList }">
											<tr>
												<td colspan="5">조회하신 게시글이 존재하지 않습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${qnaList }" var="qna">
												<tr data-no="${qna.boardNo}">
													<td>${qna.rnum }</td>
													<td>${qna.title }</td>
													<td>${qna.writer }</td>
													<td>
													<fmt:parseDate value="${qna.wrtDt }" pattern="yyyy-MM-dd HH:mm:ss" var="parseWrtDt"/>
													<fmt:formatDate pattern="yyyy-MM-dd" value="${parseWrtDt }" />
													</td>
													<td>${qna.hit }</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
						
						<div id="pagingArea" style="width:100%; padding:0 40% 0 40%;">
							${pagingVo.pagingHtml }
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-12"><br/><br/><br/></div>
		</div>
	</div>

<script type="text/javascript">

$(function(){
	var searchForm = $('#searchForm');
	var pagingArea = $('#pagingArea');
	
	pagingArea.on('click', 'a', function(event){
		event.preventDefault();	// 이벤트 블락
		var pageNo = $(this).data("page");	// 페이지 번호
		console.log(pageNo);
		searchForm.find('#page').val(pageNo);
		searchForm.submit();
	});
	
	$(".tbody").find("tr").click(function(){
		
		var qnaNo = $(this).attr("data-no");
		location.href="/jobel/qnaDetail?boardNo="+qnaNo;
	});
});

</script>
    
    



























