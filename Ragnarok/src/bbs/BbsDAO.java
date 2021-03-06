package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	private Connection conn;
	private ResultSet rs;

	public BbsDAO(){
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
	
	public int getNext() {
		String SQL = "SELECT bbsID FROM bbs ORDER BY bbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int write(String bbsTitle, String userID, String bbsContent) {
		String SQL = "INSERT INTO bbs VALUES(?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<BbsDTO> getList(int pageNumber){
		String SQL="SELECT * FROM BBS WHERE bbsID < ? AND bbasAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		ArrayList<BbsDTO> list = new ArrayList<BbsDTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext()-(pageNumber-1) * 10);
			rs = pstmt.executeQuery();
			while(rs.next()){
				BbsDTO bbs = new BbsDTO();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbasAvailbale(rs.getInt(6));
				list.add(bbs);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
    public BbsDTO getBbs(int bbsID) {
    	String SQL="SELECT * FROM BBS WHERE bbsID = ?";
     	try {
  		   PreparedStatement pstmt = conn.prepareStatement(SQL);
  		   pstmt.setInt(1, bbsID); 
  		   rs = pstmt.executeQuery();
  		   if(rs.next()) {
 			   BbsDTO bbs = new BbsDTO();
 			   bbs.setBbsID(rs.getInt(1));
 			   bbs.setBbsTitle(rs.getString(2));
 			   bbs.setUserID(rs.getString(3));
 			   bbs.setBbsDate(rs.getString(4));
 			   bbs.setBbsContent(rs.getString(5));
 			   bbs.setBbasAvailbale(6);
 			   return bbs;
 		   }
  	   } catch(Exception e) {
  		   e.printStackTrace();
  	   }
  	   return null;
    }
    public int count() {
    	String SQL = "select count(*) as cnt from bbs where bbasAvailable = 1;";
    	try {
    		PreparedStatement pstmt = conn.prepareStatement(SQL);
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			return rs.getInt(1);
    		}
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    	return -1;
    }
    
}
