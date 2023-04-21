<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>아이고 캠핑장</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script >

</script>
	
<style>
	textarea{ resize: none; font-size: 15px; }
	ul{ list-style: none; }
	li{ list-style: none; color: white;}
	button{ cursor:pointer; }
	.wholebox{ width:980px; height:800px; margin: 0 auto; padding:0;}
	.top{ width: 980px; height: 25px; text-align: center; margin: 0; padding: 0; background-color: #3C2317;}
	.top_left{ width:80px; height: 20px; float: left; line-height: 25px; }
	.top_right{ width: 900px; height: 25px; float: left; line-height: 25px; }
	.text{ position: relative; left: 350px; }
	.t{ height: 20px; }
	.date{ width:980px; height: 30px; }
	.empty{ height: 30px; width: 840px; float: left; }
	.date_empty{ eight: 30px; width: 140px; line-height: 30px; font-size: 15px; float: left; color: black;  }
	.title{ height: 50px; width: 100%; line-height: 50px; border-bottom: 2px solid gray; font-size: x-large; }
	.content{ height: 200px;  }
	.password{ height: 25px; }
	.modifyBtn{ width: 980px; height: 40px; line-height: 40px; }
	.modBtn{ width:40px; height: 25px; }
	.list{ width:40px; height:30px; position: relative; bottom: 32px; left: 460px; }
	.listbtn{ width: 40px; height: 25px; color: white; font-size: 15px;
	 border-radius: 5px; background-color: #628E90; position: relative; top: -20px; }
	.reple{ width: 980px; height: 220px; }
	.repBtn{ width: 60px; height: 25px; color: white; font-size: 15px;
	 border-radius: 5px; background-color: #628E90; position: relative; bottom: -10px;}
	
</style>
</head>
<body>

<!-- 기본 홈페이지  -->
<div>
	<!-- 탑바-->
<%@ include file="./common/topbar.jsp" %>
<!-- 메뉴-->
<%@ include file="./common/menu.jsp" %>
<!-- 메인 -->
<%@ include file="./common/main.jsp" %>
</div>
	<!-- page content -->
<div class="wholebox">
	<ul class="top">
		<li class="top_left"><b>Q&A</b></li>
		<li class="top_right"><p class="text">COMMUNITY > Q&A</p></li>
	</ul>
	<div class="t"></div>
	<ul class="date">
		<li class="empty"></li>
		<li class="date_empty"><b>작성일 : ${reple.q_date }</b></li>
	</ul>
	<div class="t"></div>
	<div class="title">
		<h3>글제목 : ${reple.q_title }</h3>
	</div>
	<div class="content">
		<br>
		${reple.q_content }
	</div>
	<div class="t"></div>
	
	<!-- 답변달기 button -->
	<div class="reple">
		<form action="/q_detail" method="post">
			<input type="hidden" name="rownumber" value=${reple.q_no }>
			<textarea name="reple" rows="10" cols="105"></textarea>
			<button class="repBtn">답변하기 </button>
		</form>
	</div>
	<div class="t"></div>

	<!-- 목록 버튼  -->
	<div class="list">
		<button class="listbtn" onclick="history.go(-1); return flase;">목록</button>
	</div>
</div>

<!-- 하단 바-->
<%@ include file="./common/bottom.jsp" %>
<!-- 사이드 바-->
<%@ include file="./common/sidebar.jsp" %>
</body>
</html>
<script type="text/javascript">

</script>