<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<c:if test="${param.error eq 10}">
<script type="text/javascript">
   alert("잘못된 접근입니다.");
</script>
</c:if>
<c:if test="${param.error eq 11}">
<script type="text/javascript">
   alert("ID/PW를 확인해주세요.");
</script>
</c:if>
<c:if test="${error ne null }">
<script type="text/javascript">
   alert("${error}");
</script>
</c:if>
<style type="text/css">
body{
margin:0;
padding: 0;
width: 100%;
height: 100vh;

background-color: #E8F995;
}
.loginbox{
margin-top: 300px;
margin-left: calc(50% - 162px);
width: 300px;
height: 150px;
border: 1px solid black;
border-radius:10px;
position: relative;
padding-top: 20px;
background-color: #E6EBCB;
border-style: none;
box-shadow:2px 2px 2px; gray;
}
.title{
position: absolute;
width: 150px;
height:30px;
line-height:24px;
text-align:center;
border: 1px solid black;
border-radius:5px;
color: black;
background-color:yellow;
font-size: 20px;
top: -40px;
left: 80px;
}
.login{
text-align: center;
width:inherit;
}
.box{
width: inherit;
float: left;
padding-top: 20px;
}
.text{
width: 90px;
float: left;
text-align: right;
margin-right: 10px;
}

.idtext{
width:150px;
float: left;
}
.pwtext{
width: 150px;
float: left;
}
.button{
margin-top: 30px;
width:80px;
height:30px;
border-style: none;
border-radius: 2px;
background-color: yellow;
}
.back{

width: 100px;
height:30px;
font-size: 20px;
text-align: center;
line-height: 30px;
display: block;

}
</style>
</head>
<body>
<span class="back" onclick="location.href='/'">나가기</span>
<div class="loginbox">
<span class="title">Login</span>
<div class="login">
<form action="/login" method="post">
<div class="box"><div class="text">아이디 </div><input type="text" class="idtext" name="id"></div>
<div class="box"><div class="text">비밀번호  </div><input type="password" class="pwtext" name="pw"></div>
<button class="button" type="submit">로그인</button>
</form>
</div>
</div>
</body>
</html>