var sysdate = new Date();
var year=sysdate.getFullYear();
var month=sysdate.getMonth()+3;
var date=sysdate.getDate();
var after=year+"/"+month+"/"+date;

$(function(){
	
	$("#dates").daterangepicker({
		autoUpdateInput: false,
		   "locale": {
		 "format": "YYYY-MM-DD",
		 "separator": " ~ ",
	     "applyLabel": "확인",
	     "cancelLabel": "취소",
	     "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
	     "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
	}
   },function(start,end){
   	var date_start=start.format("YYYY-MM-DD");
   	var end_start=end.format("YYYY-MM-DD");
   	$("#start").val(date_start);
   	$("#end").val(end_start);
   	
   	}
	)
	$("#peak").click(function(){
		if($("#start").val()=="" || $("#end").val()==""){
			alert("날짜를 입력해주세요.");
			return false;
		} else{
			$("#dateform").attr("action", "/peak");
			$("#dateform").submit();
		}
	});
	
	$("#hpeak").click(function(){
		if($("#start").val()=="" || $("#end").val()==""){
			alert("날짜를 입력해주세요.");
			return false;
		} else{
			$("#dateform").attr("action", "/hpeak");
			$("#dateform").submit();
		}
	});
	
	
	
});