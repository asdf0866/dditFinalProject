<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<main id="main" class="main">
	<div class="pagetitle">
		<h1>프로필</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/jobel/co_home">Home</a></li>
				<li class="breadcrumb-item"><a href="/jobel/co_mem_page">회원 정보</a></li>
				<li class="breadcrumb-item active">프로필</li>
			</ol>
		</nav>
	</div><!-- End Page Title -->
	
<%-- 	<sec:authentication property="principal.member" var="member"/> --%>
    
	<section class="section profile">
		<div class="row">
			<div class="col-xl-4">
				<div class="card">
					<div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
						<img src="${pageContext.request.contextPath }${company.coLogoPath}" alt="Profile" class="rounded-circle">
						<h2 class="my-3">${member.name }</h2>
						<h3 class="my-1">${member.jobName }</h3>
					</div>
				</div>
			</div>
			
			<div class="col-xl-8">
				<div class="card">
					<div class="card-body pt-3">
						<!-- Bordered Tabs -->
						<ul class="nav nav-tabs nav-tabs-bordered">
							<li class="nav-item">
								<button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">계정 정보</button>
							</li>
							
							<li class="nav-item">
								<button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">정보 수정</button>
							</li>
							
							<li class="nav-item">
								<button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">비밀번호 변경</button>
							</li>
							
							<li class="nav-item">
								<button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-companyConfig">기업 정보</button>
							</li>
							
							<sec:authorize access="hasRole('ROLE_COMPANY_LEADER')">
							<li class="nav-item">
								<button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-companyModify">기업 정보 수정</button>
							</li>
							
							<li class="nav-item">
								<button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-accountInsert">기업 계정 추가</button>
							</li>
							</sec:authorize>
						</ul>
						
						<div class="tab-content pt-2">
							<div class="tab-pane fade show active profile-overview" id="profile-overview">
								<h5 class="card-title fw-bold">프로필 상세보기</h5>

								<div class="row">
									<div class="col-lg-3 col-md-4 label">사원명</div>
									<div class="col-lg-9 col-md-8">${member.name }</div>
								</div>
								
								<div class="row">
									<div class="col-lg-3 col-md-4 label">회사명</div>
									<div class="col-lg-9 col-md-8">${company.coName }</div>
								</div>
								
								<div class="row">
									<div class="col-lg-3 col-md-4 label">직무명</div>
									<div class="col-lg-9 col-md-8">${member.jobName }</div>
								</div>
								
								<div class="row">
									<div class="col-lg-3 col-md-4 label">연락처</div>
									<div class="col-lg-9 col-md-8">${member.telno }</div>
								</div>
								
								<div class="row">
									<div class="col-lg-3 col-md-4 label">이메일</div>
									<div class="col-lg-9 col-md-8">${member.email }</div>
								</div>
								
								<div class="row">
									<div class="col-lg-3 col-md-4 label">권한명</div>
									<div class="col-lg-9 col-md-8">
										<c:forEach items="${member.authList }" var="auth" varStatus="stat">
											<c:if test="${stat.count == 2}">
												<c:out value=" , " />
											</c:if>
											<c:if test="${auth.auth eq 'ROLE_COMPANY_LEADER' }">
													<c:out value="기업 팀장 계정" /> 
											</c:if>
											<c:if test="${auth.auth eq 'ROLE_COMPANY' }">
												<c:out value="기업 일반 계정" />
											</c:if>
										</c:forEach>
									</div>
								</div>
							
								<div class="row">
									<div class="col-lg-3 col-md-4 label">계정 등록일</div>
									<div class="col-lg-9 col-md-8">
										<c:set var="joinYmd" value="${member.joinYmd }"/>
										<fmt:parseDate value="${joinYmd }" pattern="yyyyMMdd" var="fmtJoinYmd"/>
										<fmt:formatDate value="${fmtJoinYmd }" pattern="yyyy월 MM월 dd일"/>
									</div>
								</div>
							</div>
							
							<div class="tab-pane fade profile-edit pt-3" id="profile-edit">
								<form id="profileEditForm"><!-- Profile Edit Form -->
									<div class="row mb-3">
										<label for="company" class="col-md-4 col-lg-3 col-form-label">아이디</label>
										<div class="col-md-8 col-lg-9">
											<input name="memId" type="text" class="form-control" id="memId" value="${member.memId }" readonly="readonly">
										</div>
									</div>
									
									<div class="row mb-3">
										<label for="name" class="col-md-4 col-lg-3 col-form-label">사원명</label>
										<div class="col-md-8 col-lg-9">
											<input name="name" type="text" class="form-control" id="name" value="${member.name }">
										</div>
									</div>
									
									<div class="row mb-3">
										<label for="jobName" class="col-md-4 col-lg-3 col-form-label">직무명</label>
										<div class="col-md-8 col-lg-9">
											<input name="jobName" type="text" class="form-control" id="jobName" value="${member.jobName }">
										</div>
									</div>
									
									<div class="row mb-3">
										<label for="telno" class="col-md-4 col-lg-3 col-form-label">연락처</label>
										<div class="col-md-8 col-lg-9">
											<input name="telno" type="text" class="form-control" id="telno" value="${member.telno }">
											<p class="form-text mx-2 mb-1">(-) 없이 11~12자리를 입력해주세요.</p>
										</div>
									</div>
									
									<div class="row mb-3">
										<label for="email" class="col-md-4 col-lg-3 col-form-label">이메일</label>
										<div class="col-md-8 col-lg-9">
											<input name="email" type="text" class="form-control" id="email" value="${member.email }">
										</div>
									</div>
									
									<div class="text-center">
										<button type="button" class="btn btn-primary" id="editMemberBtn">변경사항 저장</button>
									</div>
								</form><!-- End Profile Edit Form -->
							</div>
							
							<div class="tab-pane fade pt-3" id="profile-change-password">
								<!-- Change Password Form -->
								<form id="changePasswordForm">
									<div class="row mb-3">
										<label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">비밀번호 변경</label>
										<div class="col-md-8 col-lg-9">
											<input name="password" type="password" class="form-control" id="currentPassword">
										</div>
									</div>
									
									<div class="row mb-3">
										<label for="newPassword" class="col-md-4 col-lg-3 col-form-label">새 비밀번호</label>
										<div class="col-md-8 col-lg-9">
											<input name="newpassword" type="password" class="form-control" id="newPassword">
										</div>
									</div>
										
									<div class="row mb-3">
											<label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">새 비밀번호 확인</label>
											<div class="col-md-8 col-lg-9">
											<input name="renewpassword" type="password" class="form-control" id="renewPassword">
											<div class="invalid-feedback checkPwDiv">
												비밀번호가 일치하지 않습니다.
											</div>
										</div>
									</div>
									<div class="text-center">
										<button type="submit" class="btn btn-primary" id="pwBtn">비밀번호 변경</button>
									</div>
								</form><!-- End Change Password Form -->
							</div>
							
							<div class="tab-pane fade profile-overview" id="profile-companyConfig">
								<h5 class="card-title fw-bold">회사 소개 문구</h5>
								<p class="small fst-italic">${company.coContent }</p>
								
								<hr class="my-3"/>
								
								<h5 class="card-title fw-bold">회사 상세보기</h5>
								
								<div class="row">
									<div class="col-lg-3 col-md-4 label">회사명</div>
									<div class="col-lg-9 col-md-8">${company.coName }</div>
								</div>
								
								<div class="row">
									<div class="col-lg-3 col-md-4 label">회사 등록 직군</div>
									<div class="col-lg-9 col-md-8">
									<c:forEach items="${codeList }" var="code">
										<c:if test="${company.coJobType == code.commonCode}">${code.commonCodeName }</c:if>
									</c:forEach>
									</div>
								</div>
								
								<div class="row">
									<div class="col-lg-3 col-md-4 label">회사 공식 홈페이지 URL</div>
									<div class="col-lg-9 col-md-8">
										<a href="${company.coUrl }">${company.coUrl }</a>
									</div>
								</div>
								
								<div class="row">
									<div class="col-lg-3 col-md-4 label">회사 주소</div>
									<div class="col-lg-9 col-md-8">
										(${company.postcode }) ${company.addressBasic } ${company.addressDetail }
									</div>
								</div>
								
								<div class="row">
									<div class="col-lg-3 col-md-4 label">회사 팩스 번호</div>
									<div class="col-lg-9 col-md-8">
										<c:if test="${company.coFax.length() == 10 }">
											${company.coFax.substring(0,2) }-${company.coFax.substring(2,7) }-${company.coFax.substring(7) } 
										</c:if>
										<c:if test="${company.coFax.length() == 11 }">
											${company.coFax.substring(0,3) }-${company.coFax.substring(3,7) }-${company.coFax.substring(7) } 
										</c:if>
										${fmtFax }
									</div>
								</div>
								
								<div class="row">
									<div class="col-lg-3 col-md-4 label">직원 수</div>
									<div class="col-lg-9 col-md-8">${company.coEmployeeCount } 명</div>
								</div>
								
								<div class="row">
									<div class="col-lg-3 col-md-4 label">연간 매출액</div>
									<div class="col-lg-9 col-md-8">
										<fmt:parseNumber type="number" var="sales" value="${company.coSales }" />
										<fmt:formatNumber value="${sales * 1000000}" maxFractionDigits="3" var="fmtSales" />
										${fmtSales } 원
									</div>
								</div>
								
								<div class="row">
									<div class="col-lg-3 col-md-4 label">회사 대표명</div>
									<div class="col-lg-9 col-md-8">${company.coCeoName }</div>
								</div>
							
								<div class="row">
									<div class="col-lg-3 col-md-4 label">회사 창립일</div>
									<div class="col-lg-9 col-md-8">
										<c:set var="fndnYmd" value="${company.coFndnYmd }"/>
										<fmt:parseDate value="${fndnYmd }" pattern="yyyyMMdd" var="fmtFndnYmd"/>
										<fmt:formatDate value="${fmtFndnYmd }" pattern="yyyy월 MM월 dd일"/>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-3 col-md-4 label">사이트 가입일자</div>
									<div class="col-lg-9 col-md-8">
										<c:set var="coRegYmd" value="${company.joinYmd }"/>
										<fmt:parseDate value="${coRegYmd }" pattern="yyyyMMdd" var="fmtCoRegYmd"/>
										<fmt:formatDate value="${fmtCoRegYmd }" pattern="yyyy월 MM월 dd일"/>
									</div>
								</div>
							</div><!-- 기업 정보 끝 -->
							
							<div class="tab-pane fade profile-edit" id="profile-companyModify">
								<form id="companyEditForm">
									<input type="hidden" value="${company.coNo }" name="coNo" />
									<div class="row my-3">
										<label for="profileImage" class="col-md-4 col-lg-3 col-form-label">회사 로고 사진</label>
										<div class="col-md-8 col-lg-9">
											<img src="${pageContext.request.contextPath }${company.coLogoPath}" alt="Profile">
											<div class="pt-2">
												<label class="btn btn-primary btn-sm text-light" id="uploadLogo" title="Upload new profile image" for="imgFile"><i class="bi bi-upload"></i></label>
												<input type="file" id="imgFile" name="imgFile" style="display:none" />
												<label class="btn btn-danger btn-sm text-light" id="deleteLogo" title="Remove my profile image"><i class="bi bi-trash"></i></label>
											</div>
										</div>
									</div>
									
									<hr class="my-3"/>
									
									<div class="row my-3">
										<label for="coName" class="col-md-4 col-lg-3 col-form-label">회사명</label>
										<div class="col-md-8 col-lg-9">
											<input name="coName" type="text" class="form-control" id="coName" value="${company.coName }">
										</div>
									</div>
									
									<div class="row my-3">
										<label for="coJobType" class="col-md-4 col-lg-3 col-form-label">직군</label>
										<div class="col-md-8 col-lg-9">
											<select class="form-select" name="coJobType">
												<c:forEach items="${codeList }" var="code">
													<option value="${code.commonCode }" <c:if test="${company.coJobType == code.commonCode }">selected</c:if>>
														${code.commonCodeName }
													</option>
												</c:forEach>
											</select>
										</div>
									</div>
									
									<div class="row my-3">
										<label for="coUrl" class="col-md-4 col-lg-3 col-form-label">회사 홈페이지 URL</label>
										<div class="col-md-8 col-lg-9">
											<input name="coUrl" type="text" class="form-control" id="coUrl" value="${company.coUrl }" />
										</div>
									</div>
									
									<div class="row my-3">
										<label for="coEmployeeCount" class="col-md-4 col-lg-3 col-form-label">직원 수</label>
										<div class="col-md-8 col-lg-9">
											<input name="coEmployeeCount" type="number" class="form-control" id="coEmployeeCount" min="1" value="${company.coEmployeeCount }" />
											<p class="form-text mb-1"> * 숫자만 입력해주세요. (예시 : 120명 → 120) </p>
										</div>
									</div>
									
									<div class="row my-3">
										<label for="coSales" class="col-md-4 col-lg-3 col-form-label">연간 매출액</label>
										<div class="col-md-8 col-lg-9">
											<input name="coSales" type="number" class="form-control" id="coSales" min="1" value="${sales * 1000000 }" />
											<p class="form-text mb-1"> * 숫자만 입력해주세요. (예시 : 1억 2,000만 → 120000000) </p>
										</div>
									</div>
									
									<div class="row my-3">
										<label for="coCeoName" class="col-md-4 col-lg-3 col-form-label">회사 대표명</label>
										<div class="col-md-8 col-lg-9">
											<input name="coCeoName" type="text" class="form-control" id="coCeoName" value="${company.coCeoName }" />
										</div>
									</div>
									
									<div class="row my-3">
										<label for="coFndnYmd" class="col-md-4 col-lg-3 col-form-label">회사 창립일</label>
										<div class="col-md-8 col-lg-9">
											<fmt:parseDate value="${company.coFndnYmd }" var="parseFndnYmd" dateStyle="default" pattern="yyyyMMdd"/>
											<fmt:formatDate value="${parseFndnYmd }" pattern="yyyy-MM-dd" var="formatFndnYmd"/>
											<input name="coFndnYmd" type="date" class="form-control" id="coFndnYmd" value="${formatFndnYmd }" />
										</div>
									</div>
									
									<div class="row my-3">
										<label for="coFax" class="col-md-4 col-lg-3 col-form-label">회사 팩스 번호</label>
										<div class="col-md-8 col-lg-9">
											<input name="coFax" type="text" class="form-control" id="coFax" value="${company.coFax }" />
											<p class="form-text mb-1"> * 숫자만 입력해주세요. (예시 : 042-1234-5678 → 04212345678)</p>
										</div>
									</div>
									
									<div class="row my-3 d-flex flex-nowrap">
										<label for="postcode" class="col-md-4 col-lg-3 col-form-label">우편번호</label>
										<div class="col-md-8 col-lg-9 input-group w-75 d-inlineblock">
											<input name="postcode" type="text" class="form-control" id="postcode" value="${company.postcode }" />
											<input type="button" class="btn btn-primary"value="검색" id="postBtn" />
										</div>
									</div>
									
									<div class="row my-3">
										<label for="addressBasic" class="col-md-4 col-lg-3 col-form-label">기본주소</label>
										<div class="col-md-8 col-lg-9">
											<input name="addressBasic" type="text" class="form-control" id="addressBasic" value="${company.addressBasic }"/>
										</div>
									</div>
									
									<div class="row my-3">
										<label for="addressDetail" class="col-md-4 col-lg-3 col-form-label">기본주소</label>
										<div class="col-md-8 col-lg-9">
											<input name="addressDetail" type="text" class="form-control" id="addressDetail" value="${company.addressDetail }"/>
										</div>
									</div>
									
									<div class="text-center">
										<button type="button" class="btn btn-primary" id="editCompanyBtn">변경사항 저장</button>
									</div>
								</form>
							</div>
							
							<div class="tab-pane fade pt-3 profile-edit" id="profile-accountInsert">
								<form id="newCoMemberForm">
									<div class="row mb-3">
										<label for="memId" class="col-md-4 col-lg-3 col-form-label">아이디</label>
										<div class="col-md-8 col-lg-9">
											<input name="memId" type="text" class="form-control" id="newMemId">
										</div>
									</div>
									
									<div class="row mb-3">
										<label for="memPassword" class="col-md-4 col-lg-3 col-form-label">비밀번호</label>
										<div class="col-md-8 col-lg-9">
											<input name="memPassword" type="password" class="form-control" id="newMemPassword">
										</div>
									</div>
										
									<div class="row mb-3">
											<label for="name" class="col-md-4 col-lg-3 col-form-label">이름</label>
											<div class="col-md-8 col-lg-9">
											<input name="name" type="text" class="form-control" id="newName">
										</div>
									</div>
									
									<div class="row mb-3">
											<label for="telno" class="col-md-4 col-lg-3 col-form-label">연락처</label>
											<div class="col-md-8 col-lg-9">
											<input name="telno" type="text" class="form-control" id="newTelno">
										</div>
									</div>
									
									<div class="row mb-3">
											<label for="email" class="col-md-4 col-lg-3 col-form-label">이메일</label>
											<div class="col-md-8 col-lg-9">
											<input name="email" type="text" class="form-control" id="newEmail">
										</div>
									</div>
									
									<div class="row mb-3">
											<label for="email" class="col-md-4 col-lg-3 col-form-label">직무명</label>
											<div class="col-md-8 col-lg-9">
											<input name="jobName" type="text" class="form-control" id="newJobName">
										</div>
									</div>
									
									<div class="text-center">
										<button type="button" class="btn btn-primary" id="accountBtn">신규 기업 회원 등록</button>
									</div>
								</form>
							</div>
							
						</div><!-- End Bordered Tabs -->
					</div>
				</div>
			</div>
		</div>
	</section>
