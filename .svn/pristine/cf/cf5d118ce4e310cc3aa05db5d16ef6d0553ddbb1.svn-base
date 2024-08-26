<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%-- <link href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet"> --%>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/headers.css"> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>

<style>
.card-body{
	height : 150px;
}
.ansContent{
	border: none;
	outline: none;
}
ansContentDiv{
	white-space:pre-line;
}
</style>

<div class="position-relative overflow-hidden p-3 p-md-8 m-md-8 text-center bg-white">
		<div class="col-md-8 p-lg-8 mx-auto my-5">
			<h4 class="display-4 fw-normal">1:1문의게시판</h4>
<!-- 			<p class="lead fw-normal">일반게시판 CRUD를 작성해주세요.</p> -->
		</div>
		<div class="product-device shadow-sm d-none d-md-block"></div>
		<div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
</div>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">${qna.title }</h3>
						<div class="card-tools mt-1">
							작성자 : ${qna.writer }
							작성일시 : <fmt:parseDate value="${qna.wrtDt }" pattern="yyyy-MM-dd HH:mm:ss" var="parseWrtDt" />
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${parseWrtDt }" />
							조회수 : ${qna.hit }
						</div>
					</div>
					<div class="card-body">
						<div class="form-group row mt-1">
							<div class="col-sm-12">${qna.content }</div>
						</div>
					</div>
					<div class="card-footer">
						<!-- 로그인 된 사용자명과 작성자명이 일치할 때만 수정 및 삭제 버튼을 보이게 함 -->
						<sec:authorize access="isAuthenticated()">
							<sec:authentication property="name" var="username"/>
							<c:if test="${username == qna.writer }">
								<button type="button" class="btn" style="background-color: #A9E2F3; float: left;" id="updateBtn">수정</button>
								<button type="button" class="btn" style="background-color: #F7819F; float: left;" id="deleteBtn">삭제</button>
							</c:if>
						</sec:authorize>
					</div>
							<!-- 
								수정과 삭제 이벤트를 처리할 때, boardNo 파라미터를 사용해 이벤트를 처리하므로 form 
								태그 내에서 boardNo을 공유하여 form 이벤트를 활용한 수정/삭제 이벤트를
								처리하도록 함.
							 -->
							<form action="/jobel/qnaUpdate" method="post" id="upForm">
								<input type="hidden" name="boardNo" value="${qna.boardNo }"/>
								<sec:csrfInput/>
							</form>
							<form action="/jobel/qnaDelete" method="post" id="delForm">
								<input type="hidden" name="boardNo" value="${qna.boardNo }"/>
								<sec:csrfInput/>
							</form>
					
				</div>
			</div>
			<div class="col-md-12"><br/><br/><br/></div>
			<!-- 관리자일 경우에만 답변 작성 폼을 보여줌 -->
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<c:if test="${answer == null }">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">답변 </h3>
<!-- 								<div class="card-tools mt-1"> -->
<%-- 									작성자 : ${answer.writer }  --%>
<!-- 									작성일시 : -->
<%-- 									<fmt:parseDate value="${answer.wrtDt }" pattern="yyyy-MM-dd HH:mm:ss" var="parseWrtDt" /> --%>
<%-- 									<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${parseWrtDt }" /> --%>
<!-- 								</div> -->
<!-- 								<div class="card-tools mt-1"> -->
<!-- 								</div> -->
							</div>
							<div class="card-body">
								<div class="form-group row mt-1">
									<div class="col-sm-12">
<%-- 										<p id="ansP">${answer.content }</p> --%>
										<form action="/jobel/answerInsert" method="post" id="ansInsertForm">
