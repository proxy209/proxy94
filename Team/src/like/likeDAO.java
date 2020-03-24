package like;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bbs.bbsDTO;

public class likeDAO {
	private Connection conn;
	private ResultSet rs;

	public likeDAO() {
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

	public int like(String userID, int bID) {
		String SQL = "INSERT INTO blike VALUES(?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setInt(2, bID);
			pstmt.setInt(3, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<likeDTO> getbLike() {
		String SQL = "SELECT * FROM bLike";
		ArrayList<likeDTO> list = new ArrayList<likeDTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				likeDTO like = new likeDTO();
				like.setUserID(rs.getString(1));
				like.setbID(rs.getInt(2));
				like.setbLike(rs.getInt(3));
				list.add(like);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
