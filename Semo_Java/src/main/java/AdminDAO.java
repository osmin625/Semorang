import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {
	private DBUtil dbUtil = DBUtil.getInstance();
	
	public void insert(String admin_id, String password) {
		AdminDTO adminDTO = new AdminDTO(admin_id,password);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "INSERT INTO ADMIN VALUES(?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,adminDTO.getAdmin_id());
			pstmt.setString(2, adminDTO.getPassword());
			rs = pstmt.executeQuery();
			System.out.println("ADMIN INSERT 완료\n"+adminDTO.toString());
			conn.commit();
		}
		catch (SQLException e) {
			System.err.println("AdminDAO : insert 오류");
			e.printStackTrace();
		}
		finally {
			dbUtil.close(rs,pstmt,conn);
		}
	}
	
	public void delete(String admin_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "DELETE FROM ADMIN WHERE ADMIN_ID = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, admin_id);
			rs = pstmt.executeQuery();
			System.out.println("ADMIN DELETE 완료\n"+ " user_id: "+admin_id);
			conn.commit();
		}
		catch (SQLException e) {
			System.err.println("AdminDAO : delete 오류");
			e.printStackTrace();
		}
		finally {
			dbUtil.close(rs,pstmt,conn);
		}
	}
}
