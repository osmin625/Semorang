package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import dto.ThingRankDTO;
import util.DBUtil;
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
	public int insert(int thing_id, String user_id, int ranks) {
		ThingRankDTO trDTO = new ThingRankDTO(get_next_id(), thing_id, user_id, ranks);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
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
			result =1;
		}
		catch (SQLException e) {
			System.err.println("ThingRankDAO : insert 오류");
			e.printStackTrace();
		}
		finally {
			dbUtil.close(rs,pstmt,conn);
		}
		return result;
	}
	
	// ThingRank 수정하기 - update_date에 자동으로 현재시각 기록됨
	public void update(int thing_id, String user_id,int new_ranks) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		try {
			conn = dbUtil.getConnection();
			String sql = "UPDATE THINGRANK "
					+ "SET RANKS = ? , UPDATE_DATE = ?"
					+ "WHERE THING_ID = ? "
					+ " AND USER_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,new_ranks);
			pstmt.setTimestamp(2,timestamp);
			pstmt.setInt(3,thing_id);
			pstmt.setString(4, user_id);
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
	
	public int user_valid_check(String user_id,int thing_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;																		
		String sql="";
		try {
			conn = dbUtil.getConnection();
			sql = "SELECT THING_ID FROM THINGRANK WHERE USER_ID = ? AND Thing_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,user_id);
			pstmt.setInt(2,thing_id);
			rs = pstmt.executeQuery();
			if(rs!=null && rs.isBeforeFirst()) { // rs에 값이 하나라도 있을 경우
					result = 1;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			dbUtil.close(rs,pstmt,conn);
		}	
		return result;
	}
}
