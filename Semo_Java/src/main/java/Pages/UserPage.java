package Pages;
import java.sql.SQLException;
import java.util.List;
import DAO.User_TR_Board_DAO;
import DTO.User_TR_Board_DTO;

public class UserPage {
	private User_TR_Board_DAO utb_DAO;
	
	UserPage(){
		super();
		utb_DAO = new User_TR_Board_DAO();
	}
	
	// 해당 유저의 ThingRank 전체 출력
	public void print_total_trBoard(String user_id) {
		try {
			List<User_TR_Board_DTO> mypageDTO_list= utb_DAO.getTotalList_by_userId(user_id);
			for (User_TR_Board_DTO myPageDTO : mypageDTO_list) {
				System.out.println(myPageDTO.toString_short());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 해당 유저의 ThingRank 카테고리별 출력 (순위 재조정함)
	public void print_category_trBoard(String user_id,String category_name) {
		int new_rank = 1; // 카테고리별 출력 시 순위 다시 나타내기 위한 변수
		int temp;
		try {
			List<User_TR_Board_DTO> mypageDTO_list= utb_DAO.getCateList_by_userId(user_id,category_name);
			for (User_TR_Board_DTO myPageDTO : mypageDTO_list) {
				temp = myPageDTO.getTr_ranks();
				if(new_rank != temp) {
					new_rank++;
				}
				System.out.printf("%-3d | %-10s\n", new_rank, myPageDTO.getT_thing_name());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
