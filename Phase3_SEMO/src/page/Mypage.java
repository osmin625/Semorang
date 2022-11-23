package page;

import java.sql.SQLException;
import java.util.Scanner;

import dao.UserDAO;

//UserPage를 상속받는 클래스
public class Mypage extends UserPage {
	
	public Mypage(String my_id) {
		super();
		this.setUser_id(my_id);
	}
	
	public void display(Scanner keyboard) {
		int menu = 0;
		while(true) {
			System.out.println("==============================");
			System.out.println("Press number for your purpose");
			System.out.println("-----------------------------");
			System.out.println("	1. My Info 	  ");
			System.out.println("	2. My Total Ranking Board 	  ");
			System.out.println("	3. My Category Ranking Board 	  ");
			System.out.println("	4. Insert Ranking 	  ");
			System.out.println("	5. Update Ranking 	  ");
			System.out.println("	6. Delete Ranking 	  ");
			System.out.println("	7. Take Snapshot 	  ");
			System.out.println("-----------------------------");
			System.out.println("	exit(-1) 		  ");
			System.out.println("==============================");
			System.out.println("Choose menu number");
			menu = keyboard.nextInt();
			keyboard.nextLine();
			
			if(menu == 1) {
				myInfo();
			}
			else if (menu == 2) {
				print_total_trBoard(this.getUser_id());														//print_total_trBoard : UserPage에 있는 method
			}
			else if (menu == 3) {
				print_category_trBoard(this.getUser_id(),selectCategory(keyboard));							//print_category_trBoard : UserPage에 있는 method
			}
			else if (menu == 4) {
				
			}
			else if (menu == 5) {
				
			}
			else if (menu == 6) {
				
			}
		}
		
	}
	
	public void myInfo() {
		try {
			System.out.println(UserDAO.get_userInfo(this.getUser_id()).toString());
		} catch (SQLException e) {
			System.err.println("Mypage : myInfo 오류");
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
	
	
	public void insertRanking(Scanner keyboard) {
		System.out.println("추가할 음식점(thing)의 이름을 입력하세요");
		// 음식점을 선택하는 과정이 필요함 -> GUI로 구현 -> 지금은 음식점 이름이 unique하다고 가정하고 진행
//		keyboard.nextLine()
		
	}
	
	public void deleteRanking(Scanner keyboard) {
		
	}
	
	public void updateRanking(Scanner keyboard) {
		
	}
	

}
