<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<meta charset="UTF-8">
<script type="text/javascript">
function exit() {
	location.href="/main";
}
$(function(){
	$("#sta").click(function(){
		$("#state").submit();
	})
	
})
</script>
<title>관리자 페이지</title>
<style>
.select{
width: calc(100% - 200px);
height: 100vh;
float: left;
position: relative;
overflow: hidden;
}
.logout{
font-size: 13px;
float: right;
margin-right: 10px;
}
.selectbox{
width: 990px;
height: 250px;
position: absolute;
top: calc(50% - 300px);
left: calc(50% - 480px);
}
.a{
top: 50%;
}
.circle{
width:250px;
height:250px;
display: block;
background-color: yellow;
border-radius: 250px;
float: left;
margin-right: 30px;
font-size: 30px;
text-align: center;
line-height: 250px;
}
.circle:hover{
cursor: pointer;
background-color: black;
color: white;
transition: all 0.5s ease-out;
}
</style>
</head>
<body>
<%@ include file="menu.jsp" %>
<div class="select">
	<div class="selectbox">
		<form action="/state" method="post" id="state">
		<span class="circle" id="sta">예약 현황</span>
		</form>
		<span class="circle" onclick="location.href='/reserve'">예약 관리</span>
		<span class="circle" onclick="location.href='/'">HOME</span>
	</div>
	<div class="selectbox a">	
		<span class="circle" onclick="location.href='/siteinfo'">SITE 관리</span>
		<span class="circle" onclick="location.href='/refund'">환불</span>
		<span class="circle" onclick="location.href='/logout'">로그아웃</span>
	</div>	
	
</div>
</body>
</html>
