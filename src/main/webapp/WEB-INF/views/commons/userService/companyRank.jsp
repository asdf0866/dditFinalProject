<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<style>

img{
	width:60px;
	height:60px;
	float:left;
	margin-right: 25px;
}

.comList{
	border-radius: 10px;
	margin: 5px 0 5px 0;
	padding: 10px;
	background: white;
}

.comContent{
	display : inline-block;
}

.comContent p{
	font-size:0.9rem;
}

.comScore{
	float:right;	
	margin: 18px 20px 0 0;
	color : gray;
}

</style>

<div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px; margin-top:50px;">
				<h1 class="display-6">기업 랭킹</h1>
				<p class="text-primary fs-5 mb-5">내가 원하는 조건으로 기업순위를 알아보세요!</p>
</div>

<form action="/jobel/comRank" id="searchFrm">
	<div class="container-xxl py-5" style="margin-top:0;margin-bottom:0;padding-top:0;padding-bottom:0;" id="searchDiv">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-10">
					<div>
						<input type="hidden" name="page" id="page">
						<div class="input-group">
							<input type="text" name="searchWord" 
							class="form-control float-right" value="${searchWord }" placeholder="찾고 싶은 기업명을 입력하세요">
							<div class="input-group-append">
								<button class="btn btn-primary" id="searchBtn" style="float: right;">검색</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-xxl py-5">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-10">
					<div class="input-group" style="width: 250px; float:right;">
						<label class="input-group-text">정렬</label>
						<select name="orderType" class="form-select" id="orderSel">
							<option value="total" <c:if test="${pagingVo.orderType eq 'total' }">selected='selected'</c:if>>총만족도 점수순</option>
							    <option value="welfare" <c:if test="${pagingVo.orderType eq 'welfare' }">selected='selected'</c:if>>복지 점수순</option>
							<option value="salary" <c:if test="${pagingVo.orderType eq 'salary' }">selected='selected'</c:if>>급여 점수순</option>
							<option value="culture" <c:if test="${pagingVo.orderType eq 'culture' }">selected='selected'</c:if>>사내문화 점수순</option>
							<option value="improve" <c:if test="${pagingVo.orderType eq 'improve' }">selected='selected'</c:if>>자기개발 점수순</option>
							<option value="manage" <c:if test="${pagingVo.orderType eq 'manage' }">selected='selected'</c:if>>경영 점수순</option>
							<option value="sale" <c:if test="${pagingVo.orderType eq 'sale' }">selected='selected'</c:if> >매출액 높은순</option>
							<option value="empNum" <c:if test="${pagingVo.orderType eq 'empNum' }">selected='selected'</c:if>>직원수 많은순</option>
						</select>
					</div>
				</div>
				<div class="col-lg-10">
		 			
		 			<div>
		 				<c:forEach items="${pagingVo.dataList }" var="data" varStatus="status">
			 				<div class="comList" data-no="${data.coNo }">
			 					<span>
				 					<img class="img-thumbnail rounded" src="${pageContext.request.contextPath }${data.coLogoPath }" alt=""/>
			 					</span>
			 					<div class="comContent">
				 					<p style="margin-top:10px;">
						 				${data.coName }
				 					</p>
				 					<p style="margin:0 0 0 0;">
						 				${data.coJobTypeName } | ${data.addressBasic }
				 					</p>
			 					</div>
			 					<div class="comScore">
			 						복지점수 : <span>${data.coWelfareEvlAvg }</span>
			 						급여점수 : <span>${data.coSalaryEvlAvg }</span>
			 						사내문화점수 : <span>${data.coCultureEvlAvg }</span>
			 						자기개발점수 : <span>${data.coImproveEvlAvg }</span>
			 						경영점수 : <span>${data.coManageEvlAvg }</span>
			 						총점수 : <span>${data.coEvlAvg }</span>
			 					</div>
			 				</div>
		 				</c:forEach>
		 			</div>
					
					<div class="pagingDiv d-flex justify-content-center">
						${pagingVo.pagingHtml }
					</div>
				</div>
	 		</div>
	 	</div>
	</div>
</form>


	
<script>
 
$(function(){
	
	var searchFrm = $("#searchFrm");
	var orderSel = $("#orderSel");
	
	$(".pagingDiv").on('click', 'a', function(event){
		event.preventDefault();	// 이벤트 블락
		var page = $(this).data('page');
		$("#page").val(page);
		console.log("asd >", $("#page").val());
		searchFrm.submit();
	});
	
	$('body').css("background", "#f0f0f0");
	
	$(".comList").on('click',function(){
		var coNo = $(this).attr("data-no");
		location.href="/jobel/comDetail?coNo="+coNo;
	});
	
	orderSel.on('change', function(){
		searchFrm.submit();
	});
});

</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	