<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<sec:authorize access="isAnonymous()">
	<c:set var="loginYn" value="N"/>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
	<c:set var="loginYn" value="Y"/>
	<sec:authentication property="principal.member" var="member"/>
	<sec:authentication property="principal.member.memId" var="memId"/>
</sec:authorize>

<input type="hidden" value="${recruit.recruitNo }" id="recNo"/>
<div class="recSection">
	<div class="recWrap">
		<div class="recContent recDetail">
			<div class='recTitle'>
				<p class="recSubTitleText">${recruit.coName }</p>
				<p class="recTitleText">${recruit.title }</p>
				<div class="applicationMenu">
					<c:choose>
						<c:when test="${alreadyLike ne null }">
							<button class="likeBtnReverse"><span><i class='bx bx-star'></i></span></button>
						</c:when>
						<c:otherwise>
							<button class="likeBtn"><span><i class='bx bx-star'></i></span></button>
						</c:otherwise>
					</c:choose>
					<button class="appBtn" id="appBtn"><span>지원하기</span></button>
				</div>
			</div>
			<hr class="my-3" />
			<div class="recDesc">
				<div class="descLeft">
					<div class="descColumn">
						<label>자격 요건</label>
						<span>${recruit.requiredQualification }</span>
					</div>
					<div class="descColumn">
						<label>요구 학력</label>
						<span>
							${recruit.schTypeName }
							<c:if test="${recruit.requiredEducation != 'SCHTYPE000'}"> ↑ </c:if>
						</span>
					</div>
					<div class="descColumn">
						<label>고용 형태</label>
						<span>${recruit.wrkTypeName }</span>
					</div>
				</div>
				<div class="descRight">
					<div class="descColumn">
						<label>급여</label>
						<span>${recruit.salary }</span>
					</div>
					<div class="descColumn">
						<label>근무 시간</label>
						<span>${recruit.workTime }</span>
					</div>
					<div class="descColumn">
						<label>근무 지역</label>
						<span>${recruit.coAddressBasic }</span>
					</div>
				</div>
			</div>		<!-- recDesc 끝 -->
			
			<hr class="my-3" />
			
			<c:if test="${fileList ne null and not empty fileList }">
				<div class="recFiles">
					<c:forEach items="${fileList }" var="file" varStatus="stat">
						<c:if test="${stat.index != 0 }">
							<span>&nbsp;|&nbsp;</span>
						</c:if>
						<a href="/jobel/download?fileId=${file.fileId }&fileSerialNo=${file.fileSerialNo }">
						<i class="bi bi-file-earmark-arrow-down fs-5 fw-bold"></i>
						</a>
						<span>${file.fileOriginName }</span>
					</c:forEach>
				</div>
				<hr class="my-3" />
			</c:if>
			
			<div class="recMainContent">
				${recruit.content }
			</div>		<!-- recruit 테이블 content 끝 -->
			
			<div class="recLocationContent">
				<p class="descTitle">근무지 위치 정보</p>
				<div class="descContent">
					<input type="hidden" value="${recruit.coAddressBasic }" id="comAddrBasic"/>
					<input type="hidden" value="${recruit.coAddressDetail }" id="comAddrDetail"/>
					<div id="mapDiv" style="width:100%; height:300px; display:none;"></div>
					<p class="mapDesc">(${recruit.coPostcode }) ${recruit.coAddressBasic } ${recruit.coAddressDetail }</p>
				</div>
			</div>		<!-- recLocation 끝 -->
			
			<div class="recApplicationContent">
				<p class="descTitle">접수 기간</p>
				<div class="descContent">
					<c:choose>
						<c:when test="${recruit.allRecruitYn == 'Y' }">
							<p>상시 채용</p>
						</c:when>
						<c:otherwise>
							<div class="dateInfo">
								<fmt:parseDate value="${recruit.recruitBgngYmd }" var="recruitBgngYmd" pattern="yyyyMMdd"/>
								<fmt:parseDate value="${recruit.recruitBgngDt }" var="recruitBgngDt" pattern="HHmm"/>
								<label>접수 시작일</label>
								<span>
									<fmt:formatDate value="${recruitBgngYmd }" pattern="MM월 dd일 (E)"/>
									<fmt:formatDate value="${recruitBgngDt }" pattern="HH:mm"/>
								</span>
							</div>
							<div class="dateInfo">
								<fmt:parseDate value="${recruit.recruitDdlnYmd }" var="recruitDdlnYmd" pattern="yyyyMMdd"/>
								<fmt:parseDate value="${recruit.recruitDdlnDt }" var="recruitDdlnDt" pattern="HHmm"/>
								<label>접수 마감일</label>
								<span>
									<fmt:formatDate value="${recruitDdlnYmd }" pattern="MM월 dd일 (E)"/>
									<fmt:formatDate value="${recruitDdlnDt }" pattern="HH:mm"/>
								</span>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>		<!-- recApplicationContent 끝 (접수 방법) -->
			
			<div class="recApplyStatContent">
				<p class="descTitle">지원자 통계</p>
				<div class="descContent d-flex">
					<div class="descContentLeft col-6 d-flex justify-content-center">
						<canvas id="genderChart" style="height:30vh;width:50vh;"></canvas>
					</div>
					<div class="descContentRight col-6 d-flex justify-content-center">
						<canvas id="ageRangeChart" style="height:30vh;width:50vh;"></canvas>
					</div>
				</div>
			</div>		<!-- recApplyStat 끝 (지원자 통계) -->
			
			<div class="recCompanyContent">
				<input type="hidden" id="coName" value="${company.coName }" />
				<p class="descTitle">기업 정보</p>
				<div class="descContent">
					<div class="companyInfo">
						<p class="comTitle">${company.coName }</p>
						<img class="coInfoImg" src="${pageContext.request.contextPath }${recruit.coLogoPath}">
						<div class="comLeft">
							<div class="descColumn">
								<label>대표자명</label>
								<span>${company.coCeoName}</span>
							</div>
							<div class="descColumn">
								<label>업종</label>
								<span>${company.coJobTypeName}</span>
							</div>
							<div class="descColumn">
								<label>설립일</label>
								<span>
								<c:set var="fndnYmd" value="${company.coFndnYmd }"/>
								<fmt:parseDate value="${fndnYmd }" pattern="yyyyMMdd" var="fmtFndnYmd"/>
								<fmt:formatDate value="${fmtFndnYmd }" pattern="yyyy년 MM월 dd일"/>
								</span>
							</div>
							<div class="descColumn">
								<label>홈페이지</label>
								<a href='${company.coUrl }' target="_blank" style="text-decoration-line: none;">${company.coUrl }</a>
							</div>
						</div>
						<div class="comRight">
							<div class="descColumn">
								<label>팩스번호</label>
								<span>
								<c:if test="${company.coFax.length() == 10 }">
									${company.coFax.substring(0,2) }-${company.coFax.substring(3,7) }-${company.coFax.substring(7) } 
								</c:if>
								<c:if test="${company.coFax.length() == 11 }">
									${company.coFax.substring(0,3) }-${company.coFax.substring(3,7) }-${company.coFax.substring(7) } 
								</c:if>
								</span>
							</div>
							<div class="descColumn">
								<label>사원수</label>
								<span>${company.coEmployeeCount}명</span>
							</div>
							<div class="descColumn">
								<label>매출액</label>
								<span><fmt:formatNumber type="number" maxFractionDigits="3" value="${company.coSales * 1000000 }" />원</span>
							</div>
							<div class="descColumn">
								<label>기업주소</label>
								<span>${company.postcode} ${company.addressBasic} ${company.addressDetail}</span>
							</div>
						</div>
					</div>
				</div>
			</div>		<!-- recCompanyInfo 끝 -->
		</div>		<!-- recContent 끝 -->
	</div>		<!-- recWrap 끝 -->
