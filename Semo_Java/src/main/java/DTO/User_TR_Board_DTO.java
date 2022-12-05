package DTO;
/**
 * User 1명의 ThingRank Board에 들어가는 정보를 담은 클래스  
 */
public class User_TR_Board_DTO {
	private String u_user_id;
	private String u_name;
	private int tr_ranks;
	private int t_thing_id;
	private String t_thing_name;
	private String t_categories;
	
	public User_TR_Board_DTO(){
		super();
		u_user_id = "";
		u_name = "";
		tr_ranks = 0;
		t_thing_id = 0;
		t_thing_name = "";
		t_categories = "";
	}
	
	@Override
	public String toString() {
		String result= String.format(" %-10s | %-8s | %-10d | %-10d | %-10s | %-10s",
				u_user_id,u_name,tr_ranks,t_thing_id,t_thing_name,t_categories);
		return result;
	}

	/**
	 * ranks랑 thing_name만 출력
	 */
	public String toString_short() {
		String result= String.format(" %-10d | %-10s ",tr_ranks,t_thing_name);
		return result;
	}
	
	public void setT_categories(String t_categories) {
		String temp;
		String c =t_categories.substring(0,3);
		switch(c) {
		case"Q01" : temp ="한식";break;
		case"Q02" : temp ="중식";break;
		case"Q03" : temp ="일식/수산물";break;
		case"Q04" : temp ="분식";break;
		case"Q05" : temp ="닭/오리요리";break;
		case"Q06" : temp ="양식";break;
		case"Q07" : temp ="패스트푸드";break;
		case"Q08" : temp ="제과제빵떡케익";break;
		case"Q09" : temp ="유흥주점";break;
		case"Q10" : temp ="별식/퓨전요리";break;
		case"Q12" : temp ="커피점/카페";break;
		case"Q13" : temp ="음식배달서비스";break;
		case"Q14" : temp ="기타음식업";break;
		case"Q15" : temp ="부페";break;
		default : temp = ""; break;
		}
		this.t_categories = temp;
	}
	
	public String getU_user_id() {
		return u_user_id;
	}
	public void setU_user_id(String u_user_id) {
		this.u_user_id = u_user_id;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public int getTr_ranks() {
		return tr_ranks;
	}
	public void setTr_ranks(int tr_ranks) {
		this.tr_ranks = tr_ranks;
	}
	public int getT_thing_id() {
		return t_thing_id;
	}
	public void setT_thing_id(int t_thing_id) {
		this.t_thing_id = t_thing_id;
	}
	public String getT_thing_name() {
		return t_thing_name;
	}
	public void setT_thing_name(String t_thing_name) {
		this.t_thing_name = t_thing_name;
	}
	public String getT_categories() {
		return t_categories;
	}
}
