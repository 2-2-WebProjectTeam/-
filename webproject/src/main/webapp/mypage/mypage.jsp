<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로필 페이지</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        background-color: #fff;
        height: 100%;
    }

    .profile-container {
        display: flex;
        flex-direction: column;
        align-items: center;
        padding-top: 20px;
        margin-bottom: 20px;
        width: 100%;
    }

    .profile-image {
        position: relative;
        width: 100px;
        height: 100px;
        margin-bottom: 10px;
    }

    .notification {
        position: absolute;
        top: 0;
        right: 0;
        background-color: #ff3b30;
        color: #fff;
        border-radius: 50%;
        width: 24px;
        height: 24px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 14px;
        font-weight: bold;
    }

    .profile-info {
        text-align: center;
        cursor: pointer; /* 클릭 가능하도록 커서 변경 */
    }

    .profile-info h2 {
        font-size: 20px;
        margin: 5px 0;
    }

    .profile-info .points {
        color: #ffae42;
        font-size: 14px;
    }

    .profile-links {
        display: flex;
        justify-content: space-around;
        width: 100%;
        padding: 15px 0;
        border-top: 1px solid #ddd;
        font-size: 16px;
    }

    .profile-link {
        padding: 10px 20px;
        cursor: pointer;
    }

    .profile-link.active {
        background-color: #ffae42;
        color: #fff;
        border-radius: 5px;
    }
</style>
<script>
    function toggleActive(element) {
        document.querySelectorAll(".profile-link").forEach(link => {
            link.classList.remove("active");
        });
        element.classList.add("active");
    }
</script>
</head>
<body>

<div class="profile-container">
    <img src="<%= request.getContextPath() %>/image/circle.png" class="profile.image">
    <div class="profile-info" onclick="window.location.href='<%= request.getContextPath() %>/login/login.jsp'">
        <h2>로그인</h2>
        <p class="points">0 point</p>
    </div>
    <div class="profile-links">
        <span class="profile-link" onclick="toggleActive(this)">내가 신청한 일</span>
        <span class="profile-link" onclick="toggleActive(this)">내가 등록한 일</span>
    </div>
</div>
<jsp:include page="../navigation.jsp"/>
</body>
</html>