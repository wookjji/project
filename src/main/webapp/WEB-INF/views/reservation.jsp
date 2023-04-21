<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poiret+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

<head>
<script>
$(function(){
   $("#end_btn").click(function(){
      if($("input[name=terms]:checkbox").is(':checked') == false){
         alert("약관동의에 체크 해주세요");
         }else if(($("#name").val()) ==""){
            alert("성함을 적어주세요");
         }else if(($("#tel").val()) == ""){
            alert("예약자 전화번호를 적어주세요");
         }else if(($("#tel").val()).length < 11){
            alert("핸드폰번호 글자수를 정확하게 입력해주세요");
         }else{
         if(($("#bank_book").is(':checked')) == true){   
         alert("무통장 결제를 선택하셨습니다");
         $("#p_check").val(0);
         $("#method_check").val("무통장");
         $("#reform").submit();
         alert("예약이완료되었습니다");
         }else if(($("#card").is(':checked')) == true){
         alert("카드결제를 선택하셨습니다.");
         $("#card_modal").css('display','block');
         $("#card_account").click(function(){
         $("#p_check").val(1);
         $("#method_check").val("카드");
         $("#reform").submit();
         alert("예약이완료되었습니다");
         });         
         }else{
         alert("결제 방식을 선택하지않으셨습니다 선택해주세요");
         }
      }
   });   
   $("#card_cancle").click(function(){
      $("#card_modal").css('display','none');
   })
});


</script>

<style>
.big{
position: relative;
margin: 0 auto;

width:100%;


}
input[type=text]{
text-align: center;
}
body{
background-color: #DCEBFF;
width:100%;
height:auto;
font-family: 'Poiret One', cursive; 
}
.main{

margin:0 auto;
padding:0;
position:relative;
width:1250px;
height:auto;
}
.head{
margin:0 auto;
width:1250px;
height:50px;
background-color: #F2F8FF;
opacity:0.9;
border-radius: 10px 10px 0px 0px;
}
.m_image{
margin:0 auto;
background-image:url('/resources/image/camping3.jpeg');
width:1250px;
height:520px;
z-index: 1;

}
.cal_f{
margin:0 auto;
width:1250px;
height:300px;
background-color: #F2F8FF;
opacity:0.9;
box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
transition: all 0.3s cubic-bezier(.25,.8,.25,1);
z-index: 2;
}
.main_text{
position:absolute;
left:7%;
top:7%;
font-family: 'Poiret One', cursive; 
 font-size: 80px;
 color:#E6E6E6;
 opacity: 0.9;
 z-index: 3;
}
.cal_top{
margin:0 auto;
   position:absolute;
   left:6%;
   top:35%;
   width:1100px;
   height:53px;
   background-color:white;
   z-index: 4;
   border-radius: 10px;
   float:left;
   opacity: 0.8;
}
.cal_top div{
float:left;
width:275px;
height:50px;
text-align: center;
font-size: 30px;

}

.cal_m{
   border-style:none;
   margin:0 auto;
   position:absolute;
   left:6%;
   top:40%;
   width:1100px;
   height:150px;
   background-color:white;
   z-index: 5;
   border-radius: 10px;
   float:left;
   box-shadow: 0 5px gray;
   opacity: 0.8;
}
.cal_sday{
float:left;
width:271px;
height:148px;

border-style: none;
font-size: 50px;
font-family: 'Poiret One', cursive; 
}
.cal_eday{
float:left;
width:271px;
height:148px;
border-style: none;
font-size: 50px;
background-color: #DEDEDE;
font-family: 'Poiret One', cursive; 
}
.cale_p{
float:left;
width:271px;
height:148px;
border-style: none;
font-size: 50px;
font-family: 'Poiret One', cursive; 
   
}
.cale_b{
margin:0 auto;
float:left;
width:275px;
height:150px;

background-color: #DEDEDE;
}
.r_btn{
width:275px;
height:150px;
font-size: 50px;
line-height:130px;
text-align: center;

}

/* 모달 */
.container{
width:100%;

}
.container > .btn {
  margin: 60px;
  padding: 20px 40px;
  font-size: 30px;
  border-radius: 40px;
  margin: 0 auto;
}
.modal {
  background: #fff;
  width: 1300px;
  height: 100%;
font-family: 'Noto Sans KR', sans-serif;
  transition: all 600ms cubic-bezier(0.86, 0, 0.07, 1);
  top: 100%;
  position: fixed;
    margin: 0 auto;
   left: 1%;
   right: 0;
   

  background-color:#D1D4CE;
  border-radius:15px;
  z-index:6;
  .header {
    padding:20px;
    border-bottom: 1px solid #ddd;
    font: 300 24px Lato;
    position: relative;

    }
.modal>table{
width:auto;
height:auto;
background-color: blue;
}


}
.mo_head{
margin:0 auto;
width:1000px;
height:50px;
font-size: 50px;
margin-top: 20px;

}
.mo_head2{

width:1000px;
height:50px;
font-size: 50px;
margin-top: 20px;
margin-left: 30px;
}
.mo_head3{
width:1000px;
height:50px;
font-size: 50px;
margin-top: 20px;
margin-left: 30px;
}
.mo_bady{
margin:0 auto;
position:relative;
top:30px;
width:1000px;
height:1000px;
}
.human{
font-size: 50px;
float:left;
}
.mo_bady>#decrease{
float:right;
width:60px;
height:60px;
font-size: 60px;
line-height:10px;
border-radius:10px;
  background-color:#D1D4CE;
