<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
    <meta charset="UTF-8">
    <title>erand_enroll</title>
    <style>
        .title-container {
            width: 100%;
            max-width: 1000px;
            position: relative;
            margin: 0 auto;
            padding-top: 20px; /* 상단 여백 */
        }
        .title-container img {
            position: absolute;
            top: 20px; /* 이미지의 상단 여백 */
            left: 20px; /* 이미지의 왼쪽 여백 */
            cursor: pointer; /* 클릭 가능하도록 커서 변경 */
        }
        h1 {
            padding: 150px 60px 0px;
            font-size: 50px;
        }
        h7 {
            padding: 0px 60px;
            font-size: 30px;
        }
        .explanation {
            padding: 100px 60px;
        }
        .explanation-item {
            margin-bottom: 50px; /* 각 항목 간의 간격 조정 */
            font-size: 30px;
        }
        .icon {
            margin-right: 50px; /* 아이콘과 텍스트 간의 간격 */
            vertical-align: middle; /* 아이콘 정렬 */
            height : 40px;
        }
        .map{
            width : 95%;
        }
        .place{
            margin-top : -220px;
        }
        h6{
            padding: 0px 60px;
            font-size: 35px; 
            color : #F7A239;

        }
        .content {
            padding: 0px 60px;
            margin-top : -50px;
            font-size: 23px;
            line-height: 1.6; /* 줄 간격 설정 */
            color: #333;
            word-wrap: break-word; /* 긴 단어 줄바꿈 */
            word-break: break-word; /* 단어가 영역을 벗어나지 않게 */
        }
        .submit-button {
            width: 580px;
            padding: 20px;
            border: none;
            border-radius: 20px;
            background-color: #fde7cd;
            font-size: 40px;
            cursor: pointer;
            color : #F7A239;
            margin-top : 400px;
            display : block;
            margin-left: auto; 
            margin-right: auto; 
            text-align:center;
        }
        .submit-button:hover {
            background-color: #ff9800;
        }
        .arrow {
         position: fixed;
         top: 20px;
         left: 20px;
         cursor: pointer;
         width: 30px;
         height: 30px; 
         z-index: 100;
      }


    </style>
</head>
<body>
    <div class="title-container">
        <img src="./image/arrow.back.png" class="arrow" onclick="history.back()">
    </div>
    <h1>프린트 5장 해주세요</h1>
    <h7>단순서비스</h7>
    <div class="explanation">
        <div class="explanation-item">
            <img class="icon" src="./image/time.png">기한 : 9/4 (수) 10:00
        </div>
        <div class="explanation-item">
            <img class="icon" src="./image/place.png">장소 : 신공학관 3106
        </div>
        <div class="explanation-item">
            <img class="icon" src="./image/point.png">활동비 : 2000 point
        </div>
    </div>
    <div class="place">
        <img class="map" src="./image/dongguk.map.png"></div>
        <img src="./image/Vector.png">  <!--나중에 정보 받아와서 조정예정 -->
    </div>
    <hr style=width:800px;>
    <div class="detail">
        <h6>요청 내용</h6>
        <div class="content">지금 당장 받는게 힘들것같아 프린트 이후 3106 앞 사물함에 넣어주시면 좋을것같습니다. 뽑을 내용은 채팅으로 보내드릴게요.</div>
    </div>
    <input type="submit" value="등록하기" class="submit-button" >
</body>
</html>
