<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="recSection">
	<c:set value="${pagingVO.dataList }" var="recruitList"/>
	
	<div class="recWrap">
		<div class="recContent">
			<div class='recTitle'>
				<span class="recTitleText">채용 공고 목록</span>
			</div>
			<div class="recSearchBar">
				<div class="mainOptionBar">
					<div class="tabSection">
						<div class="sectionGroup">
							<div class="areaSection" id="areaSection">
								<div class="sectionDiv">
									<i class="sectionIcon bx bx-location-plus"></i>
									<span class="sectionText">지역 선택</span>
								</div>
							</div>
							<div class="jobSection" id="jobSection">
									<div class="sectionDiv">
									<i class="sectionIcon bx bx-id-card"></i>
									<span class="sectionText">직업 선택</span>
								</div>
							</div>
							<div class="keywordSection">
								<div class="sectionDiv">
									<form action="" id="searchForm" method="get">
										<input type="hidden" name="page" id="page">
										<input type="hidden" name="regType" id="regType" value="${regType }">
										<input type="hidden" name="jobType" id="jobType" value="${jobType }">
										<i class="sectionIcon bx bx-search-alt"></i>
										<input class="sectionText" name="searchWord" id="searchWord" type="text" placeholder="검색어를 입력하세요." value="${searchWord }"/>
										<button id="searchBtn"><i class='bx bx-subdirectory-left'></i></button>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="tabContent">
						<div class="optionContent areaSection" style="display:none;">
							<c:forEach items="${regtypeList }" var="regtype">
								<div>
									<input type="radio" name="regType" value="${regtype.commonCodeDetail }" id="${regtype.commonCodeDetail }" <c:if test="${regtype.commonCodeDetail == regType }">checked="checked"</c:if>>
									<label for="${regtype.commonCodeDetail }">${regtype.commonDetailName }</label>
								</div>
							</c:forEach>
						</div>
						<div class="optionContent jobSection" style="display:none;">
							<c:forEach items="${jobCodeList }" var="jobCode">
								<div>
									<input type="radio" name="jobType" value="${jobCode.commonCode }" id="${jobCode.commonCode }" <c:if test="${jobCode.commonCode == jobType }">checked="checked"</c:if>/>
									<label for="${jobCode.commonCode }">${jobCode.commonCodeName }</label>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>		<!-- recSearchBar 끝 -->
			<div class="recContentList">
				<div class="recruit-group">
					<c:forEach items="${recruitList }" var="recruit">
						<div class="card recruit" idx="${recruit.recruitNo }">
							<img class="card-img-top recLogo" src="${pageContext.request.contextPath }${recruit.coLogoPath}">
							<div class="card-body">
								<p class="card_title_">${recruit.title }</p>
								<p class="card_subtitle_">${recruit.coName }</p>
								<p class="card_text_">${recruit.coAddressBasic } | ${recruit.wrkTypeName } | ${recruit.schTypeName }</p>
							</div>
							<div class="card_footer_">
								<fmt:parseDate value="${recruit.recruitDdlnYmd }" var="recruitDdlnYmd" pattern="yyyyMMdd"/>
								<span>
								 	~ <fmt:formatDate value="${recruitDdlnYmd }" pattern="MM월 dd일 (E)"/> 마감 <i class='bx bx-star likeIcon'></i>
								</span>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>		<!-- recContentList 끝 -->
			<div id="pagingArea">
				${pagingVO.pagingHtml }
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function(){
		var areaSection = $('#areaSection');		//	지역 선택 버튼들 보여주는 Section
		var jobSection = $('#jobSection');			//	직업 선택 버튼 보여주는 Section
		var pagingArea = $('#pagingArea');			//	페이지 버튼
		var searchForm = $('#searchForm');			//	검색과 페이징 정보가 담긴 폼
		
		var regBtns = $('input[name=regType]');		//	지역 선택의 각 지역 버튼들
		var jobBtns = $('input[name=jobType]');		//	직업 선택의 각 직업 버튼들
		
		//	지역 선택 시 데이터 적용
		regBtns.on('click', function(){
			var regValue = $(this).val();
			$('#regType').val(regValue);
			$('#jobType').val("");
			$('input[name=jobType]').prop("checked", false);
		});		//	regBtns onClick 이벤트 종료
		
		//	직무 선택 시 데이터 적용
		jobBtns.on('click', function(){
			var jobValue = $(this).val();
			$('#jobType').val(jobValue);
			$('#regType').val("");
			$('input[name=regType]').prop("checked", false);
		});		//	jobBtns onClick 이벤트 종료
		
		//	페이징 처리 이벤트
		pagingArea.on('click', 'a', function(event){
			event.preventDefault();					//	a 태그의 이벤트 제거
			var pageNo = $(this).data("page");		//	페이지 번호
			
			searchForm.find('#page').val(pageNo);
			searchForm.submit();
		});		//	pagingArea onClick 이벤트 종료
		
		//	옵션 중 지역 선택 클릭 이벤트
		areaSection.on('click', function(){
			if($(this).hasClass('sectionActive')){
				return false;
			} else {
				$(this).addClass('sectionActive');
				$('#jobSection').removeClass('sectionActive');
				var areaSec = $('.areaSection').eq(1).show();
				var jobSec = $('.jobSection').eq(1).hide();
			}
		});		//	areaSection onClick 이벤트 종료
		
		
		//	옵션 중 직업 선택 클릭 이벤트
		jobSection.on('click', function(){
			if($(this).hasClass('sectionActive')){
				return false;
			} else {
				$(this).addClass('sectionActive');
				$('#areaSection').removeClass('sectionActive');
				var areaSec = $('.areaSection').eq(1).hide();
				var jobSec = $('.jobSection').eq(1).show();
			}
		});		//	jobSection onClick 이벤트 종료
		
		
		//	공고 상세보기 이벤트
		$('.recruit').on('click', function(){
			var recruitNo = $(this).attr('idx');
			var recUrl = "/jobel/recDetail?recruitNo="+recruitNo;
			
			location.href = recUrl;
		});		//	$('.recruit') onClick 이벤트 종료
		
		
		//	공고 즐겨찾기 아이콘 마우스 OVER 이벤트
		$('.likeIcon').on('mouseover', function(){
			$(this).removeClass('bx-star');
			$(this).addClass('bxs-star');
		});		//	$('.likeIcon') onMouseover 이벤트 종료
		
		
		//	공고 즐겨찾기 아이콘 마우스 OUT 이벤트
		$('.likeIcon').on('mouseout', function(){
			$(this).removeClass('bxs-star');
			$(this).addClass('bx-star');
		});		//	$('.likeIcon') onMouseout 이벤트 종료
		
	});		//	$(function()) 종료
</script>