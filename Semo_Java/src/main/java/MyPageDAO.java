import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MyPageDAO {
	private DBUtil dbUtil = DBUtil.getInstance();
	
	// 해당 유저의 ThingRank 전체 출력
	public void print_total_trBoard(String user_id) {
		try {
			List<MyPageDTO> mypageDTO_list= getTotalList_by_userId(user_id);
			for (MyPageDTO myPageDTO : mypageDTO_list) {
				System.out.println(myPageDTO.toString_short());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 해당 유저의 ThingRank 카테고리별 출력 (순위 재조정함)
	public void print_category_trBoard(String user_id,String category_name) {
		int new_rank = 1; // 카테고리별 출력 시 순위 다시 나타내기 위한 변수
		int temp;
		try {
			List<MyPageDTO> mypageDTO_list= getCateList_by_userId(user_id,category_name);
			for (MyPageDTO myPageDTO : mypageDTO_list) {
				temp = myPageDTO.getTr_ranks();
				if(new_rank != temp) {
					new_rank++;
				}
				System.out.printf("%-3d | %-10s\n", new_rank, myPageDTO.getT_thing_name());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<MyPageDTO> getTotalList_by_userId(String user_id) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MyPageDTO> list = new ArrayList<>();
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
				MyPageDTO mpb = new MyPageDTO();
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
	
	public List<MyPageDTO> getCateList_by_userId(String user_id,String category_name) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MyPageDTO> list = new ArrayList<>();
		try {
			conn = dbUtil.getConnection();
			String user_total_thingrank_sql = "SELECT U.USER_ID , U.NAME, TR.RANKS,T.THING_ID,T.THING_NAME, T.CATEGORIES"
					+ " FROM USERS U,THINGRANK TR,THING T "
					+ "WHERE 1=1"
					+ "	AND U.USER_ID =TR.USER_ID"
					+ "	AND TR.THING_ID = T.THING_ID"
					+ "	AND U.USER_ID = ?"
					+ " AND T.CATEGORIES LIKE ?"
					+ "ORDER BY TR.RANKS ASC";
			pstmt = conn.prepareStatement(user_total_thingrank_sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, String.format("%s%%", DBUtil.cate_name_to_id(category_name)));
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MyPageDTO mpb = new MyPageDTO();
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
