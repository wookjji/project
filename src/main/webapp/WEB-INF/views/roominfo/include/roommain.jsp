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
	height: 1100px;
	border: solid 1px black;
	padding: 40px;
	box-sizing: border-box;
	position: absolute;
	left: calc(50% - 500px);
}

.roominfo {
	width: 440px;
	height: 440px;
	border: 1px solid black;
	float: left;
	margin: 5px;
	box-sizing: border-box;
}

.image_roominfo {
	width: 440px;
	height: 440px;
	border: 1px solid black;
	float: left;
	margin: 5px;
	box-sizing: border-box;
	background-image: url("./image/tent.jpg");
	background-size: 440px 440px;
	background-repeat: no-repeat;
}

.roombase {
	width: 100%;
	height: 1100px;
	position: relative;
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
	height: 1000px;
	padding: 15px 0 15px 0;
	box-sizing: border-box;
}

.right {
	padding-top: 30px;
	text-align: right;
	width: 900px;
	height: 30px;
	position: absolute;
	bottom: 20px;
}

.roominfo1 {
	width: 430px;
	height: 400px;
}

.roominfo2 {
	width: 430px;
	height: 30px;
	text-align: center;
	line-height: 30px;
	font-size: 25px;
}
</style>
</head>
<body>
	<div class="roombase">
		<div class="roominfobox">
			<div class="roomtitle">&nbsp;객실안내</div>
			<div class="roombox">

				<c:forEach items="${list}" var="s">
					<a href="./roominfodetail?si_type=${s.si_type}">
						<div class="roominfo">
							<div class="roominfo1">
								<img src="./resources/upFile/${s.si_photo1}" height="400px"
									width="430px">
							</div>
							<div class="roominfo2">
								<b>${s.si_type}</b>
							</div>
						</div>
					</a>
				</c:forEach>
				<div class="image_roominfo"></div>
				<c:if test="${sessionScope.id ne null }">
					<div class="right">
						<button type="button" onclick="location.href='./roominfowrite'">글수정</button>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>