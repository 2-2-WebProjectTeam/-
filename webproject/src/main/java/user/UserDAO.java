package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import errand.Errand;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO()
	{
		try {
			String dbURL = "jdbc:mysql://localhost/infor";
			String dbID = "root";
			String dbPassword = "0000";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword)
	{
		String SQL = "SELECT userPassWord From USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				if(rs.getString(1).equals(userPassword))
				{
					return 1;// 로그인 성공
				}
				else
					return 0; // 비밀번호 틀림
			}
			return -1; // 아이디 없음
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return -2;// 데이터베이스 오류
	}
	
	public int join(User user)
	{
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserPhoneNumber());
			pstmt.setString(5, user.getUserBirthday());
			pstmt.setString(6, user.getUserGender());
			return pstmt.executeUpdate();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return -1;// 데이터베이스 오류
	}
	
	public String getPassword(String userPhoneNumber) {
		String SQL="SELECT userPassword FROM user WHERE userPhoneNumber=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userPhoneNumber);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString("userPassword");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
