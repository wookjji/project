<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link href="./resources/css/date.css?v=1" rel="stylesheet" type="text/css">
<script type="text/javascript" src="./resources/js/date.js?v=3" ></script> 
<meta charset="UTF-8">
<title>날짜 설정</title>
</head>
<body>
<form id="dateform" method="post">
<div class="dateall">
<span class="datetitle">날짜설정</span>
<div class="datebox">
<div id="dates" class="reser">
<span class="maintext">일정을 선택해주세요</span><br>
<input type="text"  id="start" name="start" style ="text-align:center" readonly="readonly">
<input type="text"  id="end" name="end" style ="text-align:center" readonly="readonly">
</div>
<input type="button" id="peak" value="성수기" onclick="peak(this.form)">
<input type="button" id="hpeak" value="극성수기" onclick="hpeak()">
</form>
<br>
<br>
<table class="datetable">
	<thead>
		<tr>
			<td></td>
			<td>시작일</td>
			<td>끝일</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${datelist }" var="l">
		<tr>
			<td><input type="text" class="datename" value="${l.name }" readonly="readonly"></td>
			<td><input type="text" class="date" name="startdate" value="${l.start_date }" readonly="readonly"></td>
			<td><input type="text" class="date" name="enddate"value="${l.end_date }" readonly="readonly"></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</div>
</div>
</body>
</html>