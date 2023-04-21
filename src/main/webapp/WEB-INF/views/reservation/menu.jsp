<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="./resources/css/modal.css" rel="stylesheet" type="text/css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>


  <script type="text/javascript">

  var i="${param.err}"
  	  if(i!=""){
		  alert("이미 취소된 예약번호입니다");  
	  }
  
  $(function(){	

	  
		$(".btn_r_no").click(function(){ // cal 아이디를 클릭을하면 
	 		var r_no = $("#r_no").val();
			$.post( //post방식으로 
						{
						url:"/check", //url
						dataType : "json", //받아올 데이터타입 
						data : {
							"r_no" : r_no // 보낼 데이터 == httparameter 과 같음
						}
				}).done(function(data){//성공 data라는곳에 정보가있음
					
					if(data=="1"){
						
						$("#dd").val(r_no);
						$("#btn_sub").submit();
					}
					else if(data == "2"){
						alert("이미 취소된 예약번호입니다.");
					}
					else{
						alert("예약번호가 존재하지않습니다.");
						alert("올바른 예약번호로 다시시도해주세요.");
					}


				}).fail(function(xhr){ //실패 xhr 에 정보가 있음
					alert("fail");
				})
			});
	});
//   ------------------------------------
        var imgArray = new Array();
        imgArray[0] = "./resource/image/camp0.png";
        imgArray[1] = "./resource/image/camp1.png";
        imgArray[2] = "./resource/image/camp2.png";

        function showImage() {
            var imgNum = Math.round(Math.random() * 2);
            var objImg = document.getElementById("introImg");
            objImg.src = imgArray[imgNum];
            setTimeout("showImage()", 3000);
        }
    </script>
<style>
	
	    * {
        margin: 0 auto;
        padding: 0;
    }
    ul {
        list-style: none;
    }
    a {
        text-decoration: none;
        color: green;
    }
    .big{
        width: 100%;
        height : 100px;
        position: relative;
        z-index: 5;
    }
    .menu{
        position: absolute;
        left:calc(50% - 500px);
    }
    .menu:after {
        display: block;
        content: '';
        clear: both;
    }
    .menu > li {
        position: relative;
        float: left;
        text-align: center;
        width: 180px;
        height: 100px;
    }
    .menu > li > a {
        display: block;
        background: white;
        height: 100px;
        width: 180px;
        line-height: 100px;
        color: black;
    }
    .menu > li:hover .depth_1 {
        display: block;
    }
    .menu .depth_1 {
        display: none;
        position: absolute;
        left: 0;
        right: 0;
        text-align: center;
    }
    .menu .depth_1 a {
        border: 1px solid gray;
        border-width: 1px 0 1px 0;
        display: block;
        padding: 5px;
        background: white;
        color: black;
        height: 50px;
        line-height: 50px;
    }
    .menu .depth_1 a:hover{
        background-color: #D0FC5C;
        }
</style>
</head>
<body>
<div class="big">
<ul class="menu">
        <a href="/"><img src="./resources/image/logo.jpg" style="float:left; width:260px; height:100px;"></a>
    <li>
        <a href="#">INTRODUCE</a>
        <ul class="depth_1">
            <li><a href="./introduction">소개</a></li>
            <li><a href="./map">오시는길</a></li>
        </ul>
    </li>
    <li>
        <a href="#">CAMPINFO</a>
        <ul class="depth_1">
            <li><a href="./arrangement">이용안내</a></li>
            <li><a href="./roominfo">객실안내</a></li>
            <li><a href="./useinfo">배치도</a></li>

        </ul>
    </li>
    <li>
        <a href="#">RESERVATION</a>
        <ul class="depth_1">
            <li><a href="./reinfo">예약 안내</a></li>
            <li><a href="./reservation">예약 하기</a></li>
            <li><a class="check">예약 확인</a></li>

        </ul>
    </li>
    <li>
        <a href="#">COMMUNITY</a>
        <ul class="depth_1">
            <li><a href="#">공지사항</a></li>
            <li><a href="#">이용후기</a></li>
            <li><a href="#">문의하기</a></li>
        </ul>
    </li>
</ul>
</div>
	<div class="modal">
		<div class="modal_body" style="display:hidden;">
		<div class="close_modal" style="cursor:pointer">X</div>
				<h3>예약번호를 입력해주세요</h3>
				<br> <input type="text" class="r_no" id="r_no">
				<button class="btn_r_no">확인</button>
		</div>
	</div>

			<form action="/checkok" method="post" id="btn_sub">
 				<input type="hidden" name="r_no" id="dd">
 				</form>
	
	
</body>
<script type="text/javascript">

const modal = document.querySelector('.modal');
const btnOpenPopup = document.querySelector('.check');
const closeBtn = document.querySelector('.close_modal');
btnOpenPopup.addEventListener('click',() => {modal.style.display ='block';});
closeBtn.addEventListener('click',() => {modal.style.display ='none';});
modal.addEventListener("click", e => {const evTarget = e.target
    if(evTarget.classList.contains("modal")) {
        modal.style.display = "none"
    }
});

</script>
</html>