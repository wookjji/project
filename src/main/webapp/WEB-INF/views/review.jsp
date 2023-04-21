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
var start=${start} //시작번호 
var end=${end} //끝번호 
var page_number=${page_number} //현재 페이지 번호 
var check=${check} //체크 번호 
var sort="${sort}" //검색 종류 
var search="${search}"  //검색어 
var screen_number=${screen_number} //페이지의 페이지 번호
var choose;
$(function(){
	$(".hideBtn").click(function(){
		choose=$(this).attr('id');
		$("#q_no").val(choose);
		$("#chk").val("true");
		$("#hide").submit();
	})
	$(".cancel_btn").click(function(){
		choose=$(this).attr('id');
		$("#q_no").val(choose);
		$("#chk").val("false");
		$("#hide").submit();
	})
})

</script>
<style>

		#after{display:none;}
	#before
	{display:none;}

	table { border-collapse: collapse; }
	caption{ align: center;}
	ul{ list-style: none; color:white;}
	li{ list-style: none;}
	th{ height: 35px; background-color: #cccc;}
	td{ height: 35px;}
	.wholebox{ width:980px; height:900px; margin: 0 auto; padding:0;}
	.top{ width: 980px; height: 25px; text-align: center; margin: 0; padding: 0; background-color: #3C2317;}
	.top_left{ width:80px; height: 20px; float: left; line-height: 25px; }
	.top_right{ width: 900px; height: 25px; float: left; line-height: 25px; }
	.text{ position: relative; left: 350px; }
	.empty{ width:980px; height: 50px; }
	.empty1{ width:980px; height: 20px; }
	.middle{ width:980px; height: 730px; }
	.notice{ width: 940px; height: 560px; border-width: 1px 0px 1px; margin: 0 auto; }
	.no{ width: 70px; text-align: center; }
	.title{ width: 600px; }
	.title1{ width: 600px; position:relative; left:10px; }
	.writer{ width: 100px; }
	.date{ width: 110px; text-align: center; }
	.hide{ width: 50px; }
	.write_btn{ width: 940px; height: 50px; }
	.r_no{ height: 25px; width:150px; }
	.reviewBtn{ width: 60px; height: 25px; color: white; font-size: 15px;
	 border-radius: 5px; background-color: #628E90; }
	.page_search{ width: 980px; height: 80px; text-align: center; }
	.paging{ width: 400px; height: 40px; line-height: 40px; }
	.list_present{ color: red;}
	.search{ width:400px; height: 40px; line-height: 40px; }
	#search{ height: 25px; width:150px; }
	#sort{ height: 25px; width: 100px; }
	#search_btn{width:50px; height: 25px; font-size:15px; border-radius: 5px; 
	background-color: #628E90; color:white; }
  	#modal_btn{ width: 80px; height: 30px; color: white; font-size: 15px; border-radius: 5px; 
  	background-color: #628E90; position: relative; left: 870px; bottom: -10px; }
	.modal_wrap{ display: none; width: 400px; height: 150px; position: absolute; text-align: center;
    border: 2px solid black; border-radius: 8px; top: 1200px; left: 50%; margin: -250px 0 0 -250px;
    background:#eee; z-index: 2; }
	.modal_background{ display: none; position: absolute; width: 100%; top:0; left: 0; z-index: 1; }
	.modal_close{ width: 26px; height: 26px; position: absolute; top: 10px; right: 10px; }
	.modal_wrap .modal_text{ width: 300px; height: 100px; }
	.modal_close .closeImg{ display: block; width: 100%; height: 100%; }
  	.hideBtn{ width: 45px; height: 20px; background-color:#3d698e; color: white; border-radius: 5px;  }
  	.cancel_btn{ width: 45px; height: 20px; background-color:#37353a; color: white; border-radius: 5px;}
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
		<li class="top_left"><b>이용후기</b></li>
		<li class="top_right"><p class="text">COMMUNITY > 이용후기</p></li>
	</ul>
	<div class="empty"></div>
		<!-- 전체  -->
	<div class="middle">
		<div class="notice">
			<!-- 공지사항 목록  -->
			<table border="1">
				<thead>
				<tr>
					<th class="no">번호</th>
					<th class="title">제목</th>
					<th class="writer">작성자</th>
					<th class="date">작성일</th>
					<c:if test="${sessionScope.id ne null }">
						<th class="hide">숨김</th>
					</c:if>
				</tr>
				</thead>
					<tbody>
				<c:forEach items="${reviewlist}" var="row">
						<tr>
							<td class="no">${row.rv_no}</td>
							<td class="title1"><a href="r_detail?rownumber=${row.rv_no}">${row.rv_title}</a></td>
							<td class="wrtier">${row.rv_writer }</td>
							<td class="date">${row.rv_date }</td>
							<td>
							<c:if test="${sessionScope.id ne null }">
							<c:choose>
								<c:when test="${row.rv_hide eq 0 }">
									<button class="hideBtn" type="button" id=${row.rv_no }>보임</button>
								</c:when>
								<c:otherwise>
									<button class="cancel_btn" id="${row.rv_no }" type="button">안보임</button>
								</c:otherwise>
							</c:choose>
							</c:if>
							</td>
						</tr>
				</c:forEach>
					</tbody>
			</table>
		</div> 
				<form action="/r_hide" method="post" id="hide">
				<input type="hidden" name="chk" id="chk">
				<input type="hidden" name="q_no" id="q_no"> 
			</form>
		<div class="empty1"></div>
	
		<!-- 모달 창  -->
		<button type="button" id="modal_btn">글쓰기</button>
		<div class="modal_background"></div>
		<div class="modal_wrap">
			<div class="modal_close" style="cursor:pointer">X</div>
				<div class="modal_text">
					<form action="/r_write" method="post" id="write">
					<br><br>
					<h3>예약번호를 입력해세요</h3><br>
					<input type="text" class="rno" name="r_no" id="r_no">
					<button class="reviewBtn" type="button" id="rnocheck">확인</button>
					</form>
				</div>
			</div>
		
		<!-- 페이징 & 검색 기능   -->
		<div class="page_search">
			<div class="paging">
				<a id="before">◀</a>
				<c:forEach var="i" begin="${start }" end="${end }" step="1">
					<c:choose>
						<c:when test="${i == page_number }">
							<a class="list_present" onclick="test(this)">${i }</a>
						</c:when>
						<c:otherwise>
							<a class="list" onclick="test(this)">${i }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<a id="after">▶</a>
			</div>
			<!-- 검색  -->
			<div class="search">
				<form id="alt" action="/review" method="post">
					<input type="hidden" name="page_number" id="page_number" value=${page_number }>
					<input type="hidden" name="screen_number" id="screen_number" value=${screen_number }>
					<select id="sort" class="select" name="sort">
						<option value="" <c:if test="${sort eq '' }">selected="selected"</c:if>>선택하세요</option>
						<option id="rv_title" value="rv_title" <c:if test="${sort eq 'rv_title' }">selected="selected"</c:if>>제목</option>
						<option id="rv_content" value="rv_content" <c:if test="${sort eq 'rv_content' }">selected="selected"</c:if>>내용</option>
					</select>
					<input type="text" name="search" id="search" value=${search }>
					<button id="search_btn" type="button">검색</button>
				</form>
			</div>
		<!-- page_search 끝  -->
		</div>
	<!-- middle 끝  -->
	</div>
<!-- whplebox 끝  -->
</div>	
<!-- 하단 바-->
<%@ include file="./common/bottom.jsp" %>
<!-- 사이드 바-->
<%@ include file="./common/sidebar.jsp" %>
</body>
<script>
//모달 열기 
function modalOpen(){
	document.querySelector('.modal_wrap').style.display = 'block';
	document.querySelector('.modal_background').style.display = 'block';
}
// 모달 끄기
function modalClose(){
	document.querySelector('.modal_wrap').style.display ='none';
	document.querySelector('.modal_background').style.display = 'none';
}
// 버튼 클리스너 달기 
document.querySelector('#modal_btn').addEventListener('click', modalOpen);
document.querySelector('.modal_close').addEventListener('click', modalClose);


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
};

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
	});
	$("#before").click(function(){
		$("#page_number").val(${start}-1);
		$("#screen_number").val(${screen_number}-1);
		$("#sort").val("${sort}");
		$("#search").val("${search}");
		$("#alt").submit();
	});
	$("#search_btn").click(function(){
		$("#page_number").val(1);
		$("#screen_number").val(1);
		$("#alt").submit();
	});
	
	
	$("#rnocheck").click(function(){
	      var r_no = $(this).prevAll("#r_no").val();

	      $.post({
	         url : "/review_modal",
	         dataType : "html",
	         data : {r_no : r_no}
	         }).done(function(data){
	            if(data == 1){
	               $("#write").submit();
	            } else if(data==0){
	               alert("예약번호가 없습니다. 다시 한번 확인해주세요.")
	            }   else{
	               alert("이미 리뷰가 작성된 예약 번호 입니다.")
	            }
	         });
	   });
	});

</script>
</html>