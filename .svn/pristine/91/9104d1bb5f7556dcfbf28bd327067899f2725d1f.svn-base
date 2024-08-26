<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

	<div class="container">
		<div class="input-form-background row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">기업 등록</h4>
				<form action="/jobel/co_register" method="post" enctype="multipart/form-data" id="companyFrm">
					<sec:csrfInput/>
					<div class="row">
						<div class="col-md-6 mb-3">
							<img src="${pageContext.request.contextPath }/resources/images/default/default_thumbnail.png" class="img-thumbnail" id="profileImg">
						</div>
						<div class="col-md-6 mb-3" style="text-align:right;">
							<button type="button" class="btn btn-sm btn-success" id="explainBtn">데이터 입력</button>
							<a href="/jobel/co_menu" class="btn btn-sm btn-primary">돌아가기</a>
							<!-- 빈 공간으로 간격 맞추는 겸 해서 hidden 속성으로 추가할 내용 입력 -->
							<input type="hidden" value="0"/>
						</div>
						<div class="col-md-6 mb-3">
							<label class="form-label" for="coName">기업명</label>
							<input class="form-control" type="text" name="coName" /> 
						</div>
						<div class="col-md-6 mb-3">
							<!-- 로고 등록하면 프로필 사진에 반영 되서 확인할 수 있어야 한다. -->
							<label class="form-label" for="coLogoPath">회사 로고 사진</label>
							<input class="form-control" type="file" name="imgFile" id="imgFile">
							<p class="footnote"> * "jpg", "jpeg", "gif", "png"만 가능합니다. </p>
						</div>
						<div class="col-md-12 mb-3">
							<label class="form-label" for="coContent">회사 소개 내용</label>
							<textarea class="form-control" name="coContent" id="coContent"></textarea>
						</div>
						<div class="col-md-12 mb-3">
							<label class="form-label" for="coUrl">회사 홈페이지 URL</label>
							<input class="form-control" type="text" name="coUrl" placeholder="https://www.jobeullae.co.kr/"/>
						</div>
						<div class="col-md-6 mb-3">
							<label class="form-label" for="coEmployeeCount">직원 수</label>
							<input class="form-control" type="number" min="1" name="coEmployeeCount"/>
							<p class="footnote"> * 숫자만 입력해주세요. (예시 : 120명 → 120)</p>
						</div>
						<div class="col-md-6 mb-3">
							<label class="form-label" for="coSales">연간 매출액</label>
							<input class="form-control" type="number" min="1" name="coSales" />
							<p class="footnote"> * 예시 : 1억 2,000만 → 120000000</p>
						</div>
						<div class="col-md-6 mb-3">
							<label class="form-label" for="coCeoName">기업 대표</label>
							<input class="form-control" type="text" name="coCeoName" />
							<p class="footnote"> * 공통 대표여도 한 명만 적어주세요.</p>
						</div>
						<div class="col-md-6 mb-3">
							<label class="form-label" for="coFndnYmd">창립일자</label>
							<!-- max에는 오늘 날짜를 구해서 넣는 방식으로 -->
							<input class="form-control" type="date" name="coFndnYmd" max="" />
						</div>
						<div class="col-md-6 mb-3">
							<label class="form-label" for="coFax">팩스 번호</label>
							<!-- 02-xxxx-xxxx 또는 042-xxxx-xxxx 같은 형식으로 휴대번호와 비슷하다 -->
							<input class="form-control" type="text" name="coFax" placeholder="(-) 없이 11~12자리를 입력해주세요."/>
							<p class="footnote"> * 예시 : 042-1234-5678 → 04212345678</p>
						</div>
						<div class="col-md-6 mb-3">
							<label class="form-label" for="coJobType">직종</label>
							<select class="form-select" name="coJobType">
								<option value="JOB001T">개발</option>
								<option value="JOB002T">경영 · 비즈니스</option>
								<option value="JOB003T">마케팅 · 광고</option>
								<option value="JOB004T">디자인</option>
								<option value="JOB005T">영업</option>
								<option value="JOB006T">고객서비스 · 리테일</option>
								<option value="JOB007T">미디어</option>
								<option value="JOB008T">엔지니어링 · 설계</option>
								<option value="JOB009T">HR</option>
								<option value="JOB010T">게임 제작</option>
								<option value="JOB011T">금융</option>
								<option value="JOB012T">제조 · 생산</option>
								<option value="JOB013T">교육</option>
								<option value="JOB014T">의료 · 제약 · 바이오</option>
								<option value="JOB015T">물류 · 무역</option>
								<option value="JOB016T">법률 · 법집행기관</option>
								<option value="JOB017T">식 · 음료</option>
								<option value="JOB018T">건설 · 시설</option>
								<option value="JOB019T">공공 · 복지</option>
							</select>
						</div>
						<div class="col-md-6 mb-3">
							<label class="form-label" for="postcode">우편번호</label>
							<div class="postbox">
								<input class="form-control" type="text" name="postcode" id="postcode" />
								<button class="btn btn-primary postbtn" onclick="DaumPostcode()" type="button">주소 검색</button>
							</div>
						</div>
						<div class="col-md-12 mb-3">
							<label class="form-label" for="addressBasic">기본 주소</label>
							<input class="form-control" type="text" name="addressBasic" id="addressBasic"/>
						</div>
						<div class="col-md-12 mb-3">
							<label class="form-label" for="addressDetail">상세 주소</label>
							<input class="form-control" type="text" name="addressDetail" id="addressDetail"/>
						</div>
						<div class="col-md-12 mb-3">
							<label class="form-label" for="requestFile">제출 서류</label>
							<input class="form-control" type="file" name="requiredFile" multiple>
						</div>
					</div>
				<hr class="my-5">
					<div class="row">
						<div class="col-md-12 mb-3">
							<p class="foreword">해당 기업의 대표 관리자 계정의 정보를 입력하세요.</p>
						</div>
						<div class="col-md-8 mb-3 mx-auto">
							<label class="form-label" for="memId">계정 아이디</label>
							<div class="postbox">
								<input class="form-control" type="text" name="member.memId" id="memId"/>
								<input class="btn btn-primary" type="button" value="중복 확인" id="checkBtn">
							</div>
						</div>
						<div class="col-md-8 mb-3 mx-auto">
							<label class="form-label" for="memPassword">비밀번호</label>
							<input class="form-control" type="password" name="member.memPassword" id="memPw"/>
						</div>
						<div class="col-md-8 mb-3 mx-auto">
							<label class="form-label" for="name">사원명</label>
							<input class="form-control" type="text" name="member.name" id="memName"/>
						</div>
						<div class="col-md-8 mb-3 mx-auto">
							<label class="form-label" for="email">이메일</label>
							<input class="form-control" type="text" name="member.email" id="memEmail"/>
						</div>
						<div class="col-md-8 mb-3 mx-auto">
							<label class="form-label" for="telno">연락처</label>
							<input class="form-control" type="text" name="member.telno" id="memTelno" placeholder="(-) 없이 11~12자리를 입력해주세요."/>
							<p class="footnote"> * 예시 : 010-1234-5678 → 01012345678</p>
						</div>
						<div class="col-md-8 mb-3 mx-auto">
							<label class="form-label" for="jobName">직무명</label>
							<input class="form-control" type="text" name="member.jobName" id="memJobName"/>
						</div>
						<hr class="my-5">
						<input class="btn btn-primary" type="button" value="등록" id="submitBtn" />
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	$(function(){
		var imgFile = $('#imgFile');			//	회사 로고 입력 Input
		var profileImg = $('#profileImg');		//	썸네일 이미지 태그
		var submitBtn = $('#submitBtn');		//	등록 버튼
		
		//	내용 입력칸 CKEDITOR 적용 및 이미지 업로드 기능 적용
		CKEDITOR.replace('coContent', {
			filebrowserUploadUrl : '${pageContext.request.contextPath}/imageUpload.do'
		});
		CKEDITOR.config.height = "450px";
		
		//	등록 버튼 클릭 이벤트
		submitBtn.on('click', function(){
			$('#companyFrm').submit();
		});		//	submitBtn onClick 이벤트 종료
		
		//	회사 로고 선택 이벤트(이미지 파일을 선택하여 등록, 변경 시 이벤트 발생)
		imgFile.on('change', function(event){
			var file = event.target.files[0];		//	내가 선택한 파일
			
			//	이미지 파일인지 검사
			if(isImageFile(file)){
				var reader = new FileReader();
				reader.onload = function(e){
					//	썸네일 이미지 태그에 src 경로로 result를 세팅
					//	이미지 파일의 데이터를 base64 인코딩 형태로 변형된 데이터로 src 경로에 설정
					profileImg.attr('src', e.target.result);
				}
				reader.readAsDataURL(file);
			} else {
				alert("파일의 형식이 맞지 않습니다.")
				imgFile.val("");
			}
		});		//	imgFile onChange 이벤트 종료
		
		
		//	시연 기능용 버튼
		$("#explainBtn").on('click', function(){
			var contentText = "<p>1956년, 대전역 앞 작은 찐빵집에서 시작된 성심당은 대전시민의 자부심과 사랑으로 성장하여 대전을 대표하는 향토기업이 되었습니다.</p>";
			contentText += "우리는 가톨릭 정신을 바탕으로 지역 사회에 봉사하는 가치 있는 기업이 되며, '맛있는 빵, 경이로운 빵, 생명의 빵' 을 통해 '사랑의 문화' 를 이루어 가겠습니다.";
			
			//	회사 정보 입력
			$("input[name=coName]").val("성심컴퍼니");					//	기업명 값 입력
			CKEDITOR.instances.coContent.setData(contentText);			//	기업 소개 내용 입력
			$("input[name=coUrl]").val("https://sungsimdang.co.kr/");	//	회사 URL 입력
			$("input[name=coEmployeeCount]").val("1250");				//	직원 수 입력
			$("input[name=coSales]").val("85000000000");				//	연간 매출액 입력 (850억)
			$("input[name=coCeoName]").val("임영진");					//	회사 대표명 입력
			$("input[name=coFndnYmd]").val("1956-10-15");				//	회사 창립일자 입력
			$("input[name=coFax]").val("0422572984")					//	FAX 번호 입력
			$("input[name=postcode]").val("34921")						//	우편번호 입력
			$("input[name=addressBasic]").val("대전광역시 중구 대종로 480번길 15")	//	기본 주소 입력
			$("input[name=addressDetail]").val("성심당 본점")						//	상세 주소 입력
			
			//	기업 대표자 계정 입력
			$("#memId").val("bread1956");				//	아이디 입력
			$("#memPw").val("java");						//	비밀번호 입력(되나?);
			$("#memName").val("류현진");					//	이름
			$("#memEmail").val("breadlover1956@sungsim.dang.kr");		//	이메일
			$("#memTelno").val("01048854885");				//	연락처
			$("#memJobName").val("빵 블랙홀");				//	직무명
			
		});		//	explainBtn onClick 이벤트 종료
	});		//	$(function()) 종료
	
	// 이미지 파일인지 체크
	function isImageFile(file){
		//	파일명에서 확장자 추출
		var ext = file.name.split(".").pop().toLowerCase();
		
		//	반환값으로 true 또는 false를 반환한다.
		return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
	}
	
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
				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("addressBasic").value = addr;
				
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("addressDetail").focus();
			}
		}).open();
	}
	</script>