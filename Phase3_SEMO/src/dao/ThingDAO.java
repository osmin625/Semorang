package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import dto.ThingDTO;
public class ThingDAO {
	private DBUtil dbUtil = DBUtil.getInstance();
	
	public List<ThingDTO> getList() throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ThingDTO> list = new ArrayList<>();
		
		try {
			conn = dbUtil.getConnection();
			String sql = "SELECT * FROM THING";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ThingDTO t = new ThingDTO();
				t.setThing_id(rs.getInt("thing_id"));
				t.setAdmin_id(rs.getString("admin_id"));
				t.setThing_name(rs.getString("thing_name"));
				t.setCategories(rs.getString("categories"));
				t.setLatitude(rs.getDouble("latitude"));
				t.setLongitude(rs.getDouble("longitude"));
				t.setSido(rs.getString("sido"));
				t.setSigoongoo(rs.getString("sigoongoo"));
				t.setBubjungdong(rs.getString("bubjungdong"));
				list.add(t);
			}
		} finally {
			dbUtil.close(rs,pstmt,conn);
		}
		return list;
	}
}
