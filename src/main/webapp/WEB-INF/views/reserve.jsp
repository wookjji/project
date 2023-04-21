<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./resources/css/modal2.css?v=2" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<script>
let start_to_date;
let end_to_date;
let diff2;
var site_json=${json.get("site")};
let s_num=${num};
let f_start;
let f_end;
let test_start;
let test_end;
let choose;//추가 해야
$(function(){	
	$("#subtraction").click(function(){
	 	$("#s_date").val(s_num-1);
 		$("#search").val("${standard}");
		$("#gogo2").submit();
	})
	$("#plus").click(function(){
		$("#s_date").val(s_num+1);
		$("#search").val("${standard}");
		$("#gogo2").submit(); 
	})
	start_to_date=new Date("${start}");  
	end_to_date=new Date("${end}"); 
	diff2=(end_to_date - start_to_date) / (24 * 60 * 60 * 1000);
	//날짜 표시 테이블
	for(var i=0;i<=diff2;i++){
		  if(i>0){
			  start_to_date.setDate(start_to_date.getDate() + 1);
			  }	  
		var text="<th class='da'>"+start_to_date.getDate()+"</th>"
		$("#print").append(text);
	}
		
 	for(var i=0;i<site_json.length;i++){
 		f_start=new Date("${start}");
		var text2="<tr id="+site_json[i]["s_no"]+"></tr>"
		$("#middle").append(text2);
	 	var text3="<th>"+site_json[i]["si_type"]+"/"+site_json[i]["s_num"]+"</th>";
		$("#"+site_json[i]["s_no"]).append(text3);
		
		if(site_json[i]["start_date"].length==0){	//reservation의 날짜가 없는경우 
			for(var j=0;j<=diff2;j++){
				var text4="<th class='can'></th>";
				$("#"+site_json[i]["s_no"]).append(text4);
			}	
		}
		else{
			for(var j=0;j<=diff2;j++){//reservation의 날짜가 있는경우
				 if(j>0){f_start.setDate(f_start.getDate() + 1);}
				if(site_json[i]["start_date"].length>0){//아직까지 남아있는 경우에만
					test_start=new Date(site_json[i]["start_date"][0]);
					test_end=new Date(site_json[i]["end_date"][0]);
					if(f_start<test_start){ //Ex 4/1 4/2~4/4일의 경우
						var text4="<th class='can'></th>";
						$("#"+site_json[i]["s_no"]).append(text4);
					}
					else if(f_start>=test_start){
							if(f_start>=test_end){
								var text4="<th id="+site_json[i]["reservation_n"][0]+" class='disable' ></th>";
								$("#"+site_json[i]["s_no"]).append(text4);
								site_json[i]["end_date"].splice(0,1);
								site_json[i]["start_date"].splice(0,1);
								site_json[i]["reservation_n"].splice(0,1);
							}
							else{
								var text4="<th id="+site_json[i]["reservation_n"][0]+" class='disable'></th>";
								$("#"+site_json[i]["s_no"]).append(text4);
							}
					}
				}
				else{
					var text4="<th class='can'></th>";
					$("#"+site_json[i]["s_no"]).append(text4);
					
				}
			}
		}
	}
 	//검색 버튼 눌렀을떄
 	$("#ddd").click(function(){
 		$("#search").val($("#dd").val()+"-01");
 		$("#s_date").val(0);
 		$("#gogo2").submit(); 		
 	})
 	//검색버튼을 누르지않고 선택했을떄 
 	
 	 	$(".disable").click(function(){
 		choose=$(this).attr('id');
 		$(".modal").show();
 		$(".close_modal").click(function(){
 			$(".modal").hide();
 		});
		$.post(
				{
				url:"/modal",
				dataType : "json",
				data : {
					"rno":choose,
				}
		}).done(function(data){
			//alert(data.json.r_name);
			
			$(".s_type").text(data.json.si_type);
			$(".s_num").text(data.json.s_num);
			$(".r_name").text(data.json.r_name);
			$(".r_no").text(data.json.r_no);
			$(".r_tel").text(data.json.r_tel);
			$(".r_count").text(data.json.r_count+"명");
			$(".r_date").text(data.json.r_in+"~"+data.json.r_out);
 		}).fail(function(xhr){
			alert("fail");
		});
 	 	})
 	
});


</script>
<style>
.can {
	background-color: #0489B1;
}

th {
	width: 50px;
	height: 20px;
	border: 1px solid black;
	font-size: 11px;
}

.peak_day {
	width: 100px;
	height: 100px;
	background-color: yellow;
}

.room {
	width: 100px;
	height: 100px;
	background-color: skyblue;
}

.disable {
	background-color: gray;
}

.tb {
	border-collapse: collapse;
}
.box{
width: calc(100% - 180px);
height: 100vh;
float: left;
margin-top: 2px;
}
.monthbox{
margin-left:450px;
width:inherit;
height: 30px;
float: left;
}
#subtraction{
text-align: center;
width: 60px;
height: 25px;
line-height: 25px;
border: 1px solid black;
float:left;
font-weight: bold;
font-size: 13px;
}
.year{
width:150px;
text-align:center;
float:left;
display: block;
}
#plus{
text-align: center;
width: 60px;
height: 25px;
line-height: 25px;
border: 1px solid black;
float:left;
font-weight: bold;
font-size: 13px;
}
.tablebox{
float: left;
width: inherit;
}
.month{
float:left;
width: 300px;
height:30px;
padding-right: 240px;

}
.month_search{
float:left;
width: 200px;
}

</style>

<body>
<%@include file="menu.jsp" %>
<div class="box">
<div class="monthbox">
	<div class="month">
		<form id="gogo2" action="/reserve" method="get">
		<input id="s_date" type="hidden" name="s_date">
		<div id="subtraction"> << </div>
		<span class="year">${month }</span>
		<div id="plus">>></div>
		<input type="hidden" name="search" id="search">
	</form>
	</div>
	<div class="month_search">
	<input type="month" id="dd">
	<button type="button" id="ddd">gogo</button>
	</div>	
</div>
<div class="tablebox">
	<table class="tb">
		<thead id="top">
			<tr id="print">
				<th>구분</th>
			</tr>
		</thead>
		<tbody id="middle">
		</tbody>

	</table>
</div>
</div>
<div class="modal">
		<div class="modal_body">
		<div class="close_modal" style="cursor:pointer">X</div>
		
			<div class="modalbox"><div class="text">SITE :</div><span type="text" class="a s_type"></span></div>
			<div class="modalbox"><div class="text">NO :</div><span type="text" class="a s_num"></span></div>
			<div class="modalbox"><div class="text">예약번호 :</div><span type="text" class="a r_no"></span></div>
			<div class="modalbox"><div class="text">예약자명 :</div><span type="text" class="a r_name"></span></div>
			<div class="modalbox"><div class="text">예약자 전화번호 :</div><span type="text" class="a r_tel"></span></div>
			<div class="modalbox"><div class="text">인원 :</div><span class="a r_count" ></span></div>
			<div class="modalbox"><div class="text">예약일 :</div><span class="a r_date"></span></div>			
		</div>
</div>
</body>
<script type="text/javascript" src="./resources/js/modal.js?v=1"></script>
</html>