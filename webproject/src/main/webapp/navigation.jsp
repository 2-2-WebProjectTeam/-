<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>하단바</title>
<style>
    .navbar {
        position: fixed;
        bottom: 0; /* Positioned at the bottom */
        left: 0;
        width: 100%;
        height: 60px; /* Reduced navbar height */
        background-color: #fff;
        display: flex;
        justify-content: space-around;
        align-items: center;
        box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.1);
        z-index: 1000;
        font-family: Arial, sans-serif;
        font-size: 12px; /* Reduced font size */
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
        width: 24px; /* Reduced icon size */
        height: 24px;
        margin-bottom: 3px; /* Reduced spacing between icon and text */
    }

    .navbar-item:hover {
        color: #333; /* Hover text color */
    }
</style>
</head>
<body>
<div class="navbar">
    <a class="navbar-item" href="<%= request.getContextPath() %>/mypage/mypage.jsp">
        <img src="<%= request.getContextPath() %>/image/nav_chat.png" alt="채팅">
        채팅
    </a>
    <a class="navbar-item" href="<%= request.getContextPath() %>/main.jsp">
        <img src="<%= request.getContextPath() %>/image/nav_home.png" alt="홈">
        홈
    </a>
    <a class="navbar-item" href="<%= request.getContextPath() %>/mypage/mypage.jsp">
        <img src="<%= request.getContextPath() %>/image/nav_my.png" alt="마이">
        마이
    </a>
</div>
</body>
</html>
