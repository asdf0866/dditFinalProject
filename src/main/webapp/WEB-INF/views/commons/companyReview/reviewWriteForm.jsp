<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<style>
	.autoButton {
		border : 0;
		background: #AAA;
		border-radius: 5px;
		color : white;
		font-weight: 600;
		font-size: 24px;
	}
</style>
<sec:authentication property="principal.member" var="member"/>
<sec:authentication property="principal.member.memId" var="memId"/>

<div class="reviewSection">
	<div class="reviewWrap">
		<div class="reviewContent">
			<form action="/jobel/reviewWrite" method="post" id="reviewForm">
				<input type="hidden" name="memId" value="${memId }"/>
				<div class="reviewTitle">
					<span class="reviewTitleText" style="font-size: 2.0rem;">기업 리뷰 작성</span>
					<button type="button" class="autoButton">데이터 입력</button>
				</div>
				<hr class="mt-0"/>
				<div class="reviewWriteContent">
					<div class="reviewItem">
						<label class="reviewItemTitle" for="title" style="width: 10%;text-align: left;margin-left: 30px;margin-right: 5px;">리뷰 제목</label>
						<input class="reviewItemInput" type="text" name="title" id="title">
					</div>
				</div>
				<div class="reviewWriteContent">
					<div class="reviewItem">
						<div class="reviewDivideItem">
							<label class="reviewItemTitle" for="coName">리뷰 기업</label>
							<input type="hidden" name="coNo" id="coNo">
							<input class="reviewItemInput" type="text" name="coName" id="coName" readonly="readonly">
						</div>
						<div class="reviewDivideItem">
							<label class="reviewItemTitle" for="coName">재직 여부</label>
							<label class="reviewRadio">
								<input type="radio" name="workYn" value="N" checked><span>퇴직</span>
							</label>
							<label class="reviewRadio">
								<input type="radio" name="workYn" value="Y"><span>재직</span>
							</label>
						</div>
					</div>
				</div>
				<hr/>
				<div class="reviewScoreArea">
					<div class="scoreItem">
						<div class='scoreTitle'>복지</div>
						<div class="starArea" id="welfare_evl">
							<span class="star on" value="1"></span>
							<span class="star" value="2"></span>
							<span class="star" value="3"></span>
							<span class="star" value="4"></span>
							<span class="star" value="5"></span>
							<input type="hidden" name="coWelfareEvl" id="coWelfareEvl" value="1"/>
						</div>
					</div>
					<div class="scoreItem">
						<div class='scoreTitle'>급여</div>
						<div class="starArea" id="salary_evl">
							<span class="star on" value="1"></span>
							<span class="star" value="2"></span>
							<span class="star" value="3"></span>
							<span class="star" value="4"></span>
							<span class="star" value="5"></span>
							<input type="hidden" name="coSalaryEvl" id="coSalaryEvl" value="1"/>
						</div>
					</div>
					<div class="scoreItem">
						<div class='scoreTitle'>사내문화</div>
						<div class="starArea" id="culture_evl">
							<span class="star on" value="1"></span>
							<span class="star" value="2"></span>
							<span class="star" value="3"></span>
							<span class="star" value="4"></span>
							<span class="star" value="5"></span>
							<input type="hidden" name="coCultureEvl" id="coCultureEvl" value="1"/>
						</div>
					</div>
					<div class="scoreItem">
						<div class='scoreTitle'>자기개발</div>
						<div class="starArea" id="improve_evl">
							<span class="star on" value="1"></span>
							<span class="star" value="2"></span>
							<span class="star" value="3"></span>
							<span class="star" value="4"></span>
							<span class="star" value="5"></span>
							<input type="hidden" name="coImproveEvl" id="coImproveEvl" value="1"/>
						</div>
					</div>
					<div class="scoreItem">
						<div class='scoreTitle'>경영진</div>
						<div class="starArea" id="manage_evl">
							<span class="star on" value="1"></span>
							<span class="star" value="2"></span>
							<span class="star" value="3"></span>
							<span class="star" value="4"></span>
							<span class="star" value="5"></span>
							<input type="hidden" name="coManageEvl" id="coManageEvl" value="1"/>
						</div>
					</div>
				</div>		<!-- reviewScoreArea 끝 -->
				<hr/>
				<div class="reviewTextContent">
					<div class="reviewBigItem">
						<label class="reviewItemTitle text-primary">장점</label>
						<textarea class="reviewTextarea" name="coStrengths" id="coStrengths"></textarea>
					</div>
					<div class="reviewBigItem">
						<label class="reviewItemTitle text-danger">단점</label>
						<textarea class="reviewTextarea" name="coWeaknesses" id="coWeaknesses"></textarea>
					</div>
					<div class="reviewBigItem">
						<label class="reviewItemTitle text-success">바라는 점</label>
						<textarea class="reviewTextarea" name="coWish" id="coWish"></textarea>
					</div>
					<hr/>
					<div class="reviewItem">
						<label class="reviewItemTitle">한 줄 평가</label>
						<input type="text" class="reviewItemInput" name="oneLineReview" id="oneLineReview"/>
					</div>
					<br/>
				</div>		<!-- reviewTextContent 끝 -->
				<div class="reviewFooter">
					<div class="reviewFooterDesc">
						<p> * 회사에 대한 근거 없는 비방과 비난은 경고 없이 삭제될 수 있습니다.</p>
						<p> * 악의적인 리뷰를 작성하거나 거짓 리뷰를 작성하는 경우에도 삭제될 수 있습니다.</p>
					</div>
					<div class="reviewFooterBtns">
						<button class="btn btn-secondary">돌아가기</button>
						<button class="btn btn-primary" type="button" id="reviewSubmitBtn">등록하기</button>
					</div>
				</div>
				<sec:csrfInput/>
			</form>
		</div>		<!-- reviewContent 끝 -->
	</div>		<!-- reviewWrap 끝 -->
