package Pages;

import DAO.UserDAO;

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
		
		LoginPage loginpage = new LoginPage();
		System.out.println(loginpage.toString());
		
//		UserDAO ud = new UserDAO();
//		ud.delete("user_51");
//		ud.delete("user_52");
//		ud.delete("user_53");
		
		
		
//		UserPage userpage = new UserPage();
//		userpage.print_total_trBoard("user_1");
//		System.out.println("-------------------------");
//		userpage.print_category_trBoard("user_1", "한식");
		
//		Mypage mypage = new Mypage();
//		mypage.print_total_trBoard("user_1");
//		System.out.println("-------------------------");
//		mypage.print_category_trBoard("user_1", "한식");
		
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
//		
		
//		ThingRankDAO thingRankDAO = new ThingRankDAO();
//		thingRankDAO.insert(17720028, "user_1", 3);
//		thingRankDAO.update(17720028, "user_1", 1);
//		thingRankDAO.delete(17720028,"user_1");
//		thingRankDAO.printTotalList();
	}
	
	
	
	// login 정보 있으면 0, 있으면 1
//	public int valid_login(String id, String pw,int user_type) {
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		int result = 0;																		
//		String sql="";
//		try {
//			conn = dbUtil.getConnection();
//			if(user_type == 1) {  // 일반 유저
//				sql = "SELECT USER_ID USERS WHERE USER_ID = ? AND PASSWORD = ?)";
//			}else if(user_type == 0) { // admin
//				sql = "SELECT ADMIN_ID ADMIN WHERE ADMIN_ID = ? AND PASSWORD = ?)";
//			}else {
//				System.err.println("user_type 오류");
//				System.exit(1);
//			}
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1,id);
//			pstmt.setString(2,pw);
//			rs = pstmt.executeQuery();
//			if(rs!=null && rs.isBeforeFirst()) { // rs에 값이 하나라도 있을 경우
//					result = 1;
//			}
//		}
//		catch (SQLException e) {
//			System.err.println("MainPage : valid_login 오류");
//			e.printStackTrace();
//		}
//		finally {
//			dbUtil.close(rs,pstmt,conn);
//		}	
//		return result;
//	}
	
}