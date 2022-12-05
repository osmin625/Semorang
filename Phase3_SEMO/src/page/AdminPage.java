package page;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import dao.UserDAO;
import main.DBUtil;

public class AdminPage {
	private DBUtil dbUtil = DBUtil.getInstance();
	
	public AdminPage() {
		super();
	}
	
	public void delete_user(Scanner keyboard) {
		System.out.println("삭제할 유저의 user_id를 입력하세요");
		String user_id = keyboard.nextLine();
		UserDAO userDAO = new UserDAO();
		userDAO.delete(user_id);
		userDAO = null;
	}
	
	public void verify_thing_count() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT  U.USER_ID, COUNT(*) AS THING_COUNT"
				+ "	FROM USERS U, THING T, VERIFY V"
				+ " WHERE U.USER_ID = V.USER_ID"
				+ "    AND V.THING_ID = T.THING_ID"
				+ " GROUP BY U.USER_ID"
				+ " ORDER BY THING_COUNT DESC";
		try {
			conn = dbUtil.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				System.out.printf("%-10s %-5d\n"
						,rs.getString(1),rs.getInt(2));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			dbUtil.close(rs,stmt,conn);
		}
	}
	public void count_thing_by_category() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT CATEGORIES, COUNT(*) AS COUNT_THINGS"
				+ " FROM THING"
				+ " GROUP BY CATEGORIES"
				+ " ORDER BY COUNT_THINGS DESC ";
		try {
			conn = dbUtil.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				System.out.printf("%-10s %-5d\n"
						,DBUtil.cate_id_to_name(rs.getString(1)),rs.getInt(2));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			dbUtil.close(rs,stmt,conn);
		}
	}
	
	public void  search_snapshot_has_more_like() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT  SNAPSHOT_ID, CONTENT,DIF_LIKE_AND_DISLIKE"
				+ " FROM (  SELECT "
				+ "            SNAPSHOT_ID,"
				+ "            CONTENT,"
				+ "            (LIKE_COUNT - DISLIKE_COUNT) AS DIF_LIKE_AND_DISLIKE"
				+ "        FROM "
				+ "            RANKING_SNAPSHOT"
				+ "        WHERE "
				+ "            (LIKE_COUNT - DISLIKE_COUNT) >= 0)";
		try {
			conn = dbUtil.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				System.out.printf("%-10s %-20s %-5d\n"
						,rs.getString(1),rs.getString(2),rs.getInt(3));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			dbUtil.close(rs,stmt,conn);
		}
	}
	
	
	public void search_user_has_follower() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT "
				+ "    NAME, "
				+ "    PHONE_NUMBER "
				+ "FROM "
				+ "    USERS "
				+ "WHERE "
				+ "    EXISTS (SELECT "
				+ "                *"
				+ "            FROM "
				+ "                FOLLOW"
				+ "            WHERE"
				+ "                FOLLOWER_UID = USER_ID)";
		try {
			conn = dbUtil.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				System.out.printf("%-10s %-20s\n"
						,rs.getString(1),"0"+rs.getInt(2));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			dbUtil.close(rs,stmt,conn);
		}
	}
	
	public void search_nst_thing(Scanner keyboard) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("n을 설정하세요");
		int n = keyboard.nextInt();
		keyboard.nextLine();
		try {
			conn = dbUtil.getConnection();
			String sql = "SELECT"
					+ "    u.name,"
					+ "    t.thing_name,"
					+ "    t.categories,"
					+ "    tr.THINGKING_DATE "
					+ "FROM\r\n"
					+ "    users     u,"
					+ "    thingrank tr,"
					+ "    thing     t "
					+ "WHERE "
					+ "	t.thing_id = tr.thing_id"
					+ "    AND u.user_id = tr.user_id"
					+ "    AND tr.RANKS = ?"
					+ "ORDER BY u.name ASC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, n);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				System.out.printf("%-10s %-15s %-10s %-20s\n",rs.getString(1),rs.getString(2),DBUtil.cate_id_to_name(rs.getString(3)),rs.getString(4));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			dbUtil.close(rs,pstmt,conn);
		}
	}
	
}