line-height: 20px;
}
.mo_bady>#counter{
float:right;
width:60px;
height:60px;
font-size: 50px;
line-height:55px;
background-color:#D1D4CE;
text-align: center;
}
.mo_bady>#increase{
float:right;
width:60px;
height:60px;
font-size: 60px;
line-height:10px;
border-radius:10px;
  background-color:#D1D4CE;

}
#btn_p{
float:left;
width:1000px;
height:100px;
position: relative;
top:3%;
text-align:center;
line-height:95px;
background-color:#7CB72F;
font-size: 50px;
border-radius: 30px 30px 30px 30px;
color:white;
}
.btn {
   background: linear-gradient(to right, rgb(220, 227, 91), rgb(69, 182, 73));
  padding: 10px 25px;
  display: inline-block;
  border-radius: 25px;
  margin: 20px 0;
  color: #fff;
  position: relative;
  transition: all .4s ease;
  cursor: pointer;
  &:hover {
    box-shadow: 0 3px 15px rgba(0,0,0,0.2);
  }
}

.container.modal-open .modal {
  top: 50%;
}
.container2.modal-open .modal {
  top: 30%;
}

.peak_day{
width:100px;
height:100px;
background-color:yellow;


}
.can{
float:left;
width:100px;
height:20px;
border-radius: 10px;
margin: 10px;
line-height:19px;
text-align: center;
border: 2px solid;
border-color:#C1D5A6;
background-color: #DAF0BE;
font-weight: 400;

}
.can:active
{background-color: green;}
.roomcon{
width:700px;
height:100px;

position: relative;
left: 15%;
top:30px;
}
.room{
float:left;
width:150px;
height:50px;
background-color:skyblue;
text-align: center;
border: 2px solid;
border-radius: 10px;
font-size: 20px;
line-height: 50px;
margin: 10px;


}
.disable{
float:left;
width:100px;
height:20px;
border: 2px solid;
border-radius: 10px;
border-color:gray;
background-color:gray;
text-align: center;
line-height: 19px;
color: white;
margin: 10px;
}
.disabledr{
float:left;
width:150px;
height:50px;
border-radius: 10px;
border-color:gray;
background-color:gray;
text-align: center;
color: white;
line-height: 50px;
margin: 10px;
}

.body_set{
width: 1100px;
height: auto;
margin: 0 auto;

}
.reser_btn{
width:100px;
height:20px;
background-color: green;
border-radius: 5px;
color:white;
}
.body_reser{
width:1100px;
height:100px;
margin:0 auto;

}
.body_sub{
width:500px;
height:100px;
position: relative;
left:605px;
}
.info{
margin-top: 10px;
}
.pay_info{
width:1100px;
height:500px;
overflow: scroll;
border:1px solid;
background-color: white;
}
h1{
margin-left: 100px;
}
.site_show{

position: absolute;
left:1000px;
}
.site_show>input[type=text]{
border-style: none;
width:60px;
height:30px;
border-radius: 5px;
}
.site_show>button{
border-style: none;
width:65px;
height:30px;
border-radius: 5px;
background-color:#DAF0BE; 
font-weight:bold;
font-family: 'Noto Sans KR', sans-serif;
}
.card_modal{
font-family:monospace; 
font-size:20px;
position:relative;
top:30px;
width:500px;
height:370px;
background-color: #dcdcdc;
border-radius: 10px;
z-index: 12;
margin:0 auto;
display: none; 
text-align: center;
}
.card_modal>h3{
position: relative;
top:40px;
}
.card_modal>table{
position: relative;
top:40px;
left:10px;
width:500px;
height:auto;
}
.card_modal>table>tr>td>input[type="text"]{
width:50px;
height:30px;
}
.halbu{
text-align: center;
width:149px;
height:23px;
}
.card_modal>input[type="text"]{
position: relative;
top:50px;
width:100px;
height:20px;
}
.btn_card{
position: relative;
left:36%;
top:24%;
}
.table_1:not(.table){
position: relative;
right:40px;
}
.table_2:not(.table){
width:600px;
position: relative;
right:100px;
}

</style>
<!-- <link href="./resources/css/rsvtest.css" rel="stylesheet" type="text/css"> -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="big">
<form id="reform" action="/reservation_end" method="post"> 
<div class="main">
<div class="head"></div>

