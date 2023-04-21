<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>아이고 캠핑장 </title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function chkBtn(){
	var pw = $("#password").val();
	var title = $("#title").val();
	var content = $("#content").val();
	
	if(title.replace(/\s | /gi, "").length == 0){
		alert("제목을 입력해주세요.");
		$("#title").focus();
	}
	
	if(content.replace(/\s | /gi, "").length == 0){
		alert("내용을 입력해주세요.");
		$("#content").focus();
	}
	
	if(pw.length < 4){
		alert("4자리 숫자를 입력하세요.");
		return false;
	}else{
		console.log("통과");
		return true;
	}
}

</script>
<style type="text/css">

li{ list-style: none; }
.header{width: 100%; height: 600px; margin: 0 auto; }
article{ width:940px; height:600px; margin: 0 auto; }
body{ margin:0; padding: 0; }
.container{
width: 980px; height: 650px; margin: 0 auto;}
.title{ width: 900px; height: 40px; margin-left: 5px; }
.text{ width: 500px; height: 30px; border-radius: 5px; }
.write{ width: 940px; height: 350px; border-radius: 5px; }
.fileAdd{ width: 940px; height: 50px; }
.save_btn{ width: 940px; height: 50px; }
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
			<b style="font-size: 40px;">Q&A 글쓰기</b><br><br>
			
			
			<form action="/q_write" method="post">
				<div class="title">
					<b style="font-size: 20px;"> 제목 :</b> <input class="text" id="title" type="text" name="title" placeholder=" 제목을 입력을 입력하세요">
				</div>
				<div>
				<textarea class="write" id="content" name="content" maxlength="1000" rows="30" placeholder="내용을 입력하세요"></textarea>
				</div>
				<br>
				
				<div class="pw">
					<b style="font-size: 18px;"> 비밀번호 :</b> <input name="pw" id="password" type="text" placeholder=" 숫자 4자를 입력하세요" maxlength="4" />
				</div>
					
				<div class="save_btn">
				
					<button class="btn" type="submit" >저장</button>
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