<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<main id="main" class="main">
		<div class="pagetitle">
			<h1>지원자 목록</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="/jobel/co_home">Home</a></li>
					<li class="breadcrumb-item"><a href="/jobel/co_apply_list">지원자 관리</a></li>
					<li class="breadcrumb-item active">상세보기</li>
				</ol>
			</nav>
		</div>
		
		<section class="section">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<div class="card-title">
								<div class="g-0 d-flex">
									<div class="col-md-3">
										<img class="img-thumbnail rounded float-start" src="${pageContext.request.contextPath }${recruit.coLogoPath }">
									</div>
									<div class="col-md-9 mx-3">
										<table class="table table-striped table-bordered align-middle text-center">
											<tr>
												<td class="text-start" colspan="4">
													<h3 class="card-title fs-3 fw-bold">${recruit.title }</h3>
													<p><b>공고 등록자 : </b>${recruit.coMemId }</p>
												</td>
											</tr>
											<tr>
												<td class="w-25 fw-bold">채용직무명</td>
												<td class="w-25">
													<input type="hidden" name="recruitJob" value="${recruit.recruitJob }">
													${recruit.jobName }
												</td>
												<td class="w-25 fw-bold">모집인원</td>
												<td class="w-25">${recruit.recruitCount }</td>
											</tr>
											<tr class="fw-bold">
												<td>근무 시간</td>
												<td>고용 형태</td>
												<td>급여</td>
												<td>공고 등록일</td>
											</tr>
											<tr>
												<td>${recruit.workTime }</td>
												<td>
													<input type="hidden" name="workType" value="${recruit.workType }" />
													${recruit.wrkTypeName }
												</td>
												<td>${recruit.salary }</td>
												<td>
													<c:set var="regDate" value="${recruit.recruitRegYmd }" />
													<fmt:parseDate value="${regDate }" pattern="yyyyMMdd" var="fmtReg"/>
													<fmt:formatDate value="${fmtReg }" pattern="yyyy-MM-dd"/>
												</td>
											</tr>
											<tr class="fw-bold">
												<td>요구 학력</td>
												<td>자격 요건</td>
												<td>채용 시작 시간</td>
												<td>채용 종료 시간</td>
											</tr>
											<tr>
												<td>
													<input type="hidden" name="requiredEducation" value="${recruit.requiredEducation }" />
													${recruit.schTypeName }
												</td>
												<td>${recruit.requiredQualification }</td>
												<td>
													<c:set var="bgngDate" value="${recruit.recruitBgngYmd}${recruit.recruitBgngDt }" />
													<fmt:parseDate value="${bgngDate }" pattern="yyyyMMddHHmm" var="fmtBgng"/>
													<fmt:formatDate value="${fmtBgng }" pattern="yy-MM-dd HH:mm"/>
												</td>
												<td>
													<c:set var="ddlnDate" value="${recruit.recruitDdlnYmd}${recruit.recruitDdlnDt }" />
													<fmt:parseDate value="${ddlnDate }" pattern="yyyyMMddHHmm" var="fmtDdln"/>
													<fmt:formatDate value="${fmtDdln }" pattern="yy-MM-dd HH:mm"/>
												</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
							
							<hr class="my-3" />
							
							<div class="card-body">
								<div class="card-title d-flex align-items-center">
									<h3 class="card-text d-block my-auto">지원자 현황</h3>
									<button type="button" class="ms-3 btn btn-primary" id="detailBtn">상세보기</button>
								</div>
								<hr/>
								<div class="card-text d-flex">
									<div class="col-4 border">
										<div class="col-12 chartHeader">
											<span class="chartHeaderText">지원자 성비율</span>
										</div>
										<div><canvas id="genderChart" width="100" height="100"></canvas></div>
									</div>
									<div class="col-4 border">
										<div class="col-12 chartHeader">
											<span class="chartHeaderText">날짜별 지원자</span>
										</div>
										<div><canvas id="recentChart" width="100" height="100"></canvas></div>
									</div>
									<div class="col-4 border">
										<div class="col-12 chartHeader">
											<span class="chartHeaderText">연령대별 지원자</span>
										</div>
										<div><canvas id="ageRangeChart" width="100" height="100"></canvas></div>
									</div>
								</div>
							</div>
							
							<hr class="my-3" />
							<div class="card-footer">
								<input type="hidden" name="recruitNo" id="recruitNo" value="${recruit.recruitNo }">
								<input type="button" class="btn btn-success" value="돌아가기" id="listBtn">
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	
	<script type="text/javascript">
		$(function(){
			//	지원자 현황 상세보기
			$('#detailBtn').on('click', function(){
				var recruitNo = $('#recruitNo').val();
				location.href = "/jobel/co_app_detail_jobseeker?recruitNo=" + recruitNo;
			});
			
			var genderCrt = $('#genderChart');			//	지원자 성비율 차트
			var recentCrt = $('#recentChart');			//	일일 지원자 수 차트
			var ageRangeCrt = $('#ageRangeChart');		//	연령대별 지원자 차트
			$('#listBtn').on('click', function(){
				location.href = "/jobel/co_apply_list";
			});
			
			var genderChart = new Chart(genderCrt, {
				type : 'bar',
				data : {
					labels : ${genderName},
					datasets : [{
						label : "지원자 성비율",
						data : ${genderData},
						backgroundColor: [
							'rgba(168, 227, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 99, 132, 0.2)',
						],
						borderColor: [
							'rgba(168, 227, 132, 1)',
							'rgba(54, 162, 235, 1)',
							'rgba(255, 99, 132, 1)',
						],
						borderWidth: 1
					}]
				},
				options : {
					scales : {
						y : {
							beginAtZero : true
						}
					}
				}
			});		//	genderChart 종료
			
			var recentChart = new Chart(recentCrt, {
				type : "line",
				data : {
					labels : ${recentName},
					datasets : [{
						label : "지원자 수",
						lineTension : 0.1,
						backgroundColor : "rgba(78, 115, 223, 0.1)",
						borderColor : "rgba(78, 115, 223, 1)",
						pointRadius : 1,
						pointBackgroundColor : "rgba(78, 115, 223, 1)",
						pointBorderColor : "rgba(78, 115, 223, 1)",
						pointHoverRadius : 3,
						pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
						pointHoverBorderColor: "rgba(78, 115, 223, 1)",
						pointHitRadius: 1,
						pointBorderWidth: 1,
						data : ${recentData},
						fill : false
					}]
				},
				option : {
					maintainAspectRatio: false,
					layout: {
						padding: {
							left: 10,
							right: 25,
							top: 25,
							bottom: 0
						}
					},
					scales: {
						xAxes: [{
							time: {
								unit: 'date'
							},
							gridLines: {
								display: false,
								drawBorder: false
							},
							ticks: {
								maxTicksLimit: 12
							}
						}],
						yAxes: [{
							ticks: {
								maxTicksLimit: 5,
								padding: 10,
								min: -0.05,
								max: 0.05,
								beginAtZero : true
							},
							gridLines: {
								color: "rgb(234, 236, 244)",
								zeroLineColor: "rgb(234, 236, 244)",
								drawBorder: false,
								borderDash: [2],
								zeroLineBorderDash: [2]
							}
						}]
					},
					legend: {
						display: false
					},
					tooltips: {
						backgroundColor: "rgb(255,255,255)",
						bodyFontColor: "#858796",
						titleMarginBottom: 10,
						titleFontColor: '#6e707e',
						titleFontSize: 14,
						borderColor: '#dddfeb',
						borderWidth: 1,
						xPadding: 15,
						yPadding: 15,
						displayColors: false,
						intersect: false,
						mode: 'index',
						caretPadding: 10,
						callbacks: {
							label: function (tooltipItem, chart) {
								var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
								return datasetLabel + ': ' + number_format_div1(tooltipItem.yLabel, 2);
							}
						}
					}
				}
			});		//	recentChart 종료
			
			var ageRangeChart = new Chart(ageRangeCrt, {
				type : 'pie',
				data : {
					labels : ${ageRangeName},
					datasets : [{
						data : ${ageRangeData},
						backgroundColor : [
							'rgba(179, 0, 0, 0.2)',
							'rgba(179, 164, 0, 0.2)',
							'rgba(0, 179, 3, 0.2',
							'rgba(0, 149, 179, 0.2)',
							'rgba(152, 0, 179, 0.2)'
						],
						borderColor : [
							'rgba(179, 0, 0, 1)',
							'rgba(179, 164, 0, 1)',
							'rgba(0, 179, 3, 1)',
							'rgba(0, 149, 179, 1)',
							'rgba(152, 0, 179, 1)'
						],
						borderWidth : 1
					}]
				},
				options : {
					plugins : {
						legend : {
							position : 'top',
						},
						title : {
							display : true,
							text : '연령대별 지원자 수'
						}
					}
				},
			});		//	ageRangeChart 종료
		});
	</script>