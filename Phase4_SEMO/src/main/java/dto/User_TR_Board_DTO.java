package dto;

import util.DBUtil;

/**
 * User 1명의 ThingRank Board에 들어가는 정보를 담은 클래스  
 * User_TR_Board_DAO에서 사용된 SELECT문 참고
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
		this.t_categories = DBUtil.cate_id_to_name(t_categories);
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
