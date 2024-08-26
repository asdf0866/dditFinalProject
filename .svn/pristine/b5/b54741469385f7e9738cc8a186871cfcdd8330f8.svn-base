<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

	<div class="content w-100">
		<div class="header_top d-flex justify-content-end">
			<form action="/jobel/logout" method="post">
				<input type="submit" class="btn btn-sm btn-secondary mx-2" value="로그아웃" />
				<sec:csrfInput/>
			</form>
			<a href="/jobel/home" class="btn btn-sm btn-secondary">돌아가기</a>
		</div>

		<div class="subIndex">
			<div class="subContent">
				<div class="myProfile">
					<div class="infoTitle">
						<span class="titleText">기본정보</span>
					</div>
					
					<ul class="infoContent">
						<li>
							<div class="myPhoto">
								<img src="${pageContext.request.contextPath }${member.profilePhotoPath }">
							</div>
						</li>
						
						<li>
							<div class="myAccount">
								<div class="myName">
									<div class="nameText">${member.name }</div>
									<button type="button" class="content_item_btn edit_btn acctBtn" id="myNameBtn">실명 수정</button>
								</div>
								<div class="myEmail">${member.email }</div>
							</div>
						</li>
					</ul>	<!-- infoContent 종료 -->
					
					<ul class="subContentRow">
						<li>
							<div class="rowItem">
								<i class="bx bx-phone"></i>
								<span class="rowItemText">
									<c:set value="${member.telno }" var="myTelno" />
									${myTelno.substring(0,3) }-${myTelno.substring(3,7) }-${myTelno.substring(7) }
								</span>
								<button type="button" class="content_item_btn edit_btn acctBtn" id="myTelnoBtn">수정</button>
							</div>
						</li>
						<li>
							<div class="rowItem">
								<i class="bx bx-envelope"></i>
								<span class="rowItemText">${member.email }</span>
								<button type="button" class="content_item_btn edit_btn acctBtn" id="myEmailBtn">수정</button>
							</div>
						</li>
						<li>
							<div class="rowItem">
								<i class="bx bx-cake"></i>
								<span class="rowItemText">
									<c:set var="myBrdt" value="${member.brdt }" />
									<fmt:parseDate value="${myBrdt }" pattern="yyyyMMdd" var="fmtBrdt"/>
									<fmt:formatDate value="${fmtBrdt }" pattern="yyyy-MM-dd"/>
								</span>
								<button type="button" class="content_item_btn edit_btn acctBtn" id="myBrdtBtn">수정</button>
							</div>
						</li>
						<li>
							<div class="rowItem">
								<i class="bx bx-home"></i>
								<span class="rowItemText">(${member.postcode }) ${member.addressBasic } ${member.addressDetail }</span>
								<button type="button" class="content_item_btn edit_btn acctBtn" id="myAddrBtn">수정</button>
							</div>
						</li>
					</ul>
				</div>	<!-- myProfile 종료 -->
			</div>	<!-- subContent 종료(회원정보 변경) -->
			
			<div class="subContent">
				<div class="myProfile">
					<div class="infoTitle">
						<span class="titleText">비밀번호 변경</span>
					</div>
					<form id="editPwFrm">
						<ul class="subContentRow">
							<li>
								<div class="rowItem">
									<label class="form-label rowLabel">현재 비밀번호</label>
									<input type="password" class="form-control" id="myPassword">
								</div>
							</li>
							<li>
								<div class="rowItem">
									<label class="">새 비밀번호</label>
									<input type="password" class="form-control" id="changePassword">
								</div>
							</li>
							<li>
								<div class="rowItem">
									<label class="">새 비밀번호 확인</label>
									<input type="password" class="form-control" id="checkPassword">
									<div class="invalid-feedback checkPwDiv">
										비밀번호가 일치하지 않습니다.
									</div>
								</div>
							</li>
							<li>
								<div class="rowItem passwordBtn">
									<button type="button" class="content_item_btn edit_btn" id="pwBtn">변경</button>
								</div>
							</li>
						</ul>
					</form>
				</div>	<!-- subContent 종료(비밀번호 변경) -->
			</div>
		</div>	<!-- subIndex 종료 -->
	</div>	<!-- content 종료 -->
	
	<!-- Modal -->
	<div class="modal fade" id="profileModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">회원 정보 수정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<form id="editAccountFrm" method="post">
					<input type="hidden" name="memId" value="${member.memId }" id="myMemId"/>
					<div class="modal-body" id="modalNormal">
						<label class="form-label" id="profileModalLabel">변경할 것</label>
						<input type="text" class="form-control" id="profileModalInput"/>
					</div>
					<div class="modal-body" id="modalAddr">
						<div class="d-flex text-center align-items-center">
							<label for="modalPostcode" class="form-label col-2">우편번호</label>
							<div class="input-group">
								<input type="text" class="form-control" value="${member.postcode }" name="postcode" id="modalPostcode" disabled="disabled" />
								<button type="button" class="btn btn-primary">검색</button>
							</div>
						</div>
						<div class="d-flex text-center align-items-center">
							<label for="modalAddrBasic" class="form-label col-2">기본 주소</label>
							<input type="text" class="form-control" value="${member.addressBasic }" name="addressBasic" id="modalAddrBasic"  disabled="disabled"/>
						</div>
						<div class="d-flex text-center align-items-center">
							<label for="modalAddrDetail" class="form-label col-2">상세 주소</label>
							<input type="text" class="form-control" value="${member.addressDetail }" name="addressDetail" id="modalAddrDetail" disabled="disabled"/>
						</div>
					</div>
					<input type="hidden" name="modalTrigger" id="modalTrigger" value="N"/>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="editAcctBtn">변경사항 저장</button>
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>	<!-- Modal 종료 -->
	
	<script type="text/javascript">
		$(function(){
			var profileModal = $('#profileModal');		//	회원 정보 수정 모달 창
			var editAcctBtn = $('#editAcctBtn');		//	모달 창 변경사항 저장 버튼
			var isChangeAddress = false;				//	주소 변경 여부를 위한 boolean
			var isCheckPassword = false;				//	비밀번호 변경을 위한 boolean
			
			var myPassword = $('#myPassword');			//	현재 비밀번호 입력 INPUT
			var changePassword = $('#changePassword');	//	새 비밀번호 입력 INPUT
			var checkPassword = $('#checkPassword');	//	새 비밀번호 확인 입력 INPUT
			var pwBtn = $('#pwBtn');					//	패스워드 변경 버튼
			
			
			//	회원 정보 수정 모달 창의 내용 중 주소 변경은 처음에 hide 상태로 둔다.
			$('#modalAddr').hide();
			
			
			//	회원 정보 수정 모달 창 여는 이벤트
			$('.acctBtn').on('click', function(){
				var clickThis = $(this).attr('id');
				
				//	주소 변경을 클릭했다가 취소 후 다른 것을 변경하려고 할 때
				if(clickThis != 'myAddrBtn' && isChangeAddress){
					//	주소 변경 모달을 비활성화
					isChangeAddress = false;
					
					//	모달창 크기 복구
					$('#profileModal').find('.modal-dialog').removeClass("modal-lg");
					
					//	기존의 input 태그는 활성화
					$("#profileModalInput").attr('disabled', false);
					$("#modalNormal").show();
					
					//	사용할 주소 모달내용을 비활성화
					$("#modalAddr").hide();
					$("#modalPostcode").attr('disabled', true);
					$("#modalAddrBasic").attr('disabled', true);
					$("#modalAddrDetail").attr('disabled', true);
					$('#modalTrigger').val('N');
				}
				
				//	실명 변경을 클릭했을 경우
				if(clickThis == 'myNameBtn'){
					$("#profileModalLabel").html("변경할 이름");
					$("#profileModalInput").attr('type', 'text');
					$("#profileModalInput").attr('name', 'name');
					$("#profileModalInput").attr('value', '${member.name}');
				}
				
				//	전화번호 수정을 클릭했을 경우
				if(clickThis == "myTelnoBtn"){
					$("#profileModalLabel").html("변경할 연락처");
					$("#profileModalInput").attr('type', 'text');
					$("#profileModalInput").attr('name', 'telno');
					$("#profileModalInput").attr('value', '${member.telno}');
				}
				
				//	이메일 수정을 클릭했을 경우
				if(clickThis == "myEmailBtn"){
					$("#profileModalLabel").html("변경할 이메일");
					$("#profileModalInput").attr('type', 'text');
					$("#profileModalInput").attr('name', 'email');
					$("#profileModalInput").attr('value', '${member.email}');
				}
				
				//	생일 수정을 클릭했을 경우
				if(clickThis == "myBrdtBtn"){
					$("#profileModalLabel").html("변경할 생일");
					$("#profileModalInput").attr('type', 'date');
					$("#profileModalInput").attr('name', 'brdt');
					$("#profileModalInput").attr('value', '<fmt:formatDate value="${fmtBrdt }" pattern="yyyy-MM-dd"/>');
				}
				
				//	주소 변경을 클릭했을 경우
				if(clickThis == "myAddrBtn") {
					//	주소 변경했다는 신호를 적용
					isChangeAddress = true;
					
					//	모달 창의 크기를 키움
					$('#profileModal').find('.modal-dialog').addClass("modal-lg");
					
					//	기존의 input 태그는 비활성화
					$("#profileModalInput").attr('disabled', true);
					$("#modalNormal").css('display', 'none');
					
					//	사용할 주소 모달내용을 활성화
					$("#modalAddr").css('display', 'block');
					$("#modalPostcode").attr('disabled', false);
					$("#modalAddrBasic").attr('disabled', false);
					$("#modalAddrDetail").attr('disabled', false);
					$('#modalTrigger').val('Y');
				}
				
				profileModal.modal("show");
			});		//	회원 정보 수정 버튼 onClick 이벤트 종료
			
			
			//	새 비밀번호 일치 여부 확인
			checkPassword.on('keyup', function(){
				var newPw = $('#changePassword').val();
				var checkPw = $('#checkPassword').val();
				
				if(newPw == checkPw){
					checkPassword.removeClass('is-invalid');
					isCheckPassword = true;
				}
				
				if(newPw != checkPw){
					checkPassword.addClass('is-invalid');
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
				
				var memId = $('#myMemId').val();
				var myPw = $('#myPassword').val();
				var newPw = $('#changePassword').val();
				
				//	현재 비밀번호 일치 여부 확인
				if(!checkPw(memId, myPw)){
					alert("현재 비밀번호가 일치하지 않습니다.");
					$('#myPassword').focus();
					return false;
				}
				
				//	신규 비밀번호 일치 여부 확인(똑같은 비밀번호로 변경할 수 없음)
				if(checkPw(memId, newPw)){
					alert("이미 사용 중인 비밀번호는 사용할 수 없습니다.");
					$('#changePassword').focus();
					return false;
				}
				
				//	비밀번호 변경
				changePw(memId, newPw);
				
			});		//	pwBtn onClick 이벤트 종료
			
			
			//	모달 창 변경사항 저장 클릭 이벤트
			editAcctBtn.on('click', function(){
				
				//	주소 변경 시 입력 값 유효성 검사
				if(isChangeAddress){
					var postcode = $('#modalPostcode').val();
					var addrBasic = $('#modalAddrBasic').val();
					var addrDetail = $('#modalAddrDetail').val();
					
					if(postcode == null || postcode == ""){
						alert('우편 주소는 비어있을 수 없습니다.');
						$('#modalPostcode').focus();
						return false;
					}
					if(addrBasic == null || addrBasic == ""){
						alert('기본 주소는 비어있을 수 없습니다.');
						$('#modalAddrBasic').focus();
						return false;
					}
					if(addrDetail == null || addrDetail == ""){
						alert('상세 주소는 비어있을 수 없습니다.');
						$('#modalAddrDetail').focus();
						return false;
					}
				} else {		//	회원정보 변경 시 유효성 검사
					var inputValue = $('#profileModalInput').val();
					if(inputValue == null || inputValue == ""){
						alert("변경할 값이 비어있을 수 없습니다.");
						$('#profileModalInput').focus();
						return false;
					}
				}		//	유효성 검사(입력 값 공백 여부) 종료
				
				//	모달 창의 formData를 json화
				var formData = $('#editAccountFrm').serialize();
				
				//	회원 정보 변경
				$.ajax({
					url : "/jobel/changeAccount",
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
				});
				
			});		//	editAcctBtn onClick 이벤트 종료
			
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
			}		//	function changPw 종료
			
		});		//	$(function()) 종료
	</script>