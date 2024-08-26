<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 여기에 게시판 작성 폼을 만들어주세요. -->
<c:set value="등록" var="name" />
<c:if test="${status eq 'u' }">
	<c:set value="수정" var="name" />
</c:if>
<!--
	 요청URI : /jobel/insert
	 요청파라미터 : {title : 1, content : 2}
	 요청방식 : post
	 -->
<form:form modelAttribute="boardVO" action="/jobel/insert" method="post" id="ConsultingWriteForm"
	enctype="multipart/form-data">
	<c:if test="${status eq 'u' }">
		<input type="hidden" name="boardNo" value="${board.boardNo}" />
	</c:if>
	<div class="card-body">
		<div class="form-group">

			<input type="text" id="title" name="title" class="form-control"
				placeholder="제목을 입력해주세요" value="${board.title }" required />
		</div>
		<div class="form-group">
			<label for="content">내용을 입력해주세요</label>
			<textarea id="content" name="content" class="form-control" rows="14">${board.content } </textarea>
		</div>
		<div class="form-group">
			<div class="custom-file">

				<input type="file" class="custom-file-input" id="boFile"
					name="boFile" multiple="multiple"> <label
					class="custom-file-label" for="boFile">파일을 선택해주세요</label>
			</div>
		</div>
		<sec:csrfInput />

	</div>
</form:form>
<c:if test="${status eq 'u' }">
	<div class="card-footer bg-white">
		<ul class="mailbox-attachments d-flex align-items-stretch clearfix">
			<c:if test="${not empty fileList }">
				<input type="hidden" value="${board.attachFile }" name="attachFile"/>
				<c:forEach items="${fileList }" var="attachFile">
					<li><span class="mailbox-attachment-icon"> <i
							class="far fa-file-pdf"></i>
					</span>
						<div class="mailbox-attachment-info">
							<a href="#" class="mailbox-attachment-name"> <i
								class="fas fa-paperclip"></i> ${attachFile.fileName }
							</a> <span class="mailbox-attachment-size clearfix mt-1"> <span>${attachFile.fileSize }</span>
								<span
								class="btn btn-default btn-sm float-right attachmentFileDel"
								id="span_${attachFile.fileNo }"> <i class="fas fa-times"></i>
							</span>
							</span>
						</div></li>
				</c:forEach>
			</c:if>
		</ul>
	</div>
</c:if>

<div class="card-footer bg-white">
	<div class="row">
		<div class="col-12">
			<input type="button" value="${name }" id="addBtn"
				class="btn btn-dark float-right">
			<c:if test="${status eq 'u' }">
				<input type="button" value="취소" id="cancelBtn"
					class="btn btn-secondary  float-right">
			</c:if>
			<c:if test="${status ne 'u' }">
				<input type="button" value="목록" id="listBtn"
					class="btn btn-secondary float-right">
			</c:if>
						<input type="button" value="자동 입력" id="insertBtn"
					class="btn btn-secondary  float-right" style="color: blue">
		</div>
	</div>
</div>


<script type="text/javascript">
$(function(){
	
	CKEDITOR.replace("content");
	CKEDITOR.config.height = "600px";
	
	var addBtn = $("#addBtn");
	var cancelBtn =$("#cancelBtn");
	var ConsultingWriteForm = $("#ConsultingWriteForm");
	
	addBtn.on("click", function(){
		var title = $("#title").val();
		var content =CKEDITOR.instances.content.getData();
		
		if(title == null || title == ""){
			alert("제목을 입력해 주세요");
			$("#title").focus();
			return false;
		}
		if(content == null || content == ""){
			alert("내용을 입력해 주세요");
			$("#content").focus();
			return false;
		}
		
		if($(this).val() == "수정"){
			ConsultingWriteForm.attr("action", "/jobel/update.do");
		}
		//title : 1, content : 2
		console.log("title : " + title + ", content : " + content);
		
		ConsultingWriteForm.submit();
	});
	// 수정 시, 기존 파일 삭제 이벤트
	$(".attachmentFileDel").on("click", function(){
		var id = $(this).prop("id");
		var idx = id.indexOf("_");
		var noticeFileNo = id.substring(idx + 1);
		var ptrn = "<input type='hidden' name='delNoticeNo' value='%V' />";
		ConsultingWriteForm.append(ptrn.replace("%V", fileSerialNo));
		$(this).parents("li:first").hide();
	});
	$('#insertBtn').on('click', function(){
		$('input[name=title]').val("제가 이 회사를 지원해봐도 될까요?");		//	공고 제목
// 		$('input[name=name]').val("제가 이 회사를 지원해봐도 될까요?");		//	공고 내용
		var text = createExplainText();
		CKEDITOR.instances.content.setData(text);	//	공고 내용 입력
		
	
}); 
});

function createExplainText(){
	var text =
		'<p>제가 스펙이 낮아서 이 회사에 지원을 해봐도 되나라는 생각이 드는데 도전해보는게 나을까요? </p>'
		
return text;
}

</script>