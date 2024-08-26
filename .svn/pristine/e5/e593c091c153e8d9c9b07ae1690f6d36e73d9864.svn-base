<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>공고 목록</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/jobel/co_home">Home</a></li>
					<li class="breadcrumb-item"><a href="/jobel/co_rec_list">채용 공고</a></li>
					<li class="breadcrumb-item active">공고 수정</li>
				</ol>
			</nav>
		</div>
		
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<form action="/jobel/co_rec_edit" id="recruitForm" method="post" enctype="multipart/form-data">
							<input type="hidden" name="recruitNo" id="recruitNo" value="${recruit.recruitNo }" />
							<div class="card-title">
								<div class="g-0 d-flex">
									<div class="col-md-3">
										<img class="img-thumbnail rounded float-start" src="${pageContext.request.contextPath }${recruit.coLogoPath }">
									</div>
									<div class="col-md-9 mx-3">
										<table class="table table-striped table-bordered align-middle text-center">
											<tr>
												<td class="text-start" colspan="4">
													<h3 class="card-title fs-3 fw-bold">
														<label class="form-label" for="title">
															<i class="bi bi-card-heading mx-2"></i>공고 제목
														</label>
														<input type="text" class="form-control" value="${recruit.title }" name="title" />
													</h3>
													<p><b>공고 등록자 : </b>${recruit.coMemId }</p>
												</td>
											</tr>
											<tr>
												<td class="w-25 fw-bold">채용직무명</td>
												<td class="w-25" id="jobTd">
													<input type="hidden" name="recruitJob" id="recruitJob" value="${recruit.recruitJob }">
													<span id="recruitName" class="fw-bold" style="font-size:1em">${recruit.jobName }</span>
												</td>
												<td class="w-25 fw-bold">모집인원</td>
												<td class="w-25">
													<input type="text" name="recruitCount" class="form-control" value="${recruit.recruitCount }" />
												</td>
											</tr>
											<tr class="fw-bold">
												<td>근무 시간</td>
												<td>고용 형태</td>
												<td>급여</td>
												<td>공고 등록일</td>
											</tr>
											<tr>
												<td>
													<input type="text" name="workTime" class="form-control" value="${recruit.workTime }" />
												</td>
												<td>
													<select class="form-select" name="workType">
														<option value="WRKTYPE000" <c:if test="${recruit.workType == 'WRKTYPE000' }">selected</c:if>>
															정규직
														</option>
														<option value="WRKTYPE001" <c:if test="${recruit.workType == 'WRKTYPE001' }">selected</c:if>>
															계약직
														</option>
														<option value="WRKTYPE002" <c:if test="${recruit.workType == 'WRKTYPE002' }">selected</c:if>>
															인턴직
														</option>
														<option value="WRKTYPE003" <c:if test="${recruit.workType == 'WRKTYPE003' }">selected</c:if>>
															아르바이트
														</option>
														<option value="WRKTYPE004" <c:if test="${recruit.workType == 'WRKTYPE004' }">selected</c:if>>
															프리랜서
														</option>
														<option value="WRKTYPE005" <c:if test="${recruit.workType == 'WRKTYPE005' }">selected</c:if>>
															파견직
														</option>
													</select>
												</td>
												<td>
													<input type="text" name="salary" class="form-control" value="${recruit.salary }" />
												</td>
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
									<select class="form-select" name="requiredEducation">
										<option value="SCHTYPE000" <c:if test="${recruit.requiredEducation == 'SCHTYPE000' }">selected</c:if>>
											학력무관
										</option>
										<option value="SCHTYPE001" <c:if test="${recruit.requiredEducation == 'SCHTYPE001' }">selected</c:if>>
											고등학교
										</option>
										<option value="SCHTYPE002" <c:if test="${recruit.requiredEducation == 'SCHTYPE002' }">selected</c:if>>
											전문대학
										</option>
										<option value="SCHTYPE003" <c:if test="${recruit.requiredEducation == 'SCHTYPE003' }">selected</c:if>>
											대학교
										</option>
										<option value="SCHTYPE004" <c:if test="${recruit.requiredEducation == 'SCHTYPE004' }">selected</c:if>>
											대학원(석사)
										</option>
										<option value="SCHTYPE005" <c:if test="${recruit.requiredEducation == 'SCHTYPE005' }">selected</c:if>>
											대학원(박사)
										</option>
									</select>
								</div>
								<div class="col-md-3 border">
									<input type="text" name="requiredQualification" class="form-control border-0" value="${recruit.requiredQualification }" />
								</div>
								<div class="col-md-3 border">
									<c:set var="bgngYmd" value="${recruit.recruitBgngYmd}" />
									<fmt:parseDate value="${bgngYmd }" pattern="yyyyMMdd" var="bgngYmdFmt"/>
									<input type="date" class="form-control" name="recruitBgngYmd" id="recruitBgngYmd" value='<fmt:formatDate value="${bgngYmdFmt }" pattern="yyyy-MM-dd"/>'/>
									
									<c:set var="bgngDt" value="${recruit.recruitBgngDt}" />
									<fmt:parseDate value="${bgngDt }" pattern="HHmm" var="bgngDtFmt"/>
									<input type="time" class="form-control" name="recruitBgngDt" id="recruitBgngDt" value='<fmt:formatDate value="${bgngDtFmt }" pattern="HH:mm"/>'/>
								</div>
								<div class="col-md-3 border">
									<c:set var="ddlnYmd" value="${recruit.recruitDdlnYmd}" />
									<fmt:parseDate value="${ddlnYmd }" pattern="yyyyMMdd" var="ddlnYmdFmt"/>
									<input type="date" class="form-control" name="recruitDdlnYmd" id="recruitDdlnYmd" value='<fmt:formatDate value="${ddlnYmdFmt }" pattern="yyyy-MM-dd"/>'/>
									
									<c:set var="ddlnDt" value="${recruit.recruitDdlnDt}" />
									<fmt:parseDate value="${ddlnDt }" pattern="HHmm" var="ddlnDtFmt"/>
									<input type="time" class="form-control" name="recruitDdlnDt" id="recruitDdlnDt" value='<fmt:formatDate value="${ddlnDtFmt }" pattern="HH:mm"/>'/>
								</div>
							</div>
							
							<hr class="my-3" />
							
							<div class="card-body justify-content-center">
								<div class="col-md-12 row">
									<div class="col-md-4 text-center px-0">
										<div class="border bg-secondary bg-opacity-10 form-control-sm">
											<span class="fw-bold fs-5">우편번호</span>
										</div>
										<div class="border bg-secondary bg-opacity-10 form-control-sm">
											<span class="fw-bold fs-5">기본주소</span>
										</div>
										<div class="border bg-secondary bg-opacity-10 form-control-sm">
											<span class="fw-bold fs-5">상세주소</span>
										</div>
									</div>
									<div class="col-md-8 px-0">
										<div class="border d-flex input-group">
											<input type="text" class="form-control" name="coPostcode" value="${recruit.coPostcode }" id="coPostcode"/>
											<input type="button" class="btn btn-primary" value="검색" id="postBtn" />
										</div>
										<div class="border h-auto">
											<input type="text" class="form-control" name="coAddressBasic" value="${recruit.coAddressBasic }" id="coAddressBasic"/>
										</div>
										<div class="border h-auto">
											<input type="text" class="form-control" name="coAddressDetail" value="${recruit.coAddressDetail }" id="coAddressDetail">
										</div>
									</div>
								</div>
							</div>
							
							<hr class="my-3" />
							
							<div class="card-body">
								<h3 class="card-title border bg-secondary bg-opacity-10 fw-bold fs-3 px-3 my-0">공고 내용</h3>
								<div class="card-text col-md-12 border fs-5 px-3">
									<textarea class="form-control" name="content" id="content">${recruit.content }</textarea>
								</div>
							</div>
							
							<hr class="my-3" />
							
							<div class="card-body">
								<div class="card-title border bg-secondary bg-opacity-10 mb-0">
									<h3 class="fw-bold fs-3 px-3 my-0">첨부 파일</h3>
									<span class="form-text px-3"> * 첨부파일 삭제는 즉각적으로 반영되니 신중히 수정하시길 바랍니다.</span>
								</div>
								<div class="d-flex input-group mb-3">
									<c:choose>
										<c:when test="${empty fileList or fileList == null}">
											<div class="border col-md-12">
												<span class="fs-5 fw-bold px-3">등록한 파일이 없습니다.</span>
											</div>
										</c:when>
										<c:otherwise>
											<input type="hidden" id="fileId" name="attachFile" value="${fileList[0].fileId }" />
											<c:forEach items="${fileList }" var="file" varStatus="stat">
												<div class="border col-md-12 px-3 row attachFile">
													<div class="w-75">
														<a><i class="bi bi-file-earmark-arrow-down fs-5 fw-bold"></i></a>
														<span>${file.fileOriginName }</span>
													</div>
													<div class="w-25 btn-group">
														<button type="button" class="btn btn-success w-50 downloadBtn" value="${file.fileSerialNo }">
															<i class='bx bx-folder-plus'></i>
															<span>다운로드</span>
														</button>
														<button type="button" class="btn btn-danger w-50 removeBtn" value="${file.fileSerialNo }">
															<i class='bx bx-folder-minus'></i>
															<span>삭제</span>
														</button>
													</div>
												</div>
											</c:forEach>
										</c:otherwise>
									</c:choose>
									<div class="border col-md-12 row input-group">
										<input type="button" class="btn btn-primary col-2" value="파일 추가" disabled />
										<input type="file" class='form-control col-10' name="recFiles" multiple="multiple" />
									</div>
								</div>
								<div class="form-check">
									<label class="form-check-label" for="allRecruitYn">
										<i class="bi bi-link"></i>
										<span>상시 채용 여부</span>
									</label>
									<c:if test="${recruit.allRecruitYn eq 'Y' }">
										<c:set var="recruitYn" value="checked" />
									</c:if>
									<input type="checkbox" class="form-check-input" id="allRecruitCheck" ${recruitYn }/>
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
									<input type="checkbox" class="form-check-input" id="selfRsmCheck" ${rsmYn }/>
									<input type="hidden" name="selfRsmYn" value="${recruit.selfRsmYn }" id="selfRsmYn" />
									<p class="footnote my-0"> * 자사 이력서를 사용할 경우 첨부파일에 이력서 양식을 등록해주세요.</p>
								</div>
							</div>
							<sec:csrfInput/>
							</form>		<!-- form 종료 -->
							
							<hr class="my-3" />
							<div class="card-footer">
								<input type="button" class="btn btn-success" value="취소" id="cancelBtn">
								<input type="button" class="btn btn-warning" value="적용" id="updateBtn">
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	
	<!-- 직무 검색 모달 -->
	<div class="modal fade" id="jobModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">직무명 검색</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="input-group d-flex col-md-12" role="group">
						<input type="text" class="form-control" id="jobSearch" placeholder="직무명을 검색하세요."/>
						<button type="button" class="btn btn-outline-secondary" disabled>
							<i class="bi bi-search"></i>
						</button>
					</div>
					<hr class="my-3">
					<div class="jobSearchBox row d-flex align-items-between ">
						<div class="col-md-6 border flex-column nav nav-pills" role="tablist" aria-orientation="vertical">
							<c:forEach items="${jobCodeList }" var="jobCode">
								<button class="nav-link jobCode" value="${jobCode.commonCode }" id="v-pills-${jobCode.commonCode }-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">${jobCode.commonCodeName }</button>
							</c:forEach>
						</div>
						<div class="col-md-6 border jobDetail flex-column nav nav-pills" role="tablist" aria-orientation="vertical" style="overflow:scroll;">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">창 닫기</button>
					<button type="button" class="btn btn-primary" id="jobSelectBtn">적용하기</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 삭제 클릭 시 띄울 경고창 -->
	<div class="modal fade" data-bs-backdrop="false" tabindex="-1" id="delAlert">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header text-danger fw-bold">
					<i class="bi bi-exclamation-octagon me-1"></i>
					<h4 class="modal-title">경고</h4>
				</div>
				<div class="modal-body">
					<span>정말로 삭제하시겠습니까?</span> <br/>
					<span>파일 삭제는 즉각 반영되며 되돌릴 수 없습니다.</span>
					<hr class="my-3" />
					<button type="button" class="btn btn-danger" id="delBtn">삭제</button>
					<button type="button" class="btn btn-secondary" id="delCancelBtn">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(function(){
			var jobTd = $('#jobTd');			//	직종명이 담긴 TD
			var jobModal = $('#jobModal');		//	직종명 기능이 담긴 Modal
			
			//	삭제할 때 사용하기 위한 전역 변수 선언
			var delFileId = null;
			var delFileSerialNo = null;
			var delFileDiv = null;
			
			//	공고 내용 입력칸 CKEDITOR 적용 및 이미지 업로드 기능 적용
			CKEDITOR.replace('content', {
				filebrowserUploadUrl : '${pageContext.request.contextPath}/imageUpload.do'
			});
			CKEDITOR.config.height = "600px";

			
			//	취소 버튼 클릭 이벤트
			$('#cancelBtn').on('click', function(){
				var recruitNo = $('#recruitNo').val();
				var url = "/jobel/co_rec_detail?recruitNo=" + recruitNo
				location.href = url;
			});		//	cancelBtn onClick 이벤트 종료
			
			
			//	다운로드 버튼 클릭 이벤트
			$('.downloadBtn').on('click', function(){
				//	첨부파일의 ID와 순번 값 가져오기
				var fileId = $('#fileId').val();
				var serialNo = $(this).val();
				
				var downloadUrl = "/jobel/download?fileId=" + fileId + "&fileSerialNo=" + serialNo;
				location.href = downloadUrl;
			});		//	downloadBtn onClick 이벤트 종료
			
			
			//	적용 버튼 클릭 이벤트
			$('#updateBtn').on('click', function(){
				$('#recruitForm').submit();
			});		//	updateBtn onClick 이벤트 종료
			
			
			//	첨부 파일의 삭제 버튼 클릭 이벤트
			$('.removeBtn').on('click', function(){
				
				//	삭제 클릭한 파일의 정보 전역변수에 입력
				delFileId = $('#fileId').val();
				delFileSerialNo = $(this).val();
				delFileDiv = $(this).parents('.attachFile');
				
				//	삭제 경고 Modal 창 열기
				$('#delAlert').modal("show");
			});		//	removeBtn onClick 이벤트 종료
			
			
			//	삭제 경고 창의 삭제 버튼 클릭 이벤트
			$('#delBtn').on('click', function(){
				
				$.ajax({
					url : "/jobel/delFile",
					type : "post",
					data : {
						fileId : delFileId,
						fileSerialNo : delFileSerialNo
					},
					beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
						xhr.setRequestHeader(header, token);
					},
					success : function(res){
						if(res=="SUCCESS"){
							alert("삭제 완료했습니다.");
							$('#delAlert').modal("hide");
							$(delFileDiv).remove();
						}
					},
					error : function(xhr){
						alert("삭제에 실패했습니다.")
						console.log("에러 코드 : " + xhr.status);
					}
				});		//	$.ajax() 종료
			});		//	delBtn onClick 이벤트 종료
			
			
			//	삭제 경고 창의 취소 버튼 클릭 이벤트
			$('#delCancelBtn').on('click', function(){
				
				//	전역변수 초기화
				delFileId = "";
				delFileSerialNo = "";
				
				//	삭제 경고 Modal 창 닫기
				$('#delAlert').modal("hide");
				
			});		//	delCancelBtn onClick 이벤트 종료
			
			
			//	상시 채용 여부 체크박스 변경 이벤트
			$('#allRecruitCheck').on('change', function(){
				
				if($('#allRecruitCheck').is(':checked')){		//	체크했을 경우 값을 Y로 변경
					$('#allRecruitYn').val("Y");
				} else {		//	체크를 풀었을 경우 값을 N로 변경
					$('#allRecruitYn').val("N");
				}
			});		//	#allRecruitCheck onChange 종료
			
			
			//	자사 이력서 사용 여부 체크박스 변경 이벤트
			$('#selfRsmCheck').on('change', function(){
				
				if($('#selfRsmCheck').is(':checked')){		//	체크했을 경우 값을 Y로 변경
					$('#selfRsmYn').val("Y");
				} else {		//	체크를 풀었을 경우 값을 N로 변경
					$('#selfRsmYn').val("N");
				}
			});		//	#selfRsmCheck onChange 종료
			
			
			//	직무 TD 클릭 이벤트(Modal 여는 이벤트)
			jobTd.on('click', function(){
				jobModal.modal('show');
			});		//	jobTd onClick 이벤트 종료
			
			
			//	직무명 검색 창에서 직군 클릭 이벤트
			$('.jobCode').on('click', function(){
				var code = $(this).attr('value');
				
				$.ajax({
					url : "/jobel/commonDetailCodeList",
					type : "post",
					beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
						xhr.setRequestHeader(header, token);
					},
					data : {
						commonCode : code
					},
					success : function(res){
						//	출력할 Detail 정보가 담긴 코드
						var jobCode = "";
						
						$.each(res, function(i, v){
							var codeId = v.commonCodeDetail;		//	detailCode명
							var codeName = v.commonDetailName;		//	해당 코드의 이름
							jobCode += "<button class='nav-link jobCodeDetail' value='"
								+ codeId
								+ "' data-bs-toggle='pill' data-bs-target='#v-pills-home' type='button' id='"
								+ codeId
								+ "' role='tab' aria-controls='v-pills-home' aria-selected='true'>"
								+ codeName + "</button>";
						});
						
						$('.jobDetail').html(jobCode);
					},
					error : function(xhr){
						console.log("에러 코드 : " + xhr.status);
					}
				});		//	$.ajax() 종료
			});		//	.jobCode onClick 이벤트 종료
			
			
			//	직무명 검색 창에서 검색 이벤트
			$('#jobSearch').on('keyup', function(){
				var keyword = $('#jobSearch').val();
				
				$.ajax({
					url : "/jobel/commonDetailSearch",
					type : "post",
					data : {
						'typeName' : "JOB",
						detailWord : keyword
					},
					beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
						xhr.setRequestHeader(header, token);
					},
					success : function(res){
						var jobCode = "";
						if(res == null || res == ""){		//	검색 결과가 없을 경우
							jobCode = "<span>검색 결과가 없습니다.</span>";
						} else {		//	검색 결과가 있는 경우
							$.each(res, function(i, v){
								var codeId = v.commonCodeDetail;		//	detailCode명
								var codeName = v.commonDetailName;		//	해당 코드의 이름
								jobCode += "<button class='nav-link jobCodeDetail' value='"
									+ codeId
									+ "' data-bs-toggle='pill' data-bs-target='#v-pills-home' type='button' id='"
									+ codeId
									+ "' role='tab' aria-controls='v-pills-home' aria-selected='true'>"
									+ codeName + "</button>";
							});
						}
						$('.jobDetail').html(jobCode);
					},
					error : function(xhr){
						console.log("에러 코드 : " + xhr.status);
					}
				});		//	$.ajax() 종료
			});		//	#jobSearch onKeyup 이벤트 종료
			
			
			//	직무명 검색 창이 닫힐 때 모달 초기화 이벤트
			$('#jobModal').on('hidden.bs.modal', function(){
				$('.jobCode').removeClass("active");
				$('.jobDetail').html("");
			});		//	#jobModal onHidden 이벤트 종료
			
			
			//	직종을 선택 후 적용하기 버튼 클릭 이벤트
			$('#jobSelectBtn').on('click', function(){
				var selectJob = null;
				var jobList = $('.jobCodeDetail');
				$.each(jobList, function(i, v){
					//	직종 버튼 중 active 클래스를 가지고 있다면 선택 된 버튼이다.
					if($(v).hasClass('active')){
						selectJob = $(v);
					}
				})

				//	선택되어 있는 값이 null이 아니라면(선택을 했다면)
				if(selectJob != null || selectJob != ""){
					//	폼에 보여지는 span 태그에 직종명 입력
					$('#recruitName').text(selectJob.text());
					
					//	폼에 숨어있는 DB에 갈 input hidden 태그에 코드값 입력
					$('#recruitJob').val(selectJob.val());
				}
				
				//	모달창 닫기
				$('#jobModal').modal("hide");
			});		//	jobSelectBtn onClick 이벤트 종료
			
			
			//	우편번호 검색 클릭 이벤트
			$('#postBtn').on('click', function(){
				DaumPostcode();
			});		//	postBtn onClick 이벤트 종료
			
		});		//	$(function()) 종료
		
		//	다음 우편번호 검색 API 코드
		function DaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					//	팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					
					//	각 주소의 노출 규칙에 따라 주소를 조합한다.
					//	내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					//	사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') {		//	사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else {		//	사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}
					
					//	사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.userSelectedType === 'R') {
						//	법정동명이 있을 경우 추가한다. (법정리는 제외)
						//	법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						
						//	건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', '+ data.buildingName : data.buildingName);
						}
					}
					
					//	우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('coPostcode').value = data.zonecode;
					document.getElementById("coAddressBasic").value = addr;
					
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("coAddressDetail").focus();
				}
			}).open();
		}
	</script>