package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import dto.AdminDTO;
import main.DBUtil;
public class AdminDAO {
	private DBUtil dbUtil = DBUtil.getInstance();
	
	// id와 pw로 ADMIN 테이블에 있는 관리자정보를 확인
	public int valid_login(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;																		
		String sql="";
		try {
			conn = dbUtil.getConnection();
			sql = "SELECT ADMIN_ID FROM ADMIN WHERE ADMIN_ID = ? AND PASSWORD = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,pw);
			rs = pstmt.executeQuery();
			if(rs!=null && rs.isBeforeFirst()) { // rs에 값이 하나라도 있을 경우
					result = 1;
			}
		}
		catch (SQLException e) {
			System.err.println("AdminDAO : valid_login 오류");
			e.printStackTrace();
		}
		finally {
			dbUtil.close(rs,pstmt,conn);
		}	
		return result;
	}
	
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
