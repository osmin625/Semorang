package Pages;

public class Main {
	
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
		if(loginpage.isLogin_success()) { // 로그인 성공했을 경우
			System.out.println(loginpage.toString());
			
		}
		
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
	
}