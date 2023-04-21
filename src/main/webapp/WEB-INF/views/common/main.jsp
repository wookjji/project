<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script type="text/javascript">
        var imgArray = new Array();
        imgArray[0] = "./image/camp0.png";
        imgArray[1] = "./image/camp1.png";
        imgArray[2] = "./image/camp2.png";

        function showImage() {
            var imgNum = Math.round(Math.random() * 2);
            var objImg = document.getElementById("introImg");
            objImg.src = imgArray[imgNum];
            setTimeout("showImage()", 3000);
        }
    </script>
<style>
	body{
	z-index: 1;
	}
.image{
    width: 980px;
    height: 400px;
    margin: 0 auto;
    position: absolute;
    left: calc(50% - 500px);
    position: absolute;
    top:25px;
}
.maindiv{
    width: 100%;
    height: 450px;
    position: relative;
    background-image: url("./image/backimage.png");
    background-size: 100% 450px;
    background-repeat: no-repeat;
    position: relative;
}
</style>
</head>
<body onload="showImage()">
<div class="maindiv">
<img id="introImg" class="image" border="0">
</div>
</body>
</html>