<div class="cal_top">
<div>Select Date</div>
<div>in</div>
<div>out</div>
<div>year/month</div>
</div>
<div class="cal_m" id="dates">
<div class="cale_b">
<div class="r_btn">Click</div>
</div>
<input type="text"  id="start" class="cal_sday" style ="text-align:center" readonly="readonly" >
<input type="text"  id="end"  class="cal_eday" style ="text-align:center" readonly="readonly" >
<input type="text"  id="year"  class="cale_p" style ="text-align:center" readonly="readonly" >
</div>

<div class="m_image">
<!-- 카드모달 -->
<div class="card_modal" id="card_modal">
<h3>결제내역</h3>
<table>
<tr>
<td>예약금액</td>
<td><input type="text" id="card_amount" readonly="readonly"></td>
</tr>
<tr>
<td>할부기간</td>
<td><select class="halbu" id="installment_period" name="installment_period">
<option value="">할부기간을정해주세요</option>
<option value="일시불">일시불</option>
<option value="1">1개월</option>
<option value="2">2개월</option>
<option value="3">3개월</option>
<option value="4">4개월</option>
<option value="5">5개월</option>
</select></td>
</tr>
</table>
<h3>결제하기</h3>
<table>
<tr>
<td>카드사 선택</td>
<td><select class="halbu" id="card_company" name="card_company">
<option value="">카드사를 정해주세요</option>
<option value="신한">신한카드</option>
<option value="현대">현대카드</option>
<option value="삼성">삼성카드</option>
<option value="롯데">롯데카드</option>
<option value="BC">BC카드</option>
</select></td>
</tr>
<tr>
<td>카드번호</td>
<td><input type="text" id="card_num" name='card_num'></td>
</tr>

</table>
<div class="btn_card">
<button type="button" id="card_account">결제하기</button><button type="button" id="card_cancle">취소</button>
</div> 
</div>
<span class="main_text">Reservation<br>I Go Camping</span>
</div>

<div class="cal_f">
</div>
</div><!--main end -->


<!--인원선택모달-->
<div class="container" id="c_modal"> 
  <div class="modal">
    <div class="body">
<div class="mo_head">
<div id="btn_close1" class="xi-angle-left"></div>
<div class="mo_bady">

<div class="human">성인</div>
<button type="button" id="increase">+</button>
<div id="counter">1</div>
<button type="button" id="decrease">−</button>
<div id="btn_p">인원선택</div>


</div>

      </div>
    </div>
  </div>
</div>

<!--방타입선택-->
<div class="container" id="p_modal"> 
  <div class="modal">
    <div class="body">
<div class="mo_head">
<div id="btn_close2" class="xi-angle-left"></div>
</div>
    <div class="roomcon">
<div id="room"></div>
</div>
<div class="site_show">
<input type="text" id="site_ty" readonly="readonly">
<input type="text" id="site_n" readonly="readonly">
<button type="button" id="btn2">선택완료</button>
    </div>
    </div>
  </div>
</div>

<!--예약확인 모달-->
<div class="container" id="site_modal"> 
  <div class="modal">
  <div class="mo_head2">
<div id="btn_close3" class="xi-angle-left"></div>
</div>
    <h1>예약확인</h1>
    <div class="body_set">
    <table class="table_1">
    <tr>
    <th>사이트 종류</th>
    <th>사이트 번호</th>
    <th>예약인원</th>
    <th>입실일</th>
    <th>퇴실일</th>
    <th>예약 최종금액</th>
    <th></th>

    </tr>
   <tr>
   <td><input type="text" id="si_type" name="si_type" readonly="readonly"></td>
   <td><input type="text" id="s_no" name="s_no" readonly="readonly"></td>
   <td><input type="text" id="per_num" name="per_num" readonly="readonly"></td>
   <td><input type="text" id="start2" name="start2" readonly="readonly"></td>
   <td><input type="text" id="end2"  name="end2"readonly="readonly"></td>
   <td><input type="text" id="sum"  name="sum" readonly="readonly"></td>
	<td><button type="button" id="reser_btn" class="reser_btn">예약화면가기</button></td>
   </tr>
    </table>


    </div>
  </div>
</div>

<!-- 에약 모달 -->
<div class="container2" id="reser_modal"> 
  <div class="modal">
  <div class="mo_head3">
<div id="btn_close4" class="xi-angle-left"></div>
</div>
   	<h1>예약하기</h1>
   
    <div class="body_reser">
    <div class="body_sub">
    <table class="table_2">
	<tr>
	<th>예약자 성함</th>
    <th>예약자 전화번호</th>
    <th>결제 방식</th>
    <th></th>
    
	</tr>
	<tr>
	   <td><input type="text"  name="name2" id="name"></td>
   <td><input type="text" name="tel" id="tel" maxlength="11"></td>
   
   <td>카드<input type="checkbox" name="pay_type" id="card" onclick="checkOnlyOne(this)">무통장<input type="checkbox" name="pay_type" id="bank_book" onclick="checkOnlyOne(this)"></td>
   
	<td><button type="button" class="reservation_f" id="end_btn">예약하기</button></td>
	
	</tr>
	</table>
	</div>
	<input type="hidden" id="method_check" name="method_check">
	<input type="hidden" id="p_check" name="p_check">
	<div class="info">
	<div>약관에 동의<input type="checkbox" id="terms" name="terms"></div><br>
	<div class="pay_info">제 1조 (목적)
