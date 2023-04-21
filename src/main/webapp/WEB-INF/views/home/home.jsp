<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>
</head>

<body >
<div class="big">
<!-- 탑바-->
<%@ include file="../common/topbar.jsp" %>
<!-- 메뉴-->
<%@ include file="../common/menu.jsp" %>
<!-- 메인-->
<%@ include file="./include/main.jsp" %>
<!-- 지도-->
<%@ include file="./include/kakaomap.jsp" %>
<!-- 하단 바-->
<%@ include file="./include/bottom.jsp" %>
<!-- 사이드 바-->
<%@ include file="../common/sidebar.jsp" %>
</div>

</body>
</html>
