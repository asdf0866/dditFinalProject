<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<c:set value="${pagingVO.dataList }" var="reportList"/>
<div class="containerBody">
	<div class="contentHeader">
		<span>신고 목록</span>
	</div>
	<div class="contentBody">
		<div class="listHeader">
			<div class="listHeaderTitle col-2">순번</div>
			<div class="listHeaderTitle col-2">신고 아이디</div>
			<div class="listHeaderTitle col-2">신고 사유</div>
			<div class="listHeaderTitle col-2">신고자 아이디</div>
			<div class="listHeaderTitle col-2">신고일자</div>
			<div class="listHeaderTitle col-2">&nbsp;</div>
		</div>
		<div class="listContentBox">
			<c:forEach items="${reportList }" var="report" varStatus="stat">
				<div class="listContent">
					<div class="listContentText col-2">${stat.count + (pagingVO.screenSize * (pagingVO.currentPage - 1)) }</div>
					<div class="listContentText col-2">${report.reportId }</div>
					<div class="listContentText col-2">${report.reasonName }</div>
					<div class="listContentText col-2">${report.reporterId }</div>
					<div class="listContentText col-2">
						<fmt:formatDate value="${report.reportDt }" pattern="yyyy-MM-dd" />
					</div>
					<div class="listContentText col-2">
						<button type="button" class="adminButton" idx="${report.reviewNo }">신고 리뷰 확인</button>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="listFooter">
			${pagingVO.getPagingHtml() }
		</div>
		<form id="pageForm" action="" method="get">
			<input type="hidden" name="menu" value="alertManage">
			<input type="hidden" id="page" name="page" value="${pagingVO.currentPage }" />
		</form>
	</div>		<!-- contentBody 끝 -->
</div>

<script>
	$(function(){
		$(".adminButton").on('click', function(){
			var reviewNo = $(this).attr("idx");
			location.href = "/jobel/checkAlert?reviewNo=" + reviewNo;
		});
	});
</script>