<%-- 											<input type="hidden" name="answerNo" value="${answer.answerNo }"/> --%>
											<input type="hidden" name="boardNo" value="${qna.boardNo }"/>
											<p class="ansContentDiv">
											<textarea class="ansContent" rows="5" cols="100" name="content"><c:out value="${answer.content}" /></textarea>
											</p>
											<sec:csrfInput/>
										</form>
									</div>
								</div>
							</div>
							<div class="card-footer">
								<button type="button" class="btn btn-primary" id="ansSaveBtn">저장</button>
							</div>
						</div>
					</div>
				</c:if>
			</sec:authorize>
				
				<!-- 일반 사용자는 답변이 달렸을 경우에만 답변글을 보이게 함 -->
				<c:if test="${answer != null }">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">답변</h3>
								<div class="card-tools mt-1">
									작성자 : ${answer.writer } 
									작성일시 :
									<fmt:parseDate value="${answer.wrtDt }" pattern="yyyy-MM-dd HH:mm:ss" var="parseWrtDt" />
									<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${parseWrtDt }" />
								</div>
							</div>
							<div class="card-body">
								<div class="form-group row mt-1">
									<div class="col-sm-12">
										<p id="ansP">${answer.content }</p>
										<form action="/jobel/answerUpdate" method="post" id="ansUpdateForm">
											<input type="hidden" name="answerNo" value="${answer.answerNo }"/>
											<input type="hidden" name="boardNo" value="${qna.boardNo }"/>
											<textarea rows="5" cols="100%" name="content" style="display:none;" id="ansContent">${answer.content }</textarea>											<sec:csrfInput/>
										</form>
									</div>
								</div>
							</div>
							<div class="card-footer">
									<!-- 관리자일 경우에만 수정 및 삭제 버튼을 보이게 함 -->
								<sec:authorize access="hasRole('ROLE_ADMIN')">
<!-- 								<button type="button" class="btn" style="background-color: #2E9AFE;" id="ansSaveBtn">저장</button> -->
<!-- 								<button type="button" class="btn btn-info" id="ansUpdateBtn">수정</button> -->
<!-- 								<button type="button" class="btn btn-danger" id="ansDelBtn">삭제</button> -->
									 <button type="button" class="btn" style="background-color: #A9E2F3;" id="ansUpdateBtn">수정</button>
                          			 <button type="button" class="btn" id="ansUpdateBtn3" style="display:none; background-color: #A9E2F3;">저장</button>
                            		 <button type="button" class="btn" style="background-color: #F7819F;" id="ansDelBtn">삭제</button>
                            		 <button type="button" class="btn" id="ansUpdateBtn2" style="display:none; background-color: #2E9AFE;">취소</button>
								</sec:authorize>
							</div>
						</div>
					</div>
				</c:if>
		</div>
		<div>
			<button type="button" class="btn" style="background-color: #2E9AFE; float: right;" id="listBtn">목록</button>
		</div>
	</div>

<script>
$(function(){
	var listBtn = $("#listBtn");
	var updateBtn = $("#updateBtn");
	var deleteBtn = $("#deleteBtn");
	var upForm = $("#upForm");
	var delForm = $("#delForm");
	
	var ansSaveBtn = $("#ansSaveBtn");			// 답변 저장 버튼
	var ansInsertForm = $("#ansInsertForm");	// 답변 작성 폼
	var ansUpdateBtn = $("#ansUpdateBtn");		// 답변 수정 버튼
	var ansDelBtn = $("#ansDelBtn");			// 답변 삭제 버튼
	var ansUpdateForm = $("#ansUpdateForm");	// 답변 삭제 버튼
	
	// 목록 버튼 이벤트
	listBtn.on("click", function(){
		location.href = "/jobel/qna";
	});
	
	// 수정 버튼 이벤트
	updateBtn.on("click", function(){
		upForm.attr("action", "/jobel/qnaUpdate");
		upForm.attr("method", "get");
		upForm.submit();
	});
	
	// 삭제 버튼 이벤트
	deleteBtn.on("click", function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			delForm.submit();
		}
	});
	
	// 답변 저장 버튼 이벤트
	ansSaveBtn.on("click", function(){
		ansInsertForm.attr("action", "/jobel/answerInsert");
		ansInsertForm.attr("method", "post");
		ansInsertForm.submit();
	});
	
	// 답변 수정 버튼 이벤트
	ansUpdateBtn.on("click", function(){
		$("#ansContent").show();
		$("#ansContent").parents('div').find('#ansP').hide();
		$("#ansUpdateBtn").hide();
		$("#ansUpdateBtn2").show();
		$("#ansUpdateBtn3").show();
	});
	
	$("#ansUpdateBtn2").on('click', function(){
		$("#ansContent").hide();
		$("#ansContent").parents('div').find('#ansP').show();
		$("#ansUpdateBtn").show();
		$("#ansUpdateBtn2").hide();
		$("#ansUpdateBtn3").hide();
	});
	
	$("#ansUpdateBtn3").on('click', function(){
		ansUpdateForm.submit();
	});
	
	// 답변 삭제 버튼 이벤트
	ansDelBtn.on("click", function(){
		if(!confirm("정말로 삭제하시겠습니까?")){
			return false;
		}
		
		ansUpdateForm.attr("action", "/jobel/answerDelete");
		ansUpdateForm.submit();
	});
	
	
});
</script>

























