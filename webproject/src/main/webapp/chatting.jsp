<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="chatting.chattingDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="chatting.chatting" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>메시지 목록</title>
    <style>
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
            text-align: left;
        }
        .message-meta {
            color: #888;
            font-size: 13px;
            margin-bottom: 10px;
            text-align: left;
        }
        tr {
            cursor: pointer;
        }
        tr:hover {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>
    <div class="message-container">
        <table>
            <%
                // 세션에서 userID 가져오기
                String userID = (String) session.getAttribute("userID");
                if (userID == null || userID.isEmpty()) {
                    out.println("<tr><td colspan='2'>로그인이 필요합니다.</td></tr>");
                } else {
                    chattingDAO dao = new chattingDAO();
                    List<chatting> errands = dao.getErrandsWithChatCondition(userID);

                    for (chatting errand : errands) {
            %>
            <tr class="message">
                <td><img src="./image/profit.png" alt="프로필 이미지"></td>
                <td>
                    <div class="message-title"><%= errand.getErrandTopic() %></div>
                    <div class="message-meta"><%= errand.getErrandType() %></div>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </div>
    <jsp:include page="navigation.jsp"/>
</body>
</html>
