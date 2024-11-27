package errand;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
			pstmt.setString(11,  "");
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
}
