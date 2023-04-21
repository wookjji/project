<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.roomainwirte {
	width: 980px;
	height: 930px;
	position: absolute;
	left: calc(50% - 500px);
	border: solid 1px black;
	padding: 40px;
	box-sizing: border-box;
}

.bigroomainwirte {
	width: 100%;
	height: 950px;
	position: relative;
}

#roomtextarea {
	width: 900px;
	height: 500px;
	border: solid 1px black;
	margin: 15px 0 15px 0;
}

input {
	margin: 15px 0 15px 0;
}

.roombottom {
	text-align: right;
}

button {
	width: 80px;
	height: 30px;
	text-align: center;
	font-size: 18px;
}
</style>

</head>
<body>
	<!-- 글쓰기 -->
	<div class="bigroomainwirte">
		<div class="roomainwirte">
			<form action="roominfowrite" method="post" enctype="multipart/form-data">


				제목 &nbsp;: &nbsp; <select class="num" name='si_type'>
					<option value="">-- 선택 --</option>
					<c:forEach items="${list}" var="s">
						<option value="${s.si_type}">${s.si_type}</option>
					</c:forEach>
				</select> <br> 본문작성<br>
				${si_type}
				<textarea id="roomtextarea" placeholder="본문내용" name="si_content"></textarea>
				사진1 &nbsp;:&nbsp;<input type="file" name="si_photo1" accept="image/*"><br>  
				사진2 &nbsp;:&nbsp;<input type="file" name="si_photo2" accept="image/*"><br>  
				사진3 &nbsp;:&nbsp;<input type="file" name="si_photo3" accept="image/*"><br>  
				사진4 &nbsp;:&nbsp;<input type="file" name="si_photo4" accept="image/*"><br>  
				<div class="roombottom">
					<button type="submit">글수정</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>