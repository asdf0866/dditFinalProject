<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<c:set value="${pagingVO.dataList }" var="memberList"/>
<div class="containerBody">
	<div class="contentHeader">
		<span>일반 회원 목록</span>
	</div>
	<div class="contentBody">
		<div class="listHeader">
			<div class="listHeaderTitle col-2">순번</div>
			<div class="listHeaderTitle col-2">아이디</div>
			<div class="listHeaderTitle col-2">이름</div>
			<div class="listHeaderTitle col-2">생년월일</div>
			<div class="listHeaderTitle col-2">가입일자</div>
			<div class="listHeaderTitle col-2">&nbsp;</div>
		</div>
		<div class="listContentBox">
			<c:forEach items="${memberList }" var="member" varStatus="stat">
				<div class="listContent">
					<div class="listContentText col-2">${stat.count + (pagingVO.screenSize * (pagingVO.currentPage - 1)) }</div>
					<div class="listContentText col-2">${member.memId }</div>
					<div class="listContentText col-2">${member.name }</div>
					<div class="listContentText col-2">
						<fmt:parseDate value="${member.brdt }" var="brdt" pattern="yyyyMMdd"/>
						<fmt:formatDate value="${brdt }" pattern="yyyy-MM-dd"/>
					</div>
					<div class="listContentText col-2">
						<fmt:parseDate value="${member.joinYmd }" var="joinYmd" pattern="yyyyMMdd"/>
						<fmt:formatDate value="${joinYmd }" pattern="yyyy-MM-dd"/>
					</div>
					<div class="listContentText col-2">
						<button type="button" class="adminButton" idx="${member.memId }">상세보기</button>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="listFooter">
			${pagingVO.getPagingHtml() }
		</div>
		<form id="pageForm" action="" method="get">
			<input type="hidden" name="menu" value="memberManage">
			<input type="hidden" id="page" name="page" value="${pagingVO.currentPage }" />
		</form>
	</div>		<!-- contentBody 끝 -->
</div>

<div class="modal fade adminDetailModal" tabindex="-1" id="memberDetailModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="memTitle">회원의 정보</h5>
				<button type="button" class="btn-close modalCloseBtn"></button>
			</div>
			<div class="modal-body adminModalBody">
				<div class="col-12 mb-0">
					<table class="col-12 table table-bordered">
						<tr>
							<td class="col-6" rowspan="10" style="vertical-align:middle;text-align:center;">
								<img src="" width="350px" height="350px" id="memProfileImg">
							</td>
							<td class="col-2 modalNames">아이디</td>
							<td class="col-4" id="memId"></td>
						</tr>
						<tr>
							<td class="col-2 modalNames">비밀번호</td>
							<td class="col-4" id="memPassword">PROTECTED</td>
						</tr>
						<tr>
							<td class="col-2 modalNames">이름</td>
							<td class="col-4" id='memName'></td>
						</tr>
						<tr>
							<td class="col-2 modalNames">별명</td>
							<td class="col-4" id='memNickname'></td>
						</tr>
						<tr>
							<td class="col-2 modalNames">성별</td>
							<td class="col-4" id='memGender'></td>
						</tr>
						<tr>
							<td class="col-2 modalNames">연락처</td>
							<td class="col-4" id='memTelno'></td>
						</tr>
						<tr>
							<td class="col-2 modalNames">이메일</td>
							<td class="col-4" id='memEmail'></td>
						</tr>
						<tr>
							<td class="col-2 modalNames">생일</td>
							<td class="col-4" id='memBrdt'></td>
						</tr>
						<tr>
							<td class="col-2 modalNames">가입일자</td>
							<td class="col-4" id='memJoinYmd'></td>
						</tr>
						<tr>
							<td class="col-2 modalNames">계정상태</td>
							<td class="col-4" id="memStatCode"></td>
						</tr>
					</table>
				</div>
				<div class="col-12 d-flex">
					<div class="col-4 border modalNames">주소</div>
					<div class="col-8 border" id="memAddress">(우편번호) 기본 주소 상세 주소</div>
				</div>
			</div>
			<div class="modal-footer">
				<input type="hidden" id="memberId" value="">
				<button type="button" class="btn btn-secondary modalCloseBtn">닫기</button>
				<button type="button" class="btn btn-warning passwordResetBtn">비밀번호 초기화</button>
			</div>
		</div>
	</div>
