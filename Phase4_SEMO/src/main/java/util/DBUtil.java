package util;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
//  팀 클라우드 접속 코드 -> 과제는 local에서 phase2 ddl, insert 스크립트 활용하여 테스트 
	private final String URL = "jdbc:oracle:thin:@SEMODB_high?TNS_ADMIN=C:\\\\OracleDBproject\\\\Wallet_SEMODB";
	private final String USER_ID = "ADMIN";
	private final String USER_PWD = "Semorang1234";
	
//	private final String URL = "jdbc:oracle:thin:@localhost:1521:orcl";
//	private final String USER_ID = "SEMOTEST";
//	private final String USER_PWD = "1234";

	private static DBUtil instance;

	private DBUtil() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("Driver Load Success");
		}catch(ClassNotFoundException e){
			System.err.println("error =" + e.getMessage());
			System.exit(1);
		}
	}

	public static DBUtil getInstance() {
		if (instance == null)
			instance = new DBUtil();
		return instance;
	}
	
	public Connection getConnection() throws SQLException {
		Connection conn = DriverManager.getConnection(URL, USER_ID, USER_PWD);
		conn.setAutoCommit(false);
		return conn;
	}

	public void close(AutoCloseable... autoCloseables) {
		try {
			for(AutoCloseable ac : autoCloseables) {
				if(ac != null)
					ac.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 카테고리 id (중분류) -> 카테고리 이름 변환
	public static String cate_id_to_name(String cate_id){
		String cate_name;
		String c =cate_id.substring(0,3);
		switch(c) {
		case"Q01" : cate_name ="한식";break;
		case"Q02" : cate_name ="중식";break;
		case"Q03" : cate_name ="일식/수산물";break;
		case"Q04" : cate_name ="분식";break;
		case"Q05" : cate_name ="닭/오리요리";break;
		case"Q06" : cate_name ="양식";break;
		case"Q07" : cate_name ="패스트푸드";break;
		case"Q08" : cate_name ="제과제빵떡케익";break;
		case"Q09" : cate_name ="유흥주점";break;
		case"Q10" : cate_name ="별식/퓨전요리";break;
		case"Q12" : cate_name ="커피점/카페";break;
		case"Q13" : cate_name ="음식배달서비스";break;
		case"Q14" : cate_name ="기타음식업";break;
		case"Q15" : cate_name ="부페";break;
		default : 
			System.err.println("category id-> name 변환 오류 ");
			cate_name = ""; 
			break;
		}
		return cate_name;
	}
	
	// 카테고리 이름 ->  카테고리 id로 변환
	public static String cate_name_to_id(String cate_name){
		switch(cate_name) {
		case"한식" : 			return "Q01";
		case"중식" : 			return "Q02";
		case"일식/수산물" : 	return "Q03";
		case"분식" : 			return "Q04";
		case"닭/오리요리" : 	return "Q05";
		case"양식" : 			return "Q06";
		case"패스트푸드" : 		return "Q07";
		case"제과제빵떡케익" : 	return "Q08";
		case"유흥주점" : 		return "Q09";
		case"별식/퓨전요리" : 	return "Q10";
		case"커피점/카페" : 	return "Q12";
		case"음식배달서비스" : 	return "Q13";
		case"기타음식업" : 		return "Q14";
		case"부페" : 			return "Q15";
		default : 
			System.err.println("category name-> id 변환 오류 ");
			return "";
		}
	}

	

}