</div>		<!-- reviewSection 끝 -->

<!-- 리뷰할 기업을 선택하기 위한 기업 검색 모달 창 -->
<div class="modal fade" id="companySearchModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header bg-secondary text-white">
				<h5 class="modal-title">기업 검색</h5>
				<button type="button" class="btn-close modalCloseBtn"></button>
			</div>
			<div class="modal-body">
				<div class="companySearchForm">
					<div class="companySearchBar input-group">
						<input type="text" class="form-control" id="companySearchWord">
						<button type="button" class="btn btn-success" id="companySearchBtn">검색</button>
					</div>
					<hr/>
					<div class="companySearchResultArea">
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary modalCloseBtn">닫기</button>
				<button type="button" class="btn btn-primary">적용하기</button>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function(){
		
		//	리뷰 등록하기 버튼 클릭 이벤트
		$('#reviewSubmitBtn').on('click', function(){
			$('#reviewForm').submit();
		});		//	reviewSubmitBtn onClick 이벤트 종료
		
		//	리뷰 기업 input 클릭 이벤트(기업 검색 모달창 Show 이벤트)
		$('#coName').on('click', function(){
			$('#companySearchModal').modal('show');
		});		//	coName onClick 이벤트 종료
		
		//	모달 닫기 버튼 클릭 이벤트
		$('.modalCloseBtn').on('click', function(){
			$('#companySearchWord').val("");			//	검색창 입력값 초기화
			$('#companySearchModal').modal('hide');		//	모달 닫기
		});		//	modalCloseBtn onClick 이벤트 종료
		
		//	기업 검색 버튼 클릭 이벤트
		$('#companySearchBtn').on('click', function(){
			searchCompany();
		});		//	companySearchBtn onClick 이벤트 종료
		
		//	기업 검색 버튼 엔터 이벤트
		$('#companySearchWord').on('keydown', function(e){
			if (e.code == 'Enter'){
				searchCompany();
			}
		});		//	companySearchBtn onKeydown 이벤트 종료
		
		function searchCompany(){
			var searchWord = $('#companySearchWord').val();
			
			if(searchWord == null || searchWord == ""){		//	입력한 단어가 없는 경우 돌려보냄
				alert("검색할 단어를 입력해주세요.");
				return false;
			}
			
			$.ajax({
				url : "/comCompare/searchCompany.do?comName="+searchWord,
				type : "post",
				beforeSend : function(xhr){			//	데이터 전송 전, 헤더에 csrf 값 설정
					xhr.setRequestHeader(header, token);
				},
				success : function(res){
					if(res == null || res == ""){		//	검색 결과가 없는 경우
						var code = "<div class='w-100' style='font-size:20px;font-weight:400;'>검색 결과가 존재하지 않습니다.</div>";
						$('.companySearchResultArea').html(code);
					} else {		//	검색 결과가 존재하는 경우
						//	검색 결과창 초기화
						$('.companySearchResultArea').html("");
						$.each(res, function(i, v){
							var code = "<div class='searchData'><p>" + v.coName;
							code += "</p><input type='hidden' value='" + v.coNo + "'name='searchCoNo'/>"; 
							code += "<input type='hidden' value='" + v.coName + "' name='searchCoName'/></div>";
							$('.companySearchResultArea').append(code);
						});		//	$.each 종료
					}
				},
				error : function(xhr){
					console.log("에러 코드 : " + xhr.status);
					alert("에러가 발생했습니다. 잠시 후 다시 시도해주세요.");
				}
			});		//	$.ajax() 종료
			
		}
		
		$('#companySearchModal').on('click', '.searchData', function(){
			//	클릭한 값 가져오기
			var coNo = $(this).find('input[name=searchCoNo]').val();
			var coName = $(this).find('input[name=searchCoName]').val();
			
			//	가져온 값 적용하기
			$('#coNo').val(coNo);
			$('#coName').val(coName);
			
			//	모달창 닫기
			$('#companySearchWord').val("");			//	검색창 입력값 초기화
			$('#companySearchModal').modal('hide');		//	모달 닫기
		});		//	검색해서 나온 결과 클릭 이벤트
		
		//	별점 클릭 이벤트
		$('.starArea > .star').on('click', function(){
			$(this).parent().children('span').removeClass('on');		//	기존의 별점 제거
			$(this).addClass('on').prevAll('span').addClass('on');		//	클릭한 위치 기준 새로 적용
			
			var score = $(this).attr("value");					//	별점의 value 가져오기
			$(this).parent().children('input').val(score);		//	해당 항목의 리뷰 점수 input에 value 적용
		});		//	별점 클릭 이벤트 종료
		
		$('.autoButton').on('click', function(){
			$('#title').val("정말 힘든 회사였어요.")
			$('#coNo').val("CMSEQ00053");
			$('#coName').val("현진제업(주)");
			
			$('#welfare_evl').children('span').addClass('on');
			$('#welfare_evl').children('span').last().removeClass('on');
			$('#salary_evl').children('span').addClass('on');
			$('#salary_evl').children('span').last().removeClass('on');
			$('#culture_evl').children('span').eq(3).prevAll('span').addClass('on');
			$('#improve_evl').children('span').eq(2).prevAll('span').addClass('on');
			$('#manage_evl').children('span').eq(2).prevAll('span').addClass('on');
			
			$('#coStrengths').text("정말로 건실한 생활, 든든한 식사 보장");
			$('#coWeaknesses').text("지나친 마초적인 아저씨 문화. 너무나도 주먹구구식 일처리");
			$('#coWish').text("좋게 보면 정이 넘치고 여기에 매진할 수 있지만 요즘은 한 회사에 평생 충성하지 않는다. 오지랖 대신 조금만 배려를 해주었으면.");
			$('#oneLineReview').val("옛날 회사 일처리를 보는 기분. 장점도 단점도 그대로");
		});
	});
</script>