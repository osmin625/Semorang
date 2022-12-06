package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import dto.ThingDTO;
import util.DBUtil;
public class ThingDAO {
	private DBUtil dbUtil = DBUtil.getInstance();
	
	public List<ThingDTO> getTotalList() throws SQLException{
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
	
	public void printTotalList() {
		try {
			List<ThingDTO> thingDTO_list= getTotalList();
			for (ThingDTO thingDTO : thingDTO_list) {
				System.out.println(thingDTO.toString());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * thing_name으로 thing_id를 찾아서 반환
	 */
	public int search_id_by_name(String name) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int thing_id = 0;
		try {
			conn = dbUtil.getConnection();
			String sql = "SELECT Thing_id FROM THING WHERE THING_NAME =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				thing_id = rs.getInt(1);
			}
		} finally {
			dbUtil.close(rs,pstmt,conn);
		}
		
		return thing_id;
	}
}