본 약관은 아이고캠핑㈜(이하 "회사")가 예약서비스(reservation service, 이하 "예약서비스")를 회원에게 제공함에 있어 필요한 회사와 회원간의 권리 및 의무 책임에 관한 제반 사항과 기타 필요한 사항을 규정함을 목적으로 합니다.

제 2조 (용어의 정의)
1.본 약관에서 사용되는 용어의 정의는 다음 각 호와 같습니다.
①"회원"이라 함은 본 약관에 따라 회사와 이용계약을 체결하고 회사가 제공하는 서비스를 이용하는 고객을 말합니다.
②"예약서비스"라 함은 "회사"가 "회원"이 회사와의 제휴 계약에 따라 제공되는 서비스의 이용을 용이하게 하기 위하여 등록 값을 제공하는 서비스를 의미합니다.
③"인증Key"라 함은 관련 시스템이 "예약서비스"의 이용 승낙을 받은 "회원"임을 식별할 수 있도록 "회사"가 "회원" 별로 할당하는 특정 문자의 조합을 의미합니다.
2.전항에서 정의되지 아니한 용어는 홈페이지 또는 상관례에 따라 해석됩니다.
제 3조 (약관의 효력 및 변경)
1."회사"는 본 약관의 내용을 회원이 쉽게 확인 할 수 있도록 "예약서비스" 신청 첫 화면에 게시합니다.
2."회사"는 관련법을 위반하지 않는 범위 내에서 본 약관을 개정할 수 있으며, "회사"가 약관을 개정할 경우 적용일자 및 개정사유를 명시하여 그 적용일자 7일 전 현행약관과 함께 홈페이지 내 공지합니다.
3."회사"가 전항에 따른 기간 동안 개정약관 고지 또는 통지를 하면서 "회원"에게 '의사표시를 하지 않으면 의사표시가 표명된 것으로 본다'는 뜻을 명확하게 공지 또는 통지하였음에도 "회원"이 명시적으로 거부의 의사표시를 하지 아니한 경우 "회사"는 "회원"이 개정약관에 동의한 것으로 간주합니다.
4."회원"이 개정 약관의 적용에 동의하지 않는 경우 "회원"은 언제든지 이용계약을 해지할 수 있습니다.
5."회사"는 필요한 경우 특정 서비스에 대하여 개별약관 또는 운영정책을 정할 수 있으며 회원은 이를 준수해야 합니다.
6.본 약관에 명시되지 아니한 사항에 대해서는 서비스 이용 공지, 카페24 회원약관, 쇼핑몰 호스팅 이용약관, 회사의 운영정책 등 회사가 정한 제반 규정 또는 관계 법령에 따릅니다.
제 4조 (이용계약의 체결)
1.본 약관에 따른 이용계약은 "회원"이 "인증Key" 발급을 위해 본 약관에 동의하여 "인증Key" 발급을 신청하고 "회사"가 이에 대해 승낙함으로써 체결됩니다.
2."회사"는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 사후에 이용계약을 해지할 수 있습니다.
①"회사"가 제공하는 API 이외의 사양에 대한 요청이 있는 경우
②타인의 명의를 도용하여 신청하거나 "회원"이 "회사"에 제출한 정보나 증빙 서류가 허위인 경우
③"회원"의 귀책사유로 승낙이 불가능하거나 기타 규정한 제반 사항을 위반하여 신청하는 경우
④천재지변, 전쟁 등 국가 초유의 비상사태 또는 이에 준하는 경우
⑤원활한 서비스 제공에 지장을 초래할 지극히 곤란한 사유가 있는 경우
⑥필요한 설비 및 인력의 부족으로 품질유지가 곤란한 경우
⑦기타 "회사"의 운영상의 사정으로 이용계약의 승낙이 곤란한 경우
제 5조 (API 서비스의 제공)
다음의 각 항의 어느 하나에 해당하는 경우에 "갑"과 "을"중 어느 일방은 계약기간 중에도 불구하고, 서면 또는 유선, 이메일 통보로서 이 계약을 해지할 수 있다.

