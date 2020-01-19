package reple;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bbs.BbsDTO;

public class RepleDAO {
	private Connection conn;
	private ResultSet rs;

	public RepleDAO(){
		try {
			String jdbcURL = "jdbc:mysql://localhost:3306/BBS?serverTimezone=Asia/Seoul";
			String dbID = "root";
			String dbPassword = "proxy209!";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int reple(String bbsID, String userID, String repleContent) {
		String SQL = "INSERT INTO reple VALUES(?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbsID);
			pstmt.setString(2, userID);
			pstmt.setString(3, getDate());
			pstmt.setString(4, repleContent);
			pstmt.setInt(5, 1);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int getNext() {
		String SQL = "SELECT repleDATE FROM reple ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<RepleDTO> getList(int pageNumber, int bbsID){
		String SQL="SELECT * FROM reple WHERE bbsID = ?";
		ArrayList<RepleDTO> list = new ArrayList<RepleDTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext()-(pageNumber-1) * 10);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			while(rs.next()){
				RepleDTO reple = new RepleDTO();
				reple.setBbsID(rs.getInt(1));
				reple.setUserID(rs.getString(2));
				reple.setRepleDATE(rs.getString(3));
				reple.setRepleContent(rs.getString(4));
				reple.setRepleAvailable(rs.getInt(5));
				list.add(reple);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
    
}
