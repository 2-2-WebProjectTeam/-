<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>메시지 목록</title>
    <style>
        /* 기본 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .message-container {
            margin: 30px auto;
            padding: 20px;
            width: 90%;
        }
        table {
            width: 100%;
            border-spacing: 0 20px;
        }
        th, td {
            text-align: left;
            padding: 15px;
            vertical-align: top;
        }
        .message img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
        }
        .message-title {
            font-size: 15px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .message-meta {
            color: #888;
            font-size: 13px;
            margin-bottom: 10px;
        }
        tr {
            cursor: pointer;
        }
        tr:hover {
            background-color: #f0f0f0;
        }

        /* 팝업 스타일 */
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 1000;
            visibility: hidden;
            opacity: 0;
            transition: visibility 0s, opacity 0.3s ease-in-out;
        }
        .overlay.active {
            visibility: visible;
            opacity: 1;
        }
        .popup {
            width: 320px;
            height: 180px;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .popup-content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            text-align: center;
        }
        .message {
            font-size: 15px;
            font-weight: bold;
            color: #333333;
        }
        .notification {
            background-color: #ffe4c3;
            height: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #f37d0e;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .notification:hover {
            background-color: #ffd4a1;
        }
    </style>
    <script>
        // 팝업 열고 닫기 기능
        document.addEventListener('DOMContentLoaded', () => {
            const popupOverlay = document.getElementById('popupOverlay');
            const closePopupButton = document.getElementById('closePopup');

            // 팝업 열기
            function showPopup() {
          const popupMessage = document.getElementById('popupMessage');
          const link = "https://open.kakao.com/o/sO3OML1g"; // 링크 주소
          popupMessage.textContent = link; // 링크 텍스트 설정
          popupMessage.href = link;       // 링크 URL 설정
           popupOverlay.classList.add('active');
         }

            // 팝업 닫기
            closePopupButton.addEventListener('click', () => {
                popupOverlay.classList.remove('active');
            });

            // Overlay를 클릭하면 닫기
            popupOverlay.addEventListener('click', (e) => {
                if (e.target === popupOverlay) {
                    popupOverlay.classList.remove('active');
                }
            });

            // 각 행 클릭 이벤트 추가
            document.querySelectorAll('.message').forEach((row) => {
                row.addEventListener('click', showPopup);
            });
        });
    </script>
</head>
<body>
    <div class="message-container">
        <table>
            <!-- Message 1 -->
            <tr class="message">
                <td><img src="./image/profit.png" alt="프로필 이미지"></td>
                <td>
                    <div class="message-title">프린트 5장 해주세요</div>
                    <div class="message-meta">단순 서비스 · 1시간 전</div>
                </td>
            </tr>
            <!-- Message 2 -->
            <tr class="message">
                <td><img src="./image/profit.png" alt="프로필 이미지"></td>
                <td>
                    <div class="message-title">벌레좀 잡아주세요 ㅠㅠ</div>
                    <div class="message-meta">가사 · 9월 4일</div>
                </td>
            </tr>
            <!-- Message 3 -->
            <tr class="message">
                <td><img src="./image/profit.png" alt="프로필 이미지"></td>
                <td>
                    <div class="message-title">후문 메가커피에서 아아좀 사다주세요</div>
                    <div class="message-meta">배달 · 30분 전</div>
                </td>
            </tr>
        </table>
    </div>

    <!-- 팝업 Overlay -->
    <!-- 팝업 Overlay -->
<div id="popupOverlay" class="overlay">
    <div class="popup">
        <div class="popup-content">
            <a id="popupMessage" class="message" href="#" target="_blank"></a>
        </div>
        <div id="closePopup" class="notification">닫기</div>
    </div>
</div>


    <jsp:include page="navigation.jsp"/>
</body>
</html>
