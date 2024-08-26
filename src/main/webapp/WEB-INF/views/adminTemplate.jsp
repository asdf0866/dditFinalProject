<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta id="_csrf" name="_csrf" content="${_csrf.token }">
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName }">
<title>JOB을래? - 마이 페이지</title>
<link href="${pageContext.request.contextPath }/resources/css/adminCSS.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	var token = "";			//	시큐리티 인증 시, 사용할 토큰 정보
	var header = "";		//	시큐리티 인증 시, 사용할 토큰 Key
	$(function(){
		token = $('meta[name="_csrf"]').attr('content');
		header = $('meta[name="_csrf_header"]').attr('content');
	});
</script>
</head>
<body>
	<div id="wrapper" class="wrap">
		<div id="aside" class="aside">
			<tiles:insertAttribute name="aside"/>
		</div>
		
		<div id="container" class="container">
			<tiles:insertAttribute name="body" />
		</div>
	</div>
</body>
</html>