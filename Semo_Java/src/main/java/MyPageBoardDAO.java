import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MyPageBoardDAO {
	private DBUtil dbUtil = DBUtil.getInstance();
	
	public List<MyPageBoardDTO> getList_by_userId(String user_id) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MyPageBoardDTO> list = new ArrayList<>();
		try {
			conn = dbUtil.getConnection();
			String user_total_thingrank_sql = "SELECT U.USER_ID , U.NAME, TR.RANKS,T.THING_ID,T.THING_NAME, T.CATEGORIES"
					+ " FROM USERS U,THINGRANK TR,THING T "
					+ "WHERE 1=1"
					+ "	AND U.USER_ID =TR.USER_ID"
					+ "	AND TR.THING_ID = T.THING_ID"
					+ "	AND U.USER_ID = ?"
					+ "ORDER BY TR.RANKS ASC";
			pstmt = conn.prepareStatement(user_total_thingrank_sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MyPageBoardDTO mpb = new MyPageBoardDTO();
				mpb.setU_user_id(rs.getString("user_id"));
				mpb.setU_name(rs.getString("name"));
				mpb.setTr_ranks(rs.getInt("ranks"));
				mpb.setT_thing_id(rs.getInt("thing_id"));
				mpb.setT_thing_name(rs.getString("thing_name"));
				mpb.setT_categories(rs.getString("categories"));
				list.add(mpb);
			}
		} finally {
			dbUtil.close(rs,pstmt,conn);
		}
		return list;
	}
	
}
