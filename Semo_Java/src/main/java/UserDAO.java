import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	private DBUtil dbUtil = DBUtil.getInstance();
	
	public void insert(String user_id, String password, String name, String region, String phone_number) {
		UserDTO userDTO = new UserDTO(user_id,password,name,region,phone_number);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "INSERT INTO USERS VALUES(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userDTO.getUser_id());
			pstmt.setString(2, userDTO.getPassword());
			pstmt.setString(3, userDTO.getName());
			pstmt.setString(4, userDTO.getRegion());
			pstmt.setString(5, userDTO.getPhone_number());
			rs = pstmt.executeQuery();
			System.out.println("USERS INSERT 완료\n"+userDTO.toString());
			conn.commit();
		}
		catch (SQLException e) {
			System.err.println("UserDAO : insert 오류");
			e.printStackTrace();
		}
		finally {
			dbUtil.close(rs,pstmt,conn);
		}
	}
	
	public void delete(String user_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "DELETE FROM USERS WHERE USER_ID = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			System.out.println("USERS DELETE 완료\n"+ " user_id: "+user_id);
			conn.commit();
		}
		catch (SQLException e) {
			System.err.println("UserDAO : delete 오류");
			e.printStackTrace();
		}
		finally {
			dbUtil.close(rs,pstmt,conn);
		}
	}
	
}
