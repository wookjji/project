<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>다음 지도 API</title>
	<style>
	.backmap{
	width: 100%;
	height: 400px;
	background-color: silver;
	position: relative;
	border: 1px solid black;
  	border-width:1px 0 1 0;
	}
	.map{
	position: absolute;
	width:550px;
	height:350px;
	left:0;
	}
	.bigmap{
	width: 980px;
    height: 400px;
    margin: 0 auto;
    position: absolute;
    left: calc(50% - 500px);
   	top:30px;
	}
	.juso{
	position: absolute;
	width:400px;
	height:350px;
	right:0;	
	background-image: url("./image/tent.jpg");
	background-size: 400px 350px;
	background-repeat: no-repeat;
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
<div class="backmap">
	<div class="bigmap">
	<div class="map" id="map"></div>
	<div class="juso"></div>
	</div>
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
		    content : '<div class="smallbox"> 아이고 캠핑장</div>' // 인포윈도우에 표시할 내용
		});
		// 인포윈도우를 지도에 표시한다
		infowindow.open(map, marker);
		// 마커에 클릭 이벤트를 등록한다 (우클릭 : rightclick)
		kakao.maps.event.addListener(marker, 'click', function() {
		});
	</script>
</html>