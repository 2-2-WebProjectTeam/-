package errand;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class errandDAO {
	private Connection conn;
	private ResultSet rs;

	public errandDAO()
	{
		try {
			String dbURL = "jdbc:mysql://localhost/erranddb";
			String dbID = "root";
			String dbPassword = "jsw2023112575*";
			Class.forName("com.mysql.jdbc.Driver");
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
	
	public int write(String errandTopic, String errandDeadLine, String errandPlace, String errandFee, String errandType, String userID, String errandContent) {
		String SQL="INSERT INTO errand VALUE (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1,  errandTopic);
			pstmt.setString(2,  errandDeadLine);
			pstmt.setString(3,  errandPlace);
			pstmt.setString(4,  errandFee);
			pstmt.setString(5,  errandType);
			pstmt.setString(6,  userID);
			pstmt.setString(7,  getDate());
			pstmt.setString(8,  errandContent);
			pstmt.setInt(9,  getNext());
			pstmt.setInt(10,  1);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;	//데이터베이스 오류
	}
}
