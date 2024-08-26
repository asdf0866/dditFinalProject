<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<sec:authorize access="isAnonymous()">
	<c:set var="loginYn" value="N"/>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
	<c:set var="loginYn" value="Y"/>
	<sec:authentication property="principal.member" var="member"/>
	<sec:authentication property="principal.member.memId" var="memId"/>
</sec:authorize>

<style>

.comImg{
	width:100px;
}

body{
	background-color:#eeeeee;
}

#backImg{
	position: absolute; 
	width: 1950px; 
	height: 180px; 
	z-index: -1;
	left: 0px;
	right: 0px;
	top: 75px;
}

.like{
	background: green; 
	color: white;
}

.unlike{
	background: white; 
	color: black;
}

.reviewDiv {
	min-height: 480px;
	background: white;
	border-radius: 5px;
	overflow-y: auto; 
}
.pageArea {
	display : flex;
	align-items : center;
	justify-content : flex-end;
	height: 50px;
	margin : 5px 0;
}
.reviewList {
	width: 100%;
	background-color: #ccc;
	border-radius: 5px;
}

.card-score {
	display: flex;
	flex-direction: column;
	border-right: 1px solid #ccc;
}

.card-score > div {
	border-bottom: 1px solid #ccc;
	text-align: center;
}

.scoreText {
	font-size: 20px;
	font-weight: 600;
}

.reviewHeader {
	display: flex;
}

.reviewHeader > p {
	text-align: center;
	font-size: 24px;
	font-weight: 600;
}

.reviewHeader > p:nth-child(3) {
	text-align: left;
}
.reviewHeader > p:last-child {
	display: flex;
	align-items: center;
	justify-content: flex-end;
}

.card-review-text * {
	font-size : 18px;
	font-weight: 600;
}

.review-text-ctrgy {
	min-height: 100px;
	padding-left: 20px;
}

.review-text-ctrgy:first-child {
	padding-top: 20px;
}

.review-text-ctrgy > p:first-child {
	font-size : 20px;
}

.revLike.on {
  	animation: beating .5s 1 alternate;
}

@keyframes beating {
	0% {transform: scale(1);}
	40% {transform: scale(1.25);}
	70% {transform: scale(0.9);}
	100% {transform: scale(1);}
}

</style>


