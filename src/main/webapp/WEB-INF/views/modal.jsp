<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./resources/css/modal1.css?v=10" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<style type="text/css">
.chlimit{
text-align: center;
}
</style>
</head>
<body>
<div class="modal">
		<div class="modal_body">
		<div class="close_modal" style="cursor:pointer">X</div>
				<form action="/siteinfo" method="post" id="site">
				<h3 class="text">방 이름<input type="text" name="chtype" class="chtype"></h3>
				<h3 class="text">최대 인원 수<input type="number" name="chlimit" class="chlimit" style="text-align:right;"></h3>
				<h3 class="text">번호<input type="number" name="chnum" class="chnum" readonly="readonly"></h3>
				<button type="submit" class="check">수정</button>
				</form>
		</div>
</div>
</body>
</html>