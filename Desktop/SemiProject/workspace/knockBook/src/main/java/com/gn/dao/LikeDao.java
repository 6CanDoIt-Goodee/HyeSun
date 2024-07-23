package com.gn.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.gn.vo.Like;

public class LikeDao {
	
	public int insertLike(Like lk) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://127.0.0.1:3306/knockBook";
			String id = "hyeseon";
			String pw = "smp5915@";
			conn = DriverManager.getConnection(url, id, pw);
			
			String sql = "INSERT INTO `like` (like_no, user_no, book_category_no, booktext_no)"
					+ "VALUES (?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lk.getLike_no());
			pstmt.setInt(2, lk.getUser_no());
			pstmt.setInt(3, lk.getBook_category_no());
			pstmt.setInt(4, lk.getBooktext_no());
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}

}
