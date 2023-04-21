<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 현황</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<style type="text/css">
#after,#before{
display:none;
}

.all{
width: calc(100% - 200px);
float: left;
height: 100vh;
overflow: hidden;
}
.statebox{
width: 100%;
}
.statetable{

border-collapse: collapse;
text-align: center;
margin-left : 10px;
margin-top : 10px;
}
.statetable > thead > tr > td{
border: 1px solid black;
font-size : 15px;
font-weight: bold;
background-color: #f7e600;
height: 30px;
}
.statetable > thead > tr > td:nth-child(1){
width: 60px;
}
.statetable > thead > tr > td:nth-child(2){
width: 40px;
}
.statetable > thead > tr > td:nth-child(3){
width: 130px;
}
.statetable > thead > tr > td:nth-child(4){
width: 100px;
}
.statetable > thead > tr > td:nth-child(5){
width: 50px;
}
.statetable > thead > tr > td:nth-child(6){
width: 170px;
}
.statetable > thead > tr > td:nth-child(7){
width: 250px;
}
.statetable > thead > tr > td:nth-child(8){
width: 90px;
}
.statetable > thead > tr > td:nth-child(9){
width: 100px;
}
.statetable > thead > tr > td:nth-child(10){
width: 80px;
border:none;
background-color: white;
}
.statetable > tbody > tr > td:nth-child(10){
border: none;
}
.statetable > tbody > tr > td{
border: 1px solid black;
height: 30px;
}
.statetable > tbody > tr > td:nth-child(1){
background-color: yellow;
}
.paging_box{
margin-top: 10px;
width: 1100px;
float: left;
text-align: center;
}
.paging{
width: 200px;
}
</style>
<script type="text/javascript">
var start=${start}; //시작번호 
var end=${end}; //끝번호 
var check=${check}; //체크 번호 
var screen_number=${screen_number}; //페이지의 페이지 번호
function test(text){

   document.getElementById("page_number").value=text.innerHTML;
   document.getElementById("screen_number").value=${screen_number};
   document.getElementById("alt").submit();
}

$(function(){
   if(check==1 || check==0){
      $("#after").css("display","block");
   }
   if(check==1 || check==2){
      $("#before").css("display","block");
   }
   $("#after").click(function(){
      $("#page_number").val(${end}+1);
      $("#screen_number").val(${screen_number}+1);
      $("#alt").submit();
   });
   $("#before").click(function(){
      $("#page_number").val(${start}-1);
      $("#screen_number").val(${screen_number}-1);
      $("#alt").submit();
   });
   $("#search_btn").click(function(){
      $("#page_number").val(1);
      $("#screen_number").val(1);
      $("#alt").submit();
   });
   
   $(".permit").click(function(){
      
      var rno = $(this).parent().prevAll(".rno").text();
      var num = $(this).parent().prevAll(".num").text().replaceAll("-","");
      var name = $(this).parent().prevAll(".name").text();
      
      if(confirm("예약을 승인하시겠습니까?")){
      $.ajax({
         url : "/permit",
         type: "post",
         cache : false,
         dataType : "html",
         data : {rno : rno, num : num, name : name},
         success : function(result){
            alert("승인완료");
         }
      });
      $(this).attr("disabled", "disabled");
      $(this).val("승인완료");
      }else{
         return false;
         
      }
   });
   
});

</script>
</head>
<body>
<%@ include file="menu.jsp" %>
<div class="all">
<div class="statebox">
<table class="statetable">
<thead>
   <tr>
      <td>SITE</td>
      <td>번호</td>
      <td>예약번호</td>
      <td>예약자 명</td>
      <td>인원</td>
      <td>예약자 전화번호</td>
      <td>기간</td>
      <td>결제방식</td>
      <td>금액</td>
      <td></td>
   </tr>
</thead>
<tbody>
<c:forEach items="${list }" var="l">
<tr>
   <td>${l.si_type}</td>
   <td>${l.s_num }</td>
   <td class="rno">${l.r_no }</td>
   <td class="name">${l.r_name }</td>
   <td>${l.r_count }명</td>
   <td class="num">${l.r_tel }</td>
   <td>${l.r_in } - ${l.r_out }</td>
   <td>
      <c:choose>
         <c:when test="${l.p_method eq '카드' }">신용카드</c:when>
         <c:otherwise>무통장</c:otherwise>
      </c:choose>
   </td>
   <td>${l.p_amount }원</td>
   <td>
   <c:choose>
   <c:when test="${l.p_check eq 0 }">
   <input type="button" class="permit" value="예약승인" >
   </c:when>
   <c:when test="${l.p_check eq 2 }">
   <input type="button" style="color:red;" value="환불요청" onclick="location.href='refund'">
   </c:when>
   <c:when test="${l.p_check eq 3 }">
   <input type="button" style="color:red;" value="환불완료" disabled="disabled">
   </c:when>
   <c:otherwise>
   <input type="button" value="승인완료" disabled="disabled">
   </c:otherwise>
   </c:choose>
   </td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
   <div class="paging_search">
         <!-- paging -->
         <div class="paging_box">
         <span class="paging">
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
         </span>
         </div>
         <!-- search  -->
         <div class="search">
         <form id="alt" action="/state" method="post">
            <input type="hidden" name="page_number" id="page_number" value=${page_number }>
            <input type="hidden" name="screen_number" id="screen_number" value="${screen_number }">
         </form>
         </div>
      </div>
</div>

</body>
</html>