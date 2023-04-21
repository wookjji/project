<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./resources/css/info.css?v=4" rel="stylesheet" type="text/css">
<link href="./resources/css/price.css?v=4" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<title>방 관리</title>
</head>
<script type="text/javascript">
$(function(){
	$(".change").click(function(){
		$(".modal").show();
		$(".chnum").val($(".num").val());
		$(".chtype").val($(this).parent().prevAll(".type").text());
		$(".chlimit").val($(this).parent().prevAll(".limit").text().split("명")[0]);
	});
	
	$(".close_modal").click(function(){
		$(".modal").hide();
	});
	$(".check").click(function(){
		if(!$(".chtype").val()){
			alert("Site명을 입력해주세요.");
			$(".chtype").focus();
			return false;
		}else if(!$(".chlimit").val()){
			alert("최대 인원수를 입력해주세요.");
			$(".chlimit").focus();
			return false;
		}else{
			$("#site").submit();
		}
	});
	$(".lock").click(function(){
		var state = $(this).parent().prevAll(".state");
		$.ajax({
			url : "/lock",
			type: "post",
			cache : false,
			dataType : "html",
			data : {type : $(this).parent().prevAll(".type").text(), num : $(this).parent().prevAll(".select").children().val()},
			success : function(active){
				if(active == 0){
					alert("활성화 되었습니다.");
					state.text("활성");
				} else if(active == 1){
					alert("비활성화 되었습니다");
					state.text("비활성");
				}
			}
		});
	});	
});
function select(type, num){
	$.ajax({
		url : "/select",
		type: "post",
		cache : false,
		dataType : "html",
		data : {type : type, num : num.value},
		success : function(result){
				if(result == 0){
					$(num).parent().siblings(".state").text("활성");
				} else if(result == 1){
					$(num).parent().siblings(".state").text("비활성");
				}
		}
	});	
}
</script>
<body>
<%@ include file="menu.jsp" %>
<div class="all">
<%@include file="date.jsp" %>
<div class="infoall">
<span class="infotitle">SITE 정보</span>
<div class="infobox">
<table class="infotable">
	<thead>
		<tr>
			<td>SITE</td>
			<td>번호</td>
			<td>최대 인원수</td>
			<td>상태</td>
			<td></td>
			<td></td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list}" var="l">
		<tr>			
			<td class="type">${l.si_type }</td>
			<td class="select">
			<select id="num" class="num" onchange="select('${l.si_type }',this)">
				<c:forEach begin="1" end="${l.count }" step="1" var="c">
 num       			<option value="${c }">${c }</option>
				</c:forEach>
        			<option value="all">전체</option>
			</select>
			</td>
			<td class="limit">${l.si_limit }명</td>
			<td class="state">활성</td>
			<td><input type="button" name="change" class="change" value="수정"></td>
			<td><input type="button" name="lock" class="lock" value="ON/OFF"></td>
		</tr>
		</c:forEach>
	</tbody>
</table>
</div>
</div>
<div class="priceall">
<span class="pricetitle">가격 변경</span>
<div class="pricebox">
<table class="pricetable">
	<thead>
		<tr>
			<td>SITE</td>
			<td>1일 비용</td>
			<td>주말 성수기</td>
			<td>평일 성수기</td>
			<td>주말 극성수기</td>
			<td>평일 극성수기</td>
			<td>주말 비수기</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${pricelist }" var="pl">
			<form action="/price" method="post">
				<tr>
					<td><input type="text" class="type" name="type" value="${pl.si_type }" readonly="readonly"></td>
					<td><input class="numb" type="number" name="price" value="${pl.si_price }"></td>
					<td><input class="numb" type="number" name="pfs" value="${pl.si_pfs }"></td>
					<td><input class="numb" type="number" name="pwe" value="${pl.si_pwe }"></td>
					<td><input class="numb" type="number" name="hfs" value="${pl.si_hfs }"></td>
					<td><input class="numb" type="number" name="hwe" value="${pl.si_hwe }"></td>
					<td><input class="numb" type="number" name="lfs" value="${pl.si_lfs }"></td>
					<td><input type="submit" class="fix" value="수정"></td>
				</tr>
			</form>
		</c:forEach>
	</tbody>
</table>
</div>
</div>

</div>

<%@include file="modal.jsp" %>




</body>
<script type="text/javascript" src="./resources/js/modal.js?v=1" ></script> 
</html>