<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>팝업 예제</title>
    <style>
        /* 전체 화면 스타일 */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }

        /* 배경 흐림 효과 (Overlay) */
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5); /* 어두운 투명 배경 */
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

        /* 팝업 창 스타일 */
        .popup {
            position: relative;
            width: 320px;
            height: 180px;
            background: #ffffff; /* 흰색 배경 */
            border-radius: 12px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        /* 팝업 상단 메시지 */
        .popup-content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            text-align: center;
        }

        .message {
            font-size: 18px;
            font-weight: bold;
            color: #333333; /* 진한 글자 색상 */
        }

        /* 하단 버튼 영역 */
        .notification {
            background-color: #ffe4c3; /* 연한 주황색 */
            height: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #f37d0e; /* 오렌지색 텍스트 */
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .notification:hover {
            background-color: #ffd4a1; /* 밝은 주황색으로 변경 */
        }
    </style>
</head>
<body>
    <div id="popupOverlay" class="overlay">
        <div class="popup">
            <div class="popup-content">
                <div class="message">팝업 메시지</div>
            </div>
            <div class="notification" id="closePopup">닫기</div>
        </div>
    </div>

    <script>
        // 요소 가져오기
        document.addEventListener('DOMContentLoaded', () => {
            const popupOverlay = document.getElementById('popupOverlay');
            const closePopupButton = document.getElementById('closePopup');

            // 페이지 로드 시 팝업 자동 열기
            popupOverlay.classList.add('active');

            // 팝업 닫기
            closePopupButton.addEventListener('click', () => {
                // 이전 페이지로 돌아가기
                window.location.href = document.referrer || '/defaultPage.jsp'; // referrer가 없으면 기본 페이지로
            });

            // Overlay를 클릭하면 닫기
            popupOverlay.addEventListener('click', (e) => {
                if (e.target === popupOverlay) {
                    window.location.href = document.referrer || '/defaultPage.jsp'; // referrer가 없으면 기본 페이지로
                }
            });
        });
    </script>
</body>
</html>
