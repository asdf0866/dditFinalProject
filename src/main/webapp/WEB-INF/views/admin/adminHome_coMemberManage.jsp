<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<c:set value="${pagingVO.dataList }" var="companyList"/>
<div class="containerBody">
	<div class="contentHeader">
		<span>기업 목록</span>
	</div>
	<div class="contentBody">
		<div class="listHeader">
			<div class="listHeaderTitle col-1">순번</div>
			<div class="listHeaderTitle col-3">기업명</div>
			<div class="listHeaderTitle col-2">회사 직군</div>
			<div class="listHeaderTitle col-2">홈페이지</div>
			<div class="listHeaderTitle col-2">신청일자</div>
			<div class="listHeaderTitle col-2">&nbsp;</div>
		</div>
		<div class="listContentBox">
			<c:forEach items="${companyList }" var="company" varStatus="stat">
				<div class="listContent">
					<div class="listContentText col-1">${stat.count + (pagingVO.screenSize * (pagingVO.currentPage - 1)) }</div>
					<div class="listContentText col-3">${company.coName }</div>
					<div class="listContentText col-2">${company.coJobTypeName }</div>
					<div class="listContentText col-2">
						<a href="${company.coUrl }" style="text-decoration: none;">링크</a>
					</div>
					<div class="listContentText col-2">
						<fmt:parseDate value="${company.joinYmd }" var="joinYmd" pattern="yyyyMMdd"/>
						<fmt:formatDate value="${joinYmd }" pattern="yyyy-MM-dd"/>
					</div>
					<div class="listContentText col-2">
						<input type="hidden" value="${company }" class="companyVO"/>
						<button type="button" class='adminButton' idx="${company.coNo }">상세보기</button>
					</div>
				</div>
			</c:forEach>
		</div>		<!-- listContentBox 끝 -->
		<div class="listFooter">
			${pagingVO.getPagingHtml() }
		</div>
		<form id="pageForm" action="" method="get">
			<input type="hidden" name="menu" value="signManage">
			<input type="hidden" id="page" name="page" value="${pagingVO.currentPage }" />
		</form>
	</div>		<!-- contentBody 끝 -->
</div>		<!-- containerBody 끝 -->

<div class="modal fade adminDetailModal" tabindex="-1" id="companyDetailModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">기업의 정보</h5>
				<button type="button" class="btn-close modalCloseBtn"></button>
			</div>
			<div class="modal-body adminModalBody">
				<div class="col-12 mb-0">
					<table class="col-12 table table-bordered">
						<tr>
							<td class="col-6" rowspan="10" style="vertical-align:middle;text-align:center;">
								<img src="" width="350px" height="350px" id="comLogoImg">
							</td>
							<td class="col-2 modalNames">회사명</td>
							<td class="col-4" id="coName"></td>
						</tr>
						<tr>
							<td class="col-2 modalNames">직군</td>
							<td class="col-4" id="coJobType">PROTECTED</td>
						</tr>
						<tr>
							<td class="col-2 modalNames">사원 수</td>
							<td class="col-4" id='coEmployeeCount'></td>
						</tr>
						<tr>
							<td class="col-2 modalNames">연간 매출액</td>
							<td class="col-4" id='coSales'></td>
						</tr>
						<tr>
							<td class="col-2 modalNames">팩스번호</td>
							<td class="col-4" id='coFax'></td>
						</tr>
						<tr>
							<td class="col-2 modalNames">대표자 이름</td>
							<td class="col-4" id='coCeoName'></td>
						</tr>
						<tr>
							<td colspan="2" class="col-6 modalNames">첨부파일</td>
						</tr>
						<tr>
							<td rowspan="3" colspan="2" class="col-6" id="reqFiles"></td>
						</tr>
					</table>
				</div>
				<div class="col-12 d-flex">
					<div class="col-4 border modalNames">주소</div>
					<div class="col-8 border" id="coAddress">(우편번호) 기본 주소 상세 주소</div>
				</div>
			</div>
			<div class="modal-footer">
				<input type="hidden" id="companyNo" value="">
				<button type="button" class="btn btn-secondary modalCloseBtn">닫기</button>
				<button type="button" class="btn btn-success detailCoMemberBtn">회원 확인</button>
				<button type="button" class="btn btn-danger deleteCompanyBtn">탈퇴 처리</button>
			</div>
		</div>
	</div>
</div>	<!-- companyDetailModal 끝 -->

<div class="modal fade adminDetailModal" tabindex="-1" id="companyMemberModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">기업 회원 목록</h5>
				<button type="button" class="btn-close secModalCloseBtn"></button>
			</div>
			<div class="modal-body adminModalBody">
				<div class="col-12">
					<table class="col-12 table table-bordered" id="coMemberTable">
						<tr>
							<td class="col-2 modalNames">아이디</td>
							<td class="col-2 modalNames">이름</td>
							<td class="col-2 modalNames">직무명</td>
							<td class="col-3 modalNames">연락처</td>
							<td class="col-3 modalNames">이메일</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary secModalCloseBtn">닫기</button>
			</div>
		</div>
	</div>
