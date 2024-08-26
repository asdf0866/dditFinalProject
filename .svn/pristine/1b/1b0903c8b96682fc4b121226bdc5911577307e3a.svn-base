<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<style>
#pagingArea{
	display: flex;
	justify-content: center;
}
.popular-posts {
    display: flex; /* Flexbox 사용 */
    flex-wrap: wrap; /* 줄 바꿈 허용 */
    max-width: 1200px; /* 최대 너비 설정 */
    margin: 20px auto; /* 중앙 정렬 */
    padding: 15px;
}

.cont {
    flex: 1 0 30%; /* 각 항목의 기본 너비를 30%로 설정 */
    margin: 10px; /* 항목 간 여백 */
    padding: 15px; /* 각 항목의 패딩 */
    border: 1px solid #e0e0e0; /* 테두리 */
    border-radius: 8px; /* 모서리 둥글게 */
    background-color: #f9f9f9; /* 배경색 */
    transition: background-color 0.3s; /* 배경색 변화 효과 */
}

.cont:hover {
    background-color: #f1f1f1; /* 호버 시 배경색 변경 */
}

.cont-title {
    font-size: 18px; /* 제목 폰트 크기 */
    font-weight: bold; /* 제목 두껍게 */
    color: #333; /* 제목 색상 */
}

.cont-title a {
    text-decoration: none; /* 링크 밑줄 제거 */
    color: inherit; /* 부모 색상 상속 */
}

.cont-title a:hover {
    text-decoration: underline; /* 호버 시 밑줄 추가 */
    color: #007bff; /* 호버 시 링크 색상 변경 */
}

.cont-info {
    font-size: 14px; /* 정보 폰트 크기 */
    color: #555; /* 정보 색상 */
    margin-top: 5px; /* 위쪽 여백 */
}

.cont-info span {
    margin-right: 10px; /* 각 정보 항목 간 여백 */
}
.table {
    width: 100%; /* 테이블 너비를 100%로 설정 */
}

.text-center {
    text-align: center; /* 텍스트 가운데 정렬 */
}
</style>
	
<div class="container-fluid hero-header bg-light py-5 mb-5">
	<div class="container py-5">
		<div class="row g-5 align-items-center">
			<div class="col-lg-6">
				<h1 class="display-4 mb-3 animated slideInDown">취업 상담 게시판</h1>
				<nav aria-label="breadcrumb animated slideInDown"></nav>
			</div>
			<div class="col-lg-6 animated fadeIn">
				<img class="img-fluid animated pulse infinite" style="animation-duration: 3s;" src="resources/cryptocurrency/img/hero-2.png" alt="">
			</div>
		</div>
	</div>
</div>

<div class="container-xxl py-5">
	<div class="container">
		<div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s">
			<p class="main-tit flex" style="font-weight: bold; margin-bottom: 15px;">🏅인기글</p>
			<div class="popular-posts">
				<c:forEach var="board" items="${popularQNAList }">
					<div class="cont">
						<p class="cont-title hover_underline">
							<a href="/jobel/detail?boardNo=${board.boardNo}">${board.title }</a>
						</p>
						<p class="cont-info">
							<span class="cont-writer"> ${board.writer }</span> 
							<span class="cont-like">작성일
							<fmt:formatDate value="${board.wrtDt }" pattern="yy-MM-dd"/>
							</span> 
						</p>
					</div>
				</c:forEach>
			</div>
		</div>
		<hr class="my-5">

		<div class="col-lg-12 col-md-18 wow fadeInUp" data-wow-delay="0.5s">
			<div class="bg-light p-5">
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card card-dark card-outline">
								<div class="card-header">
									<div class="card-tools">
										<form class="input-group input-group-sm" id="searchForm"
											style="width: 440px;">
											<input type="hidden" name="page" id="page" /> <select
												class="form-control" name="searchType">
												<option value="title"
													<c:if test="${searchType eq 'title' }">selected</c:if>>제목</option>
												<option value="writer"
													<c:if test="${searchType eq 'writer' }">selected</c:if>>작성자</option>
											</select> <input type="text" name="searchWord" value="${searchWord }"
												class="form-control float-right" placeholder="Search">
											<div class="input-group-append">
												<button type="submit" class="btn btn-default">
													<i class="fas fa-search"></i>검색
												</button>
											</div>
											<sec:csrfInput />
										</form>
									</div>
									<h3 class="card-title"></h3>
								</div>
								<div class="card-body">
									<table class="table table-bordered">
										<thead class="table-dark">
											<tr style="text-align: center;">
												<th style="width: 8%;">글 번호</th>
												<th style="width: 54%;text-align:left;">제목</th>
												<th style="width: 12%">작성자</th>
												<th style="width: 12%">작성일</th>
												<th style="width: 12%">조회수</th>
											</tr>
										</thead>
										<tbody>
											<c:set value="${pagingVO.dataList }" var="boardList" />
											<c:choose>
												<c:when test="${empty boardList }">
													<tr>
														<td colspan="5">조회하실 게시글이 존재하지 않습니다.</td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach items="${boardList }" var="board">
														<c:set value="primary" var="color" />
														<c:if test="${board.writer eq 'admin' }">
															<c:set value="danger" var="color" />
														</c:if>
														<tr style="text-align: center;">
															<td>${board.rnum}</td>
															<td style="text-align: left;">
																<a href="/jobel/detail?boardNo=${board.boardNo }" style="color: black;text-decoration: none;">
																	${board.title }
																</a>
															</td>
															<td>
																${board.writer} </td>
															<td><fmt:formatDate value="${board.wrtDt }"
																	pattern="yy-MM-dd" /></td>
															<td>${board.hit }</td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tbody>
									</table>

								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<div>
				<br>
				<div class="card-footer clearfix" id="pagingArea">
					${pagingVO.pagingHtml }</div>
				<form id="pageInfo">
					<input type="hidden" name="page" id="page">
					<sec:csrfInput />
				</form>
				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal.member" var="member"/>
					<sec:authentication property="principal.member.memId" var="memId"/>
					<input type="button" class="btn btn-primary" value="글 작성"	id="writeBtn">
				</sec:authorize>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
    	$(function(){
    		var writeBtn = $('#writeBtn');		//	글 작성 버튼
    		var pagingArea = $("#pagingArea");
    		var searchForm = $("#searchForm");
    		//	글 작성 버튼 클릭 이벤트
    		writeBtn.on('click', function(){
    			location.href = "/jobel/con_writeForm";
    		});
   		  var pagingArea = $("#pagingArea");
   	      var pageInfo = $("#pageInfo");

   	      pagingArea.on("click", "a", function(event) {
   	         event.preventDefault();
   	         var pageNo = $(this).data("page");
   	         // 검색시 사용할 form 태그안에 넣어준다. 
   	         // 검색시 사용할 form 태그를 활용해서 검색도하고 페이징 처리도 같이 진행함
   	         pageInfo.find("#page").val(pageNo);
   	         pageInfo.submit();
   	      });

    		
//     		pagingArea.on("click", "a", function(event){
//     			event.preventDefault();
//     			var pageNo = $(this).data("page");
//     			// 검색 시 사용할 form태그안에 넣어준다.
//     			// 검색 시 사용할 form태그를 활용해서 검색도하고 페이징 처리도 같이 진행함
//     			searchForm.find("#page").val(pageNo);
//     			searchForm.submit();
//     		});
    	});
    

    </script>


