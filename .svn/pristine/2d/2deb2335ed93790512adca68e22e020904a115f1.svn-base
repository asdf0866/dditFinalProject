<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<section class="content">
	<div class="position-relative overflow-hidden p-3 p-md-8 m-md-8 text-center bg-white">
		<div class="col-md-8 p-lg-8 mx-auto my-5">
			<h4 class="display-4 fw-normal">취업 상담 게시판</h4>
		</div>
		<div class="product-device shadow-sm d-none d-md-block"></div>
		<div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">${board.title }</h3>
						<div class="card-tools">작성자 : ${board.writer } 
						/ 작성일시 : <fmt:formatDate value="${board.wrtDt}" pattern="yyyy-MM-dd HH:mm:ss" />  
						/ 조회수: ${board.hit }</div>
						<input type="hidden" value="${board.writer}" id="boWriter" />
					</div>
					<form id="quickForm" novalidate="novalidate">
						<div class="card-body">${board.content }</div>
						<div class="card-footer bg-white">
							<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
<!-- 
[AttachFileVO(fileId=BRD0000002, fileSerialNo=1, fileOriginName=EmpController (1).java
, fileSaveName=b028f0ff-b1f7-4b03-a53a-9d9923bc4664_EmpController (1).java
, fileContentType=java, fileSize=1701
, filePath=/resources/upload/board\file\b028f0ff-b1f7-4b03-a53a-9d9923bc4664_EmpController (1).java
, fileRegYmd=20240719, fileChgYmd=null, fileDelYn=N)],
 -->
								<c:if test="${not empty board.fileList}">
									
									<c:forEach items="${board.fileList }" var="boardFile">
											
									<div>
										<a href="/jobel/download?fileId=${boardFile.fileId}&fileSerialNo=${boardFile.fileSerialNo}" class="mailbox-attachment-name">
											<i class="fas fa-paperclip"></i> ${boardFile.fileOriginName}
										</a> 
										<span class="mailbox-attachment-size clearfix mt-1"> 
<%-- 											<span>${boardFile.fileFancysize }</span>  --%>
											<c:url value="/notice/download.do" var="downloadUrl">
												<c:param name="fileNo" value="${boardFile.fileSerialNo}"/>
											</c:url>
											<a href="/jobel/download?fileId=${boardFile.fileId}&fileSerialNo=${boardFile.fileSerialNo}"> 
												<span class="btn btn-default btn-sm float-right">
													<i class="fas fa-download"></i>
												</span>
											</a>
										</span>
									</div>
								</c:forEach>
								</c:if>
							
								
							</ul>
						</div>
						<div class="card-footer">
							<button type="button" class="btn btn-secondary" id="listBtn">목록</button>
						<sec:authorize access="isAnonymous()">
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal.member" var="member"/>
							<sec:authentication property="principal.member.memId" var="memId"/>
							<c:if test="${memId == board.writer}">
							<button type="button" class="btn btn-dark" id="modifyBtn">수정</button>
							<button type="button" class="btn btn-danger" id="deleteBtn">삭제</button>
							</c:if>
						</sec:authorize>
						
						</div>
						<sec:csrfInput/>
					</form>
				</div>
			</div>
			<form action="/jobel/delete" method="post" id="delForm">
				<input type="hidden" name="boardNo" value="${board.boardNo }"/>
				<sec:csrfInput/>
			</form>
			<div class="col-md-6"></div>
		</div>
	</div>
	
	<hr />

<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">댓글</h3>
					</div>
				
					<!-- memId,boardId,replyContent -->
					<form id="quickForm" action="/comment/insert" method="post">
						<div class="card-footer">
						<!-- 댓글 등록 시작 -->
						<br>
