import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ThingRankDAO {
	private DBUtil dbUtil = DBUtil.getInstance();
	
	// 다음에 쓸 thingrank_id를 생성해주는 메소드
	public String get_next_id() {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "SELECT * FROM THINGRANK";
			pstmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs = pstmt.executeQuery();
			rs.last();
			count = rs.getRow()+1;
		}
		catch (SQLException e) {
			System.err.println("ThingRankDAO : get_next_id() 오류");
			e.printStackTrace();
		}
		finally {
			dbUtil.close(rs,pstmt,conn);
		}
		return "tr_"+count;
	}
	
	// 새로운 튜플 insert하기

	public void insert(int thing_id, String user_id, int ranks) {
		ThingRankDTO trDTO = new ThingRankDTO(get_next_id(), thing_id, user_id, ranks);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "INSERT INTO THINGRANK VALUES(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, trDTO.getThing_rank_id());
			pstmt.setInt(2, trDTO.getThing_id());
			pstmt.setString(3, trDTO.getUser_id());
			pstmt.setInt(4, trDTO.getRanks());
			pstmt.setTimestamp(5, trDTO.getThingking_date());
			pstmt.setTimestamp(6, trDTO.getUpdate_date());
			rs = pstmt.executeQuery();
			System.out.println("ThingRank INSERT 완료\n"+trDTO.toString());
			conn.commit();
		}
		catch (SQLException e) {
			System.err.println("ThingRankDAO : insert 오류");
			e.printStackTrace();
		}
		finally {
			dbUtil.close(rs,pstmt,conn);
		}
	}
	
	public void update(int thing_id, String user_id,int new_ranks) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "UPDATE THINGRANK "
					+ "SET RANKS = ? "
					+ "WHERE THING_ID = ? "
					+ " AND USER_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,new_ranks);
			pstmt.setInt(2,thing_id);
			pstmt.setString(3, user_id);
			rs = pstmt.executeQuery();
			System.out.println("ThingRank UPDATE 완료\n"+ "thing_id: " + thing_id + " user_id: "+user_id + " 변경한 ranks: " + new_ranks);
			conn.commit();
		}catch (SQLException e) {
			System.err.println("ThingRankDAO : update 오류");
			e.printStackTrace();
		}finally {
			dbUtil.close(rs,pstmt,conn);
		}
	}
	
	public void delete(int thing_id, String user_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "DELETE FROM THINGRANK TR WHERE TR.THING_ID = ? AND TR.USER_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,thing_id);
			pstmt.setString(2, user_id);
			rs = pstmt.executeQuery();
			System.out.println("ThingRank DELETE 완료\n"+ "thing_id: " + thing_id + " user_id: "+user_id);
			conn.commit();
		}
		catch (SQLException e) {
			System.err.println("ThingRankDAO : delete 오류");
			e.printStackTrace();
		}
		finally {
			dbUtil.close(rs,pstmt,conn);
		}
	}
	
	public void printTotalList() {
		try {
			List<ThingRankDTO> thingRankDTO_list= getTotalList();
			for (ThingRankDTO thingRankDTO : thingRankDTO_list) {
				System.out.println(thingRankDTO.toString());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<ThingRankDTO> getTotalList() throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ThingRankDTO> list = new ArrayList<>();
		
		try {
			conn = dbUtil.getConnection();
			String sql = "SELECT * FROM THINGRANK";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ThingRankDTO tr = new ThingRankDTO();
				tr.setThing_rank_id(rs.getString("thing_rank_id"));
				tr.setThing_id(rs.getInt("thing_id"));
				tr.setUser_id(rs.getString("user_id"));
				tr.setRanks(rs.getInt("ranks"));
				tr.setThingking_date(rs.getTimestamp("thingking_date"));
				tr.setUpdate_date(rs.getTimestamp("update_date"));
				list.add(tr);
			}
		} finally {
			dbUtil.close(rs,pstmt,conn);
		}
		return list;
	}
}
