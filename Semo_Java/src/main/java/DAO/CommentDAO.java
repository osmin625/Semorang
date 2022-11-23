package DAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import DTO.CommentDTO;
public class CommentDAO {
	private DBUtil dbUtil = DBUtil.getInstance();
	public List<CommentDTO> getList() throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<CommentDTO> list = new ArrayList<>();
		try {
			conn = dbUtil.getConnection();
			String sql = "SELECT * FROM SNAPSHOT_COMMENT";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CommentDTO t = new CommentDTO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4));
				t.setWrite_date(rs.getDate(5));
				t.setUpdate_date(rs.getDate(6));
				list.add(t);
			}
		} finally {
			dbUtil.close(rs,pstmt,conn);
		}
		return list;
	}
	public void printList() {
		try {
			List<CommentDTO> commentDTO_list = getList();
			for (CommentDTO commentDTO : commentDTO_list) {
				System.out.println(commentDTO.toString());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// 다음에 쓸 comment_id를 생성해주는 메소드
		public String get_next_id() {
			int count = 0;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = dbUtil.getConnection();
				String sql = "SELECT * FROM SNAPSHOT_COMMENT";
				pstmt = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
				rs = pstmt.executeQuery();
				rs.last();
				count = rs.getRow()+1;
			}
			catch (SQLException e) {
				System.err.println("CommentDAO : get_next_id() 오류");
				e.printStackTrace();
			}
			finally {
				dbUtil.close(rs,pstmt,conn);
			}
			return "cmt_"+count;
		}
		
	public void insert(String snapshot_id, String user_id,String comments) {
		CommentDTO cmDTO = new CommentDTO(get_next_id(),snapshot_id,user_id,comments);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "INSERT INTO SNAPSHOT_COMMENT VALUES(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cmDTO.getComment_id());
			pstmt.setString(2, cmDTO.getSnapshot_id());
			pstmt.setString(3, cmDTO.getUser_id());
			pstmt.setString(4, cmDTO.getComment());
			pstmt.setTimestamp(5, cmDTO.getWrite_date());
			pstmt.setTimestamp(6, cmDTO.getUpdate_date());
			rs = pstmt.executeQuery();
			System.out.println("SNAPSHOT_COMMENT INSERT 완료\n"+cmDTO.toString());
			conn.commit();
		}
		catch (SQLException e) {
			System.err.println("CommentDAO : insert 오류");
			e.printStackTrace();
		}
		finally {
			dbUtil.close(rs,pstmt,conn);
		}
	}
	
	public void update(String comment_id,String comments) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "UPDATE SNAPSHOT_COMMENT "
					+ "SET COMMENTS = ? "
					+ "WHERE COMMENT_ID = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,comments);
			pstmt.setString(2,comment_id);
			rs = pstmt.executeQuery();
			System.out.println("Comment UPDATE 완료\n"+ "comment_id: " + comment_id);
			conn.commit();
		}catch (SQLException e) {
			System.err.println("CommentDAO : update 오류");
			e.printStackTrace();
		}finally {
			dbUtil.close(rs,pstmt,conn);
		}
	}
	
	public void delete(String comment_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "DELETE FROM SNAPSHOT_COMMIT CM WHERE CM.COMMENT_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,comment_id);
			rs = pstmt.executeQuery();
			System.out.println("Comment DELETE 완료\n"+ "comment_id: " + comment_id);
			conn.commit();
		}
		catch (SQLException e) {
			System.err.println("CommentDAO : delete 오류");
			e.printStackTrace();
		}
		finally {
			dbUtil.close(rs,pstmt,conn);
		}
	}
	
	public boolean confirmation(String user_id, String comment_id) {
		boolean check = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "SELECT user_id FROM SNAPSHOT_COMMENT WHERE comment_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,comment_id);
			rs = pstmt.executeQuery();
			if (user_id.equals(rs.getString(1))) {
				check = true;
			}
		}
		catch (SQLException e) {
			System.err.println("CommentDAO : confirmation 오류");
			e.printStackTrace();
		}
		finally {
			dbUtil.close(rs,pstmt,conn);
		}
		return check;
	}
	
}

