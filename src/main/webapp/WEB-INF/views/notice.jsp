<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>

<head>
<meta charset="UTF-8">
	<title>아이고 캠핑장</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
var start=${start} //시작번호 
var end=${end} //끝번호 
var page_number=${page_number} //현재 페이지 번호 
var check=${check} //체크 번호 
var sort="${sort}" //검색 종류 
var search="${search}"  //검색어 
var screen_number=${screen_number} //페이지의 페이지 번호


</script>
<style>
	#before{display:none;}
	#after{display:none;}

	.list_present{ color:red;}
	table { border-collapse: collapse; }
	caption{ align: center;}
	ul{ list-style: none; color:white;}
	li{ list-style: none;}
	th{ height: 35px; background-color: #cccc}
	td{ height: 35px;}
	.wholebox{ width:980px; height:900px; margin: 0 auto; padding:0;}
	.top{ width: 980px; height: 25px; text-align: center;
	margin: 0; padding: 0; background-color: #3C2317;}
	.top_left{ width:80px; height: 20px; float: left; line-height: 25px; }
	.top_right{ width: 900px; height: 25px; float: left; line-height: 25px; }
	.text{ position: relative; left: 350px; }
	.empty{ width:980px; height: 40px; }
	.middle{ width:980px; height: 730px; }
	.notice{ width: 940px; height: 560px; border-width: 1px 0px 1px; margin: 0 auto; }
	.no{ width: 90px; text-align: center; }
	.title1{ width: 590px; }
	.title{ width: 590px; position: relative; left:10px; }
	.writer{ width: 90px; text-align: center; }
	.date{ width: 110px; text-align: center; }
	.check1{ width: 60px; text-align: center; }
	.write_btn{ width: 940px; height: 50px; }
	.btn{ width: 80px; height: 30px; color: white; font-size: 15px;
	border-radius: 5px; background-color: #628E90; position: relative;
	left:850px; top: 10px; }
	.paging_search{ width: 980px; height: 80px; text-align: center; }
	.paging{ width: 400px; height: 50px; }
	.search{ width:400px; height: 40px; line-height: 40px; }
 	#search_btn{ width:50px; height: 25px; font-size:15px; border-radius: 5px; 
 	background-color: #628E90; color:white; } 
	#search{ height: 25px; width:150px; }
 	#sort{ height: 25px; width: 100px; } 
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
	
	<div class="write_btn">
			<c:if test="${sessionScope.id ne null }">
				<form action="/n_write" method="post">
					<button class="btn" type="button" onclick="location.href='/n_write'">글쓰기</button>
				</form>
			</c:if>
	</div>
	<!-- 전체  -->
	<div class="middle">
		<div class="notice">
			<!-- 공지사항 목록  -->
			<table border="1">
				<thead>
				<tr>
					<th class="no">번호</th>
					<th class="title1">제목</th>
					<th class="writer">작성자 </th>
					<th class="date">작성일</th>
					<th class="check1">조회수</th>
				</tr>
				</thead>
				<c:forEach items="${noticelist }" var="data">
					<tbody>
						<tr>
							<td class="no">${data.no }</td>
							<td class="title"><a href="n_detail?rownumber=${data.n_no }">${data.n_title }</a></td>
							<td class="writer">관리자 </td>
							<td class="date">${data.n_date }</td>
							<td class="check1">${data.n_check}</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
			<div class="empty"></div>

		<div class="paging_search">
			<!-- paging -->
			<div class="paging">
			<a id="before">◀</a>
			<c:forEach var="i" begin="${start }" end="${end }" step="1">
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
			<form id="alt" action="/notice" method="post">
				<input type="hidden" name="page_number" id="page_number" value=${page_number }>
				<input type="hidden" name="screen_number" id="screen_number" value="${screen_number }">
	    		<select id="sort" class="select" name="sort">
		    		<option value="" <c:if test="${sort eq ''}">selected="selected"</c:if>>선택하세요</option>
    				<option id="n_title" value="n_title" <c:if test="${sort eq 'n_title'}">selected="selected"</c:if>>제목</option>
    				<option id="n_content" value="n_content" <c:if test="${sort eq 'n_content'}">selected="selected"</c:if>>내용</option>
    			</select>
				<input type="text" name="search" id="search" value=${search }>
     			<button id="search_btn" type="button">검색</button>
			</form>
			</div>
		<!-- paging_search 끝  -->
		</div>
		<!-- notice 끝  -->
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
var start=${start} //시작번호 
var end=${end} //끝번호 
var check=${check} //체크 번호 
var screen_number=${screen_number} //페이지의 페이지 번호
function test(text){
	document.getElementById("sort").value="${sort}" //추가임 
	document.getElementById("search").value="${search}" //
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
	 	$("#sort").val("${sort}");//
		$("#search").val("${search}");// */
		$("#alt").submit();
	})
	$("#before").click(function(){
		$("#page_number").val(${start}-1);
		$("#screen_number").val(${screen_number}-1);
		$("#sort").val("${sort}");//
		$("#search").val("${search}");// */
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