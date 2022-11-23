package page;

import java.sql.SQLException;
import java.util.Scanner;

import dao.AdminDAO;
import dao.UserDAO;

public class LoginPage {
	private boolean login_success;
	private String user_id;
	private int user_type;
	
	public LoginPage(Scanner keyboard){
		int menu = 0;
		user_type = -1;
		while(true) {
			System.out.println("==============================");
			System.out.println("Press number for your purpose");
			System.out.println("-----------------------------");
			System.out.println("	1. Login 	  ");
			System.out.println("	2. Sign Up 	  ");
			System.out.println("-----------------------------");
			System.out.println("	exit(-1) 		  ");
			System.out.println("==============================");
			System.out.println("Choose menu number");
			menu = keyboard.nextInt();
			keyboard.nextLine();
			
			if(menu == 1) {
				System.out.println("login as user(1)/admin(0)");
				user_type = keyboard.nextInt();
				keyboard.nextLine();
				if(user_type != 0 && user_type != 1) {
					System.out.println("잘못된 입력입니다");
					continue;
				}else {
					user_id = login(keyboard);
					if (!user_id.equals("")) {
//						System.out.println("login success!");
						break;
					}
				}
			}else if (menu == 2) {
				if(signUp(keyboard)) {
					System.out.println("회원가입이 완료되었습니다");
				}else {
					System.out.println("회원가입에 실패하였습니다");
				}
			}else if (menu == -1) {
				System.out.println("프로그램을 종료합니다");
				break;
			}else {
				System.out.println("잘못된 입력입니다");
			}
		}
	}
	private String login(Scanner keyboard) {
		int login_check = 0;
		String id;
		String pw;
		System.out.println("enter id");
		id = keyboard.nextLine();
		System.out.println("enter password");
		pw = keyboard.nextLine();
		// 가입되어있는 유저인지 확인
		if (user_type == 1) {
			UserDAO userDAO = new UserDAO();
			login_check = userDAO.valid_login(id, pw);
			userDAO = null;
		}else {
			AdminDAO adminDAO = new AdminDAO();
			login_check = adminDAO.valid_login(id, pw);
			adminDAO = null;
		}
		if(login_check == 0) {
			System.out.println("wrong id or password");
			id = "";
			login_success = false;
		}else {
			login_success = true;
		}
		return id;
	}
	private boolean signUp(Scanner keyboard) {
		String new_id;
		String new_pwd;
		String name;
		String region;
		String phone_num;
		UserDAO userDAO = new UserDAO();
		
		System.out.println("new user id : ");
		new_id = keyboard.nextLine();
		System.out.println("new password : ");
		new_pwd = keyboard.nextLine();
		System.out.println("your name? : ");
		name = keyboard.nextLine();
		System.out.println("your region? (si goon) : ");
		region = keyboard.nextLine();
		System.out.println("your phone number? : ");
		phone_num = keyboard.nextLine();
		try {
			userDAO.insert(new_id, new_pwd, name, region, phone_num);
		} catch (SQLException e) {
			return false;
		}
		return true;
		
	}
	
	@Override
	public String toString() {
		return "login_success!! user_id : "+ user_id + " user_type: " + user_type;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public boolean isLogin_success() {
		return login_success;
	}
	
	public void setLogin_success(boolean login_success) {
		this.login_success = login_success;
	}
	public int getUser_type() {
		return user_type;
	}
	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}
}
