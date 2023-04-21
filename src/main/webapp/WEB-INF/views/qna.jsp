<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<meta charset="UTF-8">
	<title>아이고 캠핑장</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
var start=${start}  
var end=${end}  
var page_number=${page_number}  
var check=${check}  
var sort="${sort}"  
var search="${search}"  
var screen_number=${screen_number} 


</script>
<style>
#after{display:none;}
	#before
	{display:none;}
	.list_present{ color: red;}
	table { border-collapse: collapse; } 
	caption{ align: center; }
	ul{ list-style: none; color:white; }
	li{ list-style: none; }
	th{ height: 35px; background-color: #cccc; }
	td{ height: 35px;}
	.wholebox{ width:980px; height:900px; margin: 0 auto; padding:0; }
	.top{ width: 980px; height: 25px; text-align: center;
	margin: 0; padding: 0; background-color: #3C2317;}
	.top_left{ width:80px; height: 20px; float: left; line-height: 25px; }
	.top_right{ width: 900px; height: 25px; float: left; line-height: 25px; }
	.text{ position: relative; left: 350px; }
	.empty{ width:980px; height: 50px; }
	.middle{ width:980px; height: 730px; }
	.notice{ width: 940px; height: 560px; border-width: 1px 0px 1px; margin: 0 auto; }
	.no{ width: 90px; text-align: center;}
	.title1{ width: 700px; position: relative; left:10px; }
	.title{ width: 700px; }
	.date{ width: 190px; text-align: center; }
	.reple{ width: 50px; text-align: center; background-color: #cccc  }
	.write_btn{ width: 940px; height: 50px; }
	.btn{ width: 80px; height: 30px; color: white; font-size: 15px;
	border-radius: 5px; background-color: #628E90; position: relative;
	left:850px; top: 15px; }
	.page_search{ width: 980px; height: 80px; text-align: center; }
	.paging{ width: 400px; height: 40px; line-height: 40px; }
	.search{ width:400px; height: 40px; line-height: 40px; }
	#search{ height: 25px; width:150px;}
	#sort{ height: 25px; width: 100px;}
	#search_btn{width:50px; height: 25px; font-size:15px; border-radius: 5px;
	background-color: #628E90; color:white;}
	
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
<!-- 전체  -->
<div class="wholebox">
	<ul class="top">
		<li class="top_left"><b>Q&A</b></li>
		<li class="top_right"><p class="text">COMMUNITY > Q&A</p></li>
	</ul>
	<div class="empty"></div>
	<div class="middle">
		<div class="notice">
			<!-- 공지사항 목록  -->
			<table border="1">
				<thead>
				<tr>
					<th class="no">번호</th>
					<th class="title">제목</th>
					<th class="date">작성일</th>
				</tr>
				</thead>
				<c:forEach items="${qlist}" var="row">
					<tbody>
						<tr>
							<td class="no">${row.rownumber}</td>
							<td class="title1"><a href="q_detail?rownumber=${row.q_no}">${row.q_title} </a></td>
							<td class="date">${row.q_date }</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		<!-- notice 끝  -->
		</div> 
		<!-- 글쓰기 버튼  -->
		<div class="write_btn">
			<button class="btn" onclick="location.href='/q_write'">글쓰기</button>
		</div>
		<!-- paging & search 기능   -->
		<div class="page_search">
			<!-- paging -->
			<div class="paging">
				<a id="before">◀</a>
				<c:forEach var="i" begin="${start}" end="${end}" step="1">
					<c:choose>
						<c:when test="${i == page_number}">
							<a class="list_present" onclick="test(this)">${i }</a>
						</c:when>
						<c:otherwise>
							<a class="list" onclick="test(this)">${i }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<a id="after">▶</a>
			</div>
			<!-- search  -->
			<div class="search">
				<form id="alt" action="/qna" method="post">
					<input type="hidden" name="page_number" id="page_number" value=${page_number }>
					<input type="hidden" name="screen_number" id="screen_number" value="${screen_number }">
					<select id="sort" class="select" name="sort">
						<option value="" <c:if test="${sort eq ''}">selected="selected"</c:if>>선택하세요</option>
						<option id="q_title" value="q_title" <c:if test="${sort eq 'q_title'}">selected="selected"</c:if>>제목</option>
						<option id="q_content" value="q_content" <c:if test="${sort eq 'q_content'}">selected="selected"</c:if>>내용</option>
					</select>
					<input type="text" name="search" id="search" value=${search }>
					<button id="search_btn" type="button">검색</button>
				</form>
			</div>
		<!-- paging & search 끝  -->
		</div>
	<!-- middle 끝  -->
	</div>
<!-- wholebox 끝  -->
</div>
<!-- 하단 바-->
<%@ include file="./common/bottom.jsp" %>
<!-- 사이드 바-->
<%@ include file="./common/sidebar.jsp" %>
</body>
<script>
var start=${start} 
var end=${end} 
var check=${check} 
var screen_number=${screen_number} 
function test(text){
	document.getElementById("sort").value="${sort}" 
	document.getElementById("search").value="${search}" 
	document.getElementById("page_number").value=text.innerHTML;
	document.getElementById("screen_number").value=${screen_number};
	document.getElementById("alt").submit();
}
$(function(){
	if(check===1 || check===0){
		$("#after").css("display","inline");
	}
	if(check===1 || check===2){
		$("#before").css("display","inline");
	}
	$("#after").click(function(){
		$("#page_number").val(${end}+1);
		$("#screen_number").val(${screen_number}+1);
	 	$("#sort").val("${sort}");
		$("#search").val("${search}");
		$("#alt").submit();
	})
	$("#before").click(function(){
		$("#page_number").val(${start}-1);
		$("#screen_number").val(${screen_number}-1);
		$("#sort").val("${sort}");
		$("#search").val("${search}");
		$("#alt").submit();
	})
	$("#search_btn").click(function(){
		$("#page_number").val(1);
		$("#screen_number").val(1);
		$("#alt").submit();
	})
})
</script>
</html>