import java.sql.*; // import JDBC package
import DAO.DBUtil;
public class oc_test {
	private DBUtil dbUtil = DBUtil.getInstance();
	public (String id, String pw) {
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
	
}