</div>


	<script type="text/javascript">
		$(function(){
			//	회원 확인 버튼 클릭 이벤트
			$('.detailCoMemberBtn').on('click', function(){
				var coNo = $('#companyNo').val();
				
				$.ajax({
					url : "/jobel/coMemberDateGet.do",
					type : "post",
					beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
						xhr.setRequestHeader(header, token);
					},
					data : {
						coNo : coNo,
					},
					success : function(res){
						//	기본 상단
						var memberCode = '<tr><td class="col-2 modalNames">아이디</td>'
							+ '<td class="col-2 modalNames">이름</td>'
							+ '<td class="col-2 modalNames">직무명</td>'
							+ '<td class="col-3 modalNames">연락처</td>'
							+ '<td class="col-3 modalNames">이메일</td></tr>';
						
						$.each(res, function(i, v){
							memberCode += "<tr style='text-align:center;'><td>" + v.memId + "</td>";
							memberCode += "<td>" + v.name + "</td>";
							memberCode += "<td>" + v.jobName + "</td>";
							var telno = v.telno + "";
							var formatTelno = telno.substring(0,3) + "-" + telno.substring(3,7) + "-" + telno.substring(7);
							memberCode += "<td>" + formatTelno + "</td>";
							memberCode += "<td>" + v.email + "</td></tr>";
						});		//	$.each() 종료
						
						$('#coMemberTable').html(memberCode);
						$('#companyMemberModal').modal('show');
					},
					error : function(xhr){
						alert("에러가 발생했습니다. 잠시 후 다시 시도해주세요.");
						console.log("에러 코드 : " + xhr.status);
					}
				});		//	$.ajax() 종료
				
			});		//	detailCoMemberBtn onClick 이벤트 종료
			
			//	상세보기 버튼 클릭 이벤트
			$('.adminButton').on('click', function(){
				//	해당 기업 정보 가져오기
				var coNo = $(this).attr('idx');
				
				$.ajax({
					url : "/jobel/companyDataGet.do",
					type : "post",
					beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
						xhr.setRequestHeader(header, token);
					},
					data : {
						coNo : coNo,
					},
					success : function(res){
						var companyVO = res.company;
						var fileList = res.fileList;
						
						//	데이터 입력
						$("#companyNo").val(companyVO.coNo);
						$('#coName').text(companyVO.coName);
						$('#coJobType').text(companyVO.coJobTypeName);
						$('#coCeoName').text(companyVO.coCeoName);
						
						//	형 변환 데이터 입력
						var employee = companyVO.coEmployeeCount
						var formatEmp = employee.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
						$('#coEmployeeCount').text(formatEmp);
						
						var sales = companyVO.coSales * 1000000;
						var formatSales = sales.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
						$('#coSales').text(formatSales);
						
						var fax = companyVO.coFax + "";
						if(fax.length == 10){
							fax = fax.substring(0,2) + "-" + fax.substring(2,7) + "-" + fax.substring(7);
						}
						if(fax.length == 11 ){
							fax = fax.substring(0,3) + "-" + fax.substring(3,7) + "-" + fax.substring(7);
						}
						$('#coFax').text(fax);
						
						var address = "(" + companyVO.postcode + ") " + companyVO.addressBasic + " " + companyVO.addressDetail;
						$('#coAddress').text(address);
						
						//	로고 이미지 입력
						var profilePhotoPath = companyVO.coLogoPath;
						if(profilePhotoPath == null || profilePhotoPath == ""){
							profilePhotoPath = "/resources/images/default/default_thumbnail.png";
						}
						var photoUrl = "${pageContext.request.contextPath }" + profilePhotoPath;
						$('#comLogoImg').attr('src',photoUrl);
						
						//	첨부 파일 출력
						var fileHtml = "";
						$.each(fileList, function(i, v){
							fileHtml += "<div class='border col-12'><a href='/jobel/download?fileId=" + v.fileId;
							fileHtml += "&fileSerialNo=" + v.fileSerialNo + "'><i class='bi bi-file-earmark-arrow-down fs-5 fw-bold'></i>"
							fileHtml += "</a><span>" + v.fileOriginName + "</span></div>";
						});		//	$.each() 종료
						$('#reqFiles').html(fileHtml);
						
						//	데이터 출력 후 모달 창 열기
						$('#companyDetailModal').modal('show');
					},
					error : function(xhr){
						alert("에러가 발생했습니다. 잠시 후 다시 시도해주세요.");
						console.log("에러 코드 : " + xhr.status);
					}
				});		//	$.ajax() 종료
			});		//	.adminButton onClick 이벤트 종료
			
			//	두번째 모달 닫기 버튼 클릭 이벤트
			$('.secModalCloseBtn').on('click', function(){
				$('#companyMemberModal').modal('hide');
			});
			
			//	모달 닫기 버튼 클릭 이벤트
			$('.modalCloseBtn').on('click', function(){
				$('#companyDetailModal').modal('hide');
			});
			
			//	페이징 처리 이벤트
			$('.listFooter').on('click', 'a', function(event){
				event.preventDefault();					//	a 태그의 이벤트 제거
				var pageNo = $(this).data("page");		//	페이지 번호
				
				$('#pageForm').find('#page').val(pageNo);
				$('#pageForm').submit();
			});		//	pagingArea onClick 이벤트 종료
		});		//	$(function()) 종료
	</script>