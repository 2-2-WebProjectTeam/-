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
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserPhoneNumber());
			pstmt.setString(5, user.getUserBirthday());
			pstmt.setString(6, user.getUserGender());
			pstmt.setInt(7, 10000);
			return pstmt.executeUpdate();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return -1;// 데이터베이스 오류
	}
	
	public User getUser(String userID) {
		String SQL="SELECT * FROM user WHERE userID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				User user=new User();
				user.setUserID(rs.getString(1));
				user.setUserPassword(rs.getString(2));
				user.setUserName(rs.getString(3));
				user.setUserPhoneNumber(rs.getString(4));
				user.setUserBirthday(rs.getString(5));
				user.setUserGender(rs.getString(6));
				user.setUserPoint(rs.getInt(7));
				return user;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int addpoint(int point, String userID) {
		String SQL="UPDATE user SET userPoint = ? WHERE userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1,  point);
			pstmt.setString(2,  userID);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;	//데이터베이스 오류
	}
}
