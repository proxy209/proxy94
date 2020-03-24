package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class bbsDAO {
	private Connection conn;
	private ResultSet rs;

	public bbsDAO() {
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
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	public int getNext() {
		String SQL = "SELECT bID FROM bbs ORDER BY bID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int write(String bTitle, String userID, String bContent, String bfile, String bfileReal) {
		String SQL = "INSERT INTO bbs VALUES(?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bTitle);
			pstmt.setString(3, bContent);
			pstmt.setString(4, getDate());
			pstmt.setInt(5, 0);
			pstmt.setString(6, userID);
			pstmt.setInt(7, 1);
			pstmt.setString(8, bfile);
			pstmt.setString(9, bfileReal);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<bbsDTO> getList(int pageNumber) {
		String SQL = "SELECT * FROM BBS WHERE bID < ? AND bView = 1 ORDER BY bID DESC LIMIT 10";
		ArrayList<bbsDTO> list = new ArrayList<bbsDTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bbsDTO bbs = new bbsDTO();
				bbs.setbID(rs.getInt(1));
				bbs.setbTitle(rs.getString(2));
				bbs.setbContent(rs.getString(3));
				bbs.setbDate(rs.getString(4));
				bbs.setbLike(rs.getInt(5));
				bbs.setUserID(rs.getString(6));
				bbs.setbView(rs.getInt(7));
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<bbsDTO> getbLike(int pageNumber) {
		String SQL = "SELECT * FROM BBS WHERE bLike > ? AND bView = 1 ORDER BY bLike DESC LIMIT 5";
		ArrayList<bbsDTO> list = new ArrayList<bbsDTO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				bbsDTO bbs = new bbsDTO();
				bbs.setbID(rs.getInt(1));
				bbs.setbTitle(rs.getString(2));
				bbs.setbContent(rs.getString(3));
				bbs.setbDate(rs.getString(4));
				bbs.setbLike(rs.getInt(5));
				bbs.setUserID(rs.getString(6));
				bbs.setbView(rs.getInt(7));
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public bbsDTO getBbs(int bID) {
		String SQL = "SELECT * FROM BBS WHERE bID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bbsDTO bbs = new bbsDTO();
				bbs.setbID(rs.getInt(1));
				bbs.setbTitle(rs.getString(2));
				bbs.setbContent(rs.getString(3));
				bbs.setbDate(rs.getString(4));
				bbs.setbLike(rs.getInt(5));
				bbs.setUserID(rs.getString(6));
				bbs.setbView(7);
				bbs.setBfile(rs.getString(8));
				bbs.setBfileReal(rs.getString(9));
				return bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int count() {
		String SQL = "select count(*) as cnt from bbs where bView = 1;";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int bLike(int bID) {
		String SQL = "update bbs set bLike = bLike + 1 where bID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bID);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int update(int bID, String bTitle, String bContent, String bfile, String bfileReal) {
    	String SQL="UPDATE bbs SET bTitle=?, bContent=?, bfile=?, bfileReal=? WHERE bID = ?";
  	   try {
  		   PreparedStatement pstmt = conn.prepareStatement(SQL);
  		   pstmt.setString(1, bTitle);
  		   pstmt.setString(2, bContent);
  		   pstmt.setString(3, bfile);
  		   pstmt.setString(4, bfileReal);
 		   pstmt.setInt(5, bID);
  		   return pstmt.executeUpdate();
  		   
  	   } catch(Exception e) {
  		   e.printStackTrace();
  	   }
  	   return -1; //데이터베이스 오류
    	
    }
    
    public int delete(int bID) {
    	String SQL="UPDATE bbs SET bView = 0 WHERE bID = ?";
   	   try {
   		   PreparedStatement pstmt = conn.prepareStatement(SQL);
   		   pstmt.setInt(1, bID);
   		   return pstmt.executeUpdate();
   		   
   	   } catch(Exception e) {
   		   e.printStackTrace();
   	   }
   	   return -1; //데이터베이스 오류
    	
    }
}
