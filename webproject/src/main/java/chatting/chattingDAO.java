package chatting;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class chattingDAO {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/infor?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "0000";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL JDBC 드라이버를 로드할 수 없습니다.", e);
        }
    }

    public List<chatting> getErrandsWithChatCondition(String userID) {
        List<chatting> errands = new ArrayList<>();
        String query = "SELECT e.errandID, e.errandTopic, e.errandContent, e.appliedID, e.enrollID " +
                       "FROM errand e " +
                       "WHERE (e.enrollID = ? AND e.appliedID IS NOT NULL) " +  // 첫 번째 조건: enrollID와 userID가 일치하고, appliedID가 NULL이 아님
                       "OR (e.appliedID = ?) " + // 두 번째 조건: appliedID가 userID와 일치
                       "ORDER BY e.errandID";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, userID); // userID로 enrollID 조건 설정
            pstmt.setString(2, userID); // userID로 appliedID 조건 설정

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    chatting errand = new chatting();
                    errand.setErrandID(rs.getInt("errandID"));
                    errand.setErrandTopic(rs.getString("errandTopic"));
                    errand.setErrandContent(rs.getString("errandContent"));
                    errand.setAppliedID(rs.getString("appliedID"));
                    errand.setEnrollID(rs.getString("enrollID"));

                    String errandContent = rs.getString("errandContent");
                    if (errandContent.contains("서비스")) {
                        errand.setErrandType("단순 서비스");
                    } else if (errandContent.contains("배달")) {
                        errand.setErrandType("배달");
                    } else {
                        errand.setErrandType("기타");
                    }

                    errands.add(errand);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return errands;
    }



}