<!-- 						<div class="input-group mb-3"> -->
<%--   							<label for="basic-url" class="form-label">작성자 : ${member.name}</label> --%>
<!--   						</div> -->
  						<div class="input-group mb-3">
  							<input type="hidden" name="memId" value="${member.memId}" />
  							<input type="hidden" name="boardId" value="${param.boardNo}" />
  							<textarea class="form-control" name="replyContent" placeholder="댓글을 입력해주세요" required></textarea>
  						</div>
  						
  						<div class="input-group mb-3 d-flex justify-content-end"  style="text-align: right;">
  						<c:set var="strDisabled" value="disabled"/>
  						<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal.member" var="member"/>
							<sec:authentication property="principal.member.memId" var="memId"/>
							<c:if test="${memId != null}">
								<c:set var="strDisabled" value=""/>
							</c:if>
			  			</sec:authorize>
							<button type="submit" id="replyInsertBtn" class="btn btn-info" data-chklogin="${strDisabled}" }>댓글등록</button> <br>
							<button  id="replyDataBtn" class="btn btn-info"  >자동 입력</button>
  							
  						</div>
						<!-- 댓글 등록 끝 -->
						</div>
						<sec:csrfInput />
					</form>
						<div class="card-body">
						<!-- 댓글 목록 시작 -->
						<table class="table">
						
						  <thead>
						    <tr style="text-align:center;">
<!-- 						      <th scope="col" style="width:8%;">번호</th> -->
						      <th scope="col" style="width:10%;">작성자</th>
						      <th scope="col" style="width:54%;">내용</th>
						      <th scope="col" style="width:14%;">작성일</th>
						      <th scope="col" style="width:14%;"></th>
						    </tr>
						  </thead>
						
						  <tbody id="tbody">
								<c:if test="${empty boardReplyVOList}">
									<tr>
										<td colspan="5" style="text-align: center;">등록된 댓글이 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach var="replyVO" items="${boardReplyVOList}">
							    <tr style="text-align:center;">
<%-- 							      <th scope="row">${replyVO.rnum}</th> --%>
							      <td>${replyVO.name}</td>
							      <td id="td${replyVO.replyNo}">${replyVO.replyContent}</td>
							      <td>${replyVO.replyWrtDt}</td>
							      <td>
							      	<sec:authorize access="isAuthenticated()">
										<sec:authentication property="principal.member" var="member"/>
										<sec:authentication property="principal.member.memId" var="memId"/>
											<c:if test="${memId == replyVO.memId}">
										<button type="button" class="btn btn-warning modal_btn btnReplyModify" data-reply-no="${replyVO.replyNo}" >수정</button>
										<button type="button" class="btn btn-danger modal_remove_btn btnReplyremove" data-reply-no="${replyVO.replyNo}">삭제</button>
										</c:if>
						  			</sec:authorize>
							      </td>
							    </tr>
						  	</c:forEach>
						  </tbody>
						</table>
						<!-- 댓글 목록 끝 -->


					
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- 수정Modal -->
<form action="/comment/update" method="post" id="modifyForm">
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">댓글 수정</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <textarea id="replyContent" class="form-control replyContent" rows="3" name = "replyContent" "required></textarea>
                <input type="hidden" class="replyNo" value="${replyVO.replyNo}"id="replyNo" name="replyNo"/> 
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="closeModalBtn">취소</button>
                <button type="button" class="btn btn-primary" id="saveBtn">확인</button>
            </div>
        </div>
    </div>
</div>
</form>
<!-- Modal 끝-->

	
	<!-- 삭제 Modal -->
	<form action="/comment/delete" method="post" id="modifyRemoveForm">
	<div class="modal fade" id="removeModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">정말 삭제 하시겠습니까?</h5>
					
					 
					  
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
<!-- 				<div class="modal-body" style="hidden">  -->
				 <input type="hidden" class="replyNo" value="${replyVO.replyNo}" id="replyNo" name="replyNo"/> 
				 <input type="hidden" class="replyDelYn" value="${replyVO.replyDelYn}" id="replyDelYn" name="replyDelYn"/> 
<!-- 				</div> -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal"  id="closeDelModalBtn">취소</button>
					<button type="button" class="btn btn-primary" id="removeModalBtn">삭제</button>
				</div>
			</div>
		</div>
	</div>
	</form>
	<!-- 삭제  Modal 끝-->

