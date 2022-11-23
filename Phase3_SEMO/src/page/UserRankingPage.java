package page;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dao.DBUtil;

public class UserRankingPage {
	private DBUtil dbUtil = DBUtil.getInstance();
	
	UserRankingPage(){
		super();
	}
	
	public void display() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT u.name ,SUM(r.like_count) as sl"
				+ " FROM users u, ranking_snapshot r"
				+ " WHERE r.user_id = u.user_id"
				+ " GROUP BY u.name"
				+ " ORDER BY sl DESC";
		try {
			conn = dbUtil.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				System.out.printf("%-10s %-10d\n",rs.getString(1),rs.getInt(2));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			dbUtil.close(rs,stmt,conn);
		}
	}
	
}
