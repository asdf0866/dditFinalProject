<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<div class="container-fluid hero-header bg-light py-5 mb-5">
		<div class="container py-5">
			<div class="row g-5 align-items-center">
				<div class="col-lg-6">
					<h1 class="display-4 mb-3 animated slideInDown">자주 묻는 질문</h1>
					<nav aria-label="breadcrumb animated slideInDown">
						<ol class="breadcrumb mb-0">
							<li class="breadcrumb-item"><a href="/jobel/home" style="text-decoration: none; color:black;">Home</a></li>
							<li class="breadcrumb-item"><a href="/jobel/qna" style="text-decoration: none; color:black;">Qna</a></li>
							<li class="breadcrumb-item active" aria-current="page">Faq</li>
						</ol>
					</nav>
				</div>
				<div class="col-lg-6 animated fadeIn">
					<img class="img-fluid animated pulse infinite" style="animation-duration: 3s;" src="resources/cryptocurrency/img/hero-2.png" alt="">
				</div>
			</div>
		</div>
	</div>
	
	<div class="container-xxl py-5">
		<div class="container">
			<div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
				<h1 class="display-6">자주 묻는 질문</h1>
				<p class="text-primary fs-5 mb-5">궁금한 점이 있으면 검색해주세요!</p>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-10">
					<form action="/jobel/faq" id="searchFrm">
					<select class="form-select" name="searchType" id="searchType" aria-label="Default select example" style ="width:120px; height:40px;">
						<option value="">--전체--</option>
						<c:forEach items="${faqCodeList }" var="faqCode">
								<option value="${faqCode.commonCodeDetail }" <c:if test="${pagingVo.searchType eq faqCode.commonCodeDetail }">selected='selected'</c:if> >${faqCode.commonDetailName }</option>
						</c:forEach>
					</select>
					<br>
					<div class="accordion" id="accordionExample">
						<!-- 관리자만 FAQ 작성하기 버튼을 볼 수 있도록 조건 추가 -->
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<button class="btn btn-primary fs-5 mb-5 btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#faqModal" style="float:right;">FAQ 작성하기</button>
						</sec:authorize>
							<input type="hidden" name="page" id="page">
							<div class="input-group">
								<input type="text" name="searchWord" class="form-control float-right"
									value="${searchWord }" placeholder="Search">
								<div class="input-group-append">
									<button class="btn btn-primary" id="searchBtn" style="float:right;">검색</button>
								</div>
							</div>
						<br>
						<c:forEach items="${pagingVo.dataList }" var="faqVO" varStatus="status">
							<div class="accordion-item wow fadeInUp" data-wow-delay="0.1s">
								<h2 class="accordion-header" id="heading${status.index}">
									<input type="hidden" class="noInput" value="${faqVO.faqNo }">
									<input type="hidden" class="noInput faqStatCode" value="${faqVO.faqStatCode }">
									<button class="titleBtn accordion-button collapsed" type="button" data-bs-toggle="collapse"
										data-bs-target="#collapse${status.index}" aria-expanded="false" aria-controls="collapse${status.index}"
										value="${faqVO.faqNo }">
										${faqVO.title }<%-- (${faqVO.hit }) --%>
									</button>
								</h2>
								<div id="collapse${status.index}" class="accordion-collapse collapse" aria-labelledby="heading${status.index}"
									data-bs-parent="#accordionExample">
									<div class="contentDiv accordion-body">${faqVO.content }</div>
									<!-- 관리자만 수정 및 삭제 버튼을 볼 수 있도록 조건 추가 -->
									<sec:authorize access="hasRole('ROLE_ADMIN')">
										<button class="btn btn-warning btn-sm editBtn updateBtn" type="button"
											data-bs-toggle="modal" data-bs-target="#faqEditModal">수정</button>
										<button class="btn btn-danger btn-sm deleteBtn deleteBtn" type="button">삭제</button>
									</sec:authorize>
								</div>
							</div>
						</c:forEach>
						<div class="pagingDiv d-flex justify-content-center">
							${pagingVo.pagingHtml }
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="faqModal" tabindex="-1">
		<form action="/jobel/faqWrite" method="post">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">FAQ 등록</h5>
						<button type="button" class="btn-close closeBtn" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="input-group flex-nowrap">
							<label for="type" class="input-group-text">분류</label>
							<select id="type" class="form-select">
								<c:forEach items="${faqCodeList }" var="faqCode">
									<option value="${faqCode.commonCodeDetail }" >${faqCode.commonDetailName }</option>
								</c:forEach>
							</select>
						</div>
						<div class="input-group flex-nowrap">
							<label for="title" class="input-group-text">제목</label>
							<input type="text" id="title" class="form-control" placeholder="제목" />
						</div>
						<div class="input-group flex-nowrap">
							<label for="content" class="input-group-text">내용</label>
							<textarea id="content" class="form-control"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn" style="background-color:pink;" id="exampleInsertBtn">자동입력</button>
						<button type="button" class="btn btn-secondary closeBtn" data-bs-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary" id="writeBtn">작성하기</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<div class="modal fade" id="faqEditModal" tabindex="-1">
    <form id="faqEditForm" method="post">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">FAQ 수정</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="input-group flex-nowrap">
                        <label for="editType" class="input-group-text">분류</label>
                        <select id="editType" class="form-select">
                        	<c:forEach items="${faqCodeList }" var="faqCode">
                        		<option value="${faqCode.commonCodeDetail }" class="${faqCode.commonCodeDetail } faqCode">${faqCode.commonDetailName }</option>
                        	</c:forEach>
                        </select>
                    </div>
                    <input type="hidden" id="editNo">

                    <div class="input-group flex-nowrap">
                        <label for="editTitle" class="input-group-text">제목</label>
                        <input type="text" id="editTitle" class="form-control" placeholder="제목" />
                    </div>
                    <div class="input-group flex-nowrap">
                        <label for="editContent" class="input-group-text">내용</label>
                        <textarea id="editContent" class="form-control"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary" id="editSaveBtn">저장</button>
                </div>
            </div>
        </div>
    </form>
	</div>
	
	
	<script type="text/javascript">
		$(function(){
			var faqModal = $('#faqModal');				// Modal
			var writeBtn = $('#writeBtn');				// 작성하기 버튼
			var updateBtn = $('.updateBtn');			// 작성하기 버튼
			var deleteBtn = $('.deleteBtn');			// 작성하기 버튼
			var pagingDiv = $('.pagingDiv');			// 페이징 버튼
			var searchType = $('#searchType');			// 페이징 버튼
			var searchFrm = $('#searchFrm');			// 페이징 버튼
			
			//console.log($('a'));
			
			searchType.on('change', function(){
				
				searchFrm.submit();
			});
			
			//	Modal창 작성하기 버튼 클릭 이벤트
			writeBtn.on('click', function(){
				var title = $('#title').val();
				var content = $('#content').val();
				var type = $('#type').val();
				
				console.log("title >>> " + title);
				console.log("content >>> " + content);
				console.log("type >>> " + type);
				
				var faqData = {
						title : title,
						content : content,
						faqStatCode : type
				}
				
				$.ajax({
					url : "/jobel/faqwrite",
					type : "post",
					beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
						xhr.setRequestHeader(header, token);
					},
					data : JSON.stringify(faqData),
					contentType : "application/json;charset=utf-8",
					success : function(res){
						alert("등록이 완료되었습니다.");
						location.reload();
					},
					error : function(xhr){
						console.log("에러 코드 : " + xhr.status);
						alert("오류가 발생하였습니다.");
					}
				});		//	$.ajax() 종료
			});		//	writeBtn onClick 종료
			
			
			//	Modal창 닫기 버튼 클릭 시
			$('.closeBtn').on('click', function(){
				//	Modal 안의 입력 내용 초기화
				resetModal();
			});		//	closeBtn onClick 종료
			
			
			// 조회수 증가
			$('.titleBtn').on('click', function(){
				var number = $(this).attr('value');
				
				$.ajax({
					url : "/jobel/faq/increaseHit",
					type : "post",
					data : {
						faqNo : number
					},
					success : function(res){
						console.log("조회수가 증가했습니다.");
					},
					error : function(xhr){
						console.log("조회수 증가 실패 : " + xhr.status);
					}
				});
				
			});
			
			// 검색
			$('#searchBtn').on('click', function(){
				console.log("searchBtn click..!");
				
				$("#searchFrm").submit();
			});
			
			pagingDiv.on('click', 'a', function(event){
				event.preventDefault();
				var pageNo = $(this).attr("data-page");
				$('#page').val(pageNo);
				console.log("pageNo",pageNo);
				//searchForm.submit();
				$("#searchFrm").submit();
			});
			
			
			
			
			// 시연용 데이터 입력 버튼
			$("#exampleInsertBtn").on('click', function(){
				var type = 'FAQSTAT005';
				var title = 'Q. 청소년도 회원가입 되나요?';
				var content = 'A. 네 청소년도 회원가입 가능합니다.';
				
				$("#type").find("option[value='"+type+"']").attr("selected", true);
				$("#title").val(title);
				$("#content").val(content);
			});
			
			
			
		});		//	$(function()) 종료
		
		
		
		// FAQ 수정 버튼 클릭 이벤트
        $(document).on('click', '.updateBtn', function() {
        	console.log("updateBtn click...!", $(this).parents('.accordion-item').find('.faqStatCode').val());
        	
        	$("#editTitle").val($(this).parent().parent().find('.titleBtn').text().trim());	// .trim()을 사용하여 공백제거 함
        	$("#editContent").val($(this).parent().parent().find('.contentDiv').text());
        	$("#editNo").val($(this).parent().parent().find('.noInput').val());
        	$(".faqCode").attr('selected', false);
        	$("."+$(this).parents('.accordion-item').find('.faqStatCode').val()).attr('selected', true);
			
        });
		
		$("#editSaveBtn").on('click', function(){
			console.log("editSaveBtn click...!");
			
			var editTitle = $("#editTitle").val();
			var editContent = $("#editContent").val();
			var editNo = $("#editNo").val();
			
			var jsonData = {
				'title' : editTitle,	
				'content' : editContent	
			};
			
            $.ajax({
                url: "/jobel/faq/update/" + editNo,
                type: "put",
                beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
					xhr.setRequestHeader(header, token);
				},
                data: JSON.stringify(jsonData),
                contentType: "application/json;charset=utf-8",
                success: function(res) {
                    alert("수정이 완료되었습니다.");
                    location.reload();
                },
                error: function(xhr) {
                    console.log("에러 코드 : " + xhr.status);
                    alert("오류가 발생하였습니다.");
                }
            });
			
		});
		

        // FAQ 삭제 버튼 클릭 이벤트
        $('.deleteBtn').on('click', function() {
            var faqNo = $(this).parent().parent().find('.noInput').val();
            
            if(confirm("정말 삭제하시겠습니까?")) {
                $.ajax({
                    url: "/jobel/faq/delete/" + faqNo,
                    type: "put",
                    beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
						xhr.setRequestHeader(header, token);
					},
                    success: function(res) {
                        alert("삭제가 완료되었습니다.");
                        location.reload();
                    },
                    error: function(xhr) {
                        console.log("에러 코드 : " + xhr.status);
                        alert("오류가 발생하였습니다.");
                    }
                });
            }
        });
        
		function resetModal(){
			$('#title').val("");
			$('#content').val("");
		}
		
		function increaseHit(faqNo){
			$.ajax({
				url : "/jobel/faq/increaseHit",
				type : "post",
				data : {faqNo : faqNo},
                contentType: "application/json;charset=utf-8",
				success : function(res){
					console.log("조회수가 증가했습니다.");
				},
				error : function(xhr){
					console.log("조회수 증가 실패 : " + xhr.status);
				}
			});
		}
		
		
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	