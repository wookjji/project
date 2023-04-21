:<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>아이고 캠핑장 </title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style type="text/css">
textarea{ resize: none;}
li{ list-style: none; }
.header{ width: 100%; height: 600px; margin: 0 auto; }
article{ width:940px; height:600px; margin: 0 auto; }
body{ margin:0; padding: 0; }
.container{ width: 980px; height: 650px; margin: 0 auto;}
.title{ width: 900px; height: 50px; margin-left: 5px; }
.text{ width: 500px; height: 30px; border-radius: 5px; position: relative; top:8px; }
.write{ width: 940px; height: 350px; border-radius: 5px; }
.save_btn{ width: 940px; height: 50px; }
.btn{ width: 80px; height: 30px; color: white; font-size: 15px;
border-radius: 5px; background-color: #628E90; line-height: 10px;}
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
			<b style="font-size: 40px;">공지사항 수정하기</b>
			<br><br>
			
			<form action="/n_modify" method="post">
				<div class="title">
					<b style="font-size: 20px;"> 제목 :</b> 
					<textarea class="text" name="title">${detail.n_title }</textarea>
				</div>
				<div>
				<textarea class="write" id="content" name="content" maxlength="1000" rows="30">${detail.n_content }</textarea>
				</div>
				<br>
				<div class="save_btn">
					<input type="hidden" name="rownumber" value=${detail.n_no }>
					<button class="btn" type="submit">저장</button>
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