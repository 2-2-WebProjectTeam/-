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
		return "";	
	}
	public int getNext() {
		String SQL="SELECT errandID FROM errand ORDER BY errandID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;	
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
	
	public ArrayList<Errand> getListSorted(String category, String sort) { 
	    ArrayList<Errand> list = new ArrayList<>();
	    
	    // 기본 SQL 템플릿
	    String SQL = "SELECT * FROM errand WHERE errandAvailable = 1 AND appliedID IS NULL";
	    
	    // 카테고리가 '전체'가 아닌 경우 조건 추가
	    if (!"전체".equals(category)) {
	        SQL += " AND errandType = ?";
	    }

	 // 정렬 조건 추가
	    if ("최신순".equals(sort)) {
	        SQL += " ORDER BY errandID DESC"; // 최신순 정렬
	    } else if ("포인트순".equals(sort)) {
	        SQL += " ORDER BY CAST(errandFee AS UNSIGNED) DESC"; // 포인트순 정렬
	    } else {
	        SQL += " ORDER BY errandID ASC"; // 기본 정렬 (오래된 순)
	    }
	    
	    try (PreparedStatement pstmt = conn.prepareStatement(SQL)) {

	        // 카테고리가 '전체'가 아닌 경우 파라미터 설정
	        if (!"전체".equals(category)) {
	            pstmt.setString(1, category);
	        }

	        // SQL 실행
	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	            Errand errand = new Errand();
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
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	
	public List<Errand> getErrandsWithChatCondition(String userID) {
	     List<Errand> errands = new ArrayList<>();
	     String query = "SELECT e.errandID, e.errandTopic, e.errandContent, e.appliedID, e.enrollID, e.chattingLink " +
	             "FROM errand e " +
	             "WHERE ((e.enrollID = ? AND e.appliedID IS NOT NULL) " +  
	             "OR (e.appliedID = ?)) " +
	             "AND e.errandAvailable = 1 " +   
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
	                 errand.setChattingLink(rs.getString("chattingLink"));  // chattingLink 가져오기

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
		String SQL="UPDATE errand SET errandTopic = ?, errandDeadLine = ?, errandPlace = ?, errandFee = ?, chattingLink = ?, errandType = ?, errandContent = ? WHERE errandID = ?";
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
	
	public int delete(int errandID) {
		String SQL="UPDATE errand SET errandAvailable = 0 WHERE errandID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setInt(1,  errandID);
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
