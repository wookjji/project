<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<style type="text/css">
.all{
width: calc(100% - 180px);
float: left;
}
.refundtable{
border-collapse: collapse;
text-align: center;
margin-left : 10px;
margin-top : 10px;
}
.refundtable > thead > tr > th{
border: 1px solid black;
font-size : 15px;
font-weight: bold;
background-color: #f7e600;
height: 30px;
}
.refundtable > thead > tr > th:nth-child(1){
width: 100px;
}
.refundtable > thead > tr > th:nth-child(2){
width: 80px;
}
.refundtable > thead > tr > th:nth-child(3){
width: 170px;
}
.refundtable > thead > tr > th:nth-child(4){
width: 160px;
}
.refundtable > thead > tr > th:nth-child(5){
width: 50px;
}
.refundtable > thead > tr > th:nth-child(6){
width:100px;
}
.refundtable > thead > tr > th:nth-child(7){
width: 80px;
border: none;
background-color: white;
}

.refundtable > tbody > tr > td{
border: 1px solid black;
height: 30px;
}
.refundtable > tbody > tr > td:nth-child(1){
background-color: yellow;
}
.refundtable > tbody > tr > td:nth-child(7){
border: none;
}
</style>
</head>
<script type="text/javascript">
$(function(){

   $(".fund").click(function(){
      var rno = $(this).parent().prevAll(".rno").text();
      var name = $(this).parent().prevAll(".name").text();
      var tel = $(this).parent().prevAll(".tel").text().replaceAll("-","");
      if(confirm("환불 승인하시겠습니까?")){
         $.ajax({
            url : "/fund",
            type: "post",
            cache : false,
            dataType : "html",
            data : {rno : rno, name : name, tel : tel},
            success : function(result){
                  alert("환불이 완료되었습니다.");
            }
         });
         $(this).attr("disabled", "disabled");
         $(this).val("환불완료");
      }else{
         return false;
      }
      
   });
});
</script>
<body>
<%@include file="menu.jsp" %>
<div class="all">
   <table class="refundtable">
      <thead>
         <tr>
            <th>예약번호</th>
            <th>예약자명</th>
            <th>예약자 전화번호</th>
            <th>계좌번호</th>
            <th>은행</th>
            <th>환불금액</th>
            <th></th>
         </tr>
      </thead>
      <tbody>
         <c:forEach items="${list }" var="l">
            <tr>
               <td class="rno">${l.r_no }</td>
               <td class="name">${l.ref_name }</td>
               <td class="tel">${l.r_tel }</td>
               <td>${l.ref_number }</td>
               <td>${l.ref_bank }</td>
               <td>${l.p_amount }</td>
               <td>
               <c:choose>
               <c:when test="${l.ref_check eq 0 }">
               <input type="button" class="fund" value="환불승인">
               </c:when>
               <c:otherwise>
               <input type="button" value="환불완료" disabled="disabled">
               </c:otherwise>
               </c:choose>
               </td>
            </tr>      
         </c:forEach>
      </tbody>
   </table>
</div>

</body>
</html>