</div>		<!-- recSection 끝 -->

<!-- 지원하기 클릭 시 띄울 모달창 -->
<div class="modal fade" id="resumeModal" tabindex="-3">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">내 이력서 목록</h1>
				<button type="button" class="btn-close rsmCloseBtn" aria-label="Close"></button>
			</div>
	     	<div class="modal-body" id="myResumes">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" id="writeRsmBtn" style="position: absolute;left: 2%;">이력서 작성</button>
				<button type="button" class="btn btn-secondary rsmCloseBtn">닫기</button>
				<button type="button" class="btn btn-primary" id="selectRsmBtn">이력서 선택</button>
			</div>
		</div>
	</div>
</div>		<!-- 지원하기 모달 끝 -->

<!-- 미리보기 누를 시 정보 띄울 이력서 모달창 -->
<div class="modal fade" id="previewModal" tabindex="-2">
	<div class="modal-dialog modal-xl" id="prevModal">
		<div class="modal-content">
			<button type="button" class="btn btn-secondary" id="appRsmBtn">이력서 제출</button>
			<button type="button" class="btn btn-sm btn-secondary" id="printPDF">
				<i class='bx bxs-file-pdf'></i>
			</button>
			<div class="modal-body rsmPage">
				<div class="pageContent" id="previewPage">
					<div class="prevHeader">
						<div class="prevHeaderLeft">
							<p class="prevTitle">이력서</p>
							<p class="prevTitle prevMemId">성명</p>
						</div>
						<div class="prevHeaderRight">
							<img class="prevProfilePhoto" src="${pageContext.request.contextPath }/resources/images/default/default_profile.png" />
						</div>
					</div>
					<div class="prevContent">
						<div class="prevContentMenu">
							<div class="menuItem"><span class="menuItemTitle">인적사항</span></div>
							<div class="menuItem">
								<div class="menuItemNick">생년월일</div>
								<div class="menuItemDesc prevBirth">생일 데이터</div>
							</div>
							<div class="menuItem">
								<div class="menuItemNick">연락처</div>
								<div class="menuItemDesc prevTelno">연락처 데이터</div>
							</div>
							<div class="menuItem">
								<div class="menuItemNick">주소</div>
								<div class="menuItemDesc prevMemAddr">주소 데이터</div>
							</div>
						</div>	<!-- 인적사항 끝 -->
						
						<div class="prevContentMenu" id="prevEducation">
							<div class="menuItem"><span class="menuItemTitle">학력</span></div>
							<div class="menuItemHeader">
								<div class="col-1">학력</div>
								<div class="col-1">소재</div>
								<div class="col-2">학교명</div>
								<div class="col-1">졸업여부</div>
								<div class="col-3">전공 / 부전공</div>
								<div class="col-2">기준학점 / 평점</div>
								<div class="col-2">입학일자 / 졸업일자</div>
							</div>
						</div>		<!-- 학력사항 끝 -->
						
						<div class="prevContentMenu" id="prevCareer">
							<div class="menuItem"><span class="menuItemTitle">경력</span></div>
							<div class="menuItemHeader">
								<div class="col-2">근무형태</div>
								<div class="col-3">회사명</div>
								<div class="col-3">직무명</div>
								<div class="col-2">입사일자</div>
								<div class="col-2">퇴사일자</div>
							</div>
						</div>		<!-- 경력사항 끝 -->
						
						<div class="prevContentMenu" id="prevCert">
							<div class="menuItem"><span class="menuItemTitle">자격증</span></div>
							<div class="menuItemHeader">
								<div class="col-3">자격 / 면허 종류</div>
								<div class="col-3">발급기관</div>
								<div class="col-3">취득일자</div>
								<div class="col-3">만료일자</div>
							</div>
						</div>		<!-- 자격증 끝 -->
						<div class="prevContentMenu" id="prevMilitary">
							<div class="menuItem"><span class="menuItemTitle">병력사항</span></div>
							<div class="menuItemHeader">
								<div class="col-6">병역사항</div>
								<div class="col-3">입대일자</div>
								<div class="col-3">전역일자</div>
							</div>
						</div>		<!-- 병력사항 끝 -->
							
						<div class="prevContentMenu">
							<div class="menuItem"><span class="menuItemTitle">자기소개서</span></div>
							<div class="prevPortfolio">
								자기소개내용
							</div>
						</div>
					</div>
				</div>
			</div>		<!-- modal-body 끝 -->
		</div>		<!-- modal-content 끝 -->
	</div>
