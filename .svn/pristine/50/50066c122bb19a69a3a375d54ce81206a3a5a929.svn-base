<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<style>
		@font-face {
			font-family: 'Cafe24Ssurround';
			src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff') format('woff');
			font-weight: normal;
			font-style: normal;
		}
		
		@font-face {
			font-family: 'BMJUA';
			src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
			font-weight: normal;
			font-style: normal;
		}
		
		.homeBackground {
			width : 100%;
			background : #eeeeee;
			min-height: 1080px;
		}
		
		.homeBackground * {
			font-family: 'BMJUA';
		}
		
		.homeCarousel {
			width : 100%;
			background : #bbbbbb;
			height : 360px;
			min-height: 120px;
			max-height: 360px;
		}
		
		.homeContainer {
			width : 90%;
			margin : 25px auto;
			display: flex;
			flex-direction: column;
			padding : 40px 0 100px;
			background: #ffffff;
			border-radius: 10px;
		}
		
		.homeContainer .card {
			-webkit-transform: scale(1);
			transform: scale(1);
			-webkit-transition: .5s ease-in-out;
			transition: .5s ease-in-out;
		}
		
		.homeContainer .card:hover {
			-webkit-transform: scale(1.05);
			transform : scale(1.05);
			box-shadow: 5px 5px 25px 0 rgba(0, 0, 0, 0.14);
		}
		
		.homeSection {
			width : 90%;
			margin : 0 auto;
		}
		
		.homeSection+ .homeSection {
			margin-top : 30px;
		}
		
		.homeSectionHeader > p {
			font-size : 1.4rem;
			margin : 5px 0;
		}
		
		.homeSectionBody {
			width: 100%;
		}

		.part-3-card {
			width : 30%;
		}
		
		.part-4-card {
			width : 24%;
		}
		
		.home-card-img {
			aspect-ratio : 4 / 3;
		}
		
		
	</style>
	
	<div class="homeBackground">
		<div class="carousel slide homeCarousel" id="homeCarousel" data-bs-ride="carousel">
			<div class="carousel-item h-100 active">
				<img src="${pageContext.request.contextPath }/resources/images/웹배너2.png" class="d-block w-100 h-100" alt=""
					onclick="javascript:location.href='/jobel/recHome'">
			</div>
			<div class="carousel-item h-100">
				<img src="${pageContext.request.contextPath }/resources/images/인기공고 배너2.png" class="d-block w-100 h-100" alt=""
					onclick="javascript:location.href='/jobel/comRank'">
			</div>
			<div class="carousel-item h-100">
				<img src="${pageContext.request.contextPath }/resources/images/기업비교 배너.png" class="d-block w-100 h-100" alt=""
					onclick="javascript:location.href='/comCompare/list'">
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#homeCarousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#homeCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
		
		<div class="homeContainer">
			<div class="homeSection">
				<div class="homeSectionHeader">
					<p>기업 정보</p>
				</div>
				<div class="homeSectionBody d-flex justify-content-between">
					<div class="card part-3-card">
						<img class="card-img-top" src="${pageContext.request.contextPath }/resources/images/시큐리온.png"
							onclick="javascript:location.href='/jobel/comDetail?coNo=CMSEQ00057'">
						<div class="card-body">
							<p class="card-text">(주)시큐리온</p>
							<p style="color:#808080;">IOT 보안 솔루션 개발·판매  | 서울시 송파구</p>
						</div>
					</div>
					<div class="card part-3-card">
						<img class="card-img-top" src="${pageContext.request.contextPath }/resources/images/챔프스터디2.png"
							onclick="javascript:location.href='/jobel/comDetail?coNo=CMSEQ00021'">
						<div class="card-body">
							<p class="card-text">(주)챔프스터디</p>
							<p style="color:#808080;">대한민국 최고의 교육 업계 | 서울 서초구</p>
						</div>
					</div>
					<div class="card part-3-card">
						<img class="card-img-top" src="${pageContext.request.contextPath }/resources/images/삼성케미칼.png"
							onclick="javascript:location.href='/jobel/comDetail?coNo=CMSEQ00052'">
						<div class="card-body">
							<p class="card-text">(주)삼성케미칼</p>
							<p style="color:#808080;">플라스틱 제품 생산 | 경기 김포시 </p>
						</div>
					</div>
				</div>
			</div>		<!-- homeSection 끝 (기업 정보 3카드) -->
			
			<div class="homeSection">
				<div class="homeSectionHeader">
					<p>추천 공고 분야</p>
				</div>
				<div class="homeSectionBody d-flex justify-content-between">
					<div class="card part-4-card">
						<img class="card-img-top" src="${pageContext.request.contextPath }/resources/images/개발사진.jpg"
							onclick="javascript:location.href='/jobel/recHome?page=1&regType=&jobType=JOB001T&searchWord='">
						<div class="card-body">
							<p class="card-text">개발</p>
						</div>
					</div>
					<div class="card part-4-card">
						<img class="card-img-top" src="${pageContext.request.contextPath }/resources/images/엔지니어링 설계2.jpg"
							onclick="javascript:location.href='/jobel/recHome?page=1&regType=&jobType=JOB008T&searchWord='">
						<div class="card-body">
							<p class="card-text">엔지리어닝 · 설계</p>
						</div>
					</div>
					<div class="card part-4-card">
						<img class="card-img-top" src="${pageContext.request.contextPath }/resources/images/영업.jpg"
							onclick="javascript:location.href='/jobel/recHome?page=1&regType=&jobType=JOB005T&searchWord='">
						<div class="card-body">
							<p class="card-text">영업</p>
						</div>
					</div>
					<div class="card part-4-card">
						<img class="card-img-top" src="${pageContext.request.contextPath }/resources/images/경영 비즈니스.jpg"
							onclick="javascript:location.href='/jobel/recHome?page=1&regType=&jobType=JOB002T&searchWord='">
						<div class="card-body">
							<p class="card-text">경영 · 비즈니스</p>
						</div>
					</div>
				</div>
			</div>		<!-- homeSection 끝 (공고 직무 탭 4카드) -->
			
			<div class="homeSection">
				<div class="homeSectionHeader">
					<p>최근에 올라 온 공고</p>
				</div>
				<div class="homeSectionBody d-flex justify-content-between">
					<c:forEach items="${recruitList }" var="recruit">
						<div class="card part-4-card recCard" idx="${recruit.recruitNo }">
							<img class="card-img-top home-card-img" src="${pageContext.request.contextPath }${recruit.coLogoPath}">
							<div class="card-body">
								<fmt:parseDate value="${recruit.recruitDdlnYmd }" var="recruitDdlnYmd" pattern="yyyyMMdd"/>
								<p class="card-text">
									~ <fmt:formatDate value="${recruitDdlnYmd }" pattern="MM월 dd일 (E)"/>
								</p>
								<c:if test="${recruit.title.length() < 20 }">
									<p class="card-text home-card-title">${recruit.title}</p>
								</c:if>
								<c:if test="${recruit.title.length() >= 20 }">
									<p class="card-text home-card-title">${recruit.title.substring(0, 20) }...</p>
								</c:if>
								<p class="card-text home-card-subtitle">${recruit.coName }</p>
								<p class="card-text">${recruit.coAddressBasic }</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>		<!-- homeSection 끝 (최신 공고 4카드) -->
		</div>		<!-- homeContainer 끝 -->
	</div>		<!-- homeBackground 끝 -->
	
<script type="text/javascript">
	$(function(){
		$('.recCard').on('click', function(){
			var recruitNo = $(this).attr('idx');
			var recUrl = "/jobel/recDetail?recruitNo="+recruitNo;
			
			location.href = recUrl;
		});
		
	});
</script>




















