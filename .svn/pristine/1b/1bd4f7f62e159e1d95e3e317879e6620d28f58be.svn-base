<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<sec:authorize access="isAnonymous()">
	<c:set var="loginYn" value="N"/>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
	<c:set var="loginYn" value="Y"/>
	<sec:authentication property="principal.member" var="member"/>
	<sec:authentication property="principal.member.memId" var="memId"/>
</sec:authorize>

<div class="reviewSection">
	<div class="reviewWrap">
		<div class="reviewContent">
			<div class="reviewTitle">
				<span class="reviewTitleText">기업 리뷰 게시판</span>
			</div>
			<hr/>
			<div class="reviewFavorite">
				<c:forEach items="${favoriteReview }" var="favReview">
					<div class="card favCard">
						<div class="card-header">
							<h5 class="card-title">${favReview.title }</h5>
						</div>
						<div class="card-body">
							<h5 class="card-title">${favReview.coName }</h5>
							<p class="card-text">
								<fmt:parseDate value="${favReview.wrtDt }" var="wrtDt" pattern="yyyy-MM-dd HH:mm:ss"/>
								<span class="favSpan">작성일</span> 
								<fmt:formatDate value="${wrtDt }" pattern="yyyy-MM-dd HH:mm:ss" />
							</p>
							<p class="card-text"><span class="favSpan">복지평가</span>${favReview.coWelfareEvl }점</p>
							<p class="card-text"><span class="favSpan">급여평가</span>${favReview.coSalaryEvl }점</p>
							<p class="card-text"><span class="favSpan">사내문화평가</span>${favReview.coCultureEvl }점</p>
							<p class="card-text"><span class="favSpan">자기개발평가</span>${favReview.coImproveEvl }점</p>
							<p class="card-text"><span class="favSpan">경영진평가</span>${favReview.coManageEvl }점</p>
							<p class="card-text"><span class="favSpan">총점</span>${favReview.getAvgScore() }점</p>
						</div>
					</div>
				</c:forEach>
			</div>		<!-- reviewFavorite 끝 -->
			<hr/>
			<div class="reviewBoard">
				<div class="reviewBoardContent">
					<div class="boardHeader">
						<span class="boardHeaderText">전체 기업 리뷰</span>
					</div>
					<div class="boardBody">
						<div class="boardTitle">
							<div class="boardTypes">
								<select class="form-select">
									<option>===</option>
									<option>===</option>
									<option>===</option>
								</select>
							</div>
							<form action="" id="reviewSearchForm" method="get">
								<div class="boardSearch input-group">
									<input type="hidden" name="page" id="page"/>
									<input type="hidden" name="searchType"/>
									<input class="form-control w-75" name="searchWord" type="text" value="${searchWord }">
									<button class="btn btn-success" type="button">검색</button>
								</div>
							</form>
						</div>
						<div class="boardContent">
							<c:forEach items="${pagingVo.dataList }" var="company" varStatus="stat">
							<div class="card companyCard row">
								<div class="companyCard-1">
									<img class="companyCardImg" src="${pageContext.request.contextPath }${company.coLogoPath}">
								</div>
								<div class="companyCard-3">
									<input type="hidden" name="coNo" value="${company.coNo }"/>
									<p class="comMainText">${company.coName }</p>
									<p class="comSubText">리뷰 개수 : ${company.totalReviewCount }개</p>
								</div>
								<div class="companyCard-6">
									<span>${company.recentReview }</span>
								</div>
								<div class="companyCard-1">
									<span>조회수 : ${company.totalReviewHit } 회</span>
								</div>
								<div class="companyCard-2">
									<c:if test="${(likeComList ne null) and (not empty likeComList) }">
										<c:forEach items="${likeComList }" var="likeCom">
											<c:if test="${likeCom.coNo == company.coNo }">
												<c:set value="Y" var="alreadyLike"/>
											</c:if>
										</c:forEach>
									</c:if>
									<c:choose>
										<c:when test="${alreadyLike == 'Y' }">
											<button class="likeComBtnReverse"><span>관심 기업<i class='bx bx-star'></i></span></button>
											<c:remove var="alreadyLike"/>
										</c:when>
										<c:otherwise>
											<button class="likeComBtn"><span>관심 기업<i class='bx bx-star'></i></span></button>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							</c:forEach>
						</div>		<!-- boardContent 끝 -->
					</div>		<!-- boardBody 끝 -->
				</div>		<!-- reviewBoardContent 끝 -->
				<div class="reviewBoardFooter">
					<button type="button" class="btn btn-primary" id="reviewWriteBtn">리뷰 작성</button>
					<div class="pageArea">
						${pagingVo.pagingHtml }
					</div>
				</div>
			</div>		<!-- reviewBoard 끝 -->
		</div>		<!-- reviewContent 끝 -->
	</div>		<!-- reviewWrap 끝 -->
</div>		<!-- reviewSection 끝 -->


<script type="text/javascript">
$(function(){
	var reviewWriteBtn = $('#reviewWriteBtn');
	var reviewSearchForm = $("#reviewSearchForm");
	
	//	리뷰 작성 버튼 클릭 이벤트
	reviewWriteBtn.on('click', function(){
		//	로그인 여부 확인
		var loginYn = '${loginYn}';
		if(loginYn=="N"){		//	로그인이 안 되어있을 시
			alert("로그인 후 이용 가능합니다.");
			return false;
		}
		
		location.href = "/jobel/reviewWrite";
	});		//	reviewWriteBtn onClick 이벤트 종료
	
	
	//	페이징 처리 이벤트
	$(".pageArea").on('click', 'a', function(event){
		event.preventDefault();				//	이벤트 블락
		var page = $(this).data('page');
		$("#page").val(page);
		reviewSearchForm.submit();
	});		//	페이징 처리 이벤트 종료
	
	
	//	즐겨찾기 버튼 클릭 이벤트
	$('.boardContent').on('click', '.likeComBtn', function() {
		//	로그인 여부 확인
		var loginYn = '${loginYn}';
		if(loginYn=="N"){		//	로그인이 안 되어있을 시
			alert("로그인 후 이용 가능합니다.");
			return false;
		}
		
		//	로그인이 되어있다면 값을 가져온다.
		var location = $(this).parents(".companyCard");
		var coNo = location.find('input[name=coNo]').val();
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
					clickBtn.addClass('likeComBtnReverse');
					clickBtn.removeClass('likeComBtn');
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
	$('.boardContent').on('click', '.likeComBtnReverse', function() {
		if(confirm("즐겨찾기를 취소하시겠습니까?")){
			//	취소하기로 했다면 값을 가져온다.
			var location = $(this).parents(".companyCard");
			var coNo = location.find('input[name=coNo]').val();
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
						clickBtn.addClass('likeComBtn');
						clickBtn.removeClass('likeComBtnReverse');
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
	
	
	$('.companyCard-1, .companyCard-3, .companyCard-6').on('click', function(){
		var coNo = $(this).parent().find('input[name=coNo]').val();
		location.href = "/jobel/comDetail?coNo=" + coNo;
	});		//	companyCard onClick 이벤트 종료
	
});
</script>