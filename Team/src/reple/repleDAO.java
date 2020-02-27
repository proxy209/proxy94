package reple;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bbs.bbsDTO;

public class repleDAO {
	private Connection conn;
	private ResultSet rs;

	public repleDAO(){
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
	
	public int reple(String bID, String userID, String rContent) {
		String SQL = "INSERT INTO reple VALUES(?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bID);
			pstmt.setString(2, userID);
			pstmt.setString(3, getDate());
			pstmt.setString(4, rContent);
			pstmt.setInt(5, 1);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int getNext() {
		String SQL = "SELECT rDate FROM reple ORDER BY bID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<repleDTO> getList(int pageNumber, int bID){
		String SQL="SELECT * FROM reple WHERE bID = ?";
		ArrayList<repleDTO> list = new ArrayList<repleDTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext()-(pageNumber-1) * 10);
			pstmt.setInt(1, bID);
			rs = pstmt.executeQuery();
			while(rs.next()){
				repleDTO reple = new repleDTO();
				reple.setbID(rs.getInt(1));
				reple.setUserID(rs.getString(2));
				reple.setrDate(rs.getString(3));
				reple.setrContent(rs.getString(4));
				reple.setrView(rs.getInt(5));
				list.add(reple);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
    
}
