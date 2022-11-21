package phase3_jdbc;

import java.sql.*; 
import java.util.*;
import java.io.*;

public class phase3_jdbc {
	
	public static final String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	public static final String user = "test";
	public static final String password = "test";

	public static void main(String[] args) {
		//분류를 위한 hashmap
//		HashMap<String, String> category = new HashMap<String, String>();
//		
//		category.put("Q01", "한식");
//		category.put("Q02", "중식");
//		category.put("Q03", "일식/수산물");
//		category.put("Q04", "분식");
//		category.put("Q05", "닭/오리요리");
//		category.put("Q06", "양식");
//		category.put("Q07", "패스트푸드");
//		category.put("Q08", "제과제빵떡케익");
//		category.put("Q09", "유흥주점");
//		category.put("Q10", "별식/퓨전요리");
//		// Q11은 없음
//		category.put("Q12", "커피점/카페");
//		category.put("Q13", "음식배달서비스");
//		category.put("Q14", "기타음식업");
//		category.put("Q15", "부페");
		
		
		
		Connection conn = null; // Connection object
		Statement stmt = null;	// Statement object
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("Driver Loading: Success!");
		} catch(ClassNotFoundException e) {
			System.err.println("error = " + e.getMessage());
			System.exit(1);
		}

		try {
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("Oracle Connected.");
			stmt = conn.createStatement(); 
		} catch(SQLException ex) {
			ex.printStackTrace();
			System.err.println("Cannot get a connection: " + ex.getLocalizedMessage());
			System.err.println("Cannot get a connection: " + ex.getMessage());
			System.exit(1);
		}		

		Scanner sc = new Scanner(System.in);
		
		int ad_usr = -1;
		String usr_id;
		String admin_id;
		String pwd;
		String ad_pwd;
		String permi;
		int res = 0;
		System.out.println("login as user(1)/admin(0)");
		ad_usr = sc.nextInt();
		
		// login/sign up/admin access query
		if (ad_usr == 1) {
			while (res != 1) {
				System.out.println("enter id");
				usr_id = sc.next();
				System.out.println("enter password");
				pwd = sc.next();
				res = login(usr_id, pwd, conn, stmt);
				if (res == 1) {
					System.out.println("Welcome!");
				} else if (res == 0) {
					System.out.println("wrong id or password");
				} else {
					System.out.println("you may not have an account,");
					System.out.println("would you create one? (yes : y, no : n)");
					permi = sc.next();
					if (permi == "y") {
						sign_up(conn,stmt);
					} else if (permi == "n") {
						break;
					} else {
						System.out.println("Wrong input");
					}
					
				}
			}
		} else {
			System.out.println("enter id");
			admin_id = sc.next();
			System.out.println("enter password");
			ad_pwd = sc.next();
			res = login_ad(admin_id, ad_pwd, conn, stmt);
			if (res == 0) {
				System.out.println("welcome administrator");
			} else {
				System.out.println("Wrong access, exiting program..");
			}
		}
		
		int menu = 0;
		// put query here
		
