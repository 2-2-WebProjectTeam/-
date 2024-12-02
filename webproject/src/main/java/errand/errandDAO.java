package errand;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class errandDAO {
	private Connection conn;
	private ResultSet rs;

	public errandDAO()
	{
		try {
			String dbURL = "jdbc:mysql://localhost:3306/infor?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "0000";
			Class.forName("com.mysql.cj.jdbc.Driver");

			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public String getDate() {
		String SQL="SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";	//데이터베이스 오류
	}
	public int getNext() {
		String SQL="SELECT errandID FROM errand ORDER BY errandID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;	//첫번째 게시물인 경우
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;	//데이터베이스 오류
	}
	
	public int write(String enrollID, String errandTopic, String errandDeadLine, String errandPlace, String errandFee, String chattingLink, String errandType, String errandContent) {
		String SQL="INSERT INTO errand VALUE (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1,  getNext());
			pstmt.setString(2,  enrollID);
			pstmt.setString(3,  getDate());
			pstmt.setString(4,  errandTopic);
			pstmt.setString(5,  errandDeadLine);
			pstmt.setString(6,  errandPlace);
			pstmt.setString(7,  errandFee);
			pstmt.setString(8,  chattingLink);
			pstmt.setString(9,  errandType);
			pstmt.setString(10,  errandContent);
			pstmt.setString(11,  null);
			pstmt.setInt(12,  1);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;	//데이터베이스 오류
	}
	
	public ArrayList<Errand> getList(){
		String SQL="SELECT * FROM errand WHERE errandAvailable=1 ORDER BY errandID";
		ArrayList<Errand> list = new ArrayList<Errand>();
		try{
			PreparedStatement pstmt=conn.prepareStatement(SQL);	
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Errand errand=new Errand();
				errand.setErrandID(rs.getInt(1));
				errand.setEnrollID(rs.getString(2));
				errand.setEnrollDate(rs.getString(3));
				errand.setErrandTopic(rs.getString(4));
				errand.setErrandDeadLine(rs.getString(5));
				errand.setErrandPlace(rs.getString(6));
				errand.setErrandFee(rs.getString(7));
				errand.setChattingLink(rs.getString(8));
				errand.setErrandType(rs.getString(9));
				errand.setErrandContent(rs.getString(10));
				errand.setAppliedID(rs.getString(11));
				errand.setErrandAvailable(rs.getInt(12));
				list.add(errand);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	
	}
	public List<Errand> getErrandsWithChatCondition(String userID) {
        List<Errand> errands = new ArrayList<>();
        String query = "SELECT e.errandID, e.errandTopic, e.errandContent, e.appliedID, e.enrollID " +
                       "FROM errand e " +
                       "WHERE (e.enrollID = ? AND e.appliedID IS NOT NULL) " +  
                       "OR (e.appliedID = ?) " + 
                       "ORDER BY e.errandID";

        try (PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, userID); 
            pstmt.setString(2, userID); 

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Errand errand = new Errand();
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
	public Errand getErrand(int errandID) {
		String SQL="SELECT * FROM errand WHERE errandID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, errandID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				Errand errand=new Errand();
				errand.setErrandID(rs.getInt(1));
				errand.setEnrollID(rs.getString(2));
				errand.setEnrollDate(rs.getString(3));
				errand.setErrandTopic(rs.getString(4));
				errand.setErrandDeadLine(rs.getString(5));
				errand.setErrandPlace(rs.getString(6));
				errand.setErrandFee(rs.getString(7));
				errand.setChattingLink(rs.getString(8));
				errand.setErrandType(rs.getString(9));
				errand.setErrandContent(rs.getString(10));
				errand.setAppliedID(rs.getString(11));
				errand.setErrandAvailable(rs.getInt(12));
				return errand;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int errandID, String errandTopic, String errandDeadLine, String errandPlace, String errandFee, String chattingLink, String errandType, String errandContent) {
		String SQL="UPDATE errand SET errandTopic = ?, errandDeadLine = ?, errandPlace = ?, errandFee = ?, chattiingLink = ?, errandType = ?, errandContent = ? WHERE errandID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1,  errandTopic);
			pstmt.setString(2,  errandDeadLine);
			pstmt.setString(3,  errandPlace);
			pstmt.setString(4,  errandFee);
			pstmt.setString(5,  chattingLink);
			pstmt.setString(6,  errandType);
			pstmt.setString(7,  errandContent);
			pstmt.setInt(8,  errandID);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;	//데이터베이스 오류
	}
	
	public int addApplyID(int errandID, String appliedID) {
		String SQL="UPDATE errand SET appliedID = ? WHERE errandID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1,  appliedID);
			pstmt.setInt(2,  errandID);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;	//데이터베이스 오류
	}
}