1."회원"이 "API 서비스"를 이용하기 위해서는 "회사"에 "API인증키"를 신청하여 발급받아야 합니다.
2."회사"는 "API 서비스"를 1년 365일 24시간 제공함을 원칙으로 합니다. 단, 시스템 정기점검, 증설 및 교체 등을 위해 "API 서비스"의 전부 또는 일부를 중단할 수 있습니다.
3."회사"는 운영상 필요 또는 개선을 위하여 API 서비스의 범위를 제한하거나, 이용 가능 시간, 이용 회수, 트래픽 사용량 등을 지정할 수 있으며, 신규 서비스 개발, 요청인의 API이용량 등을 감안하여 본 서비스를 유료 서비스로 전환 할 수 있습니다. 단, 이 경우 개정 정책 시행 전까지 제11조에 따라 해당 내용을 통지합니다.
4."회사"는 운영상 필요 또는 개선을 위해 API를 수정할 수 있으며 "회원"의 필요에 의한 API 기능개선을 제공하지 아니합니다. 단, "회사"는 "회원"의 요청이 필요하다 판단되는 경우 이를 참고하여 반영할 수 있습니다.
5."회사"는 서비스 제공 및 개선을 위하여 "회원"의 "API 서비스" 이용 사항(이용 내용, 이용 결과, 트래픽 사용량 등)을 수집하여 통계 자료로 활용 할 수 있습니다.
제 6조 (제공 중지)
1."회사"는 다음 각 호에 해당하는 경우 "API서비스"의 제공을 중지할 수 있습니다. 이 경우, 사유 및 기간 등을 회원에게 사전(불가피한 경우 사후)에 "API 서비스" 페이지 또는 연결화면을 통해 이를 공지합니다.
①제휴 업체와 계약이 해지되거나 종료된 경우
②설비의 보수 등을 위하여 점검이 필요한 경우
③전기통신사업법에 규정된 기간통신사업자가 전기통신서비스를 중지한 경우
④국가비상사태, 정전, "API 서비스" 설비의 장애 또는 "API 서비스" 이용 폭주 등으로 정상적인 "API 서비스" 제공이 불가능할 경우
⑤사전 통제가 불가능한 분산서비스거부(DDos), 해킹 등 외부적 침입으로 인하여 서비스 제공에 문제가 있는 경우
⑥보안상 심각하고 시급을 요하는 프로그램 결함이나 장애 혹은 그에 준하는 문제가 발생하는 경우
⑦기타 시장환경의 변화와 회사의 운영 정책 변경으로 서비스를 제공할 수 없는 사유가 발생한 경우
2."회사"는 "회원"이 "API 서비스"를 이용하여 개발, 운영하는 서비스가 다음 각 호에 해당하는 경우 해당 서비스의 제공을 중단하거나, 발급한 "인증 key"의 사용 제한, 정지 또는 삭제 등 필요한 조치를 취할 수 있습니다.
①타인의 명의를 도용하여 신청하거나 회사에 제출한 정보나 증빙 서류가 허위인 경우
②"API 서비스"를 사용하는 서비스가 불법 정보를 포함하고 있거나 법률에 위반하는 유형의 사용으로 객관적으로 판단되는 경우
③회원 ID, 인증Key, 비밀번호 등을 타인과 거래하는 경우
④작권 등 제3자의 권리를 침해한 경우
⑤비정상적인 접근 시도, 과도한 접속으로 시스템, 서버 등에 과부하를 발생시키거나, 의도적 혹은 우연적인 방법으로 시스템의 작동을 방해하는 경우
⑥"회사"가 정한 기간 동안 "API 서비스"의 사용 기록이 없거나 신규 버전의 "API 서비스"가 제공되는 경우
⑦"회사"의 사전 동의 없이 "API 서비스"의 결과 데이터, "API 서비스"의 정보를 무단으로 복제, 저장, 가공, 배포하거나 제3자에게 전송하는 경우
⑧기타 본 약관과 서비스 이용 공지, 카페24 회원약관, 쇼핑몰 호스팅 이용약관, 회사의 운영정책 등 회사가 정한 제반 규정 또는 관계 법령을 위반하는 경우
3."회사"는 본 조에 규정한 사항으로 인하여 "회원"에게 손해가 발생한 경우 그 손해에 대하여 책임을 부담하지 아니합니다.
제 7조 (회사의 의무)
1."회사"는 "회원"에게 안정적인 서비스를 제공할 수 있도록 최선을 다하며 서비스 안내 및 도움말, 본 이용약관 등을 통하여 서비스에 대한 이용 방법 및 조건 등을 제공합니다.
2."회사"는 원활한 서비스 제공을 위해 관련 설비 등을 유지ㆍ보수하고 장애 발생 시 부득이한 사유가 없는 한 이를 신속하게 복구할 수 있도록 노력합니다.
제 8조 (회원의 의무)
1."회원"은 서비스를 이용함에 있어 본 약관 및 "회사"의 운영정책, 공지사항 등을 준수합니다.
2."회원"은 "API 서비스"를 "회사"가 사용 허락한 범위 내에서 이용하여야 하며 정당한 권원 없이 타인에게 제공, 공개하거나 공유할 수 없고 타인에 의해 유용되거나 불법 부당하게 사용되지 않도록 하여야 합니다.
3."회사"가 "회원"에게 부여한 "API인증 key" 등 API 정보, 회원 ID, 비밀번호의 관리 의무는 "회원"에게 있으며 이를 소홀이 하여 발생하는 모든 결과에 대한 책임 또한 "회원"이 부담합니다.
4."회원"은 "API 서비스"를 불법ㆍ부당하게 사용하거나 제3자에게 제공하여서는 안됩니다.
5."회원"은 "API 서비스"의 이용권한, 기타 본 약관 및 관련 계약상의 지위를 제3자에게 양도, 담보의 목적으로 제공할 수 없습니다.
6."회원"은 "회사" 및 제3자의 지적재산권 및 관련 권리를 침해해서는 안됩니다.
제 9조 (지적재산권의 귀속)
1."회사"가 제공하는 "API "및 관련 프로그램의 저작권 및 기타 제반 권리는 회사에 있으며, 회사는 회사의 정책 및 운영의 필요상 "API" 또는 "API 서비스"를 변경하거나 중단할 수 있습니다.
2."회원"이 제작한 서비스 또는 프로그램에 대한 저작권은 "회원"에게 귀속합니다.
제 10조 (회사의 책임 제한)
1."회사"는 "회원"이 서비스를 이용함에 있어 본 약관 및 "회사"의 운영정책, 공지사항, 기타 회사가 정한 이용기준을 준수하지 않아 발생하는 결과에 대하여 책임을 부담하지 않습니다.
2."회사"는 "API 서비스"를 통해 제공한 결과에 대한 신뢰성, 정당성, 적법성 등을 보증하지 않으며 회원이 서비스 자료에 대한 취사선택 또는 이용으로 발생하는 손해 등에 대해 책임을 지지 아니합니다.
3."회사"는 "API 서비스"의 사용 및 사용불능으로 인하여 "회원"에게 발생한 손해에 대하여 일체 책임을 지지 아니합니다.
4."회사"는 "회원"이 "API 서비스"를 이용하여 기대한 수익에 대하여 책임을 부담하지 아니합니다.
5."회사"는 회원 상호간 또는 회원과 제3자 상호간 본 서비스를 매개로 하여 발생한 분쟁에 개입할 의무가 없으며 이로 인한 손해를 배상할 책임을 부담하지 아니합니다.
6."회사"는 천재지변, 폭동, 국내/해외 정부기관의 규제 또는 사회통념상 이에 준하는 불가항력적인 사유 혹은 시스템 점검/업그레이드 과정에서 예상치 못한 기술적 장애 혹은 시스템상 예상치 못한 장애로 인하여 이 약관의 의무를 이행하지 못하는 경우에는 그로 인해 직ㆍ간접적으로 발생하는 손해에 대해서 책임을 면합니다.
제 11조 (회원에 대한 통지)
1."회사"는 통지 내용을 "회원"이 회원가입 시 제공한 전자우편, 유선, SMS 등을 통하여 통지합니다.
2."회사"는 불특정다수 "회원"에 대한 통지인 경우, 홈페이지 내 공지사항 및 게시판 등을 통하여 게재함으로써 개별 통지를 갈음할 수 있습니다.
제 12조 (개인정보의 보호)
"회사"는 관련 법령 및 "회사"가 정하는 "개인정보처리방침"에 따라 수집한 개인정보를 보호합니다. 단, "회사"의 공식 사이트 이외의 링크된 사이트는 "회사"의 개인정보처리방침이 적용되지 아니합니다.

