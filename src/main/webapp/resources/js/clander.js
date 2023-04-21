var sysdate = new Date();
var year=sysdate.getFullYear();
var month=sysdate.getMonth()+3;
var date=sysdate.getDate();
var after=year+"/"+month+"/"+date;

$(function(){
	
	$("#dates").daterangepicker({
		autoUpdateInput: false,
		   "locale": {
		 "format": "YYYY-MMM-DD",
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
   	var year=end.format("YYYY");
   	$("#start").val(date_start);
   	$("#end").val(end_start);
   	$("#year").val(year);
   	}
	)
});