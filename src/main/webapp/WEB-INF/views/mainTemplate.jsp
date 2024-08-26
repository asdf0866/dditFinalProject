<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>채용 연계 사이트 - JOB을래</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta id="_csrf" name="_csrf" content="${_csrf.token }">
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName }">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
<%--     <link href="${pageContext.request.contextPath }/resources/cryptocurrency/img/favicon.ico" rel="icon"> --%>
    <link rel="icon" href="data:;base64,iVBORw0KGgo=">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    
    <!-- Gothic A1 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">  

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/cryptocurrency/lib/animate/animate.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/cryptocurrency/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
<%--     <link href="${pageContext.request.contextPath }/resources/cryptocurrency/css/bootstrap.min.css" rel="stylesheet"> --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="${pageContext.request.contextPath }/resources/cryptocurrency/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/niceadmin/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    
    <!-- 직접 제작한 CSS -->
    <link href="${pageContext.request.contextPath }/resources/css/resumeCSS.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/recruitCSS.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/resources/css/reviewCSS.css" rel="stylesheet">
    
    <!-- PDF 라이브러리 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
	
	<!-- JQUERY -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.serialize-object.min.js"></script>
    
    <!-- chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
    
    <script type="text/javascript">
	var token = "";			//	시큐리티 인증 시, 사용할 토큰 정보
	var header = "";		//	시큐리티 인증 시, 사용할 토큰 Key
	$(function(){
		token = $('meta[name="_csrf"]').attr('content');
		header = $('meta[name="_csrf_header"]').attr('content');
	});
</script>
</head>
<c:if test="${not empty message }">
	<script type="text/javascript">
		alert("${message}");
		<c:remove var="message" scope="request"/>
	</script>
</c:if>
<sec:authorize access="hasRole('ROLE_COMPANY')">
	<script type="text/javascript">
		alert("기업 회원은 일반 페이지를 이용하실 수 없습니다.");
		location.href = "/jobel/co_home";
	</script>
</sec:authorize>
<body>
    <!-- Page Wrapper -->
    <div id="wrapper">
		<!-- Header 영역 -->
			<tiles:insertAttribute name="header" />

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<tiles:insertAttribute name="body"/>
		</div>
		
		<!-- Footer 영역 -->
		<tiles:insertAttribute name="footer" />
	</div>

	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<!--     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script> -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=126a30d2a46843ee25bc69a141aa9849&libraries=services"></script>
	
	<!-- JavaScript Libraries -->
	<script src="${pageContext.request.contextPath }/resources/cryptocurrency/lib/wow/wow.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/cryptocurrency/lib/easing/easing.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/cryptocurrency/lib/waypoints/waypoints.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/cryptocurrency/lib/owlcarousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/cryptocurrency/lib/counterup/counterup.min.js"></script>
	
	<!-- Template Javascript -->
	<script src="${pageContext.request.contextPath }/resources/cryptocurrency/js/main.js"></script>
</body>

</html>