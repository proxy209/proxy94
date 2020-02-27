package user;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;

public class userDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public userDAO() {
		try {
			String jdbcURL = "jdbc:mysql://localhost:3306/project?serverTimezone=Asia/Seoul";
			String dbID = "root";
			String dbPassword = "proxy209!";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int login(String userID, String userPW) {
		String SQL = "SELECT userPW FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPW))
					return 1;
				else
					return 0;
			}
			return -1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}

	/*
	 * public int sign(UserDTO dto) { String SQL =
	 * "INSERT INTO USER VALUES(?,?,?,?,?)"; try { pstmt=conn.prepareStatement(SQL);
	 * pstmt.setString(1, dto.getUserID()); pstmt.setString(2,
	 * dto.getUserPassword()); pstmt.setString(3, dto.getUserName());
	 * pstmt.setString(4, dto.getUserGender()); pstmt.setString(5,
	 * dto.getUserEmail()); return pstmt.executeUpdate(); } catch(Exception e) {
	 * e.printStackTrace(); } return -1; }
	 */
	
	public int sign(String userID, String userPW, String userName, String userEmail) {
		String SQL = "INSERT INTO user(userID, userPW, userName, userEmail) VALUES(?,?,?,?)";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, userPW);
			pstmt.setString(3, userName);
			pstmt.setString(4, userEmail);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
}
