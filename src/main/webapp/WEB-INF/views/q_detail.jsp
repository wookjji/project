<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>아이고 캠핑장</title>
	<link rel="stylesheet" href="resources/css/modal.css" type="text/css"></link>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript" src="./resources/js/modal.js" ></script> 
<script >

</script>
	
<style>
	textarea{ resize: none; font-size: 15px; }
	ul{ list-style: none; }
	li{ list-style: none; color: white;}
	button{ cursor:pointer; }
	.wholebox{ width:980px; height:800px; 
	margin: 0 auto; padding:0;}
	.top{ width: 980px; height: 25px; text-align: center;
	margin: 0; padding: 0; background-color: #3C2317;}
	.top_left{ width:80px; height: 20px; float: left; line-height: 25px; }
	.top_right{ width: 900px; height: 25px; float: left; line-height: 25px; }
	.text{ position: relative; left: 350px; }
	.t{ height: 20px; }
	.date{ width:980px; height: 30px; }
	.empty{ height: 30px; width: 840px; float: left; }
	.date_empty{ height: 30px; width: 140px; line-height: 30px; font-size: 15px; float: left; color: black;  }
	.title{ height: 50px; width: 100%; line-height: 50px;
	border-bottom: 2px solid gray; font-size: x-large; }
	.content{ height: 250px;  }
	.password{ height: 25px; }
	.modifyBtn{ width: 980px; height: 40px; line-height: 40px; }
	.modBtn{ width:40px; height: 25px; }
	.list{ width:40px; height:30px; position: relative; bottom: 32px; left: 460px; }
	.listbtn{ width: 40px; height: 25px; }
	.reple{ width: 980px; height: 100px; }
	.repBtn{ width:60px; height: 25px; position: relative; bottom: 10px; left: 30px; }
	
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
		<li class="date_empty"><b>작성일 : ${detail.q_date }</b></li>
	</ul>
	<div class="t"></div>
	<div class="title">
		<h3>글제목 : ${detail.q_title }</h3>
	</div>
	<div class="content">
		<br>
		${detail.q_content }
	</div>
	<div class="t"></div>
	
	<c:if test="${sessionScope.id ne null }">
		<form action="/reple" method="post">
			<input type="hidden" name="q_no" id="q_no" value=${detail.q_no }>
			<textarea name="reple" rows="10" cols="105" id="q_answer" > ${detail.q_answer}</textarea>
			<br><br>
			<button type="submit" id="reple">답변하기</button>
		</form>
	</c:if>
		<c:if test="${sessionScope.id eq null }">		
			<textarea name="reple" rows="10" cols="105" readonly="readonly">${detail.q_answer}</textarea>
		</c:if>
		
	<div class="t"></div>
	
	<!-- 수정 비밀번호 확인  -->
	<div class="modifyBtn">
		<form action="/q_modify_text" method="post" id="btn_modify"> 
			글 비밀번호 : <input class="password" type="password" maxlength="4" id="q_pw">
			<input type="hidden" name="title" value=${detail.q_title }>
			<input type="hidden" name="content" value=${detail.q_content }>
			<input type="hidden" id="no" name="no" value=${detail.q_no }>
			<button type="button" class="modBtn">수정 </button>
 		</form> 
		<!-- 목록 버튼  -->
		<div class="list">
			<button class="listbtn" onclick="history.go(-1); return flase;">목록</button>
		</div>
	</div>
	
</div>	
<!-- 하단 바-->
<%@ include file="./common/bottom.jsp" %>
<!-- 사이드 바-->
<%@ include file="./common/sidebar.jsp" %>
</body>
</html>
<script type="text/javascript">
$(function(){
	$(".modBtn").click(function(){
		var q_pw = $("#q_pw").val();
		var no = $("#no").val();
		$.post({
			url: "/q_ajax",
			dataType: "text",
			data: { 
				"q_pw" : q_pw,
				"q_no"  : no
			}
		}).done(function(data){
			if(data==1){
				$("#btn_modify").submit();
			} else{
				alert("비밀번호가 존재하지 않습니다.");
				alert("올바른 비밀번호로 다시 시도해주세요.");
			}
		}).fail(function(xhr){
			alert("fail");
		});
	});
});

</script>