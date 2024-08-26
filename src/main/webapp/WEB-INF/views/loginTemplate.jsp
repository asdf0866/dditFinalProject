<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta id="_csrf" name="_csrf" content="${_csrf.token }">
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName }">
<title>Log in</title>

	<!-- All-Sign Stylesheet -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/loginCSS.css" rel="stylesheet">
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
<c:if test="${not empty message }">
	<script type="text/javascript">
		alert("${message}");
		<c:remove var="message" scope="request"/>
	</script>
</c:if>
<body>
	<!-- content영역 -->
	<tiles:insertAttribute name="body"/>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	const signup = document.getElementById("sign-up");
	const signin = document.getElementById("sign-in");
	loginin = document.getElementById("login-in");
	loginup = document.getElementById("login-up");
	
	$(function(){
		token = $('meta[name="_csrf"]').attr('content');
		header = $('meta[name="_csrf_header"]').attr('content');
	});
	
// 	signup.addEventListener("click", () => {
// 		loginin.classList.remove("block");
// 		loginup.classList.remove("none");
	
// 		loginin.classList.add("none");
// 		loginup.classList.add("block");
// 	});
	
// 	signin.addEventListener("click", () => {
// 		loginin.classList.remove("none");
// 		loginup.classList.remove("block");
	
// 		loginin.classList.add("block");
// 		loginup.classList.add("none");
// 	});

</script>
</html>














