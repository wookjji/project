<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.top1{
  width: 100%;
  height: 50px;
  background-color: #D3D3D3;
  border: 1px solid black;
  border-width:0 0 1px 0;
}
.top2{
  margin: 0 auto;
  width: 1000px;
  height: 50px;
  line-height: 50px;
  text-align: right;
}

a:link{
  color:black;
  text-decoration-line: none;
}
a:visited {
 color:black;
 }
a:hover{
  color:red;
  text-decoration-line: none;
}



</style>
</head>
<body>
<!-- 탑바-->
<div class="top1">
<div class="top2">
<a href="/">home</a> | <a href="/login">관리자로그인</a> | <a href="/admin">관리자페이지</a>
</div>
</div>
</body>
</html>