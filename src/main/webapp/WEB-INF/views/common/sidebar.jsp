<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>기본창</title>
<style>
.side{

}
.main{
    width: 100%;
    border: 1px solid black;
}
.side {
    position: fixed;
    top: 300px;
    right: 155px;
}
.box{
}
.box div{
    border: 1px solid black;
    width: 100px;
    height: 100px;
    background: pink;
}

</style>
</head>
<body>
<div class="main">
    <div class="side">
    <div class="box">
        <div>
            <div><a href="./map"><img src="./image/map.png" style="float:left; width:100px; height:100px;"></a></div>
            <div><a href="./useinfo"><img src="./image/bachi.png" style="float:left; width:100px; height:100px;"></a></div>
            <div><a href="./arrangement"><img src="./image/info.png" style="float:left; width:100px; height:100px;"></a></div>
            <div><a href="./reservation"><img src="./image/re.png" style="float:left; width:100px; height:100px;"></a></div>
        </div>
    </div>
    </div>
</div>


</body>
</html>