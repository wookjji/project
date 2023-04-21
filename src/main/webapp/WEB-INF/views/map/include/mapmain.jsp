<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.bar {
	width: 980px;
	height: 25px;
	position: absolute;
	left: calc(50% - 500px);
	position: absolute;
	background-color: gray;
	color: white;
	margin:5px 0 0 0;
}

.basic {
	width: 100%;
	height: 1030px;
	position: relative;
}
.bigmap{
	width: 980px;
    height: 980px;
    position: absolute;
    left: calc(50% - 500px);
    top:35px;
	}
.smallbox{
	width:150px;
	height:25px;
	text-align: center;
	line-height: 25px;
	font-size: 20px;
}
</style>
</head>
<body>
	<!-- 오시는길 -->
	<div class="basic">
		<div class="bar">&nbsp;오시는길</div>
		<div class="bigmap" id="map"></div>
	</div>
</body>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c83f897a654c7912c24749a764cc2b37"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.49959, 127.03053), // 지도의 중심좌표
		        level: 1, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 

		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new kakao.maps.ZoomControl();

		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		// 지도에 마커를 생성하고 표시한다
		var marker = new kakao.maps.Marker({
		    position: new kakao.maps.LatLng(37.49959, 127.03053), // 마커의 좌표
		    map: map // 마커를 표시할 지도 객체
		});
		// 마커 위에 표시할 인포윈도우를 생성한다
		var infowindow = new kakao.maps.InfoWindow({
		    content : '<a href="http://kko.to/42uPWtPiff"><div class="smallbox"> 아이고캠핑장</div></a>' // 인포윈도우에 표시할 내용
		});
		// 인포윈도우를 지도에 표시한다
		infowindow.open(map, marker);
	
	</script>
</html>