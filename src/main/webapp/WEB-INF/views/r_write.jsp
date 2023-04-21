<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>아이고 캠핑장 </title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style type="text/css">
textarea{resize:none;}
li{ list-style: none; }
.header{width: 100%; height: 600px; margin: 0 auto; }
article{ width:940px; height:600px; margin: 0 auto; }
body{ margin:0; padding: 0; }
.container{
width: 1080px; height: 750px; margin: 0 auto;}
.title{ width: 900px; height: 40px; margin-left: 5px; }
.text{ width: 500px; height: 30px; border-radius: 5px; }
.write{ width: 940px; height: 350px; border-radius: 5px; }
.fileAdd{ width: 940px; height: 150px; }
.save_btn{ width: 940px; height: 20px; }
.btn{ width: 80px; height: 30px; color: white; font-size: 15px;
	 border-radius: 5px; background-color: #628E90; position: relative;
	 left:850px; top: 15px; line-height: 15px; }
</style>
</head>
<body>

	<div class="header"> 
	<!-- 탑바-->
<%@ include file="./common/topbar.jsp" %>
<!-- 메뉴-->
<%@ include file="./common/menu.jsp" %>
<!-- 메인 -->
<%@ include file="./common/main.jsp" %>
	</div> 
	<div class="container">
		<article>
			<b style="font-size: 40px;">이용후기 글쓰기</b><br><br>
			<form action="/writePhotoSave" method="post" enctype="multipart/form-data">
				<div class="title">
					<b style="font-size: 20px;"> 제목 :</b> <input class="text" type="text" name="rv_title" placeholder=" 제목을 입력을 입력하세요">
				</div>
				<div>
				<textarea class="write" name="rv_content" maxlength="1000" rows="30" placeholder="글자 수 최대 1000"></textarea>
				</div><br>
				<div class="fileAdd">
					<input type="file" name="rv_photo1"  accept="image/*"><br><br>
					<input type="file" name="rv_photo2"  accept="image/*"><br><br>
					<input type="file" name="rv_photo3"  accept="image/*"><br><br>
					<p>* 파일명은 영어로 올려주세요.</p>
				</div>
				
				<div class="save_btn">
					<input type="hidden" name="r_no" value=${r_no }>
					<button class="btn" type="submit" id="reviewSave">등록 </button>
				</div>
			</form>
		</article>
	</div>
<!-- 하단 바-->
<%@ include file="./common/bottom.jsp" %>
<!-- 사이드 바-->
<%@ include file="./common/sidebar.jsp" %>
</body>
</html>