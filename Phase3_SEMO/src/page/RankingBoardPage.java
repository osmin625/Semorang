package page;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.Arrays;
import java.util.Scanner;
import main.DBUtil;

public class RankingBoardPage {
	private DBUtil dbUtil = DBUtil.getInstance();
	private String category;
	
	public RankingBoardPage() {
		category = "";
	}
	
	// 각 Thing에 대해서 전체 유저들이 매긴 Thingrank 평균을 높은 순으로 출력
	public void display(Scanner keyboard) {
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ResultSet rs_cnt = null;
		
		category = selectCategory(keyboard);
		
		// 각 유저가 선택한 thing의 점수를 카테고리별로 계산하기 위해 쿼리를 구현한다
		String sql = "select user_id, ranks, thing_name, categories, thing_id, THING_CNT "
				+ "from (select user_id, ranks, thing_id, categories, thing_name "
				+ "from thingrank natural join thing "
				+ "where categories like '"+category+"%' "
				+ "order by user_id, ranks) join "
				+ "(select thing_id, COUNT(*) THING_CNT "
				+ "from thingrank natural join thing "
				+ "where categories like '"+category+"%' "
				+ "group by thing_id) using(thing_id)";
		
		// 1개의 thing에 대해서 매겨진 랭크(thingrank)의 개수 카운트하는 query
		String sql_cnt = "select count(*) "
				+ "from (select user_id, ranks, thing_id, categories, thing_name "
				+ "from thingrank natural join thing "
				+ "where categories like '"+category+"%' "
				+ "order by user_id, ranks) join "
				+ "(select thing_id, COUNT(*) THING_CNT "
				+ "from thingrank natural join thing "
				+ "where categories like '"+category+"%' "
				+ "group by thing_id) using(thing_id)";
		
		try {
			conn = dbUtil.getConnection();
			stmt = conn.createStatement();
			rs_cnt = stmt.executeQuery(sql_cnt);
			int cnt = 0;
			while (rs_cnt.next()) {
				cnt = Integer.valueOf(rs_cnt.getString(1));
			}
			
			rs = stmt.executeQuery(sql);
			
			String[][] thingrank = new String[cnt][7]; //6번째 인덱스에 score
			int start = 0;
			int end = 0;
			float cnt_user = 0;
			
			// put thingrank into array for calculating score
			while(rs.next()) {
				
				String usr_id = rs.getString(1);
				String ranks = rs.getString(2);
				String t_name = rs.getString(3);
				String cate = rs.getString(4);
				String thing_id = rs.getString(5);
				String cnt_rank = rs.getString(6);
				
				thingrank[end][0] = usr_id; //userid
				thingrank[end][1] = ranks; //ranks that user choosed
				thingrank[end][2] = t_name; //thing name
				thingrank[end][3] = cate; //thing category
				thingrank[end][4] = cnt_rank; //number of things in certain category
				thingrank[end][5] = thing_id; // thing id
				thingrank[end][6] = "0"; // score on certain category
				
				//calculating score (two pointer algorithm)
				if (end + 1 == cnt || (end > 0 && !thingrank[end][0].equals(thingrank[end-1][0]))) { // user_id가 바뀔때
					float dif = 0;
					
					if (cnt_user == 1.0) {
						thingrank[end-1][6] = String.valueOf(5.0);
					} else {
						dif = 4/(cnt_user-1);
						for (int i = start; i < end; i++) {
							thingrank[i][6] = String.valueOf(5 - dif * (i - start));
						}
					}
					if (end + 1 == cnt) { // 마지막 인덱스 처리
						if (cnt_user == 1.0) {
							thingrank[end][6] = String.valueOf(5.0);
						} else {
							float end_f = (float)end; 
							float start_f = (float)start; 
							dif = 4/(end_f - start_f);
							for (int i = start; i < end + 1; i++) {
								thingrank[i][6] = String.valueOf(5 - dif * (i - start));
							}
						}
					}
					cnt_user = 0;
					start = end;
					end = start;
				}
				
				cnt_user += 1;
				end += 1;
				
			}
			// 점수 여기까지 계산
			
			
			//여기부터 통합랭킹 산출
			ResultSet t_rs = null;
			ResultSet rs_ttl_cnt = null;
			
			String sql_eval_count = "select count(*) "
					+ "from thing "
					+ "where categories like '"+ category +"%'";
			rs_ttl_cnt = stmt.executeQuery(sql_eval_count);
			int ttl_cnt = 0;
			
			while (rs_ttl_cnt.next()) {
				ttl_cnt = Integer.valueOf(rs_ttl_cnt.getString(1));
			}
			
			String sql_eval_score = "select thing_id, thing_name "
					+ "from thing "
					+ "where categories like '"+ category +"%'";
			t_rs = stmt.executeQuery(sql_eval_score);
			
			String[][] total_rank = new String[ttl_cnt][2]; //[name, score]
			float[][] sort_ind = new float[ttl_cnt][2]; // [score, index] 
			int t_ind = 0;
			
			while (t_rs.next()) {
				
				String th_id = t_rs.getString(1);
				String th_name = t_rs.getString(2);
				float sum = 0;
				float eval_cnt = 0;
				for (int i = 0; i < cnt; i++) {
					if (th_id.equals(thingrank[i][5])) {
						sum += Float.valueOf(thingrank[i][6]);
						eval_cnt += 1;
					}
				}
				float res_RB_score = sum/eval_cnt; 
				total_rank[t_ind][0] = th_name;
				total_rank[t_ind][1] = String.valueOf(res_RB_score);
				sort_ind[t_ind][0] = res_RB_score;
				sort_ind[t_ind][1] = t_ind;
				t_ind += 1;
			}
			// 카테고리 평균 점수에 따라 정렬
//			Arrays.sort(sort_ind, Comparator.comparingDouble(o1 -> o1[0]));
			Arrays.sort(sort_ind, (o1, o2) -> Double.compare(o2[0], o1[0]));
			
			//랭크 출력
			if (ttl_cnt == 0) {
				System.out.println("No things are on Rank!");
			}
			for (int i = 0; i < ttl_cnt; i++) {
//				System.out.println(String.valueOf(sort_ind[i][0]) + ", " +String.valueOf(sort_ind[i][1]));
				System.out.println("Rank #"+String.valueOf(i+1) + ".\t| " + total_rank[(int)sort_ind[i][1]][0]); // mean score 비교/확인 + " " + total_rank[(int)sort_ind[i][1]][1] + " " + sort_ind[i][0]);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 카테고리 선택하고 받는 함수
	public static String selectCategory(Scanner keyboard) {
		String cate_str ="";
		System.out.println("choose category by number");
		System.out.println("1. 한식\t\t2. 중식\t\t3. 일식/수산물\t4. 분식\t\t5. 닭/오리요리\n"
				+ "6. 양식\t\t7. 패스트푸드\t8. 제과제빵떡케익\t9. 유흥주점\t10. 별식/퓨전요리\n"
				+ "11. 커피점/카페\t12. 음식배달서비스\t13. 기타음식업\t14. 부페\t\t15. 통합");
		System.out.println("choose your category(by number) what you are looking for");
		
		int category_num = keyboard.nextInt();
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
		return cate_str;
	}

}