<div class="container-xxl py-5" style="margin-top:0;margin-bottom:0;padding-top:0;padding-bottom:0; " id="searchDiv">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-12" style="margin-bottom:50px;">
				<img id="backImg" src="${pageContext.request.contextPath }/resources/images/기업상세보기배너.png">
				<div class="row">
					<div class="card-header">
						<img class="comImg" src="${pageContext.request.contextPath }${comVO.coLogoPath }" style="display:inline; border-radius: 10%; margin-right:15px; float:left;">
						<div style="padding: 20px 0 0 0; width:500px;">
							<h3 style="display:inline; color:white;">${comVO.coName }</h3> <br>
							<h6 style="margin:0 0 0 0; color:white;">${comVO.coJobTypeName }</h6>
						</div>
						<div style="display: inline-block; width: 200px; float:right;">
							<c:if test="${loginYn eq 'Y' }">
								<c:if test="${isLike > 0 }">
									<button type="button" data-coNo="${comVO.coNo }" id="likeComBtn" class="btn like">즐겨찾기</button>
								</c:if>
								<c:if test="${isLike eq 0 }">
									<button type="button" data-coNo="${comVO.coNo }" id="likeComBtn" class="btn unlike">즐겨찾기</button>
								</c:if>
							</c:if>							
							<c:if test="${loginYn eq 'N' }">
								<button type="button" data-coNo="${comVO.coNo }" id="likeComBtn" class="btn unlike">즐겨찾기</button>
							</c:if>							
						</div>
					</div>
				</div>
			</div>		<!-- 제목 등 상단 메뉴 끝 -->
			
			<div class="col-lg-12">
				<div class="row">
					<div class="col-md-8" style="padding: 20px;">
						<div class="card" style="height:470px;">
							<h5 class="card-header" style="text-weight:bold;">기업 소개</h5>
							<div class="card-body">${comVO.coContent }</div>
						</div>
					</div>
					<div class="col-md-4" style="padding: 20px;">
						<div class="card" style="height:470px;">
							<h5 class="card-header" style="text-weight:bold;">기업 정보</h5>
							<div class="card-body">
								<div class="col-sm-12">직군&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : ${comVO.coJobTypeName }</div>
								<br>
								<div class="col-sm-12">매출액&nbsp;&nbsp;&nbsp;  : <fmt:formatNumber type="number" maxFractionDigits="3" value="${comVO.coSales * 1000000 }" />원</div>
								<br>
								<div class="col-sm-12">홈페이지 : <a href='${comVO.coUrl }' target="_blank" style="text-decoration-line: none;">${comVO.coUrl }</a></div>
								<br>
								<div class="col-sm-12">
								<div class="col-lg-9 col-md-8">팩스번호 : 
									<c:if test="${comVO.coFax.length() == 10 }">
										${comVO.coFax.substring(0,2) }-${comVO.coFax.substring(3,7) }-${comVO.coFax.substring(7) } 
									</c:if>
									<c:if test="${comVO.coFax.length() == 11 }">
										${comVO.coFax.substring(0,3) }-${comVO.coFax.substring(3,7) }-${comVO.coFax.substring(7) } 
									</c:if>
									${fmtFax }
								</div>
								</div>
								<br>
								<div class="col-sm-12">직원수&nbsp;&nbsp;&nbsp; : ${comVO.coEmployeeCount}명</div>
								<br>
								<div class="col-sm-12">대표명&nbsp;&nbsp;&nbsp; : ${comVO.coCeoName}</div>
								<br>
								<div class="col-sm-12"> 
								<div class="col-lg-9 col-md-8">창립일&nbsp;&nbsp;&nbsp; : 
									<c:set var="fndnYmd" value="${comVO.coFndnYmd }"/>
									<fmt:parseDate value="${fndnYmd }" pattern="yyyyMMdd" var="fmtFndnYmd"/>
									<fmt:formatDate value="${fmtFndnYmd }" pattern="yyyy년 MM월 dd일"/>
								</div>
								</div>
							</div>
						</div>
					</div>
					<p style="font-weight:bold; text-align: center;">기업 주소</p>
					<div class="col-md-12" style=" padding:20px;">
						<div id="mapDiv" style="width:100%; height:300px; display:none;"></div>
					</div>
					<p style="font-weight:bold; text-align: center;">[${comVO.postcode}] ${comVO.addressBasic} ${comVO.addressDetail}</p>
				</div>
			</div>		<!-- 내용 끝 -->
		</div>		<!-- 전체 출력 끝 -->
		
		<!-- 리뷰 출력 목록 -->
		<div class="col-12 mt-5 reviewDiv d-flex row">
			<div class="col-12 pageArea">
				<div class="pageItem">
					${pagingVO.pagingHtml }
				</div>
			</div>
			<div class="reviewList">
				<div class="review">
					<div class="card d-flex">
						<div class="card-header col-12 reviewHeader">
							<p class="col-2">작성자</p>
							<p class="col-2">재직여부</p>
							<p class="col-4">리뷰 제목입니다.</p>
							<p class="col-2">작성일자</p>
							<p class="col-2">
								<button class="btn btn-danger"><i class="bi bi-heart"></i> 좋아요</button>
								<button class="btn btn-warning"><i class="bi bi-exclamation-square"></i> 신고</button>
							</p>
						</div>
						<div class="card-body m-0 p-0 d-flex">
							<div class="card-score col-2">
								<div class="col-12">
									<p class="scoreText">총점</p>
									<p class="scoreStar">
										<span class="star on"></span>
										<span class="star on"></span>
										<span class="star on"></span>
										<span class="star on"></span>
										<span class="star"></span>
									</p>
								</div>
								<div class="col-12">
									<p class="scoreText">복지 점수</p>
									<p class="scoreStar">
										<span class="star on"></span>
										<span class="star"></span>
										<span class="star"></span>
										<span class="star"></span>
										<span class="star"></span>
									</p>
								</div>
								<div class="col-12">
									<p class="scoreText">급여 점수</p>
									<p class="scoreStar">
										<span class="star on"></span>
										<span class="star on"></span>
										<span class="star on"></span>
										<span class="star on"></span>
										<span class="star"></span>
									</p>
								</div>
								<div class="col-12">
									<p class="scoreText">사내문화 점수</p>
									<p class="scoreStar">
										<span class="star on"></span>
										<span class="star on"></span>
										<span class="star on"></span>
										<span class="star on"></span>
										<span class="star"></span>
									</p>
								</div>
								<div class="col-12">
									<p class="scoreText">자기개발 점수</p>
									<p class="scoreStar">
										<span class="star on"></span>
										<span class="star on"></span>
										<span class="star on"></span>
										<span class="star on"></span>
										<span class="star"></span>
									</p>
								</div>
								<div class="col-12">
									<p class="scoreText">경영진 점수</p>
									<p class="scoreStar">
										<span class="star on"></span>
										<span class="star on"></span>
										<span class="star on"></span>
										<span class="star on"></span>
										<span class="star"></span>
									</p>
								</div>
							</div>		<!-- score 끝 -->
							<div class="col-10 card-review-text">
								<div class="col-12 review-text-ctrgy">
									<p>한 줄 리뷰</p>
								</div>
								<div class="col-12 review-text-ctrgy">
									<p class="text-primary">장점</p>
									<p>장점 내용</p>
								</div>
								<div class="col-12 review-text-ctrgy">
									<p class="text-danger">단점</p>
									<p>단점 내용</p>
								</div>
								<div class="col-12 review-text-ctrgy">
									<p class="text-success">바라는 점</p>
									<p>바라는 점</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" tabindex="-1" id="alertModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<p class="modal-title" style="font-size:24px; font-weight: 600;">신고 사유 선택</p>
				<button type="button" class="btn-close closeBtn"></button>
			</div>
			<div class="modal-body col-12">
				<div class="d-flex row px-3 justify-content-center">
					<span class="d-block col-12 mb-2" style="font-size: 18px;font-weight: 600;">신고 사유</span>
					<input type="hidden" name="reviewNo" id="reportRevNo"/>
					<select class="form-select" name="reportReason" id="reportSelect">
						<option value="null">=== 신고 사유를 선택해주세요 ===</option>
						<option value="REPSTAT001">음란물</option>
						<option value="REPSTAT002">욕설, 혐오 표현</option>
						<option value="REPSTAT003">사실 무근, 거짓정보</option>
						<option value="REPSTAT004">불법 정보 포함</option>
						<option value="REPSTAT005">스팸, 홍보, 도배성 글</option>
						<option value="REPSTAT006">개인 정보 노출, 저작권 침해</option>
					</select>
				</div>
				<div class="col-12">
					<p style="font-size: 14px;color: #aaa;"> * 제대로 조치가 되기 위하여 신고 사유를 정확하게 선택해주세요.</p>
					<p style="font-size: 14px;color: #aaa;"> * 무분별한 신고 행위는 경고조치를 받을 수 있습니다.</p>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary closeBtn">닫기</button>
				<button type="button" class="btn btn-danger reportBtn">신고하기</button>
			</div>
		</div>
	</div>