</div>		<!-- 이력서 모달창 끝 -->


<div class="modal fade" id="applicationModal" tabindex="-1">
	<div class="modal-dialog modal-lg" id="applyModal" >
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">이력서 제출</h5>
				<button type="button" class="btn-close applyCloseBtn"></button>
			</div>
			<div class="modal-body row" style="min-height: 360px;">
				<div class="applyModalContent">
					<p class="applyText col-12">다운로드 된 이력서를 등록하여 제출해주세요.</p>
					<p class="applyText col-12">이력서 외 공고에서 요구하는 파일이 있다면 같이 제출해주세요.</p>
					<input type="file" class="form-control" name="applyFiles" id="applyFiles" multiple="multiple"/>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary applyCloseBtn">취소</button>
				<button type="button" class="btn btn-primary" id="applySubmitBtn">제출</button>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	$(function(){
		var appBtn = $('#appBtn');					//	지원하기 버튼
		var writeRsmBtn = $('#writeRsmBtn');		//	이력서 작성 버튼
		var selectRsmBtn = $('#selectRsmBtn');		//	이력서 선택 버튼
		var appRsmBtn = $('#appRsmBtn');			//	이력서 제출 버튼
		var applySubmitBtn = $('#applySubmitBtn');	//	이력서 최종 제출 버튼
		var printPDF = $('#printPDF');				//	이력서 미리보기 PDF 출력 버튼

		
		//	이력서 작성 버튼 클릭 이벤트
		writeRsmBtn.on('click', function(){
			location.href = "/jobel/resumeWrite";
		});
		
		//	지원하기 버튼 클릭 이벤트
		appBtn.on('click', function(){
			//	로그인 여부 확인
			var loginYn = '${loginYn}';		//	로그인 여부
			if(loginYn == "N") {		//	로그인이 안 되어있을 시
				alert("로그인 후 이용 가능합니다.");
				return false;
			}
			
			//	이미 지원한 공고인지 확인
			var memId = '${memId}';				//	회원 아이디
			var recNo = $('#recNo').val();		//	채용 공고 번호
			
			//	체크 여부 확인
			$.ajax({
				url : "/jobel/applyCheck",
				type : "post",
				beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
					xhr.setRequestHeader(header, token);
				},
				data : {
					memId : memId,
					recNo : recNo
				},
				success : function(res){
					if(res == "ALREADY"){		//	이미 등록한 경우
						if(confirm("이미 지원한 공고입니다. 마이 페이지에서 확인하시겠습니까?")){
							location.href = "/jobel/myPage?menu=application&currentPage=1";
						} else {
							return false;
						}
					}
					
					if(res == "SUCCESS"){		//	등록한 적 없는 경우
						openRsmModal();
					}
				},
				error : function(xhr){
					console.log("에러 코드 : " + xhr.status);
					console.log("--- checkApply Error ---");
					alert("에러가 발생했습니다. 잠시 후 다시 실행해주세요.")
				}
			});		//	$.ajax() 종료
		});		//	appBtn onClick 이벤트 종료
		
		//	지원하기 모달 창 닫는 버튼
		$('.rsmCloseBtn').on('click', function(){
			$('#resumeModal').modal('hide');
		});
		
		//	이력서 최종 제출 모달 창 닫는 버튼
		$('.applyCloseBtn').on('click', function(){
			$('#applicationModal').modal('hide');			
		});
		
		//	이력서 최종 제출 버튼 클릭 이벤트
		applySubmitBtn.on('click', function(){
			
			var fileCheck = $('#applyFiles').val();		//	첨부파일 존재 유무 확인
			
			if(!fileCheck){		//	파일이 없다면
				alert("파일을 첨부해주세요.");
				return false;
			} else {
				//	저장할 정보를 담을 formData()
				var formData = new FormData();
				
				var recNo = $('#recNo').val();												//	공고 번호
				var rsmNo = $('#myResumes').find('input[name=rsmNo]:checked').val();		//	이력서 번호
				
				formData.append("recruitNo", recNo);
				formData.append("rsmNo", rsmNo);
				
				for(var i = 0; i < $('#applyFiles')[0].files.length; i++){
					formData.append("applyFiles", $('#applyFiles')[0].files[i]);
				}
			
				$.ajax({
					url : "/jobel/doApplication",
					type : "post",
					beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
						xhr.setRequestHeader(header, token);
					},
					data : formData,
					contentType : false,
					processData: false,
					success : function(res){
						if(res == "SUCCESS"){
							alert("서류 제출이 완료되었습니다.");
							location.reload();
						}
					},
					error : function(xhr){
						console.log("에러 코드 : " + xhr.status);
						alert("에러가 발생했습니다. 잠시 후 다시 시도해주세요.");
					}
				});		//	$.ajax() 종료
			}		//	if문 else 종료
		});		//	applySubmitBtn onClick 이벤트 종료

		//	이력서 제출 버튼 클릭 이벤트
		appRsmBtn.on('click', function(){
			var recNo = $('#recNo').val();												//	공고 번호
			var rsmNo = $('#myResumes').find('input[name=rsmNo]:checked').val();		//	이력서 번호
			var memId = '${memId}';

			if(!confirm("해당 이력서로 지원하시겠습니까?")){		//	'취소' 클릭 이벤트
				return false;
			} else {		//	'확인' 클릭 이벤트
				//	이력서 PDF로 저장
				html2canvas(document.querySelector('#previewPage'), {
	                scale: 2	// 해상도를 2배로 설정
	            }).then(function(canvas) {
	                var imgData = canvas.toDataURL('image/png');
	                var imgWidth = 210;		// A4 width in mm
	                var pageHeight = 297;	// A4 height in mm
	                var imgHeight = canvas.height * imgWidth / canvas.width;	// 이미지의 높이를 비율에 맞게 계산
	                var { jsPDF } = window.jspdf;			// jsPDF를 jspdf 객체에서 가져옴
	                var doc = new jsPDF('p', 'mm', 'a4');	// 새로운 jsPDF 문서 생성

	                // PDF에 이미지 추가
	                doc.addImage(imgData, 'PNG', 0, 0, imgWidth, imgHeight);
	                
	                // PDF 파일 다운로드
	                var fileName = recNo + "_" + rsmNo + "_" + memId + "_pdf.pdf";
	                doc.save(fileName);
	            });
			
				//	제출하는 모달 창 열기
				$('#applicationModal').modal('show');
				
				//	미리보기 모달 창 닫기
				$('#previewModal').modal('hide');
			}		//	if(confirm)의 else문 종료
			
		});		//	appRsmBtn onClick 이벤트 종료
		
		//	이력서 선택 버튼 클릭 이벤트
		selectRsmBtn.on('click', function(){
			//	해당 이력서 번호와 회원 정보 가져오기
			var rsmNo = $('#myResumes').find('input[name=rsmNo]:checked').val();		//	이력서 번호
			var memId = '${memId}';
			
			if(rsmNo == null || rsmNo == ""){
				alert("이력서를 선택해주세요.");
				return false;
			}
			
			//	해당 이력서의 정보를 가져온다.
			$.ajax({
				url : "/jobel/getPreviewResume",
				type : "get",
				beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
					xhr.setRequestHeader(header, token);
				},
				data : {
					rsmNo : rsmNo,
					memId : memId
				},
				success : function(res){
					//	함수를 호출하여 데이터를 전부 넣는다.
					addPreviewData(res);
					
					//	데이터를 전부 입력했다면 이력서 미리보기 모달 창을 연다
					$('#previewModal').modal('show');
				},		//	success 끝
				error : function(xhr){
					console.log("에러 코드 : " + xhr.status);
					alert("에러가 발생했습니다. 잠시 후 다시 시도해주세요.");
					return false;
				}
			});		//	$.ajax() 종료
		});		//	selectRsmBtn onClick 이벤트 종료

		//	즐겨찾기 버튼 클릭 이벤트
		$('.applicationMenu').on('click', '.likeBtn', function() {
			//	로그인 여부 확인
			var loginYn = '${loginYn}';
			if(loginYn=="N"){		//	로그인이 안 되어있을 시
				alert("로그인 후 이용 가능합니다.");
				return false;
			}
			
			//	로그인이 되어있다면 값을 가져온다.
			var recruitNo = $('#recNo').val();
			var memId = '${memId}';
			
			$.ajax({
				url : "/jobel/likeRecruit",
				type : "post",
				beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
					xhr.setRequestHeader(header, token);
				},
				data : {
					memId : memId,
					recruitNo : recruitNo
				},
				success : function(res){
					if(res == "SUCCESS"){
						//	버튼을 변경
						$('.applicationMenu').find('.likeBtn').addClass('likeBtnReverse');
						$('.applicationMenu').find('.likeBtn').removeClass('likeBtn');
						alert("즐겨찾기 등록이 완료되었습니다.");
					}
				},
				error : function(xhr){
					console.log("에러 코드 : " + xhr.status);
					alert("즐겨찾기 추가에 실패했습니다. 잠시 후 시도해주세요.");
				}
			});		//	$.ajax() 종료
			
		});		//	likeBtn onClick 이벤트 종료
		
		//	즐겨찾기 취소 버튼 이벤트
		$('.applicationMenu').on('click', '.likeBtnReverse', function() {
			if(confirm("즐겨찾기를 취소하시겠습니까?")){
				//	취소하기로 했다면 값을 가져온다.
				var recruitNo = $('#recNo').val();
				var memId = '${memId}';
				
				$.ajax({
					url : "/jobel/likeRecruitDelete",
					type : "post",
					beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
						xhr.setRequestHeader(header, token);
					},
					data : {
						memId : memId,
						recruitNo : recruitNo
					},
					success : function(res){
						if(res == "SUCCESS"){
							//	버튼을 변경
							$('.applicationMenu').find('.likeBtnReverse').addClass('likeBtn');
							$('.applicationMenu').find('.likeBtnReverse').removeClass('likeBtnReverse');
							alert("즐겨찾기가 삭제 완료되었습니다.");
						}
					},
					error : function(xhr){
						console.log("에러 코드 : " + xhr.status);
						alert("즐겨찾기 삭제에 실패했습니다. 잠시 후 시도해주세요.");
					}
				});		//	$.ajax() 종료
			}		//	if(confirm()) 종료
		});		//	likeBtnReverse onClick 이벤트 종료
		
		//	printPDF 버튼 클릭 이벤트
		printPDF.on('click', function(){
            html2canvas(document.querySelector('#previewPage'), {
                scale: 2	// 해상도를 2배로 설정
            }).then(function(canvas) {
                var imgData = canvas.toDataURL('image/png');
                var imgWidth = 210;		// A4 width in mm
                var pageHeight = 297;	// A4 height in mm
                var imgHeight = canvas.height * imgWidth / canvas.width;	// 이미지의 높이를 비율에 맞게 계산
                var { jsPDF } = window.jspdf;			// jsPDF를 jspdf 객체에서 가져옴
                var doc = new jsPDF('p', 'mm', 'a4');	// 새로운 jsPDF 문서 생성

                // PDF에 이미지 추가
                doc.addImage(imgData, 'PNG', 0, 0, imgWidth, imgHeight);
                
                // PDF를 Blob 형식으로 출력
                var pdfBlob = doc.output('blob');

                // Blob URL 생성
                var pdfUrl = URL.createObjectURL(pdfBlob);

                // 새 창에서 PDF 보기
                window.open(pdfUrl, '_blank');
            });
		});		//	prinfPDF onClick 이벤트 종료
		
		
		/***********************************/
		/***** 공고 지원자 정보 차트화 *****/
		/***********************************/
		var genderCrt = $('#genderChart');			//	지원자 성비율 차트
		var ageRangeCrt = $('#ageRangeChart');		//	연령대별 지원자 차트
		
		var genderChart = new Chart(genderCrt, {
			type : 'bar',
			data : {
				labels : ${genderName},
				datasets : [{
					label : "지원자 성비율",
					data : ${genderData},
					backgroundColor: [
						'rgba(168, 227, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 99, 132, 0.2)',
					],
					borderColor: [
						'rgba(168, 227, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 99, 132, 1)',
					],
					borderWidth: 1
				}]
			},
			options : {
				responsive : false,
				scales : {
					y : {
						beginAtZero : true
					}
				}
			}
		});		//	genderChart 종료
		
		var ageRangeChart = new Chart(ageRangeCrt, {
			type : 'pie',
			data : {
				labels : ${ageRangeName},
				datasets : [{
					data : ${ageRangeData},
					backgroundColor : [
						'rgba(179, 0, 0, 0.2)',
						'rgba(179, 164, 0, 0.2)',
						'rgba(0, 179, 3, 0.2',
						'rgba(0, 149, 179, 0.2)',
						'rgba(152, 0, 179, 0.2)'
					],
					borderColor : [
						'rgba(179, 0, 0, 1)',
						'rgba(179, 164, 0, 1)',
						'rgba(0, 179, 3, 1)',
						'rgba(0, 149, 179, 1)',
						'rgba(152, 0, 179, 1)'
					],
					borderWidth : 1
				}]
			},
			options : {
				responsive : false,
				plugins : {
					legend : {
						position : 'top',
					},
					title : {
						display : true,
						text : '연령대별 지원자 수'
					}
				}
			},
		});		//	ageRangeChart 종료
		
		/***********************************/
		/***** 지원서 모달 오픈 이벤트 *****/
		/***********************************/
		function openRsmModal(){
			var memId = '${memId}';
			//	로그인이 되어있고 지원한 적이 없다면 값을 가져온다.
			var resultHtml = '<ul class="myRsmUl"><li class="col-1 text-center">번호</li>'
						+ '<li class="col-7">이력서 제목</li>'
						+ '<li class="col-2 text-center">이력서 등록일</li>'
						+ '<li class="col-2 text-center">이력서 선택</li></ul>';
				
			//	내 이력서 정보 가져오기
			$.ajax({
				url : "/jobel/getMyResume",
				type : "POST",
				beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
					xhr.setRequestHeader(header, token);
				},
				data : {
					memId : memId,
				},
				success : function(res){		//	이력서가 존재하는 경우
					$.each(res, function(i,v){
						resultHtml += '<ul class="myRsmUl"><li class="col-1 text-center">' + (i+1) + '</li>';
						resultHtml += '<li class="col-7">' + v.rsmTitle + '</li>';
						var regYmd = v.rsmRegYmd;
						if(regYmd != null && regYmd != ""){		//	null이 아닐 때
							regYmd = regYmd.substring(0,4) + "-" + regYmd.substring(4,6) + "-" + regYmd.substring(6);
						} else {		//	null 일 경우 null 이란 글자를 제거
							regYmd = "";
						}
						
						resultHtml += '<li class="col-2 text-center">' + regYmd + '</li>';
						resultHtml += '<li class="col-2 text-center">'; 
						resultHtml += '<input type="radio" name="rsmNo" value="' + v.rsmNo + '"';
						if(v.rsmStatCode == 'RSMTYPE001'){
							resultHtml += ' disabled'
						}
						resultHtml += '/>' + '</li></ul>';
					});

					$('#myResumes').html(resultHtml);
				},
				error : function(xhr){		//	존재하지 않는 경우
					console.log("에러 코드 : " + xhr.status);
					resultHtml += '<ul class="myRsmUl">';
					resultHtml += '<li class="w-100">저장한 이력서가 존재하지 않습니다.</li></ul>';
					
					$('#myResumes').html(resultHtml);
				}
			});		//	$.ajax() 종료
			
			//	모달 창 띄우기
			$('#resumeModal').modal('show');
		}

		
		/********************************************/
		/***** 이력서 미리보기 모달 데이터 입력 *****/
		/********************************************/
		function addPreviewData(res){
			//	데이터 가져오기
			var myResume = res.resume;
			var member = res.member;
			
			var eduDivisions = res.eduDivisions;		//	학력 구분
			var eduLocations = res.eduLocations;		//	학교 소재
			var eduGrdBasis = res.eduGrdBasis;			//	기준 학점
			var eduGrdTypes = res.eduGrdTypes;			//	졸업 여부
			
			var myBrdt = member.brdt;
			myBrdt = myBrdt.substring(0,4) + "-" + myBrdt.substring(4,6) + "-" + myBrdt.substring(6);
			var myTelno = member.telno;
			myTelno = myTelno.substring(0,3) + "-" + myTelno.substring(3,7) + "-" + myTelno.substring(7);
			var myAddress = "(" + member.postcode + ") " + member.addressBasic + ", " + member.addressDetail;
			
			//	인적 사항 입력
			$('.prevMemId').html(member.name);
			$('.prevBirth').html(myBrdt);
			$('.prevTelno').html(myTelno);
			$('.prevMemAddr').html(myAddress);
			$('.prevProfilePhoto').attr('src', '${pageContext.request.contextPath }'+myResume.rsmPhotoPath);
			
			//	학력 사항 입력
			var myEducation = myResume.educationList;
			
			//	학력사항이 존재하는 경우
			if(myEducation != null){
				var educationLocation = $('#prevEducation');		//	학력사항을 출력할 위치
				var eduMenuItem = "";								//	학력사항 내용을 담는 변수
				
				var cloneTitle = educationLocation.find(".menuItem").first().clone();		//	타이틀 복사
				var cloneHeader = educationLocation.find(".menuItemHeader").clone();		//	테이블 헤더 복사
				
				//	각각의 학력사항을 입력
				$.each(myEducation, function(i, v){
					eduMenuItem += '<div class="menuItem"><div class="col-1">' + eduDivisions[i] + '</div>';
					eduMenuItem += '<div class="col-1">' + eduLocations[i] + '</div>';
					eduMenuItem += '<div class="col-2">' + v.schoolName + '</div>';
					
					if(eduGrdTypes[i] != null && eduGrdTypes[i] != ""){		//	졸업 구분
						eduMenuItem += '<div class="col-1">' + eduGrdTypes[i] + '</div>';
					} else if(v.eduDivision == 'SCHTYPE001'){
						eduMenuItem += '<div class="col-1">졸업</div>';
					} else {
						eduMenuItem += '<div class="col-1">&nbsp;</div>';
					}
					
					eduMenuItem += '<div class="col-3">' + v.major;			//	전공 입력(고등학교 기록에는 없음)
					if(v.subMajor != null & v.subMajor != ""){				//	부전공이 있을 시
						eduMenuItem += ' / ' + v.subMajor + '</div>';
					} else {			//	부전공이 없을시
						eduMenuItem += '</div>';
					}
					
					if(eduGrdBasis[i] != null && eduGrdBasis[i] != ""){
						eduMenuItem += '<div class="col-2">' + eduGrdBasis[i] + " / "+ v.gradeAvg + '</div>';
					} else {
						eduMenuItem += '<div class="col-2">&nbsp;</div>';
					}
					
					var enterYmd = v.enterYmd;			//	입학일자
					var graduateYmd = v.graduateYmd;	//	졸업일자
					
					eduMenuItem += '<div class="col-2">';
					if(enterYmd != null && enterYmd != ""){		//	입학일자가 존재할 경우
						enterYmd = enterYmd.substring(0,4) + "-" + enterYmd.substring(4,6) + "-" + enterYmd.substring(6);
						eduMenuItem += enterYmd;
					}
					
					if(graduateYmd != null && graduateYmd != ""){		//	졸업일자가 존재할 경우
						graduateYmd = graduateYmd.substring(0,4) + "-" + graduateYmd.substring(4,6) + "-" + graduateYmd.substring(6);
						eduMenuItem += " ~ <br>" + graduateYmd;
					}
					eduMenuItem += '</div></div>';
				});		//	$.each() 종료
				
				eduMenuItem = eduMenuItem.replaceAll("null", "");

				//	학력사항 초기화
				educationLocation.html("");
				cloneTitle.appendTo(educationLocation);				//	타이틀
				cloneHeader.appendTo(educationLocation);			//	헤더
				educationLocation.append(eduMenuItem);				//	내용
			} else {		//	학력사항이 없는 경우
				var emptyItemCode = "";
				emptyItemCode += '<div class="menuItem"><div class="col-1" style="min-height: 15px;">&nbsp;</div>';
				emptyItemCode += '<div class="col-1">&nbsp;</div><div class="col-2">&nbsp;</div>';
				emptyItemCode += '<div class="col-1">&nbsp;</div><div class="col-3">&nbsp;</div>';
				emptyItemCode += '<div class="col-2">&nbsp;</div><div class="col-2">&nbsp;</div></div>';
				emptyItemCode += emptyItemCode;
				
				$('#prevEducation').find('.menuItemHeader').nextAll().remove();		//	이전 기록 제거
				$('#prevEducation').append(emptyItemCode);							//	공백 칸 추가
			}
			
			//	경력 사항 입력
			var myCareer = myResume.careerList;
			var careerWorkTypes = res.careerWorkTypes;		//	근무 형태 구분(경력)
			
			if(myCareer != null){		//	경력사항이 존재하는 경우
				var careerLocation = $('#prevCareer');			//	경력사항을 출력할 위치
				var careerMenuItem = ""							//	경력사항 내용을 담는 변수
				
				var cloneTitle = careerLocation.find(".menuItem").first().clone();		//	타이틀 복사
				var cloneHeader = careerLocation.find(".menuItemHeader").clone();		//	테이블 헤더 복사
				
				$.each(myCareer, function(i, v){
					careerMenuItem += '<div class="menuItem"><div class="col-2">' + careerWorkTypes[i] + '</div>';
					careerMenuItem += '<div class="col-3">' + v.companyName + '</div>'
					careerMenuItem += '<div class="col-3">' + v.jobName + '</div>';
					
					var jncmpYmd = v.jncmpYmd;
					if(jncmpYmd != null && jncmpYmd != ""){		//	입사일자가 존재할 경우
						jncmpYmd = jncmpYmd.substring(0,4) + "-" + jncmpYmd.substring(4,6) + "-" + jncmpYmd.substring(6);
						careerMenuItem += '<div class="col-2">' + jncmpYmd + '</div>';
					} else {
						careerMenuItem += '<div class="col-2">&nbsp;</div>'
					}
					
					var rtrmYmd = v.rtrmYmd;
					if(rtrmYmd != null && rtrmYmd != ""){
						rtrmYmd = rtrmYmd.substring(0,4) + "-" + rtrmYmd.substring(4,6) + "-" + rtrmYmd.substring(6);
						careerMenuItem += '<div class="col-2">' + rtrmYmd + '</div></div>';
					} else {
						careerMenuItem += '<div class="col-2">&nbsp;</div></div>';
					}
				});		//	$.each() 종료
				
				careerMenuItem = careerMenuItem.replaceAll("null", "");
				
				//	경력사항 초기화
				careerLocation.html("");
				cloneTitle.appendTo(careerLocation);				//	타이틀
				cloneHeader.appendTo(careerLocation);				//	헤더
				careerLocation.append(careerMenuItem);				//	내용
				
			} else {		//	경력사항이 없는 경우
				var emptyItemCode = "";
				emptyItemCode += '<div class="menuItem"><div class="col-2" style="min-height: 15px;">&nbsp;</div>';
				emptyItemCode += '<div class="col-3">&nbsp;</div><div class="col-3">&nbsp;</div>';
				emptyItemCode += '<div class="col-2">&nbsp;</div><div class="col-2">&nbsp;</div></div>';
				emptyItemCode += emptyItemCode;
				
				$('#prevCareer').find('.menuItemHeader').nextAll().remove();
				$('#prevCareer').append(emptyItemCode);
			}
			
			//	자격증 입력
			var myCert = myResume.certList;
			
			if(myCert != null){
				var certLocation = $('#prevCert');			//	자격증을 출력할 위치
				var certMenuItem = "";						//	자격증 내용을 담는 변수
				
				var cloneTitle = certLocation.find(".menuItem").first().clone();		//	타이틀 복사
				var cloneHeader = certLocation.find(".menuItemHeader").clone();			//	테이블 헤더 복사
				
				$.each(myCert, function(i, v){
					certMenuItem += '<div class="menuItem"><div class="col-3">' + v.certType + '</div>';
					certMenuItem += '<div class="col-3">' + v.certAgency + '</div>';
					
					var certAcqulreYmd = v.certAcqulreYmd;
					if(certAcqulreYmd != null && certAcqulreYmd != ""){			//	취득일자가 존재할 경우
						certAcqulreYmd = certAcqulreYmd.substring(0,4) + "-" + certAcqulreYmd.substring(4,6) + "-" + certAcqulreYmd.substring(6);
						certMenuItem += '<div class="col-3">' + certAcqulreYmd +'</div>';
					} else {
						certMenuItem += '<div class="col-3">&nbsp;</div>';
					}
					
					var certExpiryYmd = v.certExpiryYmd;
					if(certExpiryYmd != null && certExpiryYmd != ""){			//	만료일자가 존재할 경우
						certExpiryYmd = certExpiryYmd.substring(0,4) + "-" + certExpiryYmd.substring(4,6) + "-" + certExpiryYmd.substring(6);
						certMenuItem += '<div class="col-3"></div>' + certExpiryYmd + '</div>';
					} else {
						certMenuItem += '<div class="col-3">&nbsp;</div></div>';
					}
				});		//	$.each() 종료
				
				certMenuItem = certMenuItem.replaceAll("null", "");
				certLocation.append(certMenuItem);
				
				//	자격증 초기화
				certLocation.html("");
				cloneTitle.appendTo(certLocation);				//	타이틀
				cloneHeader.appendTo(certLocation);				//	헤더
				certLocation.append(certMenuItem);				//	내용
			} else {		//	자격증이 없는 경우
				var emptyItemCode = "";
				emptyItemCode += '<div class="menuItem"><div class="col-3" style="min-height: 15px;">&nbsp;</div>';
				emptyItemCode += '<div class="col-3">&nbsp;</div><div class="col-3">&nbsp;</div>';
				emptyItemCode += '<div class="col-3">&nbsp;</div></div>';
				emptyItemCode += emptyItemCode;
				
				$('#prevCert').find('.menuItemHeader').nextAll().remove();
				$('#prevCert').append(emptyItemCode);
			}
				
			//	병역사항 입력
			var myMilService = myResume.militaryService;
			
			if(myMilService != null){
				var milLocation = $('#prevMilitary');
				var cloneTitle = milLocation.find(".menuItem").first().clone();		//	타이틀 복사
				var cloneHeader = milLocation.find(".menuItemHeader").clone();			//	테이블 헤더 복사
				
				var militaryItem = '<div class="menuItem"><div class="col-6">';
				militaryItem += res.milServiceName + '</div>';
				
				var milBgngYmd = myMilService.milBgngYmd;
				if(milBgngYmd != null && milBgngYmd != ""){			//	입대일자
					milBgngYmd = milBgngYmd.substring(0,4) + "-" + milBgngYmd.substring(4,6) + "-" + milBgngYmd.substring(6);
					militaryItem += '<div class="col-3">' + milBgngYmd + '</div>';
				} else {
					militaryItem += '<div class="col-3">&nbsp;</div>';
				}
				
				var milEndYmd = myMilService.milEndYmd;
					if(milEndYmd != null && milEndYmd != ""){
					milEndYmd = milEndYmd.substring(0,4) + "-" + milEndYmd.substring(4,6) + "-" + milEndYmd.substring(6);
					militaryItem += '<div class="col-3">' + milEndYmd + '</div></div>';
				} else {
					militaryItem += '<div class="col-3">&nbsp;</div></div>';
				}
					
				//	병역사항 초기화
				milLocation.html("");
				cloneTitle.appendTo(milLocation);				//	타이틀
				cloneHeader.appendTo(milLocation);				//	헤더
				milLocation.append(militaryItem);				//	내용
			} else {		//	병역사항이 없을 경우
				var emptyItemCode = "";
				emptyItemCode += '<div class="menuItem"><div class="col-6">&nbsp;</div>';
				emptyItemCode += '<div class="col-3">&nbsp;</div><div class="col-3">&nbsp;</div></div>';
				
				$('#prevMilitary').find('.menuItemHeader').nextAll().remove();
				$('#prevMilitary').append(emptyItemCode);
			}

			//	자기소개글 입력
			var myContent = myResume.selfIntroduction;
			$('.prevPortfolio').html(myContent);
		}
		
		
		/******************************/
		/***** 지도 띄우는 이벤트 *****/
		/******************************/
		//	정보를 다 불러오면 정보를 가지고와서 지도를 띄운다.
		companyLocation();
		
		//	카카오 지도를 불러오는 함수
		function companyLocation(){
			var address1 = $("#comAddrBasic").val();	// 일반주소 데이터
			var address2 = $("#comAddrDetail").val();	// 상세주소 데이터
			
			//	일반주소 데이터가 존재하지 않는 경우, 지도를 띄울수 없기 때문에 데이터 유무의 기준을 address1으로 설정
			if(address1 != null || address1 != ""){
				var mapContainer = document.getElementById('mapDiv');		//	지도를 표시할 div 
				mapContainer.style.display = "block";
				mapOption = {
					center: new kakao.maps.LatLng(33.450701, 126.570667),		//	지도의 중심좌표
					level: 3		//	지도의 확대 레벨
				};  
		
				//	지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
		
				//	주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
		
				//	주소로 좌표를 검색합니다
				geocoder.addressSearch(address1 + " " + address2, function(result, status) {
		
					if (status === kakao.maps.services.Status.OK) {		//	정상적으로 검색이 완료됐으면
						var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						//	결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
							map: map,
							position: coords
						});
						
						//	인포윈도우로 장소에 대한 설명을 표시합니다
						var coName = $('#coName').val();
						var infowindow = new kakao.maps.InfoWindow({
							content: '<div style="width:150px;text-align:center;padding:6px 0;">' + coName + '</div>'
						});
						infowindow.open(map, marker);
		
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
					}
				});  
			}		//	if문 종료
		}		//	function companyLocation() 종료
		
	});	//	$(function()) 종료

</script>