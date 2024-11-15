<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    .navbar {
        position: fixed;
        bottom: 20px; /* 화면 하단에서 20px 위로 */
        left: 0;
        width: 100%;
        height: 100px; /* 네비게이션 바 높이 */
        background-color: #fff;
        display: flex;
        justify-content: space-around;
        align-items: center;
        box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1); /* 상단 그림자 */
        z-index: 1000; /* 다른 요소 위에 표시 */
        font-family: Arial, sans-serif;
        font-size: 14px;
        color: #aaa;
    }

    .navbar-item {
        display: flex;
        flex-direction: column;
        align-items: center;
        text-decoration: none;
        color: #aaa;
        cursor: pointer;
    }

    .navbar-item img {
        width: 30px; /* 아이콘 크기 */
        height: 30px;
        margin-bottom: 5px; /* 아이콘과 텍스트 간격 */
    }

    .navbar-item:hover {
        color: #333; /* 텍스트 호버 색상 변경 */
    }
</style>

<div class="navbar">
    <a class="navbar-item" href="chat.jsp">
        <img src="./image/nav_chat.png" alt="채팅">
        채팅
    </a>
    <a class="navbar-item" href="main.jsp">
        <img src="./image/nav_home.png" alt="홈">
        홈
    </a>
    <a class="navbar-item" href="my.jsp">
        <img src="./image/nav_my.png" alt="마이">
        마이
    </a>
</div>
