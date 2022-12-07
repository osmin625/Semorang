package page;
import java.sql.SQLException;
import java.util.List;
import java.util.Scanner;

import dao.User_TR_Board_DAO;
import dto.User_TR_Board_DTO;

public class UserPage {
	private User_TR_Board_DAO utb_DAO;
	private String user_id;
	
	UserPage(){
		super();
		utb_DAO = new User_TR_Board_DAO();
		setUser_id("");
	}
	
	UserPage(String user_id){
		super();
		utb_DAO = new User_TR_Board_DAO();
		this.setUser_id(user_id);
	}
	
	// 해당 유저의 ThingRank 전체 출력
	public void print_total_trBoard(String user_id) {
		try {
			List<User_TR_Board_DTO> mypageDTO_list= utb_DAO.getTotalList_by_userId(user_id);
			if(mypageDTO_list.isEmpty()) {
				System.out.println("No results were found for your search");
			}else {
				for (User_TR_Board_DTO myPageDTO : mypageDTO_list) {
					System.out.println(myPageDTO.toString_short());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 해당 유저의 ThingRank 카테고리별 출력 (순위 재조정함)
	public void print_category_trBoard(String user_id,String category_name) {
		int new_rank = 1; // 카테고리별 출력 시 순위 다시 나타내기 위한 변수
		int temp;
		int pre= 0;
		try {
			List<User_TR_Board_DTO> mypageDTO_list= utb_DAO.getCateList_by_userId(user_id,category_name);
			if(mypageDTO_list.isEmpty()) {
				System.out.println("No results were found for your search");
			}else {
				for (User_TR_Board_DTO myPageDTO : mypageDTO_list) {
					temp = myPageDTO.getTr_ranks();
					System.out.println("new_rank : " + new_rank + "temp: " + temp );
					
					if(new_rank != temp && pre != temp) {
						new_rank++;
					}
					System.out.printf("%-3d | %-10s\n", new_rank, myPageDTO.getT_thing_name());
					
					pre = temp;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 카테고리 선택해서 카테고리 이름 반환하는 method
		public String selectCategory(Scanner keyboard) {
			System.out.println("choose category by number");
			System.out.println("1. 한식\t\t2. 중식\t\t3. 일식/수산물\t4. 분식\t\t5. 닭/오리요리\n"
					+ "6. 양식\t\t7. 패스트푸드\t8. 제과제빵떡케익\t9. 유흥주점\t10. 별식/퓨전요리\n"
					+ "11. 커피점/카페\t12. 음식배달서비스\t13. 기타음식업\t14. 부페\t");
			
			int category_num = keyboard.nextInt();
			
			switch(category_num) {
			case 1: return "한식"; 
			case 2: return "중식"; 
			case 3: return "일식/수산물"; 
			case 4: return "분식"; 
			case 5: return "닭/오리요리"; 
			case 6: return "양식"; 
			case 7: return "패스트푸드"; 
			case 8: return "제과제빵떡케익"; 
			case 9: return "유흥주점"; 
			case 10: return "별식/퓨전요리"; 
			case 11: return "커피점/카페"; 
			case 12: return "음식배달서비스"; 
			case 13: return "기타음식업"; 
			case 14: return "부페"; 
			default : 
				System.err.println("Mypage : selectCategory 오류");
				return "";
			}
		}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
}