		if (res == 1) {
			//user access
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
				menu = sc.nextInt();
				
				if (menu == 1) {
					ranking_board(conn, stmt);
				} else if (menu == 2) {
					
				} else if (menu == 3) {
					
				} else if (menu == 4) {
					
				} else if (menu == -1) {
					break;
				}
			}
 		}
		else if (res == 123) {
			//admin access
		}
		
		// Release database resources.
		try {
			// Close the Statement object.
			stmt.close(); 
			// Close the Connection object.
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void ranking_board(Connection conn, Statement stmt) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("choose category by number");
		System.out.println("1. 한식\t\t2. 중식\t\t3. 일식/수산물\t4. 분식\t\t5. 닭/오리요리\n"
				+ "6. 양식\t\t7. 패스트푸드\t8. 제과제빵떡케익\t9. 유흥주점\t10. 별식/퓨전요리\n"
				+ "11. 커피점/카페\t12. 음식배달서비스\t13. 기타음식업\t14. 부페\t\t15. 통합");
		System.out.println("choose your category(by number) what you are looking for");
		
		String cate_str = "";
		int category_num = sc.nextInt();
		// category check (나중에 함수로 뺄거임)
		if (category_num < 11) {
			cate_str = String.valueOf(category_num);
			if (category_num == 10) {
				cate_str = "Q" + cate_str;
			} else {
				cate_str = "Q0" + cate_str;
			}
			
		} else if(category_num>=11 && category_num <15) {
			cate_str = String.valueOf(category_num+1);
			cate_str = "Q" + cate_str;
		} else if(category_num == 15) {
			cate_str = "Q";
		}
		//여기까지
		
		//계산 알고리즘 필요
		ResultSet rs = null;
		ResultSet rs_cnt = null;
		String sql = "select user_id, ranks, thing_name, categories, THING_CNT "
				+ "from (select user_id, ranks, thing_id, categories, thing_name "
				+ "from thingrank natural join thing "
				+ "order by user_id, ranks) join "
				+ "(select thing_id, COUNT(*) THING_CNT "
				+ "from thingrank "
				+ "group by thing_id) using(thing_id) "
				+ "where categories like '" + cate_str + "%'";
		
		// query count for array
		String sql_cnt = "select count(*) "
				+ "from (select user_id, ranks, thing_id, categories, thing_name "
				+ "from thingrank natural join thing "
				+ "order by user_id, ranks) join "
				+ "(select thing_id, COUNT(*) THING_CNT "
				+ "from thingrank "
				+ "group by thing_id) using(thing_id) "
				+ "where categories like '" + cate_str + "%'";
		
		try {
			rs_cnt = stmt.executeQuery(sql_cnt);
			int cnt = 0;
			while (rs_cnt.next()) {
				cnt = Integer.valueOf(rs_cnt.getString(1));
			}
			rs = stmt.executeQuery(sql);
			
			String[][] thingrank = new String[cnt][6]; //6번째 인덱스에 score 
			int ind = 0;
			// put thingrank into array for calculating score
			while(rs.next()) {
				String usr_id = rs.getString(1);
				String ranks = rs.getString(2);
				String t_name = rs.getString(3);
				String cate = rs.getString(4);
				String cnt_rank = rs.getString(5);

				thingrank[ind][0] = usr_id;
				thingrank[ind][1] = ranks;
				thingrank[ind][2] = t_name;
				thingrank[ind][3] = cate;
				thingrank[ind][4] = cnt_rank;
				thingrank[ind][5] = "0";
				
				// calculating score
				if (ind == cnt-1 || (ind > 1 && !thingrank[ind][0].equals(thingrank[ind-1][0]))) {
					float cnt_user = 0;
					if (ind == cnt-1) {
						cnt_user = Integer.valueOf(thingrank[ind-1][1]);
						ind += 1;
					} else {
						cnt_user = Integer.valueOf(thingrank[ind-1][1])-1;
					}
					float dif = 4/cnt_user;
					for (int i=0; i < cnt_user+1; i++) {
						thingrank[(ind-1)-i][5] = String.valueOf(1 + dif * i);
					}
				}
				ind += 1;
			}
//			System.out.println("check1");
			for (int i = 0; i < cnt; i++) {
//				System.out.println("check2");
				System.out.println(thingrank[i][0] + " " + thingrank[i][1] + " " + thingrank[i][2] + " " + thingrank[i][3] + " " + thingrank[i][5]);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static int login_ad(String in_userID, String in_userPassword, Connection conn, Statement stmt) { 
		ResultSet rs = null;
		String sql = "SELECT USER_ID, PASSWORD FROM ADMIN"; 
		try {
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String ad_id = rs.getString(1);
				String ad_pwd = rs.getString(2);
				if (ad_id == in_userID) {
					if (ad_pwd == in_userPassword) {
						return 123; // admin connected
					} else {
						return 0; // wrong pwd
					}
				} else {
					return -1; // no id
				}
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // DB 오류 
	}
	// 어떤 계정에 대한 실제로 로그인을 시도하는 함수, 인자값으로 ID와 Password를 받아 login을 판단함.
	public static int login(String in_userID, String in_userPassword, Connection conn, Statement stmt) { 
		ResultSet rs = null;
		String sql = "SELECT USER_ID, PASSWORD FROM USERS"; 
		try {
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				String usr_id = rs.getString(1);
				String pwd = rs.getString(2);
				if (usr_id.equals(in_userID)) {	
					if (pwd.equals(in_userPassword)) {
						return 1; // connected
					} else {
						return 0; // wrong pwd
					}
				}
			}
			rs.close();
			System.out.println("check2-2");
			return -1; // no id
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -2; // DB 오류 
	}
	
	public static void sign_up(Connection conn, Statement stmt) {
		String sql = "INSERT INTO USERS VALUES (";
		Scanner sc = new Scanner(System.in);
		
		int res = -1;
		String new_id;
		String new_pwd;
		String name;
		String region;
		String phone_num;
		System.out.println("new user id : ");
		new_id = sc.next();
		System.out.println("new password id : ");
		new_pwd = sc.next();
		System.out.println("your name? : ");
		name = sc.next();
		System.out.println("your region? (si goon) : ");
		region = sc.next();
		System.out.println("your phone number? : ");
		phone_num = sc.next();
		try {
			sql = sql +"'" + new_id + "', '" + new_pwd + "', '" + name +"', '" + region + "', '" + phone_num + "')";
			res = stmt.executeUpdate(sql);
			if (res != 0) {
	            System.out.println("success!");
	        } else {
	            System.out.println("failed.. (already existing id)");
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
