package main;

import java.util.Scanner;

import page.LoginPage;
import page.Mypage;
import page.RankingBoardPage;
import page.SnapshotBoardPage;
import page.UserRankingPage;

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
		Scanner keyboard = new Scanner(System.in);
		
		LoginPage loginpage = new LoginPage(keyboard);
		if(loginpage.isLogin_success()) { 											// 로그인 성공했을 경우
			if(loginpage.getUser_type() == 0) {										// Admin으로 로그인 했을 경우
				System.out.println("Admin 페이지는 제작중입니다");
				System.exit(1);
			}
			System.out.println(loginpage.toString());
			
			int menu = 0;												
			RankingBoardPage rbp = new RankingBoardPage();							// 각 페이지로 이동하기 위해 페이지 클래스별 객체 생성			
			Mypage mp = new Mypage(LoginPage.user_id);
			UserRankingPage urp = new UserRankingPage();
			SnapshotBoardPage sbp = new SnapshotBoardPage();
			
			while(true) {
				System.out.println("==============================");
				System.out.println("Press number for your purpose");
				System.out.println("-----------------------------");
				System.out.println("	1. Ranking Borad 	  ");
				System.out.println("	2. User Ranking 	  ");
				System.out.println("	3. Snapshot board	  ");
				System.out.println("	4. My page  	 	  ");
				System.out.println("-----------------------------");
				System.out.println("	exit(-1) 		  ");
				System.out.println("==============================");
				System.out.println("Choose menu number");
				menu = keyboard.nextInt();
				keyboard.nextLine();
				
				if (menu == 1) {
					rbp.display(keyboard);
				} else if (menu == 2) {
					urp.display();
				} else if (menu == 3) {
					sbp.display(keyboard, LoginPage.user_id);
				} else if (menu == 4) {
					mp.display(keyboard);
					
				} else if (menu == -1) {
					break;
				}
			}
			
			// 사용한 페이지 객체들 메모리 반환
			rbp = null;
			urp = null;
			sbp = null;
			mp = null;
			
		}

	}
}
