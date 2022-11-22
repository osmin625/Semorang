import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ThingRankDAO {
	private DBUtil dbUtil = DBUtil.getInstance();
	
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
