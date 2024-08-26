<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
	.resumeBody {
		max-height: 400px;
		overflow: auto;
	}
</style>
	<main id="main" class="main">
		<div class="pagetitle">
			<h1>지원자 목록</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/jobel/co_home">Home</a></li>
					<li class="breadcrumb-item"><a href="/jobel/co_apply_list">지원자 관리</a></li>
					<li class="breadcrumb-item">상세보기</li>
				</ol>
			</nav>
		</div>
		
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<div class="card-title">
								<div class="g-0 d-flex">
									<div class="col-md-3">
										<img class="img-thumbnail rounded float-start" src="${pageContext.request.contextPath }${recruit.coLogoPath }">
									</div>
									<div class="col-md-9 mx-3">
										<table class="table table-striped table-bordered align-middle text-center">
											<tr>
												<td class="text-start" colspan="4">
													<h3 class="card-title fs-3 fw-bold">${recruit.title }</h3>
													<p><b>공고 등록자 : </b>${recruit.coMemId }</p>
												</td>
											</tr>
											<tr>
												<td class="w-25 fw-bold">채용직무명</td>
												<td class="w-25">
													<input type="hidden" name="recruitJob" value="${recruit.recruitJob }">
													${recruit.jobName }
												</td>
												<td class="w-25 fw-bold">모집인원</td>
												<td class="w-25">${recruit.recruitCount }</td>
											</tr>
											<tr class="fw-bold">
												<td>근무 시간</td>
												<td>고용 형태</td>
												<td>급여</td>
												<td>공고 등록일</td>
											</tr>
											<tr>
												<td>${recruit.workTime }</td>
												<td>
													<input type="hidden" name="workType" value="${recruit.workType }" />
													${recruit.wrkTypeName }
												</td>
												<td>${recruit.salary }</td>
												<td>
													<c:set var="regDate" value="${recruit.recruitRegYmd }" />
													<fmt:parseDate value="${regDate }" pattern="yyyyMMdd" var="fmtReg"/>
													<fmt:formatDate value="${fmtReg }" pattern="yyyy-MM-dd"/>
												</td>
											</tr>
											<tr class="fw-bold">
												<td>요구 학력</td>
												<td>자격 요건</td>
												<td>채용 시작 시간</td>
												<td>채용 종료 시간</td>
											</tr>
											<tr>
												<td>
													<input type="hidden" name="requiredEducation" value="${recruit.requiredEducation }" />
													${recruit.schTypeName }
												</td>
												<td>${recruit.requiredQualification }</td>
												<td>
													<c:set var="bgngDate" value="${recruit.recruitBgngYmd}${recruit.recruitBgngDt }" />
													<fmt:parseDate value="${bgngDate }" pattern="yyyyMMddHHmm" var="fmtBgng"/>
													<fmt:formatDate value="${fmtBgng }" pattern="yy-MM-dd HH:mm"/>
												</td>
												<td>
													<c:set var="ddlnDate" value="${recruit.recruitDdlnYmd}${recruit.recruitDdlnDt }" />
													<fmt:parseDate value="${ddlnDate }" pattern="yyyyMMddHHmm" var="fmtDdln"/>
													<fmt:formatDate value="${fmtDdln }" pattern="yy-MM-dd HH:mm"/>
												</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
							
							<hr class="my-3" />
							
							<div class="card-body resumeBody">
							<c:set var="appList" value="${recruit.appList }" />
								<table class="table table-bordered table-striped col-12" style="text-align: center;">
									<tr>
										<td class="col-2 fw-bold">지원자 성함</td>
										<td class="col-6 fw-bold">이력서 제목</td>
										<td class="col-2 fw-bold">지원일자</td>
										<td class="col-2 fw-bold">이력서</td>
									</tr>
									<c:forEach items="${appList }" var="application">
										<tr>
											<td class="col-2">${application.memberName }</td>
											<td class="col-6" style="text-align: left;">${application.rsmTitle }</td>
											<td class="col-2">
												<fmt:parseDate value="${application.appApplyYmd }" pattern="yyyyMMdd" var="applyYmd"/>
												<fmt:formatDate value="${applyYmd }" pattern="yyyy-MM-dd"/>
											</td>
											<td class="col-2">
												<c:set var="document" value="${application.document }"/>
												<c:set var="files" value="${document.fileVO }"/>
												<c:forEach items="${files }" var="file">
													<a class="btn btn-success" href="/jobel/download?fileId=${file.fileId }&fileSerialNo=${file.fileSerialNo }">
														이력서
													</a>
												</c:forEach>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
							<hr class="my-3" />
							<div class="card-footer">
								<input type="button" class="btn btn-success" value="돌아가기" id="listBtn">
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	
	<script type="text/javascript">
		$(function(){
		});
	</script>