제 13조 (비밀유지)
"회원"은 "회사"의 "API서비스"와 관련하여 취득한 정보를 "회사"의 서면 동의 없이 외부에 유출하거나 제 3자에게 이용하게 하여서는 아니 됩니다.

제 14조 (계약의 해지 및 손해배상)
1."회원"은 각 "서비스"의 해지 조건에 따라 "API서비스"이용을 해지할 수 있습니다.
2.계약해지 시 "서비스" 이용기록, 자료 등이 삭제될 수 있으므로 계약해지 전에 해당 자료를 회원의 별도의 저장공간에 저장한 후 해지하여야 합니다. 이를 조치하지 않아 발생한 "회원"의 손해에 대해서 회사는 책임을 부담하지 아니합니다.
3."회원"에 의하여 "회사"에 손해가 발생한 경우 "회사"는 "API 서비스" 이용계약의 해지와는 별도로 회원에게 손해배상을 청구할 수 있습니다.
제 15조 (준거법 및 분쟁의 해결)
1.이 약관으로부터 발생한 모든 분쟁에 대하여 대한민국 법이 적용되며, 이에 의하여 해석됩니다.
2.회사와 회원간 발생한 분쟁에 관한 소송은 민사소송법 상의 관할법원에 제소합니다.
[부칙]
제 1조 (시행일)
본 약관은 2015년 7월 7일부터 적용됩니다.

	</div>
</div>
</div>
</div>
</div>
</form> 
</div>

</body>
<script type="text/javascript">

