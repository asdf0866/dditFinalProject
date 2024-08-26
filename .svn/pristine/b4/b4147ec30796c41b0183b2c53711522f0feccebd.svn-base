<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>공고 목록</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/jobel/co_home">Home</a></li>
					<li class="breadcrumb-item"><a href="/jobel/co_rec_list">채용 공고</a></li>
					<li class="breadcrumb-item active">공고 작성</li>
				</ol>
			</nav>
		</div>
		
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title formTitle">채용 공고 작성</h5>
							<button type="button" class="btn btn-primary" style="position: absolute;right: 5%;top: 2%;" id="explainBtn">데이터 입력</button>
							<form action="/jobel/co_rec_write" class="row g-3" id="recruitForm" method="post" enctype="multipart/form-data">
								<div class="col-md-12">
									<label for="title" class="form-label">
										<i class="bi bi-card-heading"></i>
										<span>공고 제목</span>
									</label>
									<input type="text" class="form-control" placeholder="공고 제목을 입력해주세요." name="title"/>
								</div>
								<div class="col-md-8">
									<label for="recruitJob" class="form-label">
										<i class="bi bi-clipboard"></i>
										<span>직무</span>
									</label>
									<div class="d-flex input-group" role="group">
										<input type="text" class="form-control" name="recruitName" id="recruitName" readonly disabled/>
										<input type="hidden" class="form-control" name="recruitJob" id="recruitJob"/>
										<input type="button" class="btn btn-primary" id="jobBtn" value="검색" data-bs-toggle="modal" data-bs-target="#jobModal" />
									</div>
								</div>
								<div class="col-md-12">
									<label for="content" class="form-label">
										<i class="bi bi-card-text"></i>
										<span>공고 내용</span>
									</label>
									<textarea class="form-control" name="content" id="content"></textarea>
								</div>
								<hr class="my-3">
								<div class="col-md-6">
									<label for="requiredEducation" class="form-label">
										<i class="bi bi-book"></i>
										<span>요구 학력</span>
									</label>
									<select class="form-select" name="requiredEducation">
										<option value="SCHTYPE000">학력무관</option>
										<option value="SCHTYPE001">고등학교</option>
										<option value="SCHTYPE002">전문대학</option>
										<option value="SCHTYPE003">대학교</option>
										<option value="SCHTYPE004">대학원(석사)</option>
										<option value="SCHTYPE005">대학원(박사)</option>
									</select>
								</div>
								<div class="col-md-6">
									<label for="requiredQualification" class="form-label">
										<i class="bi bi-brush"></i>
										<span>자격 요건</span>
									</label>
									<input type="text" class="form-control" name="requiredQualification" placeholder="예시 : 3년 이상의 소프트웨어 개발 경력 / 전문 학사 이상 등"/>
									<p class="form-text mb-0"> * 상세한 요건과 우대사항은 공고 내용에 기재해주세요.</p>
								</div>
								<div class="col-md-6">
									<label for="salary" class="form-label">
										<i class="ri-user-add-line"></i>
										모집 인원
									</label>
									<input type="text" class="form-control" name="recruitCount" placeholder="채용 인원을 입력해주세요." />
									<p class="form-text mb-0"> * 예시 : '0명', '4', '100명' ... 등등</p>
								</div>
								<div class="col-md-6">
									<label for="salary" class="form-label">
										<i class="bi bi-cash-coin"></i>
										<span>급여</span>
									</label>
									<input type="text" class="form-control" name="salary" placeholder="Ex : 월 215만원, 주급 48만원, 시급 9860원" />
								</div>
								<div class="col-md-6">
									<label for="workTime" class="form-label">
										<i class="bi bi-alarm"></i>
										<span>근무 시간</span>
									</label>
									<input type="text" class="form-control" value="오전 9시 ~ 오후 6시 (평일)" name="workTime">
									<p class="form-text mb-0"> * 정규 근무 시간이 다르다면 직접 입력해주세요.</p>
								</div>
								<div class="col-md-6">
									<label for="workType" class="form-label">
										<i class="bi bi-briefcase"></i>
										<span>고용 형태</span>
									</label>
									<select class="form-select" name="workType">
										<option value="WRKTYPE000">정규직</option>
										<option value="WRKTYPE001">계약직</option>
										<option value="WRKTYPE002">인턴직</option>
										<option value="WRKTYPE003">아르바이트</option>
										<option value="WRKTYPE004">프리랜서</option>
										<option value="WRKTYPE005">파견직</option>
									</select>
								</div>
								
								<hr class="my-3">
								<div class="col-md-12 row">
									<div class="col-3">
										<label for="recruitBgngYmd">
											<i class="bi bi-calendar4-event"></i>
											<span>채용 시작일자</span>
										</label>
										<input type="date" class="form-control" name="recruitBgngYmd" id="recruitBgngYmd"/>
									</div>
									<div class="col-3">
										<label for="recruitBgngDt">
											<i class="bi bi-hourglass-top"></i>
											<span>채용 시작일시</span>
										</label>
										<input type="time" class="form-control" name="recruitBgngDt" id="recruitBgngDt"/>
									</div>
									<div class="col-3">
										<label for="recruitDdlnYmd">
											<i class="bi bi-calendar4-week"></i>
											<span>채용 마감일자</span>
										</label>
										<input type="date" class="form-control" name="recruitDdlnYmd" id="recruitDdlnYmd"/>
									</div>
									<div class="col-3">
										<label for="recruitDdlnDt">
											<i class="bi bi-hourglass-bottom"></i>
											<span>채용 마감일시</span>
										</label>
										<input type="time" class="form-control" name="recruitDdlnDt" id="recruitDdlnDt"/>
									</div>
								</div>
								<hr class="my-3">
								<div class="col-md-8">
									<label for="coPostcode" class="form-label">
										<i class="bi bi-mailbox"></i>
										<span>근무지 우편 번호</span>
									</label>
									<div class="d-flex input-group" role="group">
										<input type="text" class="form-control" name="coPostcode" id="coPostcode"/>
										<input type="button" class="btn btn-primary" id="postBtn" value="검색" />
									</div>
								</div>
								<div class="col-md-12">
									<label for="coAddressBasic" class="form-label">
										<i class="bi bi-signpost"></i>
										<span>근무지 기본 주소</span>
									</label>
									<input type="text" class="form-control" name="coAddressBasic" id="coAddressBasic"/>
								</div>
								<div class="col-md-12">
									<label for="coAddressBasic" class="form-label">
										<i class="bi bi-signpost-2"></i>
										<span>근무지 상세 주소</span>
									</label>
									<input type="text" class="form-control" name="coAddressDetail" id="coAddressDetail"/>
								</div>
								
								<hr class="my-3">
								
								<div class="row col-md-12">
									<div class="d-flex input-group mb-3">
										<label for="recFiles" class="form-label me-3 my-auto">
											<i class="bi bi-file-earmark-arrow-down"></i>
											<span>첨부파일</span>
										</label>
										<input type="file" class='form-control' name="recFiles" multiple="multiple"/>
									</div>
									<div class="form-check ms-3">
										<label class="form-check-label" for="allRecruitYn">
											<i class="bi bi-link"></i>
											<span>상시 채용 여부</span>
										</label>
										<input type="checkbox" class="form-check-input" id="allRecruitCheck" />
										<input type="hidden" name="allRecruitYn" value="N" id="allRecruitYn" />
										<p class="form-text my-0"> * 상시 채용 여부 체크 시, 체크 해제 또는 삭제 전까지 공고가 계속 유지됩니다.</p>
									</div>
									<div class="form-check ms-3">
										<label class="form-check-label" for="selfRsmYn">
											<i class="bi bi-file-earmark-post"></i>
											<span>자사 이력서 사용 여부</span>
										</label>
										<input type="checkbox" class="form-check-input" id="selfRsmCheck"/>
										<input type="hidden" name="selfRsmYn" value="N" id="selfRsmYn" />
										<p class="form-text my-0"> * 자사 이력서를 사용할 경우 첨부파일에 이력서 양식을 등록해주세요.</p>
									</div>
									<div class="my-3">
										<input type="button" class="btn btn-primary" id="recSubmit" value="등록하기"/>
									</div>
								</div>
								
								<sec:csrfInput/>
							</form>			<!-- form 종료 -->
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
				<div class="modal-body" style="max-height: 720px;">
					<div class="input-group d-flex col-md-12" role="group">
						<input type="text" class="form-control" id="jobSearch" placeholder="직무명을 검색하세요."/>
						<button type="button" class="btn btn-outline-secondary" disabled>
							<i class="bi bi-search"></i>
						</button>
					</div>
					<hr class="my-3">
					<div class="jobSearchBox row d-flex align-items-between ">
						<div class="col-md-6 border flex-row nav nav-pills" role="tablist" aria-orientation="vertical" style="max-height: 630px; overflow: auto;">
							<c:forEach items="${jobCodeList }" var="jobCode">
								<button class="nav-link col-12 jobCode" value="${jobCode.commonCode }" id="v-pills-${jobCode.commonCode }-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">${jobCode.commonCodeName }</button>
							</c:forEach>
						</div>
						<div class="col-md-6 border jobDetail flex-row nav nav-pills" role="tablist" aria-orientation="vertical" style="max-height:630px; overflow:auto;">
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
	
	<script type="text/javascript">
		$(function(){
			var recruitForm = $('#recruitForm');	//	채용공고 폼
			var postBtn = $('#postBtn');			//	우편번호 검색 버튼
			var recSubmit = $('#recSubmit');		//	공고 등록하기 버튼
			var jobSelectBtn = $('#jobSelectBtn');	//	직종 선택 모달 적용 버튼
			
			
			//	공고 내용 입력칸 CKEDITOR 적용 및 이미지 업로드 기능 적용
			CKEDITOR.replace('content', {
				filebrowserUploadUrl : '${pageContext.request.contextPath}/imageUpload.do?${_csrf.parameterName}=${_csrf.token}'
			});
			CKEDITOR.config.height = "600px";
			
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
							jobCode += "<button class='nav-link jobCodeDetail col-12' value='"
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
					beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
						xhr.setRequestHeader(header, token);
					},
					data : {
						'typeName' : "JOB",
						detailWord : keyword
					},
					success : function(res){
						var jobCode = "";
						
						if(res == null || res == ""){		//	검색 결과가 없을 경우
							jobCode = "<span class='nav-link jobCodeDetail col-12'>검색 결과가 없습니다.</span>";
						} else {		//	검색 결과가 있는 경우
							$.each(res, function(i, v){
								var codeId = v.commonCodeDetail;		//	detailCode명
								var codeName = v.commonDetailName;		//	해당 코드의 이름
								jobCode += "<button class='nav-link jobCodeDetail col-12' value='"
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
			jobSelectBtn.on('click', function(){
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
					//	폼에 보여지는 input 태그에 직종명 입력
					$('#recruitName').val(selectJob.text());
					
					//	폼에 숨어있는 DB에 갈 input hidden 태그에 코드값 입력
					$('#recruitJob').val(selectJob.val());
				}
				
				//	모달창 닫기
				$('#jobModal').modal("hide");
			});		//	jobSelectBtn onClick 이벤트 종료
			
			
			//	공고 등록하기 버튼 클릭 이벤트
			recSubmit.on('click', function(){
				recruitForm.submit();
			});
			
			
			//	우편번호 검색 클릭 이벤트
			postBtn.on('click', function(){
				DaumPostcode();
			});		//	postBtn onClick 이벤트 종료
			
			
			//	데이터 입력 버튼 클릭 이벤트
			$('#explainBtn').on('click', function(){
				$('input[name=title]').val("2024년 성심 컴퍼니 하반기 신입 / 경력 사원 채용");		//	공고 제목
				$('#recruitName').val("제과 · 제빵사");		//	채용 직업명
				$('#recruitJob').val("JOB017T010");			//	Hidden : 직군코드(공통코드 : 제과 · 제빵사)
				
				var text = createExplainText();
				CKEDITOR.instances.content.setData(text);	//	공고 내용 입력
				
				$('select[name=requiredEducation] option:eq(0)').attr('selected', 'selected');	//	요구학력(무관)
				$('input[name=requiredQualification]').val("무관, 신입도 지원 가능");			//	자격요건(무관)
				$('input[name=recruitCount]').val("1명");		//	채용 인원
				$('input[name=salary]').val("면접 후 결정");	//	급여
				$('input[name=workTime]').val("주 5일, 스케줄 근무에 따른 시간 변동 있음");		//	근무시간
				$('select[name=workType] option:eq(2)').attr('selected', 'selected');			//	고용형태
				$('#recruitBgngYmd').val('2024-07-01');			//	채용 시작일자
				$('#recruitBgngDt').val('15:00');				//	채용 시작일시
				$('#recruitDdlnYmd').val('2024-08-30');			//	채용 마감일자
				$('#recruitDdlnDt').val('17:00');				//	채용 마감일시
				
				$('#coPostcode').val('35299');							//	우편번호
				$('#coAddressBasic').val("대전 서구 계룡로 598");		//	기본주소
				$('#coAddressDetail').val("롯데백화점 1층 성심당");		//	상세주소
			});
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
		
		function createExplainText(){
			var text = '<p><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-size:48px"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><strong><span style="color:#4876ef"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif">성심당 롯데점 제빵생산팀 정규직 증원</span></span></strong></span></span></span></span></span></span></span></span></p>'
					+ '<hr /><p><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-size:28px"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif">모집부문 및 상세내용<br />'
					+ '<span style="font-size:14pt"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="background-color:#ffef00">**매출 상승으로 인한 인원 증원</span></span></span></span></span></span></p>'
					+ '<p><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-size:15px"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="color:#444444"><span style="font-size:16px"><span style="background-color:#f7f8fc"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><strong>공통 자격요건</strong></span></span></span></span></span></span></span></span></p>'
					+ '<p><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-size:15px"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="color:#444444"><span style="font-size:15px"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="color:#444444">ㆍ학력 : 무관</span></span></span></span></span></span></span></span></p>'
					+ '<p><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-size:15px"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="color:#444444"><span style="font-size:16px"><span style="background-color:#f7f8fc"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><strong>제빵생산팀</strong><span style="font-size:14px"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="color:#666666">&nbsp;1명</span></span></span></span></span></span></span></span></span></span></span></p>'
					+ '<p><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-size:15px"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="color:#444444"><span style="font-size:15px"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="color:#444444"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="color:#444444"><strong>담당업무<br /></strong>'
					+ '<span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif">ㆍ샌드위치 생산 및 보조</span></span></span></span></span></span></span></span></span></span></span></p>'
					+ '<p><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-size:15px"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="color:#444444"><span style="font-size:15px"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="color:#444444"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="color:#444444"><strong>지원자격</strong></span></span></span></span></span></span></span></span></span></span></p>'
					+ '<p><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-size:15px"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="color:#444444"><span style="font-size:15px"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="color:#444444"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif">ㆍ경력 : 무관 (신입도 지원 가능)<br />'
					+ 'ㆍ제빵기능사 자격증<br />ㆍ보건증 제출 필수(만료일로부터 6개월 전 보건증)</span></span></span></span></span></span></span></span></span></p>'
					+ '<p>&nbsp;</p><p><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-size:28px"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif">근무조건</span></span></span></p>'
					+ '<p><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif">ㆍ</span><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif">근무형태</span><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif">:</span><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif">정규직(수습기간)-<span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="color:#ababab">3개월</span></span>, 인턴직(정규직 전환가능)-<span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="color:#ababab">3개월</span></span></span></span></span></span></p>'
					+ '<p><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif">ㆍ</span><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif">근무지역</span><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif">:</span><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif">(35299) 대전 서구 계룡로 598 롯데백화점(괴정동) - 대전 1호선 용문 에서 500m 이내</span></span></span></span></span></p>'
					+ '<p>&nbsp;</p><p><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-size:28px"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif">접수기간 및 방법</span></span></span></p>'
					+ '<p><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif">ㆍ</span><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif">접수기간</span><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif">:</span><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><strong>2024년 7월 01일 (월) 15시 ~ 2024년 8월 30일 (금) 17시</strong></span></span></span></span></p>'
					+ '<p>&nbsp;</p><p><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-size:28px"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif">유의사항</span></span></span></p>'
					+ '<p><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif"><span style="font-family:Pretendard,&quot;Malgun Gothic&quot;,dotum,gulim,sans-serif">ㆍ입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다.<br />ㆍ인성평가 합격 시 2차면접 진행</span></span></span></p>';
			return text;
		}
	</script>