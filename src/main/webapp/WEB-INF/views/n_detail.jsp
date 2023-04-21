<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta charset="UTF-8">
<title>아이고 캠핑장</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script>

	</script>
<style>
	ul{ list-style: none; color: white; }
	li{ list-style: none; }
	.wholebox{ width:980px; height:800px; margin: 0 auto; padding:0; }
	.top{ width: 980px; height: 25px; text-align: center;
	margin: 0; padding: 0; background-color: #3C2317; }
	.top_left{ width:80px; height: 20px; float: left; line-height: 25px; }
	.top_right{ width: 900px; height: 25px; float: left; line-height: 25px; }
	.text{ position: relative; left: 350px; }
	.t{ height: 20px; }
	.date{ width:980px; height: 30px; }
	.empty{ height: 30px; width: 840px; float: left; }
	.date_empty{ height: 30px; width: 140px; line-height: 30px; 
	 font-size: 15px; float: left; color: black; }
	.title{ height: 50px; width:100%; line-height: 50px; 
	border-bottom: 2px solid gray; font-size: x-large; }
	.content{ height: 400px; border-bottom: 2px solid gray; }
	.list{ width:980px; height:30px; }
	.listbtn{ width: 40px; height: 25px; position: relative; left:930px; top: 8px; }
	button{ width: 40px; height: 25px; border-radius: 5px; }
	.btns{ width:980px; height: 40px; }
	.modBtn{ position: relative; left: 10px; bottom: 16px;}
	.delBtn{ position: relative; left: 60px; bottom: 61px; }
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
	<!-- page content -->
<div class="wholebox">
	<ul class="top">
		<li class="top_left"><b>공지사항</b></li>
		<li class="top_right"><p class="text">COMMUNITY > 공지사항</p></li>
	</ul>
	<div class="t"></div>
	<ul class="date">
		<li class="empty"></li>
		<li class="date_empty"><b>작성일 : ${detail.n_date }</b></li>
	</ul>
	<div class="title">
		<h3>글제목 : ${detail.n_title }</h3>
	</div>
	<div class="content">
	<br>
		<h4>관리자 </h4><br>
		${detail.n_content }
	</div>
	<br>
	<div class="btns">
	
		<button class="listbtn" onclick="history.go(-1); return flase;">목록</button>
	
	<c:if test="${sessionScope.id ne null }">
		<form action="/modify" method="post">
			<input type="hidden" name="rownumber" value=${detail.n_no }>
			<button class="modBtn" id="rewrite" >수정 </button>
		</form><br>
		<form action="/noticeDel" method="post">
			<input type="hidden" name="rownumber" value=${detail.n_no }>
			<button class="delBtn" id="delete" >삭제 </button>
		</form>
	</c:if>
	</div>
</div>	
<!-- 하단 바-->
<%@ include file="./common/bottom.jsp" %>
<!-- 사이드 바-->
<%@ include file="./common/sidebar.jsp" %>
</body>
</html>
<script>

</script>