var sysdate = new Date();
var year=sysdate.getFullYear();
var month=sysdate.getMonth()+3;
var date=sysdate.getDate();
var after=year+"/"+month+"/"+date;

$(function(){
	
	$(".r_btn").daterangepicker({
		'applyClass':'btn_apply',
		'locale':'locale', 
		autoUpdateInput: false,
		   "locale": {
		 "format": "YYYY-MM-DD",
		 "separator": " ~ ",
	     "applyLabel": "확인",
	     "cancelLabel": "취소",
	     "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
	     "monthNames": ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
	},
	"minDate": sysdate,
   "maxDate": after,
   },function(start,end){
   	var date_start=start.format("DD");
   	var end_start=end.format("DD");
   	var date_start2=start.format("YYYY-MM-DD");
   	var end_start2=end.format("YYYY-MM-DD");
   	var year=end.format("YYYY-MMM");
   	$("#start").val(date_start);
   	$("#end").val(end_start);
   	$("#start2").val(date_start2);
   	$("#end2").val(end_start2);
   	$("#year").val(year);
   	}
	)
	
});
// 달력모달
$(function(){
	$('.btn_apply').click(function(){
		  $('#c_modal').addClass('modal-open');
		});
	$('#btn_p').click(function(){
		  $('#p_modal').addClass('modal-open');
		  $('#c_modal').removeClass('modal-open');
		  $('.m_image').attr("src","/")
		});
	$('#btn2').click(function(){
		  $('#site_modal').addClass('modal-open');
		  $('#p_modal').removeClass('modal-open');
		});
	$('#reser_btn').click(function(){
		  $('#reser_modal').addClass('modal-open');
		  $('#site_modal').removeClass('modal-open');
		});
// 모달뒤로가기
		$('#btn_close1').click(function(){
		  $('.container').removeClass('modal-open');	
		});
		
		$('#btn_close2').click(function(){
		  $('.container').removeClass('modal-open');
		  $('div').remove('.room');
		  $('div').remove('.disabledr');
		  $('#c_modal').addClass('modal-open');
		});
		$('#btn_close3').click(function(){
		  $('.container').removeClass('modal-open');
		  $('#p_modal').addClass('modal-open');
		});
		$('#btn_close4').click(function(){
		  $('.container2').removeClass('modal-open');
		  $('#site_modal').addClass('modal-open');
		});
		
	});

</script>
<script type="text/javascript">


var site=${site};// 사이트 모든정보db에서 가져온 정보 저장 
var site_info=${site_info}; //사이트 가격 정보 가져옴 
var peak_date=${peak_date}; //날짜 담겨있는 변수입니다 
var sum=0;
var start;
var end;
var start2;
var end2;
var arr_number=0;
var chk;
var pk_start;
var pk_end;
var price_number;//가격 확인을위한 넘버 
var site_n



$(function(){
	$("#btn_p").click(function(){
		start=$("#start2").val();
		end=$("#end2").val();
	var person_n = $('#counter').text();
		person_num = Number(person_n)
		
		
		$("#per_num").val(person_num);
		$.post(
				{
				url:"/reservation",
				dataType : "json",
				data : {
					"start":start,
					"end":end,
				}
		}).done(function(data){
			$(".site").remove();
			$(".can").remove();
			$(".disable").remove();
		
			var reservation=data.reservation;  //날짜로 나온 결과값
			
			data_price=data.price_data;
			if(reservation.length==site["site"].length){ //만약 전체방이 예약 되어있는경우
				for(var i=0;i<site_info["site_info"].length;i++){
						var text="<div class='disable' id='r"+i+"'>"+"남은 방:"+0+"/"+site_info["site_info"][i]["si_type"]+"</div>";	
					$("#room").append(text);
				
				}
			}
			else{ //전체방이 예약되어있지않은경우
			for(var i=0;i<site["site"].length;i++){
				  for(var j=0;j<reservation.length;j++){
				    if(site["site"][i]["s_no"] == reservation[j]){ //예약 된방번호체크 로직 
				      site["site"][i]["can"]=-1;
				      reservation.splice(j,j+1);
				      break;
				      }
				    }
					  for(arr_number;arr_number<site_info["site_info"].length;arr_number++){//예약 가능한방 갯수 로직
					    if(site["site"][i]["si_type"]==site_info["site_info"][arr_number]["si_type"]){
					      if(site["site"][i]["can"]==0){
					    	  site_info["site_info"][arr_number]["stock"]++;}break;}}}//실질적으로 반복문 30번밖에 되지않음
					    	  
			for(var i=0;i<site_info["site_info"].length;i++){//각각의 site 출력 로직
				if(site_info["site_info"][i]["si_limit"]<person_num){
					var text="<div class='disabledr'>"+"남은 방:"+0+"/"+site_info["site_info"][i]["si_type"]+"</div>";	
					
				}
				else{
					 var text="<div class='room' onclick='cho(this)' id='"+site_info["site_info"][i]["si_type"]+"'>"+"남은 방:"+site_info["site_info"][i]["stock"]+"/"+site_info["site_info"][i]["si_type"]+"</div>";
				}
				$("#room").append(text);
				}
			}
			
		}).fail(function(xhr){
			alert("fail");
		});
	});	
});
function cho(text){
	choose=text.getAttribute('id');
	$("#si_type").val(choose);
	$("#site_ty").val(choose);
	
	document.getElementById("room").innerHTML="";
	for(var i=0;i<site["site"].length;i++){
 		if(site["site"][i]["si_type"]==choose && site["site"][i]["can"]==0){
 			document.getElementById("room").innerHTML+="<a class='can' onclick='chroom("+site["site"][i]["s_num"]+")' id="+site["site"][i]["s_no"]+">"+site["site"][i]["s_num"]+"</a>";
 			
 		}
		else if(site["site"][i]["si_type"]==choose && site["site"][i]["can"]==-1){
			document.getElementById("room").innerHTML+="<div class='disable'>"+site["site"][i]["s_num"]+"</div>";
		}
	}
		
}


