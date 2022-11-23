package page;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import dao.DBUtil;

public class SnapshotBoardPage {
	private DBUtil dbUtil = DBUtil.getInstance();
	
	SnapshotBoardPage(){
		super();
	}
	
	public void display(Scanner keyboard, String user_id) {
		int menu = 0;
		while(true) {
			System.out.println("==============================");
			System.out.println("Press number for your purpose");
			System.out.println("-----------------------------");
			System.out.println("	1. Total snapshot(최신순) 	  ");
			System.out.println("	2. My snapshot	  ");
			System.out.println("-----------------------------");
			System.out.println("	exit(-1) 		  ");
			System.out.println("==============================");
			System.out.println("Choose menu number");
			menu = keyboard.nextInt();
			keyboard.nextLine();
			
			if(menu == 1) {
				total_snapshot();
			}
			else if (menu == 2) {
				user_snapshot(user_id);
			}else if(menu == -1) {
				return;
			}
		}
		
	}
	
	public void total_snapshot() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT s.snapshot_id, s.content, u.user_id, s.like_count, s.taken_date"
				+ " FROM USERS u, RANKING_SNAPSHOT s"
				+ " WHERE u.user_id = s.user_id"
				+ " ORDER BY taken_date DESC";
		try {
			conn = dbUtil.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				System.out.printf("%-10s %-20s %-10s %-5d %-20s\n"
						,rs.getString(1),rs.getString(2),rs.getString(3), rs.getInt(4),rs.getString(5));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			dbUtil.close(rs,stmt,conn);
		}
	}
	
	public void user_snapshot(String user_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql ="SELECT s.snapshot_id, s.content, s.like_count, s.taken_date"
					+ " FROM USERS u, RANKING_SNAPSHOT s"
					+ " WHERE u.user_id = s.user_id"
					+ "    AND u.user_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				System.out.printf("%-10s %-20s %-5d %-20s\n"
						,rs.getString(1),rs.getString(2), rs.getInt(3),rs.getString(4));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			dbUtil.close(rs,pstmt,conn);
		}
	}
}
