<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
function exit() {
	location.href="/main";
}
$(function(){
	$("#menu_re").click(function(){
		$("#state").submit();
	})
	
})
</script>
<style type="text/css">
body{
margin: 0;
padding: 0;
}
.menu{
width: inherit;
height: 40px;
display: block;
text-align: center;
line-height: 40px;
font-size: 20px;
color: white;
}
.menu:hover{
background-color: white;
color: black;
cursor: pointer;
transition: all 0.5s ease-out;
}
.reserve{
border-top: 1px solid white;
}
.menubox{
width: 180px;
height: 100vh;
background-color: black;
float: left;
overflow: hidden;
}
.logo{
width: 180px;
height: 100px;
color: white;
display: block;
text-align: center;
line-height: 100px;
font-size: 30px;
font-weight: bold;
}

.logo:hover{
cursor: pointer;
background-size: 180px 100px;
background-image: url("./resources/image/camp.jpg");
transition: all 1s ease-out;
color: black;
display:block;
content: "aa";
}
</style>
</head>
<body>
<div class="menubox">
<span class="logo" onclick="location.href='/admin'">IGO CAMP</span>
<form action="/state" method="post" id="state"><span class="menu" id="menu_re" >예약 현황</span></form>
<span class="menu" onclick="location.href='/reserve'">예약 관리</span>
<span class="menu" onclick="location.href='/refund'">환불</span>
<span class="menu" onclick="location.href='/siteinfo'">SITE 관리</span>
<span class="menu" onclick="location.href='/'">나가기</span>
<span class="menu" onclick="location.href='/logout'">로그아웃</span>
</div>
</body>
</html>