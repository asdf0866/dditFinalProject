<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>공고 목록</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/jobel/co_home">Home</a></li>
					<li class="breadcrumb-item"><a href="/jobel/co_rec_list">채용 공고</a></li>
					<li class="breadcrumb-item active">상세보기</li>
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
										</table>
									</div>
								</div>
							</div>
							
							<hr class="my-3" />
							
							<div class="card-body row text-center fs-5">
								<div class="col-md-3 border bg-secondary bg-opacity-10">
									<span class="d-block fw-bold">요구학력</span>
								</div>
								<div class="col-md-3 border bg-secondary bg-opacity-10">
									<span class="d-block fw-bold">자격 요건</span>
								</div>
								<div class="col-md-3 border bg-secondary bg-opacity-10">
									<span class="d-block fw-bold">채용 시작 시간</span>
								</div>
								<div class="col-md-3 border bg-secondary bg-opacity-10">
									<span class="d-block fw-bold">채용 종료 시간</span>
								</div>
								<div class="col-md-3 border">
									<span class="d-block">
										<input type="hidden" name="requiredEducation" value="${recruit.requiredEducation }" />
										${recruit.schTypeName }
									</span>
								</div>
								<div class="col-md-3 border">
									<span class="d-block">${recruit.requiredQualification }</span>
								</div>
								<div class="col-md-3 border">
									<span class="d-block">
										<c:set var="bgngDate" value="${recruit.recruitBgngYmd}${recruit.recruitBgngDt }" />
										<fmt:parseDate value="${bgngDate }" pattern="yyyyMMddHHmm" var="fmtBgng"/>
										<fmt:formatDate value="${fmtBgng }" pattern="yyyy-MM-dd HH:mm"/>
									</span>
								</div>
								<div class="col-md-3 border">
									<span class="d-block">
										<c:set var="ddlnDate" value="${recruit.recruitDdlnYmd}${recruit.recruitDdlnDt }" />
										<fmt:parseDate value="${ddlnDate }" pattern="yyyyMMddHHmm" var="fmtDdln"/>
										<fmt:formatDate value="${fmtDdln }" pattern="yyyy-MM-dd HH:mm"/>
									</span>
								</div>
							</div>
							
							<hr class="my-3" />
							
							<div class="card-body fs-5">
								<div class="col-md-12 row">
									<div class="col-md-4 text-center px-0 fw-bold">
										<div class="border bg-secondary bg-opacity-10">우편번호</div>
										<div class="border bg-secondary bg-opacity-10">기본주소</div>
										<div class="border bg-secondary bg-opacity-10">상세주소</div>
									</div>
									<div class="col-md-8 px-0">
										<div class="border"><span class="mx-1">${recruit.coPostcode }</span></div>
										<div class="border"><span class="mx-1">${recruit.coAddressBasic }</span></div>
										<div class="border"><span class="mx-1">${recruit.coAddressDetail }</span></div>
									</div>
								</div>
							</div>
							
							<hr class="my-3" />
							
							<div class="card-body">
								<h3 class="card-title border bg-secondary bg-opacity-10 fw-bold fs-3 px-3 my-0">공고 내용</h3>
								<div class="card-text col-md-12 border fs-5 px-3 d-flex flex-column align-items-center">
									${recruit.content }
								</div>
							</div>
							
							<hr class="my-3" />
							
							<div class="card-body">
								<h3 class="card-title border bg-secondary bg-opacity-10 fw-bold fs-3 px-3 my-0">첨부 파일</h3>
								<div class="mb-3">
									<c:choose>
										<c:when test="${empty fileList or fileList == null}">
											<div class="border col-md-12">
												<span class="fs-5 fw-bold px-3">등록한 파일이 없습니다.</span>
											</div>
										</c:when>
										<c:otherwise>
											<c:forEach items="${fileList }" var="file">
												<div class="border col-md-12 px-3">
													<a href="/jobel/download?fileId=${file.fileId }&fileSerialNo=${file.fileSerialNo }">
														<i class="bi bi-file-earmark-arrow-down fs-5 fw-bold"></i>
													</a>
													<span>${file.fileOriginName }</span>
												</div>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="form-check">
									<label class="form-check-label" for="allRecruitYn">
										<i class="bi bi-link"></i>
										<span>상시 채용 여부</span>
									</label>
									<c:if test="${recruit.allRecruitYn eq 'Y' }">
										<c:set var="recruitYn" value="checked" />
									</c:if>
									<input type="checkbox" class="form-check-input" id="allRecruitCheck" disabled="disabled" ${recruitYn }/>
									<input type="hidden" name="allRecruitYn" value="${recruit.allRecruitYn }" id="allRecruitYn" />
									<p class="footnote my-0"> * 상시 채용 여부 체크 시, 체크 해제 또는 삭제 전까지 공고가 계속 유지됩니다.</p>
								</div>
								<div class="form-check">
									<label class="form-check-label" for="selfRsmYn">
										<i class="bi bi-file-earmark-post"></i>
										<span>자사 이력서 사용 여부</span>
									</label>
									<c:if test="${recruit.selfRsmYn eq 'Y' }">
										<c:set var="rsmYn" value="checked" />
									</c:if>
									<input type="checkbox" class="form-check-input" id="selfRsmCheck" disabled="disabled" ${rsmYn }/>
									<input type="hidden" name="selfRsmYn" value="${recruit.selfRsmYn }" id="selfRsmYn" />
									<p class="footnote my-0"> * 자사 이력서를 사용할 경우 첨부파일에 이력서 양식을 등록해주세요.</p>
								</div>
							</div>
							
							<hr class="my-3" />
							<div class="card-footer">
								<input type="button" class="btn btn-success" value="돌아가기" id="listBtn">
								<input type="button" class="btn btn-danger" value="삭제하기" id="delBtn">
								<input type="button" class="btn btn-warning" value="수정하기" id="updBtn">
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- Update 또는 Delete 를 위한 Form -->
			<form action="/jobel/co_rec_detail" id="frm" method="get">
				<input type="hidden" name="recruitNo" id="recruitNo" value="${recruit.recruitNo }" />
				<input type="hidden" name="trigger" value="Y" />
			</form>
		</section>
	</main>
	
	<script type="text/javascript">
		$(function(){
			var listBtn = $('#listBtn');		//	돌아가기 버튼
			var delBtn = $('#delBtn');			//	삭제하기 버튼
			var updBtn = $('#updBtn');			//	수정하기 버튼
			var frm = $('#frm');				//	수정 또는 삭제를 위한 폼
			
			//	돌아가기 버튼 클릭 이벤트
			listBtn.on('click', function(){
				location.href = "/jobel/co_rec_list"
			});		//	listBtn onClick 이벤트 종료
			
			//	수정하기 버튼 클릭 이벤트
			updBtn.on('click', function(){
				frm.submit();
			});		//	updBtn onClick 이벤트 종료
			
			//	삭제하기 버튼 클릭 이벤트
			delBtn.on('click', function(){
				if(confirm("정말로 삭제하시겠습니까? 삭제 후 복구는 불가능합니다.")){
					var recruitNo = $('#recruitNo').val();
					
					$.ajax({
						url : "/jobel/co_rec_del",
						type : "post",
						beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
							xhr.setRequestHeader(header, token);
						},
						data : {
							recruitNo : recruitNo
						},
						success : function(res){
							if(res == "SUCCESS"){
								alert("삭제가 완료되었습니다.");
								location.href = "/jobel/co_rec_list";
							}
						},
						error : function(xhr){
							alert("삭제에 실패했습니다. 잠시 후 다시 시도해주세요.");
							console.log("에러 코드 : " + xhr.status);
						}
					});		//	$.ajax() 종료
				}		//	if(confirm()) 종료
			});		//	delBtn onClick 이벤트 종료
		});		//	$(function()) 종료
	</script>