function chroom(text){
	start = new Date(document.getElementById("start2").value);
	end = new Date(document.getElementById("end2").value);
	sum=0;
	//각각의 값들 눌렀을떄 값초기화를 위해 재정의
	diff=(end - start) / (24 * 60 * 60 * 1000);
	//s_no=$(this).val();
// 	alert("오는 값 : "+text);
	//s_no 번호  
	s_num=text.innerHTML;
	//각 방의 번호
	//choose= si_type 가격 출력을 위함 
	for(var i=0;i<site_info["site_info"].length;i++){
		if(choose==site_info["site_info"][i]["si_type"]){
			price_number=i;
			break;
		}
	}
		for (var i = 0; i <= diff; i++) {
			  if(i>0){
			    start.setDate(start.getDate() + 1);
			  }
			  chk=false;
			  if (start.getDay() == 5 || start.getDay() == 6) { //주말일경우 
			    for(var j=0;j<peak_date["peak_date"].length;j++){
			      pk_start=new Date(peak_date["peak_date"][j]["start_date"]);
			      pk_end=new Date(peak_date["peak_date"][j]["end_date"]);
			      if(pk_start<=start && pk_end>=start){ //날짜가 선택된경우
			        if(peak_date["peak_date"][j]["type"]=="2"){ //극성수기인경우 
			          sum=sum+site_info["site_info"][price_number]["si_hfs"]; //극성수기 주말가격 
			          chk=true;
			          break;
			        }
			        else{   //성수기인경우
			        sum=sum+site_info["site_info"][price_number]["si_pfs"]; //성수기 주말가격 
			          chk=true;
			          break;
			        }
			      }
			    }
			    if(chk==false){
			      sum=sum+site_info["site_info"][price_number]["si_lfs"]; //비성수기 주말가격 
			    }
			  }
			  else { //평일일경우 
			      for(var j=0;j<peak_date["peak_date"].length;j++){
			      pk_start=new Date(peak_date["peak_date"][j]["start_date"]);
			      pk_end=new Date(peak_date["peak_date"][j]["end_date"]);
			      if(pk_start<=start && pk_end>=start){ //날짜가 선택된경우
			        if(peak_date["peak_date"][j]["type"]=="2"){ //극성수기인경우 
			        	sum=sum+site_info["site_info"][price_number]["si_hwe"];   //극성수기 평일가격  
			          chk=true;
			          break;
			        }
			        else{   //성수기인경우
			       	 	sum=sum+site_info["site_info"][price_number]["si_pwe"];//성수기 평일 가격 
			          chk=true;
			          break;
			        }
			      }
			    }
			     if(chk==false){
			    	 sum=sum+site_info["site_info"][price_number]["si_price"]; //비성수기 평일 가격
			    }
			  }
			}
		$("#card_amount").val(sum);
		$("#sum").val(sum);
		$("#s_no").val(text);
		$("#site_n").val(text);
	}

	//예약 팝업창 띄운후  
$(document).on("click", ".disable", function () {
	  alert("예약이 불가능한방입니다 ");
	});
const $counter = document.getElementById('counter');
const $increase = document.getElementById('increase');
const $decrease = document.getElementById('decrease');
let num=1;
const render = function() {$counter.innerHTML = num;};

$increase.onclick = function () {
	num++;
	console.log('increase 버튼 클릭', num);
	render();
};
$decrease.onclick = function () {
	
	if(num<2){
		num=1;
	}else{
		num--;
	}
	
	console.log('decrease 버튼 클릭', num);
	render();
};

function checkOnlyOne(element) {
	  
	  const checkboxes 
	      = document.getElementsByName("pay_type");
	  
	  checkboxes.forEach((cb) => {
	    cb.checked = false;
	  })
	  
	  element.checked = true;
	}

	
	

</script>
</html>