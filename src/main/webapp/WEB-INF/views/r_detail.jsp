<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>아이고 캠핑장</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	
	<script>
	$(function(){
		$("#list").click(function(){
			var list="<form id='review' action='/review' method='post'></form>"
			$("#list").append(list);
			$("#notice").submit();
		})
	})
	</script>
<style>
	ul{ list-style: none; }
	li{ list-style: none; color: white; }
	.wholebox{ width:980px; height:1300px; margin: 0 auto; padding:0;}
	.top{ width: 980px; height: 25px; text-align: center; margin: 0; padding: 0; background-color: #3C2317;}
	.top_left{ width:80px; height: 20px; float: left; line-height: 25px; }
	.top_right{ width: 900px; height: 25px; float: left; line-height: 25px; }
	.text{ position: relative; left: 350px; }
	.t{ height: 20px; }
	.date{ width:980px; height: 30px; }
	.empty{ height: 30px; width: 840px; float: left; }
	.date_empty{ height: 30px; width: 140px; line-height: 30px; 
	 font-size: 15px; float: left; }
	.title{ height: 50px; width:100%; line-height: 50px; 
	border-bottom: 2px solid gray; font-size: x-large; }
	.content{ height: 400px; border-bottom: 2px solid gray; }
	.listbtn{ width: 40px; height: 25px; position: relative; left:930px; }
	.photo1 { width:450; height: 300px; float:left; margin-left: 25px; margin-bottom: 20px; }
	.photo{ height:650px; border-bottom: 1px solid gray;}
</style>
</head>
<body>
<div>
	<!-- 탑바-->
<%@ include file="./common/topbar.jsp" %>
<!-- 메뉴-->
<%@ include file="./common/menu.jsp" %>
<!-- 메인 -->
<%@ include file="./common/main.jsp" %>
</div>
	
<div class="wholebox">
	<ul class="top">
		<li class="top_left"><b>이용후기</b></li>
		<li class="top_right"><p class="text">COMMUNITY > 이용후기</p></li>
	</ul>
	<div class="t"></div>
	<ul class="date">
		<li class="empty"></li>
		<li class="date_empty">작성일 : ${detail.rv_date }</li>
	</ul>
	<div class="title">
		<h3>글제목 : ${detail.rv_title }</h3>
	</div>
	<div class="content">
		<br>
		${detail.rv_content }
	</div><br><br>
	<ul class="photo">
	<c:if test="${detail.rv_photo1 ne null }"><li><img src="/resources/upFile/${detail.rv_photo1 }" class="photo1"></li></c:if>
	<c:if test="${detail.rv_photo2 ne null }"><li><img src="/resources/upFile/${detail.rv_photo2 }" class="photo1"></li></c:if><br>
	<c:if test="${detail.rv_photo3 ne null }"><li><img src="/resources/upFile/${detail.rv_photo3 }" class="photo1"></li></c:if>
	</ul>
	<br>
	<button class="listbtn" onclick="history.go(-1); return flase;">목록</button>

</div>	
<!-- 하단 바-->
<%@ include file="./common/bottom.jsp" %>
<!-- 사이드 바-->
<%@ include file="./common/sidebar.jsp" %>
</body>
</html>
<script>

</script>