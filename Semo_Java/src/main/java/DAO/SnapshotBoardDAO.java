package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import DTO.SnapshotDTO;
public class SnapshotBoardDAO {
	private DBUtil dbUtil = DBUtil.getInstance();
	public List<SnapshotDTO> getList() throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<SnapshotDTO> list = new ArrayList<>();
		try {
			conn = dbUtil.getConnection();
			String sql = "SELECT * FROM RANKING_SNAPSHOT";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SnapshotDTO t = new SnapshotDTO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(6),rs.getInt(7));
				t.setTaken_date(rs.getDate(4));
				t.setUpdate_date(rs.getDate(5));
				list.add(t);
			}
		} finally {
			dbUtil.close(rs,pstmt,conn);
		}
		return list;
	}
}