</div>

<div id="comAddrBasic" style="display: none;">${comVO.addressBasic}</div>
<div id="comAddrDetail" style="display: none;">${comVO.addressDetail}</div>

	<script type="text/javascript">
	$(function(){
		var reviewLikeBtn = null;		//	리뷰 좋아요 버튼
		//	리뷰 좋아요 버튼 클릭 이벤트
		$('.reviewList').on('click','.revLike', function(){
			//	로그인 여부 확인
			var loginYn = '${loginYn}';
			if(loginYn=="N"){		//	로그인이 안 되어있을 시
				alert("로그인 후 이용 가능합니다.");
				return false;
			}
			
			//	리뷰 번호, 계정 아이디 가져오기
			var reviewNo = $(this).parents('.review').find('input[name=reviewNo]').val();
			var memId = '${memId}';
			reviewLikeBtn = $(this).parents('.review').find('button').eq(0);
			//	이미 좋아요 한 리뷰인지 확인하기
			$.ajax({
				url : "/jobel/checkLikeReview.do",
				type : "post",
				beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
					xhr.setRequestHeader(header, token);
				},
				data : {
					memId : memId,
					reviewNo : reviewNo
				},
				success : function(res){
					if(res == "ALREADY"){		//	이미 좋아요를 한 경우
						alert("이미 좋아요 버튼을 누른 리뷰입니다.");
					}
					if(res == "NOTYET"){		//	아직 안 한 경우
						reviewLikeBtn.addClass("selected");
						addLikeReview(memId, reviewNo);
					}
				},
				error : function(xhr){
					console.log("에러 코드 : " + xhr.status);
					alert("에러가 발생했습니다. 잠시 후 시도해주세요.");
				}
			});		//	좋아요 여부 판독 $.ajax() 종료
		});		//	revLike onClick 이벤트 종료
		
		function addLikeReview(memId, reviewNo){
			$.ajax({
				url : "/jobel/addLikeReview.do",
				type : "post",
				beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
					xhr.setRequestHeader(header, token);
				},
				data : {
					memId : memId,
					reviewNo : reviewNo
				},
				success : function(res){
					if(res == "SUCCESS"){
						reviewLikeBtn.toggleClass("on");
					}
				},
				error : function(xhr){
					console.log("에러 코드 : " + xhr.status);
					alert("에러가 발생했습니다. 잠시 후 시도해주세요.");
				}
			});		//	$.ajax() 종료
		}		//	function addLikeReview() 종료
		
		//	신고 모달 창에서 신고 버튼 클릭 이벤트
		$('.reportBtn').on('click', function(){
			
			var reason = $('#reportSelect').val();
			
			if(reason == 'null'){
				alert("신고 사유를 선택해주세요.");
				return false;
			}
			
			var reviewNo = $('#reportRevNo').val();
			var reporterId = '${memId}';
			var formData = {
					reportReason : reason,
					reporterId : reporterId,
					reviewNo : reviewNo
			}
			
			$.ajax({
				url : "/jobel/reportReview.do",
				type : "post",
				beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
					xhr.setRequestHeader(header, token);
				},
				data : formData,
				success : function(res){
					if(res == "SUCCESS"){
						alert("신고가 완료되었습니다.");
						$('#alertModal').modal('hide');
					}
				},
				error : function(xhr){
					console.log("에러 코드 : " + xhr.status);
					alert("에러가 발생했습니다. 잠시 후 시도해주세요.");
				}
			});		//	$.ajax() 종료
		});
		
		//	신고 모달창 닫기 버튼 클릭 이벤트
		$('.closeBtn').on('click', function(){
			$('#alertModal').modal('hide');
		});
		
		//	기업 리뷰 신고하기 버튼 클릭 이벤트
		$('.reviewList').on('click','.revAlert', function(){
			//	로그인 여부 확인
			var loginYn = '${loginYn}';
			if(loginYn=="N"){		//	로그인이 안 되어있을 시
				alert("로그인 후 이용 가능합니다.");
				return false;
			}
			
			//	신고하려는 리뷰의 번호를 가져와서 입력
			var reviewNo = $(this).parents('.review').find('input[name=reviewNo]').val();
			$('#reportRevNo').val(reviewNo);
			
			$('#alertModal').modal('show');
		});		//	revAlert onClick 이벤트 종료
		
		//	즐겨찾기 버튼 클릭 이벤트
		$('#likeComBtn').on('click', function() {
			//	로그인 여부 확인
			var loginYn = '${loginYn}';
			if(loginYn=="N"){		//	로그인이 안 되어있을 시
				alert("로그인 후 이용 가능합니다.");
				return false;
			}
			
			if($(this).hasClass("unlike")){
				//	로그인이 되어있다면 값을 가져온다.
				var coNo = $(this).attr("data-coNo");
				var memId = '${memId}';
				var clickBtn = $(this);		//	클릭한 버튼 값 유지
				
				$.ajax({
					url : "/jobel/likeCompany",
					type : "post",
					beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
						xhr.setRequestHeader(header, token);
					},
					data : {
						memId : memId,
						coNo : coNo
					},
					success : function(res){
						if(res == "SUCCESS"){
							//	버튼을 변경
							clickBtn.addClass('like');
							clickBtn.removeClass('unlike');
							alert("즐겨찾기 등록이 완료되었습니다.");
						}
					},
					error : function(xhr){
						console.log("에러 코드 : " + xhr.status);
						alert("즐겨찾기 추가에 실패했습니다. 잠시 후 시도해주세요.");
					}
				});		//	$.ajax() 종료
				
			} else{
				
				if(confirm("즐겨찾기를 취소하시겠습니까?")){
					//	취소하기로 했다면 값을 가져온다.
					var coNo = $(this).attr("data-coNo");
					var memId = '${memId}';
					var clickBtn = $(this);		//	클릭한 버튼 값 유지
					
					$.ajax({
						url : "/jobel/likeCompanyDelete",
						type : "post",
						beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
							xhr.setRequestHeader(header, token);
						},
						data : {
							memId : memId,
							coNo : coNo
						},
						success : function(res){
							if(res == "SUCCESS"){
								//	버튼을 변경
								clickBtn.addClass('unlike');
								clickBtn.removeClass('like');
								alert("즐겨찾기가 삭제 완료되었습니다.");
							}
						},
						error : function(xhr){
							console.log("에러 코드 : " + xhr.status);
							alert("즐겨찾기 삭제에 실패했습니다. 잠시 후 시도해주세요.");
						}
					});		//	$.ajax() 종료
				}	//	if(confirm()) 종료
			}
		});		//	likeBtn onClick 이벤트 종료
		
		//	페이징 처리 이벤트
		$(".pageItem").on('click', 'a', function(event){
			event.preventDefault();				//	이벤트 블락
			var page = $(this).data('page');
			reviewPage(page, '${comVO.coNo }');
		});		//	페이징 처리 이벤트 종료
		
		//	최초 실행시 리뷰 띄우기
		reviewPage(1, '${comVO.coNo }');
		
		//	리뷰 출력하는 함수
		function reviewPage(currentPage, coNo){
			$.ajax({
				url : "/jobel/companyDetailReview.do",
				type : "post",
				beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
					xhr.setRequestHeader(header, token);
				},
				data : {
					currentPage : currentPage,
					coNo : coNo
				},
				success : function(res){
					var reviewText = "";
					$.each(res.dataList, function(i,v){
						reviewText += '<div class="review"><div class="card d-flex">';
						reviewText += '<input type="hidden" name="reviewNo" value="' + v.reviewNo + '"/>';
						reviewText += '<div class="card-header col-12 reviewHeader"><p class="col-2">';
						reviewText += v.memId + '</p><p class="col-2">';
						
						var workYn = "퇴직";
						if(v.workYn == 'Y'){
							workYn = "재직";
						}
						reviewText += workYn + '</p><p class="col-4">';
						reviewText += v.title + '</p><p class="col-2">';
						var wrtDt = v.wrtDt.substring(0,10);
						reviewText += wrtDt + '</p><p class="col-2"><button class="btn btn-danger revLike">';
						reviewText += '<i class="bi bi-heart"></i> 좋아요</button><button class="btn btn-warning revAlert">';
						reviewText += '<i class="bi bi-exclamation-square"></i> 신고</button></p>';
						reviewText += '</div><div class="card-body m-0 p-0 d-flex">';
						reviewText += '<div class="card-score col-2"><div class="col-12"><p class="scoreText">총점</p>';
						var welfare = v.coWelfareEvl;
						var salary = v.coSalaryEvl;
						var culture = v.coCultureEvl;
						var improve = v.coImproveEvl;
						var manage = v.coManageEvl;
						var totalScore = (welfare + salary + culture + improve + manage) / 5;
						
						reviewText += '<p class="scoreStar">';
						for(var i = 1; i <= 5; i++){
							if(i < totalScore){
								reviewText += '<span class="star on"></span>';  
							} else {
								reviewText += '<span class="star"></span>';
							}
						}
						
						reviewText += '</p></div><div class="col-12"><p class="scoreText">복지 점수</p>';
						reviewText += '<p class="scoreStar">';
						for(var i = 1; i <= 5; i++){
							if(i < welfare){
								reviewText += '<span class="star on"></span>';  
							} else {
								reviewText += '<span class="star"></span>';
							}
						}
						
						reviewText += '</p></div><div class="col-12"><p class="scoreText">급여 점수</p>';
						reviewText += '<p class="scoreStar">';
						for(var i = 1; i <= 5; i++){
							if(i < salary){
								reviewText += '<span class="star on"></span>';  
							} else {
								reviewText += '<span class="star"></span>';
							}
						}
						
						reviewText += '</p></div><div class="col-12"><p class="scoreText">사내문화 점수</p>';
						reviewText += '<p class="scoreStar">';
						for(var i = 1; i <= 5; i++){
							if(i < culture){
								reviewText += '<span class="star on"></span>';  
							} else {
								reviewText += '<span class="star"></span>';
							}
						}
						
						reviewText += '</p></div><div class="col-12"><p class="scoreText">자기개발 점수</p>';
						reviewText += '<p class="scoreStar">';
						for(var i = 1; i <= 5; i++){
							if(i < improve){
								reviewText += '<span class="star on"></span>';  
							} else {
								reviewText += '<span class="star"></span>';
							}
						}
						
						reviewText += '</p></div><div class="col-12"><p class="scoreText">경영진 점수</p>';
						reviewText += '<p class="scoreStar">';
						for(var i = 1; i <= 5; i++){
							if(i < manage){
								reviewText += '<span class="star on"></span>';  
							} else {
								reviewText += '<span class="star"></span>';
							}
						}
						reviewText += '</p></div></div>';
						reviewText += '<div class="col-10 card-review-text"><div class="col-12 review-text-ctrgy">';
						reviewText += '<p>' + v.oneLineReview + '</p></div>';
						reviewText += '<div class="col-12 review-text-ctrgy"><p class="text-primary">장점</p>';
						reviewText += '<p>' + v.coStrengths + '</p></div>';
						reviewText += '<div class="col-12 review-text-ctrgy"><p class="text-danger">단점</p>';
						reviewText += '<p>' + v.coWeaknesses + '</p></div>';
						reviewText += '<div class="col-12 review-text-ctrgy"><p class="text-success">바라는 점</p>';
						reviewText += '<p>' + v.coWish + '</p></div></div></div></div></div>';
					});		//	$.each() 종료
					
					$('.reviewList').html(reviewText);
				},
				error : function(xhr){
					console.log("에러 코드 : " + xhr.status);
					alert("에러가 발생했습니다.");
				}
			});
		}
		
		companyLocation();		//	페이지 로딩이 끝나면 기업 주소 출력
		
		function companyLocation(){
			var address1 = $("#comAddrBasic").text();	// 일반주소 데이터
			var address2 = $("#comAddrDetail").text();	// 상세주소 데이터
			
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
				
				console.log("geocoder", geocoder);
		
				//	주소로 좌표를 검색합니다
				geocoder.addressSearch(address1 + " " + address2, function(result, status) {
		
					if (status === kakao.maps.services.Status.OK) {		//	정상적으로 검색이 완료됐으면
						var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						//	결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
							map: map,
							position: coords
						});
						
				        map.setCenter(coords);
					} 
				});  
			}		//	if문 종료
		}
	});		//	$(function()) 종료
	
	</script>
