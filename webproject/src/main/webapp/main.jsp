<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메인페이지(홈)</title>
    <style>
       /* category-박스 설정 */
        .category-container {
            display: flex;
            flex-wrap: wrap;
            gap: 25px; /* 버튼 간 간격 증가 */
            justify-content: center; /* 버튼을 가운데 정렬 */
            margin-top: 180px; /* 상단 여백 조정 */
        }

        /* category-버튼 스타일 */
        .category-button {
            width: 180px; /* 버튼 너비 증가 */
            padding: 20px 0px; /* 버튼 내부 여백 증가 */
            border: 2px solid #ddd;
            border-radius: 35px;
            background-color: #f5f5f5;
            font-size: 25px; /* 글자 크기 증가 */
            color: #333;
            cursor: pointer; /* 마우스 오버 시 포인터 커서 이미지*/
            text-align: center;
        }

        /* 정렬-박스 설정 */
        .sorting-container {
            display: flex;
            gap: 10px;
            justify-content: center;
            margin-top: 45px; 
            margin-left: 500px;
        }

        /* 정렬-버튼 스타일 */
        .sorting-button {
            width: 100px;
            padding: 10px 0px;
            border: 2px solid #ddd;
            border-radius: 35px;
            background-color: #f5f5f5;
            font-size: 18px;
            color: #333;
            cursor: pointer;
            text-align: center;
            
        }

        /* 선택된 버튼 스타일 */
        .selected {
            background-color: #ffae42;
            color: white;
            border-color: #ffae42;
        }

        /* 박스 위에 올렸을 때 */
        .category-button:hover {
            background-color: #ffae42;
            color : #f5f5f5;
        }
        .sorting-button:hover {
            background-color: #ffae42;
            color : #f5f5f5;

        }

        /* 세 번째 메인 버튼 이후 줄바꿈 */
        .break {
            flex-basis: 100%;
            height: 0;
        }

        .plus{
            position : fixed;
            width : 100px;
            height : 100px;
            margin-top : 1300px;
            margin-left : 700px;
        }
       
           

    </style>
    <script>
        function selectCategory(element) { 
            const buttons = document.querySelectorAll('.category-button');
            buttons.forEach(button => button.classList.remove('selected'));
            element.classList.add('selected');
        }

        function selectSorting(element) {
            const buttons = document.querySelectorAll('.sorting-button');
            buttons.forEach(button => button.classList.remove('selected'));
            element.classList.add('selected');
        }
    </script>
</head>
<body>
    <div class="category-container">
        <div class="category-button selected" onclick="selectCategory(this)">전체</div>
        <div class="category-button" onclick="selectCategory(this)">물품 대여</div>
        <div class="category-button" onclick="selectCategory(this)">배달</div>
        <div class="break"></div>
        <div class="category-button" onclick="selectCategory(this)">문서 작성</div>
        <div class="category-button" onclick="selectCategory(this)">단순 서비스</div>
        <div class="category-button" onclick="selectCategory(this)">기타</div>
    </div>

    <div class="sorting-container">
        <div class="sorting-button" onclick="selectSorting(this)">최신순</div>
        <div class="sorting-button" onclick="selectSorting(this)">포인트순</div>
        <div class="sorting-button" onclick="selectSorting(this)">마감순</div>
    </div>
    <img class="plus" src="./image/plus.png" onclick="location.href='main-plus.jsp';">
    <jsp:include page="navigation.jsp"/>

    
</body>
</html>
