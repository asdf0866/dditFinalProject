<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta id="_csrf" name="_csrf" content="${_csrf.token }">
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName }">
<title>JOB을래 - 기업회원</title>

	<!-- Favicons -->
	<link href="${pageContext.request.contextPath }/resources/niceadmin/img/favicon.png" rel="icon">
	<link href="${pageContext.request.contextPath }/resources/niceadmin/img/apple-touch-icon.png" rel="apple-touch-icon">

	<!-- Google Fonts -->
	<link href="https://fonts.gstatic.com" rel="preconnect">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

	<!-- Vendor CSS Files -->
	<link href="${pageContext.request.contextPath }/resources/niceadmin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/niceadmin/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/niceadmin/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/niceadmin/vendor/quill/quill.snow.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/niceadmin/vendor/quill/quill.bubble.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/niceadmin/vendor/remixicon/remixicon.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/niceadmin/vendor/simple-datatables/style.css" rel="stylesheet">

	<!-- Template Main CSS File -->
	<link href="${pageContext.request.contextPath }/resources/niceadmin/css/style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/companyCSS.css" rel="stylesheet">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/js/jquery.serialize-object.min.js"></script>
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
<body>
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Header 영역 -->
		<tiles:insertAttribute name="header" />
		
		<!-- Content 영역 -->
		<div id="content-wrapper" class="d-flex flex-column">
			<tiles:insertAttribute name="aside" />
			<!-- Main Content -->
			<tiles:insertAttribute name="body"/>
		</div>
        
		<!-- Footer 영역 -->
		<tiles:insertAttribute name="footer" />
	</div>
	
	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="${pageContext.request.contextPath }/resources/niceadmin/vendor/apexcharts/apexcharts.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/niceadmin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<%-- 	<script src="${pageContext.request.contextPath }/resources/niceadmin/vendor/chart.js/chart.umd.js"></script> --%>
	<script src="${pageContext.request.contextPath }/resources/niceadmin/vendor/echarts/echarts.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/niceadmin/vendor/quill/quill.js"></script>
	<script src="${pageContext.request.contextPath }/resources/niceadmin/vendor/simple-datatables/simple-datatables.js"></script>
	<script src="${pageContext.request.contextPath }/resources/niceadmin/vendor/tinymce/tinymce.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/niceadmin/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="${pageContext.request.contextPath }/resources/niceadmin/js/main.js"></script>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=126a30d2a46843ee25bc69a141aa9849&libraries=services"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
	
</body>
</html>














