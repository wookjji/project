<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>예약확인</title>
<link href="./resources/css/table.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>	
<script type="text/javascript">
$(function(){
	var money =${r_List.p_amount};
	var method = "${r_List.p_method }";
	var now = new Date();
	var start= new Date("${r_List.r_in }");
	
	
$('#can_btn').click(function(){
	if(now>=start){
		alert("입실일이 당일이거나 \n이미 지나서 \n취소가불가능합니다.");
	}
	else{

		if(method=="카드"){
			alert("예약이 취소되었습니다.");
			$("#cancel").submit();
		}else{
		$('.container').addClass('modal-open');
		$('#money').val(money);}
		
		};
	})
	
	


$('.js-close-modal').click(function(){
	  $('.container').removeClass('modal-open');
	});
	
	$('.cancel-btn2').click(function(){
		var r_no = $("#r_no").val();
		var a_bank = $("#a_bank").val();
		var a_number = $("#a_number").val();
		var a_name = $("#a_name").val();
		if(r_no=="" || a_bank=="" || a_number=="" || a_name==""){
			alert("빈칸이 없게 작성해 주세요");
// 		}else if( != r_no){
// 			alert("예약번호가 올바르지않습니다.\n다시확인해주세요.");
		}
		else{
			if(confirm("정말 취소하시겠습니까?")){
			$("#cancel").submit();					
			}
		}
	});
	
});

</script>
<style type="text/css">
.ev_1 {
	z-index:19;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100vh;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

.ev_1.show {
	display: block;
}
.container > .btn {
  margin: 60px;
  padding: 20px 40px;
  font-size: 30px;
  border-radius: 40px;
}
.modal {
  background: #fff;
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
  transition: all 600ms cubic-bezier(0.86, 0, 0.07, 1);
  top: 100%;
  position: fixed;
  left: 0;
  border-radius: 15px;
  opacity:0.8;
  .header {
    padding:20px;
    border-bottom: 1px solid #ddd;
    font: 300 24px Lato;
    position: relative;
    
    
    }
  .body {
    padding: 20px;
    font: 300 16px Lato;
  }
}

.btn {
   background: linear-gradient(to right, rgb(220, 227, 91), rgb(69, 182, 73));
  padding: 10px 25px;
  display: inline-block;
  border-radius: 25px;
  margin: 20px 0;
  color: #fff;
  position: relative;
  transition: all .5s ease;
  cursor: pointer;
  &:hover {
    box-shadow: 0 3px 15px rgba(0,0,0,0.2);
  }
}
input[type="text"]{
text-align: center;
width:auto;
height:30px;
border-radius: 3px;
border-style: none;
background-color: #F3F5DB;
}
select{
width:auto;
height:30px;
border-radius: 3px;
border-style: none;
background-color: #F3F5DB;
}
.cancel-btn2{
width:70px;
height:30px;
border-style: none;
border-radius:3px;
background-color: #C9CAB9;
}
.container.modal-open .modal {
  top: 400px;
}
</style>
</head>
<body>
<div class="container">

<h1>예약확인</h1>
  <table class="rwd-table">
    <tbody>
      <tr>
        <th>예약번호</th>
        <th>고객명</th>
        <th>휴대전화</th>
        <th>입실일</th>
        <th>퇴실일</th>
        <th>결제방식</th>
        <th>금액</th>
        <th>예약취소</th>
        
      </tr>
      <tr>
        <td data-th="Supplier Code">
          ${r_List.r_no}
        </td>
        <td data-th="Supplier Name">
          ${r_List.r_name}
        </td>
        <td data-th="Invoice Number">
          ${r_List.r_tel }
        </td>
        <td data-th="Invoice Date">
          ${r_List.r_in }
        </td>
        <td data-th="Due Date">
         ${r_List.r_out }
        </td>
        <td data-th="Due Date" id="pay_method">
       	 ${r_List.p_method }
        </td>
        <td data-th="Due Dat">
       	 ${r_List.p_amount } 
        </td>
        <td data-th="Due Date">
         <button type="button" id="can_btn" class="cancel_btn">예약취소</button><br>
        </td>
        
      </tr>
  
    </tbody>
  </table>
 
</div>
<!-- ------------------모달----------------------- -->
  <div class="momo">
<div class="container">

  <div class="modal">
  <div class="ev">
    <form id="cancel" action="/cancel" method="post">
<table class="table">
    <tbody>
      <tr>
        <th>예약번호</th>
        <th>은행</th>
        <th>계좌번호</th>
        <th>예금주명</th>
        <th>취소</th>
        <th></th>
      </tr>
      <tr>
        <td data-th="Supplier Code">
<input type="text" name="r_no" id="r_no" value="${r_List.r_no}" readonly="readonly">
        </td>
        <td data-th="Supplier Name">
                   <select name="a_bank" id="a_bank" >
<option value=""></option>
<option value="하나">하나은행</option>
<option value="국민">KB국민은행</option>
<option value="신한">신한은행</option>
<option value="농협">농협은행</option>
<option value="우리">우리은행</option>
<option value="제일">제일은행</option>
<option value="한국씨티">한국씨티은행</option>
<option value="케이">케이뱅크</option>
<option value="카카오">카카오뱅크</option>
<option value="토스">토스</option>
<option value="수협">수협은행</option>

</select>
        </td>
        <td data-th="Invoice Number">
         <input type="text" name="a_number" id="a_number" maxlength="29" placeholder="계좌번호를 입력해주세요">
        </td>
        <td data-th="Invoice Date">
         <input type="text" name="a_name" id="a_name" placeholder= "예금주명을 입력해주세요">
        </td>
        <td data-th="Due Date">
        <button class="cancel-btn2" type="button">예약취소</button>
        </td>
      </tr>
  
    </tbody>
  </table>
        <a class="btn js-close-modal">Close</a>
<input type="hidden" id="money" name="money">
</form>
</div>
  </div>
  </div>

</div>
</body>

</html>