</section>
<script type="text/javascript">
$(function(){
	var listBtn = $("#listBtn");
	var modifyBtn = $("#modifyBtn");
	var deleteBtn = $("#deleteBtn");
	var delForm = $("#delForm");
	var delcommentForm = $("#delcommentForm");
	var modifyRemoveForm = $("#modifyRemoveForm");
	let replyNo;
	
	
	// 댓글 등록 버튼
	$("#replyInsertBtn").on("click", function(){
		//alert($(this).data("chklogin"))
		if($(this).data("chklogin")=="disabled"){
			alert("로그인 후 사용하세요...");
			return;
		}
		
	});
	
	
	//댓글 수정 확인
	
	
	//댓글 수정 준비
	$(".btnReplyModify").on("click",function(){
		replyNo = $(this).data("replyNo");1616
		console.log("replyNo : " + replyNo);
	});
	
	listBtn.on("click", function(){
		location.href = "/jobel/consulting_board";
	});
	
	modifyBtn.on("click", function(){
		var boWriter = $('#boWriter').val();
		var memId = '${memId}';
		
		console.log("boWriter : " + boWriter);
		console.log("memId : " + memId);
		
		if(boWriter == memId){
			delForm.attr("action", "/jobel/update.do");
			delForm.attr("method", "get");
			delForm.submit();
		} else {
			alert("해당 글의 작성자만 수정할 수 있습니다 .");
			return false;
		}
	});
	
	deleteBtn.on("click", function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			delForm.submit();
		}
	});
	
	$(".modal_btn").on("click", function(){
		$("#exampleModal").modal("show");
	});
	

	$("#closeModalBtn").on("click", function(){
		$("#exampleModal").modal("hide");
	});
	

		// 삭제버튼 눌렀을 때 
	$(".btnReplyremove").on("click", function(){
		replyNo = $(this).data("replyNo");
		$("#removeModal").modal("show");
	});
		
		
	$("#closeDelModalBtn").on("click", function(){
		$("#removeModal").modal("hide");
	});
	

	  
	$('.modal_btn').on('click', function() {
					var replyContent = $(this).closest('tr').find('td:nth-child(2)').text();
					$('#replyContent').val(replyContent); // textarea에 내용을 설정합니다.
					$('#replyId').val($(this).closest('tr').data('reply-id')); // 댓글 ID를 설정 (필요한 경우)
					$('#exampleModal').modal('show'); // 모달 표시
				});

		//댓글 수정 처리
		$('#saveBtn').on('click',function() {

					var modifyForm = $("#modifyForm");
					var replyContent = $('.replyContent').val();
					// AJAX 호출 또는 데이터 처리 로직 추가
					console.log("수정된 내용:", replyContent);
					//전역변수
					console.log("댓글 ID:", replyNo);
					// 	            delcommentForm.submit();

					let data = {
						"replyNo" : replyNo,
						"replyContent" : replyContent
					};
					////set    reply_content = 샵{replyContent} where  reply_no = 샵{replyNo}
					console.log("data : ", data);

					$.ajax({
						url : "/comment/updateAjax",
						contentType : "application/json;charset=utf-8",
						data : JSON.stringify(data),
						type : "post",
						dataType : "json",
						beforeSend : function(xhr) {
							xhr.setRequestHeader("${_csrf.headerName}",
									"${_csrf.token}");
						},
						success : function(result) {
							//result : boardReplyVO
							console.log("result : ", result);

							console.log("result.replyContent : "
									+ result.replyContent);
							$("#td" + replyNo).html(result.replyContent);

							$('#exampleModal').modal('hide'); // 모달 닫기
						}
					});

				});
		//댓글 삭제 처리
		$('#removeModalBtn').on('click', function() {

			var modifyRemoveForm = $("#modifyRemoveForm");
			var replyContent = $('.replyContent').val();
			// AJAX 호출 또는 데이터 처리 로직 추가
			console.log("삭제여부 내용:", replyDelYn);
			//전역변수
			console.log("댓글 ID:", replyNo);
			// 	            delcommentForm.submit();

			let data = {
				"replyNo" : replyNo,
				"replyContent" : replyContent
			};
			////set    reply_content = 샵{replyContent} where  reply_no = 샵{replyNo}
			console.log("data : ", data);

			$.ajax({
				url : "/comment/deleteAjax",
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				type : "post",
				dataType : "json",
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}",
							"${_csrf.token}");
				},
				success : function(result) {
					//result : boardReplyVO
					console.log("result : ", result);

					console.log("result.replyContent : "
							+ result.replyContent);
					$("#td" + replyNo).parent().remove();

					$('#removeModal').modal('hide'); // 모달 닫기
				}
			});

		});
	
	});//달러 function

	$(document).ready(function(){
	    $('#replyDataBtn').on('click', function(){
	    	  $('textarea[name=replyContent]').val("네 한번 도전해보세요. 적극적인 자세가 중요합니다.");
	    });
	});
	
</script>

