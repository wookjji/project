<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.roominfobox {
	width: 980px;
	height: 1500px;
	position: absolute;
	left: calc(50% - 500px);
	padding: 40px;
	box-sizing: border-box;
}

.roominfo {
	width: 440px;
	height: 440px;
	float: left;
	margin: 5px;
	box-sizing: border-box;
}

.roombase {
	width: 100%;
	height: 1500px;
	position: relative;
	margin: 20px 0 20px 0;
}

.roomtitle {
	width: 100%;
	height: 25px;
	background-color: gray;
	color: white;
	box-sizing: border-box;
	line-height: 25px;
}

.roombox {
	width: 900px;
	height: 930px;
	padding: 15px 0 15px 0;
	box-sizing: border-box;
}

.right {
	padding-top: 30px;
	text-align: right;
	width: 900px;
	height: 30px;
	background-color: purple;
}

.textbox {
	padding: 25px 25px 25px 25px;
	margin: 25px 0 25px 0;
	width: 900px;
	height: 200px;
	border: solid black 1px;
	box-sizing: border-box;
	background-color: white;
	font-size: 25px;
}

.itemimg {
	width: 900px;
	height: 250px;
}
</style>
</head>
<body>
	<div class="roombase">
		<div class="roominfobox">
			<div class="roomtitle">&nbsp;${detail.si_type}캠프 사이트 사진</div>
			<div class="roombox">

				<c:if test="${detail.si_photo1 ne null}">
					<img src="./resources/upFile/${detail.si_photo1} " class="roominfo">
				</c:if>
				<c:if test="${detail.si_photo2 ne null}">
					<img src="./resources/upFile/${detail.si_photo2} " class="roominfo">
				</c:if>
				<c:if test="${detail.si_photo3 ne null}">
					<img src="./resources/upFile/${detail.si_photo3} " class="roominfo">
				</c:if>
				<c:if test="${detail.si_photo4 ne null}">
					<img src="./resources/upFile/${detail.si_photo4} " class="roominfo">
				</c:if>
			</div>
			<div class="textbox">${detail.si_content }</div>
			<img src="./image/iteminfo.png" class="itemimg">
		</div>
	</div>
</body>
</html>