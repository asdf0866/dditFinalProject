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
				<span class="mx-2 fw-bold fs-4">관심등록 관리</span>
			</div>
			<div class="subContent">
				<div class="myResume">
					<div class="infoTitle">
						<span class='titleText'>관심 공고</span>
					</div>
				</div>
				<ul class="infoContent infoContentHeader">
					<li class="col-1 text-center">번호</li>
					<li class="col-5 text-center">공고 제목</li>
					<li class="col-2 text-center">공고 기업</li>
					<li class="col-2 text-center text-wrap">공고 마감일</li>
					<li class="col-2 text-center text-wrap">관심 등록일</li>
				</ul>
				<c:choose>
					<c:when test="${intRecruitList == null or intRecruitList == '' or empty intRecruitList}">
						<ul class="infoContent">
							<li>등록한 관심 공고가 존재하지 않습니다.</li>
						</ul>
						</c:when>
					<c:otherwise>
						<c:forEach items="${intRecruitList }" var="intRecruit" varStatus="stat">
							<ul class="infoContent">
								<li class="col-1 text-center">${stat.count }</li>
								<li class="col-5 recTitle">
									<input type="hidden" value="${recruitList[stat.index].recruitNo }" name="recruitNo"/>
									<c:set var="recTitle" value="${recruitList[stat.index].title }" />
									<c:if test="${recTitle.length() <= 20 }">${recTitle }</c:if>
									<c:if test="${recTitle.length() > 20 }">${recTitle.substring(0, 20) }...</c:if>
								</li>
								<li class="col-2 text-center">${recruitList[stat.index].coName }</li>
								<li class="col-2 text-center">
									<fmt:parseDate value="${recruitList[stat.index].recruitDdlnYmd }" pattern="yyyyMMdd" var="ddlnYmd"/>
									<fmt:formatDate value="${ddlnYmd }" pattern="yyyy-MM-dd"/>
								</li>
								<li class="col-2 text-center">
									<fmt:parseDate value="${intRecruit.interestRegYmd }" pattern="yyyyMMdd" var="interestRegYmd"/>
									<fmt:formatDate value="${interestRegYmd }" pattern="yyyy-MM-dd"/>
								</li>
							</ul>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>		<!-- subContent(관심 공고) 끝 -->
			
			<div class="subContent">
				<div class="myResume">
					<div class="infoTitle">
						<span class='titleText'>관심 기업</span>
					</div>
				</div>
				<ul class="infoContent infoContentHeader">
					<li class="col-1 text-center">번호</li>
					<li class="col-6 text-center">기업명</li>
					<li class="col-3 text-center text-wrap">관심 등록일</li>
					<li class="col-2 text-center">상세보기</li>
				</ul>
				<c:choose>
					<c:when test="${intCompanyList == null or intCompanyList == '' or empty intCompanyList}">
						<ul class="infoContent">
							<li>등록한 관심 기업이 존재하지 않습니다.</li>
						</ul>
						</c:when>
					<c:otherwise>
						<c:forEach items="${intCompanyList }" var="intCompany" varStatus="stat">
							<ul class="infoContent">
								<li class="col-1 text-center">${stat.count }</li>
								<li class="col-6 comTitle">
									<input type="hidden" value="${companyList[stat.index].coNo }" name="coNo"/>
									<c:set var="coName" value="${companyList[stat.index].coName }" />
									<c:if test="${coName.length() <= 20 }">${coName }</c:if>
									<c:if test="${coName.length() > 20 }">${coName.substring(0, 20) }...</c:if>
								</li>
								<li class="col-3 text-center">
									<fmt:parseDate value="${intCompany.interestRegYmd }" pattern="yyyyMMdd" var="interestRegYmd"/>
									<fmt:formatDate value="${interestRegYmd }" pattern="yyyy-MM-dd"/>
								</li>
								<li class="col-2 text-center">
									<button type="button" idx="${companyList[stat.index].coNo }" class="content_item_btn comBtn" style="float: none;">이동</button>
								</li>
							</ul>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>		<!-- subContent(관심 기업) 끝 -->
		</div>
	</div>		<!-- content 끝 -->

	<script type="text/javascript">
		$(function(){
			//	관심 공고 제목 클릭 이벤트
			$('.recTitle').on('click', function(){
				var recruitNo = $(this).find('input[name=recruitNo]').val();
				var recUrl = "/jobel/recDetail?recruitNo=" + recruitNo;
				location.href = recUrl;
			});		//	.recTitle onClick 이벤트 종료
			
			
			//	관심 기업명 클릭 이벤트
			$('.comTitle').on('click', function(){
				var coNo = $(this).find('input[name=coNo]').val();
				var comUrl = "/jobel/comDetail?coNo=" + coNo;
				location.href= comUrl;
			});		//	.comTitle onClick 이벤트 종료
			
			//	관심 기업 상세보기 버튼 클릭 이벤트
			$('.comBtn').on('click', function(){
				var coNo = $(this).attr('idx');
				var comUrl = "/jobel/comDetail?coNo=" + coNo;
				location.href= comUrl;
			});		//	.comBtn onClick 이벤트 종료
		});		//	$(function()) 종료
	</script>