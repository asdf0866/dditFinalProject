<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

	<header class="header">
		<div class="header_home">
			<!-- 로고 / MyPage -->
			<div class="gnb_area">
				<a href="/jobel/home" class="icon-link">
					<span>
						<img class="myPageLogo" src="/resources/images/JOB을래_LOGO.png">
					</span>
				</a>
				<a href="/jobel/myPage" class="icon-link" style="text-decoration: none; color:black">
					<span class="m-0 fw-bold fs-4">
						<!-- 임시로 글자로만 적어둠 / 로고가 생겼으면 좋겠습니다. -->
						마이 페이지
					</span>
				</a>
			</div>	<!-- 로고 / MyPage 끝 -->
			
			<!-- 프로필 영역 -->
			<div class="profile_area">
				<div class="profile_thumbnail">
					<!-- 자신이 등록한 프로필 사진 -->
					<a class="photoLink" onclick="showPhotoModal()">
						<img src="${pageContext.request.contextPath }${member.profilePhotoPath}" class="img-thumbnail rounded-circle profilePhoto" >
						<span class="photoEdit"><i class='bx bx-pencil'></i></span>
					</a>
				</div>
				<div class="profile">
					<p class="userNickname">${member.nickname }</p>
					<p class="userId">${member.memId }</p>
					<p class="userEmail">${member.email }</p>
				</div>
			</div>	<!-- 프로필 영역 끝 -->
			
			<!-- 마이 페이지 좌측 메뉴 -->
			<div id="headerLeft" class="header_left" aria-hidden="false">
			
				<!-- 메뉴들 -->
				<ul class="left_menu list-group" role="menu">
					<li>
						<span class="list-group-item left_menu_title">내 계정 관리</span>
					</li>
					<li>
						<a href="/jobel/myPage?menu=viewProfile" id="viewProfile" class="list-group-item">내 프로필</a>
					</li>
					<li>
						<a href="/jobel/myPage?menu=viewResume" id="viewResume" class="list-group-item">내 이력서</a>
					</li>
					<li>
						<a href="/jobel/myPage?menu=interest" id="interest" class="list-group-item">관심 등록</a>
					</li>
					<li>
						<a href="/jobel/myPage?menu=application&currentPage=1" id="application" class="list-group-item">채용 관리</a>
					</li>
				</ul>
				
				<hr class="my-3"/>
				
				<ul class="left_sub_menu list-group">
					<li>
						<span class="list-group-item left_menu_title">게시글 관리</span>
					</li>
					<li>
						<a href="/jobel/myPage?menu=myQna&currentPage=1" class="list-group-item">1:1 문의</a>
					</li>
					<li>
						<a href="/jobel/myPage?menu=myConsulting&currentPage=1" class="list-group-item">취업 상담</a>
					</li>
				</ul>
			</div>	<!-- 마이 페이지 좌측 메뉴 끝 -->
			
			<hr class="my-3" />
			
			<!-- 네이버 스타일이 마음에 들어서 따라해보기 위한 테스트 -->
			<!-- Footer -->
			<div class="left_footer">
				<ul class="left_guide">
					<li class="footer_item">
						<form action="/jobel/logout" method="post">
							<label for="logoutFooter" style="cursor: pointer;">로그아웃</label>
							<input type="submit" class="btn btn-sm btn-secondary mx-2" style="display: none;" id="logoutFooter"/>
							<sec:csrfInput/>
						</form>
					</li>
					<li class="footer_item">
						<a href="/jobel/faq" style="text-decoration: none; color: black;">고객센터</a>
					</li>
				</ul>
			</div>
		</div>	<!-- Header Home 끝 -->
		<c:if test="${menu != null }">
			<c:set value="${menu }" var="selectMenu"></c:set>
		</c:if>
	</header>
	
	<!-- Modal -->
	<div class="modal fade" id="photoModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">프로필 수정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<input type="hidden" name="memId" value="${member.memId }" />
						<table class="table table-bordered text-center align-middle">
							<tr>
								<td class="table_desc">프로필 사진</td>
								<td>
									<div class="tablePhoto">
										<img src="${pageContext.request.contextPath }${member.profilePhotoPath}" class="img-thumbnail rounded-circle" style="width:150px;height:150px;" id="modalProfilePhoto">
									</div>
									<div class="tableBtns">
										<input type="file" id="modalImgFile" name="imgFile" style="display:none;">
										<label for="modalImgFile" class="btn">사진 변경</label>
										<button class="btn">사진 삭제</button>
									</div>
								</td>
							</tr>
							<tr>
								<td class="table_desc">별명</td>
								<td>
									<input type="text" value="${member.nickname }" name="nickname" class="form-control"/>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="photoModalBtn">변경사항 저장</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>	<!-- Modal 종료 -->
	<script type="text/javascript">
		$(function(){
			//	메뉴를 선택했다면 해당 메뉴를 강조시키는 함수
			if('${selectMenu}' != null && '${selectMenu}' != ""){
				var menuId = '#' + '${selectMenu}';
				$(menuId).addClass('selected');
			}
				
			var imgFile = $("#modalImgFile");						//	이미지 파일 담을 input
			var modalProfilePhoto = $("#modalProfilePhoto");		//	이미지 변경 모달의 프로필 사진
			var changeImage = false;
			
			//	사진 변경 클릭 이벤트
			imgFile.on('change', function(){
				var file = event.target.files[0];		//	내가 선택한 파일
				
				//	이미지 파일인지 검사
				if(isImageFile(file)){
					var reader = new FileReader();
					reader.onload = function(e){
						//	썸네일 이미지 태그에 src 경로로 result를 세팅
						//	이미지 파일의 데이터를 base64 인코딩 형태로 변형된 데이터로 src 경로에 설정
						modalProfilePhoto.attr('src', e.target.result);
					}
					reader.readAsDataURL(file);
					changeImage = true;
				} else {
					alert("파일의 형식이 맞지 않습니다.")
					imgFile.val("");
					changeImage = false;
				}
			});		//	imgFile onChange 이벤트 종료
			
			//	프로필 사진모달 변경사항 저장 클릭 이벤트
			$('#photoModalBtn').on('click', function(){
				
				var formData = new FormData();
				
				//	변경할 별명 저장
				var nickname = $('input[name=nickname]').val();
				if(nickname == null || nickname == ""){		//	별명란이 비어있을 경우
					alert("별명란을 입력해주세요.");
					$('input[name=nickname]').focus();
					return false;
				} else {
					formData.append("nickname", nickname);
				}
				
				if(changeImage){		//	사진을 변경했다면
					var photoImg = $('#modalImgFile')[0].files[0];
					formData.append("profilePhoto", photoImg);
				}
				
				//	회원 아이디 정보도 같이 보내줌
				var memId = '${member.memId}';
				formData.append("memId", memId);
				
				$.ajax({
					url : "/jobel/changeProfile",
					type : "post",
					beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
						xhr.setRequestHeader(header, token);
					},
					data : formData,
					contentType : false,
					processData: false,
					success : function(res){
						if(res == "SUCCESS"){
							alert("변경사항이 저장되었습니다.");
							location.reload();
						}
					},
					error : function(xhr){
						console.log("에러 코드 : " + xhr.status);
						alert("에러가 발생했습니다. 잠시 후 다시 시도해주세요.");
					}
				});		//	$.ajax() 종료
			});		//	photoModalBtn onClick 이벤트 종료
		});		//	$(function()) 종료
		
		// 이미지 파일인지 체크
		function isImageFile(file){
			//	파일명에서 확장자 추출
			var ext = file.name.split(".").pop().toLowerCase();
			
			//	반환값으로 true 또는 false를 반환한다.
			return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
		}
		
		//	프로필 수정 모달 창을 여는 함수
		function showPhotoModal(){
			$('#photoModal').modal('show');
		}
	</script>