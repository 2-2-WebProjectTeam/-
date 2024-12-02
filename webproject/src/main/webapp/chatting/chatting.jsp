<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="errand.errandDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="errand.Errand" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>메시지 목록</title>
    <style>
    	.title {
	    text-align: center;
	    position: fixed;
	    top: 0;
	    left: 0;
	    width: 100%;
	    background-color: white; 
	    z-index: 1000; 
	    padding: 10px;
	    margin : 10px 0px 10px;
}	
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
            margin-left: 10px;
        }

        .message-title {
            font-size: 15px;
            font-weight: bold;
            margin-bottom: 10px;
            text-align: left;
            margin-left :-40px;
        }

        .message-meta {
            color: #888;
            font-size: 13px;
            margin-bottom: 10px;
            text-align: left;
            padding-left : 10px;
			margin-left : -50px;
        }

        tr {
            cursor: pointer;
        }

        tr:hover {
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
            padding: 18px;
            text-align: center;
        }

        .message {
            font-size: 16px;
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
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .notification:hover {
            background-color: #ffd4a1; /* 밝은 주황색으로 변경 */
        }
    </style>
    <script>
        function showChattingLink(link) {
            var popup = document.getElementById("popupOverlay");
            var linkElement = document.getElementById("chattingLink");
            linkElement.textContent = link;  // 텍스트를 링크로 변경
            linkElement.href = link;  // href에 실제 URL 설정
            popup.classList.add("active");
        }

        function closePopup() {
            var popup = document.getElementById("popupOverlay");
            popup.classList.remove("active");
        }
    </script>
</head>
<body>
<h3 class="title">채팅</h3>
    <div class="message-container">
        <table>
            <%
                // 세션에서 userID 가져오기
                String userID = (String) session.getAttribute("userID");
            if (userID == null || userID.isEmpty()) {
                out.println("<script>alert('로그인이 필요합니다.');</script>");
            }
 else {
                    errandDAO dao = new errandDAO();
                    List<Errand> errands = dao.getErrandsWithChatCondition(userID);

                    for (Errand errand : errands) {
            %>
            <tr class="message" onclick="showChattingLink('<%= errand.getChattingLink() != null ? errand.getChattingLink() : '#' %>')">
    <td><img src="../image/profit.png" alt="프로필 이미지"></td>
    <td>
        <div class="message-title"><%= errand.getErrandTopic() %></div>
        <div class="message-meta"><%= errand.getErrandType() %>
        /     신청자: <%= errand.getEnrollID() != null ? errand.getEnrollID() : "없음" %>
		수락자: <%= errand.getAppliedID() != null ? errand.getAppliedID() : "없음" %>
    </td>
</tr>

            <%
                    }
                }
            %>
        </table>
    </div>

    <!-- 팝업 오버레이 -->
    <div id="popupOverlay" class="overlay" onclick="closePopup()">
        <div class="popup">
            <div class="popup-content">
                <div class="message"></div>
                <a id="chattingLink" href="#" target="_blank" class="message">URL을 클릭하세요</a> <!-- "채팅 열기"를 대신해서 링크가 표시됨 -->
            </div>
            <div class="notification" onclick="closePopup()">닫기</div>
        </div>
    </div>

    <jsp:include page="../navigation.jsp"/>
</body>
</html>
