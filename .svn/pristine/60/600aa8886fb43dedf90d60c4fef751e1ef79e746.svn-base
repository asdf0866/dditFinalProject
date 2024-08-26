<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
	<div class="register">
		<div class="register__content">
			<div class="register__img">
				<img src="https://image.freepik.com/free-vector/code-typing-concept-illustration_114360-3581.jpg" alt="user login">
			</div>
			
			<div class="register__forms">
			<!-- create account form -->
		
				<form action="/jobel/register" class="login__create" id="register-up" method="post" enctype="multipart/form-data">
					<h1 class="register__title">회원가입</h1>
					<div>
						<div class="login__box d-flex flex-column justify-content-center">
							<img src="${pageContext.request.contextPath }/resources/images/default/default_profile.png" 
								class="d-block rounded-circle mx-auto mb-3 border" style="width:320px; height:320px;" id="profileImg">
								<label for="profilePhoto" class="btn btn-success postbtn">프로필 사진 등록하기</label>
								<input type="file" name="profilePhoto" id="profilePhoto" style="display:none;">
						</div>
						<div class="login__box input-group mb-3 postbox">
							<i class='bx bx-user login__icon'></i>
							<input type="text" placeholder="아이디" class="login__input" name="memId" id="memId">
							<button type="button" class="btn btn-success postbtn col-sm-4" id="idCheckBtn">중복 확인</button>
						</div>
						<span class="form-text" id="idError"></span>
						<div class="login__box">
							<i class='bx bx-lock login__icon'></i>
							<input type="password" placeholder="비밀번호" class="login__input" name="memPassword" id="memPassword">
						</div>
						<div class="login__box">
							<i class='bx bx-at login__icon'></i>
							<input type="text" placeholder="이메일" class="login__input" name="email" id="email">
						</div>
						<div class="login__box">
							<i class='bx bx-user-pin login__icon'></i>
							<input type="text" placeholder="이름" class="login__input" name="name" id="name">
						</div>
						<div class="login__box">
							<i class='bx bx-id-card login__icon'></i>
							<input type="text" placeholder="별명" class="login__input" name="nickname" id="nickname">
						</div>
						<div class="login__box radioDiv">
							<div>
								<i class="bx bx-male login__icon man"></i>
								<label for="genderM"><b>남자</b></label>
								<input type="radio" id="genderM" name="gender" value="M" checked/>
							</div>
							<div>
								<i class="bx bx-female login__icon woman"></i>
								<label for="genderW"><b>여자</b></label>
								<input type="radio" id="genderW" name="gender" value="W"/>
							</div>
						</div>
						<div class="login__box">
							<i class='bx bx-cake login__icon'></i>
							<input type="date" placeholder="생년월일(8자리)" class="login__input" name="brdt" id="brdt">
						</div>
						<div class="login__box">
							<i class='bx bx-phone-call login__icon'></i>
							<input type="text" placeholder="휴대전화번호" class="login__input" name="telno" id="telno">
						</div>
						<div class="login__box input-group mb-3 postbox">
							<i class='bx bx-envelope login__icon'></i>
							<input type="text" class="login__input form-control" placeholder="우편번호" name="postcode" id="postcode">
							<button type="button" class="btn btn-success postbtn col-sm-4" onclick="DaumPostcode()">우편번호 찾기</button>
						</div>
						<div class="login__box">
							<i class='bx bx-home-smile login__icon'></i>
							<input type="text" class="login__input" placeholder="기본주소" name="addressBasic" id="addressBasic"/>
						</div>
						<div class="login__box">
							<i class='bx bxs-home-smile login__icon'></i>
							<input type="text" class="login__input" placeholder="상세주소" name="addressDetail" id="addressDetail"/>
						</div>
						<div class="login__box radioDiv">
							<div>
								<i class="bx bx-male login__icon"></i>
								<label for="marryN"><b>미혼</b></label>
								<input type="radio" id="marryN" name="marriageYn" value="N" checked/>
							</div>
							<div>
								<i class="bx bx-male-female login__icon"></i>
								<label for="marryY"><b>기혼</b></label>
								<input type="radio" id="marryY" name="marriageYn" value="Y"/>
							</div>
						</div>
					</div>
					<a href="#" class="login__button" id="submitBtn">가입하기</a>
					<button type="button" class="login__button" id="explainBtn" style="width: 100%; height: 50px; border: none;">데이터 입력</button>
					<div>
						<span class="login__account login__account--account">이미 계정이 있으신가요?</span>
						<a class="login__signup login__signup--signup" id="sign-in" href="/jobel/login">로그인하기</a>
					</div>
					<sec:csrfInput/>
				</form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(function(){
			var idCheck = false;
			var idCheckBtn = $('#idCheckBtn');			//	아이디 중복 확인 버튼
			var submitBtn = $('#submitBtn');			//	가입하기 버튼
			
			//	중복확인 버튼 클릭 이벤트
			idCheckBtn.on('click', function(){
				
				var memId = $('#memId').val();
				
				if(memId == null || memId == ""){
					var code = "<font style='color:red;'>아이디를 입력해주세요.</font>";
					$('#idError').html(code);
					return false;
				}
				$.ajax({
					url : "/jobel/idCheck",
					type : "post",
					beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
						xhr.setRequestHeader(header, token);
					},
					data : {
						memId : memId
					},
					success : function(res){
						var result = "";
						if(res > 0) {
							result = "<font style='color:red;'>아이디가 중복됩니다. 다른 아이디를 입력해주세요.</font>";
							idCheck = false;
						} else {
							result = "<font style='color:blue;'>사용 가능한 아이디입니다.</font>";
							idCheck = true;
						}
						$('#idError').html(result);
					},
					error : function(xhr){
						alert("중복 확인 중 에러가 발생했습니다. 잠시 후 다시 실행해주세요.")
						console.log("에러 코드 : " + xhr.status);
					}
					
				});
				idCheck = true;
			});
			
			//	가입하기 버튼 클릭 이벤트
			submitBtn.on('click', function(){
				var memId = $("#memId").val();
				var memPassword = $("#memPassword").val();
				var name = $("#name").val();
				var email = $("#email").val();
				var nickname = $("#nickname").val();
				var brdt = $("#brdt").val();
				var telno= $("#telno").val();
				var addressDetail = $("#addressDetail").val();
				var postcode = $("#postcode").val();
				
				var id = document.getElementById("memId").value;
				var regex = /^[a-zA-Z0-9]{3,20}$/;
				
				var password = document.getElementById("memPassword").value;
				var regex2 = /^[a-zA-Z0-9]{4,20}$/;
				
				var name =  document.getElementById("name").value;
				var regex3 = /^[가-힣]$/;
				
				var errorMessage = document.getElementById("error-message");
				
// 				if(memId == null || memId== ""){
// 					alert("아이디를 입력해주세요");
// 					return false;
// 				}
				
// 				if(memPassword == null || memPassword == ""){
// 					alert("비밀번호를 입력해주세요");
// 					return false;
// 				}
				
// 				if (!regex2.test(password)) {
// 	                alert("비밀번호는 영소대문자와 숫자만 입력 가능하며, 최소 4글자에서 최대 20글자까지 가능합니다.");
// 	                return false;
// 	            }
				
// 				if(email == null || email == ""){
// 					alert("이메일을 입력해주세요");
// 					return false;
// 				}
				
// 				if(name == null || name == ""){
// 					alert("이름을 입력해주세요");
// 					return false;
// 				}
				
// 				if (!regex3.test(name)) {
// 	                alert("이름은 한글만 입력 가능합니다.");
// 	                return false;
// 	            }
				
// 				if(nickname == null || nickname == ""){
// 					alert("별명을 입력해주세요");
// 					return false;
// 				}
				
// 				if( brdt == null ||  brdt == ""){
// 					alert("생년월일을 입력해주세요");
// 					return false;
// 				}
				
// 				if( telno == null || telno == ""){
// 					alert("번호를 입력해주세요");
// 					return false;
// 				}
				
// 				if(postcode == null || postcode == ""){
// 					alert("우편번호를 입력해주세요");
// 					return false;
// 				}
				
// 				if( addressDetail == null || addressDetail == ""){
// 					alert("상세주소를 입력해주세요");
// 					return false;
// 				}
				
				if(!idCheck){
					alert("아이디 중복 검사를 해주세요.");
					return false;
				}
				
				$('#register-up').submit();
			});
			
			//	프로필 사진 이벤트들
			var imgFile = $('#profilePhoto');			//	회사 로고 입력 Input
			var profileImg = $('#profileImg');		//	썸네일 이미지 태그
			
			//	프로필 사진 선택 이벤트(이미지 파일을 선택하여 등록, 변경 시 이벤트 발생)
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
			
			
			//	데이터 입력 버튼 클릭 이벤트
			$('#explainBtn').on('click', function(){
				$('#memId').val("jobjob01");						//	아이디 입력
				$('#memPassword').val("java");						//	비밀번호 입력
				$('#email').val("iwannajob@please.choose.me");		//	이메일 입력
				$('#name').val("구직자");							//	이름 입력
				$('#nickname').val("각설이");						//	별명 입력
				$('#genderM').prop("checked", true);				//	남성 선택
				$('#genderW').prop("checked", false);				//	여성 취소
				$('#brdt').val("1997-09-07");						//	생일 입력
				$('#telno').val("01050004949");						//	연락처 입력
				$('#postcode').val("34908");						//	우편번호 입력
				$('#addressBasic').val("대전 중구 계룡로 846");		//	기본 주소 입력
				$('#addressDetail').val("3 ~ 4층");					//	상세 주소 입력
				//	결혼여부는 굳이 건드리지 않음
			});
		});		//	$(function()) 종료
		
		// 이미지 파일인지 체크
		function isImageFile(file){
			//	파일명에서 확장자 추출
			var ext = file.name.split(".").pop().toLowerCase();
			
			//	반환값으로 true 또는 false를 반환한다.
			return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
		}
		function DaumPostcode() {
		      new daum.Postcode({
		         oncomplete : function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		            var addr = ''; // 주소 변수
		            var extraAddr = ''; // 참고항목 변수

		            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		               addr = data.roadAddress;
		            } else { // 사용자가 지번 주소를 선택했을 경우(J)
		               addr = data.jibunAddress;
		            }

		            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		            if (data.userSelectedType === 'R') {
		               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		               if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
		                  extraAddr += data.bname;
		               }
		               // 건물명이 있고, 공동주택일 경우 추가한다.
		               if (data.buildingName !== '' && data.apartment === 'Y') {
		                  extraAddr += (extraAddr !== '' ? ', '
		                        + data.buildingName : data.buildingName);
		               }

		            }
		            // 우편번호와 주소 정보를 해당 필드에 넣는다.
		            document.getElementById('postcode').value = data.zonecode;
		            document.getElementById("addressBasic").value = addr;
		            // 커서를 상세주소 필드로 이동한다.
		            document.getElementById("addressDetail").focus();
		         }
		      }).open();
		   }
	</script>
		