<%@ page import="java.sql.*" %>
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
            text-align: left; /* Left align the title */
        }
        .message-meta {
            color: #888;
            font-size: 13px;
            margin-bottom: 10px;
            text-align: left; /* Left align the meta information */
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
                // Database connection details
                String dbURL = "jdbc:mysql://localhost:3306/infor"; // Replace with your DB URL
                String dbUser = "root"; // Replace with your DB username
                String dbPassword = "chlalstjr04A"; // Replace with your DB password

                // Query to fetch errand details
                String query = "SELECT errandID, errandTopic, errandContent FROM errand ORDER BY errandID";

                try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                     Statement stmt = conn.createStatement();
                     ResultSet rs = stmt.executeQuery(query)) {

                    // Iterate through result set and display rows
                    while (rs.next()) {
                        int errandID = rs.getInt("errandID");
                        String errandTopic = rs.getString("errandTopic");
                        String errandType = ""; // Derive errandType based on errandContent
                        String errandContent = rs.getString("errandContent");

                        // Example logic to derive errandType
                        if (errandContent.contains("서비스")) {
                            errandType = "단순 서비스";
                        } else if (errandContent.contains("배달")) {
                            errandType = "배달";
                        } else {
                            errandType = "기타";
                        }
            %>
            <tr class="message">
                <td><img src="./image/profit.png" alt="프로필 이미지"></td>
                <td>
                    <div class="message-title"><%= errandTopic %></div>
                    <div class="message-meta"><%= errandType %></div>
                </td>
            </tr>
            <%
                    }
                } catch (SQLException e) {
                    out.println("Database error: " + e.getMessage());
                }
            %>
        </table>
    </div>

    <jsp:include page="navigation.jsp"/>
</body>
</html>
