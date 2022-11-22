import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

public class MainPage {
	

	
	public static void main(String[] args) {
		// jdbc 드라이버 로딩
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		MyPageBoardDAO mpbDAO = new MyPageBoardDAO();
		try {
			List<MyPageBoardDTO> mybDTO_list = mpbDAO.getList_by_userId("user_1");
			for (MyPageBoardDTO myPageBoardDTO : mybDTO_list) {
				System.out.println(myPageBoardDTO.toString());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
//		ThingDAO thingDAO = new ThingDAO();
//		try {
//			List<ThingDTO> thingDTO_list= thingDAO.getList();
//			for (ThingDTO thingDTO : thingDTO_list) {
//				System.out.println(thingDTO.toString());
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		ThingRankDAO thingRankDAO = new ThingRankDAO();
//		try {
//			List<ThingRankDTO> thingRankDTO_list= thingRankDAO.getTotalList();
//			for (ThingRankDTO thingRankDTO : thingRankDTO_list) {
//				System.out.println(thingRankDTO.toString());
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
		
		
//		Connection conn =getConnection();
//		Statement stmt = null;
//		ResultSet rs = null;
//		String admin_id = null;
//		String admin_pw = null;
//		try {
//			stmt = conn.createStatement();
//			String sql = "Select * from Thing ";
//			rs = stmt.executeQuery(sql);
//			while(rs.next()) {
//				admin_id =rs.getString("admin_id");
//				admin_pw = rs.getString(2);
//			}
//			System.out.println("admin_id : " + admin_id);
//			System.out.println("admin_pw : " + admin_pw);
//		}catch (SQLException e2) {
//			e2.printStackTrace();
//		}
		
		
		
	}
	private static Connection getConnection() {
		Connection conn = null;
		try {
			String url = "jdbc:oracle:thin:@SEMODB_high?TNS_ADMIN=C:\\\\OracleDBproject\\\\Wallet_SEMODB";
			String user = "ADMIN";
			String password = "Semorang1234";
			conn = DriverManager.getConnection(url, user, password);
		}catch (SQLException e2) {
			e2.printStackTrace();
		}
		return conn;
	}
	

}