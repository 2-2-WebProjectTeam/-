<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>main-plus</title>
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
       .title {
         font-size: 42px;
         font-weight: 900;
         text-align: center;
         position: relative;
         top: 20px; /* 텍스트의 상단 여백 */
         transform: translateY(0);
       }
       
        .input-field {
            width: 100%;
            /* padding: 15px; */
            margin: 100px 0;
            border: none;
            border-bottom: 2px solid #ddd;
            font-size: 50px;
            outline: none;
        }
        /* 카테고리 버튼 스타일 */
        .category-container {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            justify-content: center;
            margin: 15px 0;
        }
        .category-button {
            width: 180px; /* 버튼 너비 증가 */
            padding: 20px 0px; /* 버튼 내부 여백 증가 */
            border: 2px solid #ddd;
            border-radius: 35px;
            font-size: 25px; /* 글자 크기 증가 */
            color: #333;
            cursor: pointer; /* 마우스 오버 시 포인터 커서 이미지*/
            text-align: center;
            margin : 5px;
        }
        .category-button:hover {
            background-color: #eee;
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
            margin-top : 20px;
        }
        .submit-button:hover {
            background-color: #ff9800;
        }
        /* fieldset 스타일 */
        fieldset {
            border: 2px solid #ddd; /* 테두리 색상 */
            border-radius: 70px; /* 둥근 모서리 */
            padding: 30px;
            margin : 82px;
            font-size:30px;
            color : #424242
            
        } 
        .map-icon {
            position: absolute;
            right: 150px; /* 오른쪽 끝으로 배치 */
            top: 980px;
            width: 50px; /* 아이콘 너비 */
            height: 50px; /* 아이콘 높이 */
            cursor: pointer; /* 클릭 가능한 느낌 */
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
    <div class="title-container">
        <img src="./image/arrow.back.png" onclick="history.back()"> 
        <div class="title">심부름 등록</div>
    </div>

    <form>
        <fieldset class="form">
            <table style="width: 100%;">
                <tr>
                    <td>제목</td>
                </tr>
                <tr>
                    <td><input type="text" name="title" class="input-field"></td><br>
                </tr>
                <tr>
                    <td>기한</td>
                </tr>
                <tr>
                    <td><input type="text" name="deadline" class="input-field"></td>
                </tr>
                <tr>
                    <td>장소</td>
                </tr>
                <tr>
                    <td><input type="text" name="place" class="input-field">
                    <img src="./image/map_icon.png"alt="지도 아이콘" class="map-icon" onclick="openMapOverlay()" ></td><tr>
                </tr>
                <tr>
                    <td>활동비</td>
                </tr>
                <tr>
                    <td><input type="text" name="money" class="input-field"></td>
                </tr>
                <tr>
                    <td>
                        <div class="category-container">
                            <div class="category-button" onclick="selectCategory(this)">문서 작성</div>
                            <div class="category-button" onclick="selectCategory(this)">물품 대여</div>
                            <div class="category-button" onclick="selectCategory(this)">배달</div>
                            <div class="category-button" onclick="selectCategory(this)">단순 서비스</div>
                            <div class="category-button" onclick="selectCategory(this)">기타</div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>요청 내용</td>
                </tr>
                <tr>
                    <td><textarea name="detail" rows="8%" style="width: 100%; padding: 0px; font-size: 30px; border: 2px solid #ddd; border-radius: 5px;"></textarea></td>
                </tr>
                <tr>
                    <td style="text-align: center;" ><input type="submit" value="등록하기" class="submit-button" ></td>
                </tr>
            </table>
        </fieldset>
    </form>
    </div>
    <!-- Overlay for the map -->
    <div class="overlay" id="mapOverlay" style="display: none; position: absolute; top: 25%; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, 0.5);">
    <div style="position: relative; width: 80%; margin: 0 auto; background: white; padding: 20px; border-radius: 10px; top: 50px;">
        <img src="./image/arrow.back.png" alt="닫기 버튼" style="position: absolute; top: 10px; cursor: pointer;" onclick="closeMapOverlay()">
        <img src="./image/dongguk.map.png" alt="지도 이미지" style="width: 100%; height: auto; margin-top: 50px;">
        <input type="text" id="detailAddress" class="address-input" placeholder="상세 주소를 입력하세요" style="width: 100%; padding: 10px; margin-top: 20px; font-size: 20px; border: 1px solid #ddd; border-radius: 5px;">
        <button type="button" style="margin-top: 20px; padding: 10px 20px; font-size: 20px; background-color: #ff9800; color: white; border: none; border-radius: 5px; cursor: pointer;" onclick="setPlace()">저장</button>
    </div>
    </div>

    

    <script>
        // Function to open the map overlay
        function openMapOverlay() {
            document.getElementById('mapOverlay').style.display = 'block';
        }

        // Function to close the map overlay
        function closeMapOverlay() {
            document.getElementById('mapOverlay').style.display = 'none';
        }
        // Function to set the detailed address into the place input field
function setPlace() {
    const detailAddress = document.getElementById('detailAddress').value; // Get the value of the detail address
    const placeInput = document.querySelector('input[name="place"]'); // Select the place input field

    if (detailAddress.trim() !== "") {
        placeInput.value = detailAddress; // Set the value of the place field
        closeMapOverlay(); // Close the overlay
    } else {
        alert("상세 주소를 입력해주세요."); // Show an alert if the field is empty
    }
}

    </script>
</body>
</html>
