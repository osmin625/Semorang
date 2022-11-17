package phase3_jdbc;

import java.sql.*; 
import java.util.*;
import java.io.*;

public class phase3_jdbc {

	public static final String url = "jdbc:oracle:thin:@SEMODB_high?TNS_ADMIN=C:\\\\OracleDBproject\\\\Wallet_SEMODB";
	public static final String user = "ADMIN";
	public static final String password = "Semorang1234";

	public static void main(String[] args) {
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
		
		// login
		String usr_id;
		String pwd;
		String permi;
		int res = 0;
		while (res != 1) {
			Scanner sc = new Scanner(System.in);
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

	// 어떤 계정에 대한 실제로 로그인을 시도하는 함수, 인자값으로 ID와 Password를 받아 login을 판단함.
	public static int login(String in_userID, String in_userPassword, Connection conn, Statement stmt) { 
		ResultSet rs = null;
		String sql = "SELECT USER_ID, PASSWORD FROM USERS"; 
		try {
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				// Fill out your code
				String usr_id = rs.getString(1);
				String pwd = rs.getString(2);
				if (usr_id == in_userID) {
					if (pwd == in_userPassword) {
						return 1; // connected
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
		if (res == 0) {
			System.out.println("success! please sign in again");
		}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
}
