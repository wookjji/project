<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.intmain {
	width: 980px;
	height: 980px;
	background-image:url("./image/campinfo.png");
	background-repeat:no-repeat;
	background-size:980px 980px;
	position: absolute;
	left: calc(50% - 500px);
	top:35px;
}

.bar {
	width: 980px;
	height: 25px;
	position: absolute;
	left: calc(50% - 500px);
	position: absolute;
	background-color: gray;
	color: white;
	margin:5px 0 0 0;
}

.basic {
	width: 100%;
	height: 1030px;
	position: relative;
}
</style>
</head>
<body>
	<!-- 오시는길 -->
	<div class="basic">
		<div class="bar">&nbsp;이용안내</div>
		<div class="intmain"></div>
	</div>
</body>
</html>