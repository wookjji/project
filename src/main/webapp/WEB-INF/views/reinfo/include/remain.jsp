<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.intmain1 {
	width: 980px;
	height: 980px;
	background-image: url("./image/pay3.png");
	background-size: 980px 490px;
	background-repeat: no-repeat;
	position: absolute;
	left: calc(50% - 500px);
	top: 35px;
}

.intmain2 {
	width: 980px;
	height: 980px;
	background-image: url("./image/pay2.png");
	background-size: 980px 980px;
	background-repeat: no-repeat;
	position: absolute;
	left: calc(50% - 500px);
	top: 525px;
}

.intmain3 {
	width: 980px;
	height: 408px;
	position: absolute;
	left: calc(50% - 500px);
	top: 1525px;
	border: solid 2px #86501D;
}

.bar {
	width: 980px;
	height: 25px;
	position: absolute;
	left: calc(50% - 500px);
	position: absolute;
	background-color: gray;
	color: white;
	margin: 5px 0 0 0;
}

.basic {
	width: 100%;
	height: 1950px;
	position: relative;
}
.str{
width: 980px;
height: 100px;
border: solid 2px #86501D;
padding: 10px 0 10px 0;
box-sizing: border-box;
}
.std1{
width: 140px;
height: 100px;
border: solid 2px #86501D;
text-align: center;;
line-height: 40px;
margin: 10px 0 10px 0;
box-sizing: border-box;
font-size: 20px;
background: #86501D;
color:white;
}
.std2{
width: 140px;
height: 100px;
border: solid 2px #86501D;
text-align: center;;
line-height: 40px;
margin: 10px 0 10px 0;
box-sizing: border-box;
font-size: 20px;
}
</style>
</head>
<body>
	<div class="basic">
		<div class="bar">&nbsp;예약안내</div>
		<div class="intmain1"></div>
		<div class="intmain2"></div>
		<div class="intmain3">
		
			<table>
				<tr class="str">
					<td class="std1">SITE</td>
					<td class="std1">1일 비용</td>
					<td class="std1">주말 비수기</td>
					<td class="std1">평일 성수기</td>
					<td class="std1">주말 성수기</td>
					<td class="std1">평일 극성수기</td>
					<td class="std1">주말 극성수기</td>
				</tr>
				<c:forEach items="${pricelist }" var="pl">
					<tr class="str">
					<c:set var="si_pfs" value="${pl.si_pfs+pl.si_price}"/>
					<c:set var="si_pwe" value="${pl.si_pwe+pl.si_price}"/>
					<c:set var="si_hfs" value="${pl.si_hfs+pl.si_price}"/>
					<c:set var="si_hwe" value="${pl.si_hwe+pl.si_price}"/>
					<c:set var="si_lfs" value="${pl.si_lfs+pl.si_price}"/>
						<td class="std1">${pl.si_type }</td>
						<td class="std2">${pl.si_price}원</td>
						<td class="std2"><c:out value="${si_lfs}"/>원</td>
						<td class="std2"><c:out value="${si_pwe}"/>원</td>
						<td class="std2"><c:out value="${si_pfs}"/>원</td>
						<td class="std2"><c:out value="${si_hwe}"/>원</td>
						<td class="std2"><c:out value="${si_hfs}"/>원</td>
					</tr>
				</c:forEach>
			</table>

		</div>

	</div>
</body>
</html>