</div>

	<script type="text/javascript">
	$(function(){
		
		//	상세보기 버튼 클릭 이벤트
		$('.adminButton').on('click', function(){
			//	클릭한 버튼으로부터 회원 아이디 값 가져오기
			var memId = $(this).attr('idx');
			
			$.ajax({
				url : "/jobel/memberDataGet.do",
				type : "post",
				beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
					xhr.setRequestHeader(header, token);
				},
				data : {
					memId : memId,
				},
				success : function(res){
					//	회원 정보 모달 창에 입력
					$('#memTitle').text(res.name + " 회원의 정보");
					
					$('#memId').text(res.memId);		//	출력되는 아이디
					$('#memberId').val(res.memId);		//	기능을 위한 hidden input의 value
// 					$('#memPassword').text(res.memPassword);
					$('#memName').text(res.name);
					
					var telno = res.telno + "";
					var formatTelno = telno.substring(0,3) + "-" + telno.substring(3,7) + "-" + telno.substring(7);
					$('#memTelno').text(formatTelno);
					
					$('#memEmail').text(res.email);
					
					var joinYmd = res.joinYmd + "";
					var formatJoinYmd = joinYmd.substring(0,4) + "-" + joinYmd.substring(4,6) + "-" + joinYmd.substring(6);
					$('#memJoinYmd').text(formatJoinYmd);
					var address = "(" + res.postcode + ") " + res.addressBasic + " " + res.addressDetail; 
					$('#memAddress').text(address);
					var brdt = res.brdt + "";
					var formatBrdt = brdt.substring(0,4) + "-" + brdt.substring(4,6) + "-" + brdt.substring(6);
					$('#memBrdt').text(formatBrdt);
					$('#memNickname').text(res.nickname);
					
					var gender = "남성";
					if(res.gender == "W"){
						gender = "여성";
					}
					$('#memGender').text(gender);
					
					var memStat = "일반 계정";
					if(res.memStatCode == 'MEMSTAT000'){
						memStat = "탈퇴 계정";
					}
					if(res.memStatCode == "MEMSTAT002"){
						memStat = "블랙리스트";
					}
					$('#memStatCode').text(memStat);
					
					var profilePhotoPath = res.profilePhotoPath;
					if(profilePhotoPath == null || profilePhotoPath == ""){
						profilePhotoPath = "/resources/images/default/default_profile.png";
					}
					var photoUrl = "${pageContext.request.contextPath }" + profilePhotoPath;
					$('#memProfileImg').attr('src', photoUrl);
					
					//	모달 창 열기
					$('#memberDetailModal').modal('show');
				}, error : function(xhr){
					alert("에러가 발생했습니다. 잠시 후 다시 시도해주세요.");
					console.log("에러 코드 : " + xhr.status);
				}
			});	//	$.ajax() 종료
		});		//	.adminButton onClick 이벤트 종료
		
		
		//	모달 닫기 버튼 클릭 이벤트
		$('.modalCloseBtn').on('click', function(){
			$('#memberDetailModal').modal('hide');
		});
		
		//	페이징 처리 이벤트
		$('.listFooter').on('click', 'a', function(event){
			event.preventDefault();					//	a 태그의 이벤트 제거
			var pageNo = $(this).data("page");		//	페이지 번호
			
			$('#pageForm').find('#page').val(pageNo);
			$('#pageForm').submit();
		});		//	pagingArea onClick 이벤트 종료
		
	});
	</script>