</main><!-- End #main -->


<script type="text/javascript">
	$(function(){
		var editMemberBtn = $('#editMemberBtn');	//	회원 정보 수정 - 변경사항 저장 버튼
		var editCompanyBtn = $('#editCompanyBtn');	//	기업 정보 수정 - 변경사항 저장 버튼
		var accountBtn = $('#accountBtn');			//	신규 기업 회원 등록 버튼
		
		var currentPassword = $('#currentPassword');	//	현재 비밀번호 입력 INPUT
		var newPassword = $('#newPassword');			//	새 비밀번호 입력 INPUT
		var renewPassword = $('#renewPassword');		//	새 비밀번호 확인 입력 INPUT
		var pwBtn = $('#pwBtn');						//	패스워드 변경 버튼
		var isCheckPassword = false;					//	비밀번호 변경을 위한 boolean
		
		//	회원 정보 수정 이벤트
		editMemberBtn.on('click', function(){
			//	회원 정보 수정 폼 데이터 JSON화
			var formData = $('#profileEditForm').serialize();
			
			$.ajax({
				url : "/jobel/coMemberEdit",
				type : "post",
				data : formData,
				beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
					xhr.setRequestHeader(header, token);
				},
				success : function(res){
					if(res=="SUCCESS"){
						alert("변경이 완료되었습니다.");
						location.reload();
					}
				},
				error : function(xhr){
					alert("변경에 실패하였습니다. 잠시 후 다시 시도해주세요.");
					console.log("에러 코드 : " + xhr.status);
				}
			});		//	$.ajax() 종료
		});		//	editMemberBtn onClick 이벤트 종료
		
		
		//	새 비밀번호 일치 여부 확인
		renewPassword.on('keyup', function(){
			var newPw = $('#newPassword').val();
			var checkPw = $('#renewPassword').val();
			
			if(newPw == checkPw){
				renewPassword.removeClass('is-invalid');
				isCheckPassword = true;
			}
			
			if(newPw != checkPw){
				renewPassword.addClass('is-invalid');
				isCheckPassword = false;
			}
		});		//	새 비밀번호 일치 확인 이벤트 종료
		
		//	비밀번호 변경 버튼 클릭 이벤트
		pwBtn.on('click', function(){
			
			//	새 비밀번호 일치 여부 확인
			if(!isCheckPassword) {
				alert("새 비밀번호 값을 제대로 확인해주세요.");
				$('#checkPassword').focus();
				return false;
			}
			
			var memId = "${member.memId }";
			var myPw = $('#currentPassword').val();
			var newPw = $('#newPassword').val();
			
			//	현재 비밀번호 일치 여부 확인
			if(!checkPw(memId, myPw)){
				alert("현재 비밀번호가 일치하지 않습니다.");
				$('#currentPassword').focus();
				return false;
			}
			
			//	신규 비밀번호 일치 여부 확인(똑같은 비밀번호로 변경할 수 없음)
			if(checkPw(memId, newPw)){
				alert("이미 사용 중인 비밀번호는 사용할 수 없습니다.");
				$('#newPassword').focus();
				return false;
			}
			
			//	비밀번호 변경
			changePw(memId, newPw);
		});		//	pwBtn onClick 이벤트 종료
		
		
		//	기업 정보 수정 이벤트
		editCompanyBtn.on('click', function(){
			//	기업 정보 수정 폼 데이터 JSON화
			var formData = $('#companyEditForm').serialize();
			
			$.ajax({
				url : "/jobel/editCompany",
				type : "post",
				beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
					xhr.setRequestHeader(header, token);
				},
				data : formData,
				success : function(res){
					//	검증 성공 시 비밀번호 변경 진행
					if(res == "SUCCESS"){
						alert("변경이 완료되었습니다.");
						location.reload();
					}
				},
				error : function(xhr){
					console.log("에러 코드 : " + xhr.status);
					alert("에러가 발생하였습니다. 잠시 후 다시 시도해주세요.");
				}
			});		//	$.ajax() 종료
		});		//	editCompanyBtn onClick 이벤트 종료
		
		//////////////////////////////////////////////
		///////				함수				//////
		//////////////////////////////////////////////
		
		//	비밀번호 중복을 확인하는 함수
		function checkPw(memId, memPw){
			var result = null;
			$.ajax({
				url : "/jobel/checkPassword",
				type : "post",
				beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
					xhr.setRequestHeader(header, token);
				},
				data : {
					memId : memId,
					memPassword : memPw,
				},
				async : false,
				success : function(res){
					//	검증 성공 시 비밀번호 변경 진행
					if(res == "SUCCESS"){
						result = true;
					}
				},
				error : function(xhr){
					result = false;
				}
			});		//	$.ajax() 종료
			
			return result;
		}		//	function checkPw 종료
		
		
		//	비밀번호 변경을 진행하는 함수
		function changePw(memId, newPw){
			$.ajax({
				url : "/jobel/changePassword",
				type : "post",
				beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
					xhr.setRequestHeader(header, token);
				},
				data : {
					memId : memId,
					memPassword : newPw,
				},
				success : function(res){
					if(res == "SUCCESS"){
						alert("비밀번호 변경이 완료되었습니다.");
						location.reload();
					}
				}, error : function(xhr){
					alert("비밀번호 변경에 실패했습니다. 잠시 후 다시 시도해주세요.");
					console.log("에러 코드 : " + xhr.status);
				}
			});		//	$.ajax() 종료
		}		//	function changePw 종료
	});		//	$(function()) 종료
</script>