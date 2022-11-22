import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

public class MainPage {
	

	
	public static void main(String[] args) {
		// jdbc 드라이버 로딩
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("Driver Load Success");
		}catch(ClassNotFoundException e){
			System.err.println("error =" + e.getMessage());
			System.exit(1);
		}
		
//		MyPageBoardDAO mpbDAO = new MyPageBoardDAO();
//		try {
//			List<MyPageBoardDTO> mybDTO_list = mpbDAO.getList_by_userId("user_1");
////			System.out.printf(" %-10s | %-8s | %-10s | %-10s | %-10s | %-10s\n"
////					,"user_id","user_name","ranks","thing_id","thing_name","categories");
//			System.out.printf(" %-9s | %-10s \n","나의 순위","상호명");
//			for (MyPageBoardDTO myPageBoardDTO : mybDTO_list) {
//				System.out.println(myPageBoardDTO.toString_short());
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
		
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
		
		ThingRankDAO thingRankDAO = new ThingRankDAO();
		thingRankDAO.insert(17720028, "user_1", 3);
//		thingRankDAO.delete(17720028,"user_1");
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
}