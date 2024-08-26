<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<main id="main" class="main">
	<div class="pagetitle">
		<h1>Dashboard</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="/jobel/co_home">Home</a></li>
				<li class="breadcrumb-item active">Dashboard</li>
			</ol>
		</nav>
	</div>
	<!-- End Page Title -->

	<section class="section dashboard">
		<div class="row">
			<div class="col-lg-6">
				<div class="card basic dashboardCard">
					<div class="card-body">
						<div class="card-title">
							<h5 class="card-text" style="font-weight: 600;">채용 공고</h5>
						</div>
						<hr class="my-2" />
						<table class="table table-bordered table-striped text-center">
							<tr>
								<th class="col-1">#</th>
								<th class="col-7">제목</th>
								<th class="col-2">조회수</th>
								<th class="col-2">마감일자</th>
							</tr>
							<c:choose>
								<c:when
									test="${recruitList == null or recruitList == '' or empty recruitList }">
									<c:forEach begin="1" end="5" step="1">
										<tr>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
											<td>&nbsp;</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:forEach items="${recruitList }" var="recruit"
										varStatus="stat">
										<tr class="recData" idx="${recruit.recruitNo }">
											<td>${stat.count }</td>
											<td><c:set value="${recruit.title }" var="recTitle" /> <c:if
													test="${recTitle.length() <= 20 }">${recTitle }</c:if> <c:if
													test="${recTitle.length() > 20 }">${recTitle.substring(0, 20) }...</c:if>
											</td>
											<td>${recruit.hit }회</td>
											<td><fmt:parseDate value="${recruit.recruitDdlnYmd }"
													pattern="yyyyMMdd" var="recruitDdlnYmd" /> <fmt:formatDate
													value="${recruitDdlnYmd }" pattern="yyyy-MM-dd" /></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>

						</table>
						<hr class="my-1" />
						<div class="row justify-content-end">
							<a
								class="badge bg-secondary col-sm-2 rounded-pill float-right d-block me-3"
								href="/jobel/co_rec_list"> <i class="bi bi-collection me-1"></i>
								공고 목록
							</a>
						</div>
					</div>
				</div>
			</div>
			<!-- card col-lg-6(공고) 끝 -->
			<div class="col-lg-6">
				<div class="card basic dashboardCard">
					<div class="card-body">
						<div class="card-title"
							style="padding-bottom: 10px; margin-bottom: 5px;">
							<h5 class="card-text" style="font-weight: 600;">지원자 현황</h5>
						</div>
						<div class="card-chart">
							<div class="card-left border">
								<canvas id="genderChart" width="100" height="100"></canvas>
							</div>
							<div class="card-right border">
								<canvas id="recentChart" width="100" height="100"></canvas>
							</div>
						</div>
						<hr class="my-1" />
						<div class="row justify-content-end">
							<a
								class="badge bg-secondary col-sm-2 rounded-pill float-right d-block me-3"
								href="/jobel/co_apply_list"> <i
								class="bi bi-collection me-1"></i> 지원자 관리
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- row 끝 -->
	</section>
</main>
<!-- End #main -->

<script type="text/javascript">
		var recData = $('.recData');			//	채용 공고 목록
		var genderCrt = $('#genderChart');		//	지원자 성비율 차트
		var recentCrt = $('#recentChart');		//	일일 지원자 수 차트
		
		recData.on('click', function(){
			var recNo = $(this).attr('idx');
			location.href = "/jobel/co_rec_detail?recruitNo=" + recNo;
		});
		
		var genderChart = new Chart(genderCrt, {
			type : 'bar',
			data : {
				labels : ${genderName},
				datasets : [{
					label : "게시된 공고 지원자 성비율",
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
	</script>


