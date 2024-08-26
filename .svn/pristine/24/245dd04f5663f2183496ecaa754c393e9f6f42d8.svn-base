<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%-- <link href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet"> --%>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/headers.css"> --%>
<script src="https://ajax.goontext.request.contextPath }/resources/css/headegleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>

	<div class="position-relative overflow-hidden p-3 p-md-8 m-md-8 text-center bg-white">
		<div class="col-md-8 p-lg-8 mx-auto my-5">
			<h4 class="display-4 fw-normal">1:1 문의게시판</h4>
<!-- 			<p class="lead fw-normal">일반게시판 CRUD를 작성해주세요.</p> -->
		</div>
		<div class="product-device shadow-sm d-none d-md-block"></div>
		<div
			class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="">
					<div class="card-body">
						<form method="post" action="/jobel/qnaInsert" id="qnaForm" class="form-horizontal">
							<c:if test="${status eq 'u' }">
								<input type="hidden" name="boardNo" value="${board.boardNo }" />
							</c:if>
							<div class="form-group row">
								<label class="col-sm-2 control-label" >제목</label>
								<div class="col-sm-10">
									<input name="title" id="title" type="text" class="form-control" value="${board.title }" placeholder="제목을 입력해주세요.">
								</div>
								<font color="red" style="font-size:14px;">${errors.title }</font>
							</div>
							<div class="form-group row mt-4">
								<label class="col-sm-2 control-label" >내용</label>
								<div class="col-sm-10">
									<textarea name="content" id="content" cols="50" rows="5" class="form-control" placeholder="content">${board.content }</textarea>
								</div>
								<font color="red" style="font-size:14px;">${errors.content }</font>
							</div>
							<div class="form-group row mt-4">
								<div class="col-sm-offset-2 col-sm-12 ">
									<input type="button" value="등록" class="btn btn-primary float-right" id="addBtn">
									<c:if test="${status eq 'u' }">
										<input type="button" value="취소" class="btn btn-danger float-right" id="cancelBtn">
									</c:if>
									<c:if test="${status ne 'u' }">
										<input type="button" value="목록" class="btn btn-success float-right" id="listBtn">
									</c:if>
									<button type="button" class="btn" style="background-color:pink;" id="exampleInsertBtn">자동입력</button>
								</div>
							</div>
							<sec:csrfInput/>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-12"><br/><br/><br/></div>
		</div>
	</div>

<script type="text/javascript">
$(function(){
	// CKEditor를 textarea에 얹는다.
	CKEDITOR.replace("content");
	
	var addBtn = $("#addBtn");
	var cancelBtn = $("#cancelBtn");
	var listBtn = $("#listBtn");
	var qnaForm = $("#qnaForm");
	
	// 등록 버튼 이벤트
	addBtn.on("click", function(){
		var title = $("#title").val();	// 제목 값
		// 일반적인 textarea인 경우
// 		var content = $("#boContent").val();// 내용 값
		//ckeditor를 활용한 경우
		var content = CKEDITOR.instances.content.getData();	// 내용 값
		
		if(title == null || title == ""){
			alert("제목을 입력해주세요!")
			return false;
		}
		
		if(content == null || content == ""){
			alert("내용을 입력해주세요!")
			return false;
		}
		
		// 수정일때는 등록 이벤트를 수정 이벤트로 변경한다.
		if($(this).val() == "수정"){
			qnaForm.attr("action", "/jobel/qnaUpdate");
		}
		
		qnaForm.submit();
		
	});
	
	// 취소 버튼 이벤트
	cancelBtn.on("click", function(){
		
	});
	
	// 목록 버튼 이벤트
	listBtn.on("click", function(){
		location.href = "/jobel/qna";
	});
	
	
	// 시연용 데이터 입력 버튼
	$("#exampleInsertBtn").on('click', function(){
		var title = '지역, 나이 조건으로 검색';
		var content = '지역이나 나이 등의 조건으로 채용정보를 검색할 수는 없나요?';
		
		$("#title").val(title);
// 		$("#content").val();
		CKEDITOR.instances.content.setData(content);
		
	})
	
	
});

</script>























