package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.UserDTO;

public class UserDAO {
	private static DBUtil dbUtil = DBUtil.getInstance();
	
	public int valid_login(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;																		
		String sql="";
		try {
			conn = dbUtil.getConnection();
			sql = "SELECT USER_ID FROM USERS WHERE USER_ID = ? AND PASSWORD = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,pw);
			rs = pstmt.executeQuery();
			if(rs!=null && rs.isBeforeFirst()) { // rs에 값이 하나라도 있을 경우
					result = 1;
			}
		}
		catch (SQLException e) {
			System.err.println("MainPage : valid_login 오류");
			e.printStackTrace();
		}
		finally {
			dbUtil.close(rs,pstmt,conn);
		}	
		return result;
	}
	
	public static UserDTO get_userInfo(String user_id)throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserDTO userDTO= new UserDTO();
		
		try {
			conn = dbUtil.getConnection();
			String sql = "SELECT * FROM USERS WHERE USER_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,user_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				userDTO.setUser_id(rs.getString("user_id"));
				userDTO.setPassword(rs.getString("password"));
				userDTO.setName(rs.getString("name"));
				userDTO.setRegion(rs.getString("region"));
				userDTO.setPhone_number(rs.getString("phone_number"));
			}
		}
		finally {
			dbUtil.close(rs,pstmt,conn);
		}
		return userDTO;
	}
	
	
	public void insert(String user_id, String password, String name, String region, String phone_number) throws SQLException{
		UserDTO userDTO = new UserDTO(user_id,password,name,region,phone_number);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "INSERT INTO USERS VALUES(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userDTO.getUser_id());
			pstmt.setString(2, userDTO.getPassword());
			pstmt.setString(3, userDTO.getName());
			pstmt.setString(4, userDTO.getRegion());
			pstmt.setString(5, userDTO.getPhone_number());
			rs = pstmt.executeQuery();
			System.out.println("USERS INSERT 완료\n"+userDTO.toString());
			conn.commit();
		}
		finally {
			dbUtil.close(rs,pstmt,conn);
		}
		userDTO = null;
	}
	
	public void delete(String user_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "DELETE FROM USERS WHERE USER_ID = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			System.out.println("USERS DELETE 완료\n"+ " user_id: "+user_id);
			conn.commit();
		}
		catch (SQLException e) {
			System.err.println("UserDAO : delete 오류");
			e.printStackTrace();
		}
		finally {
			dbUtil.close(rs,pstmt,conn);
		}
	}
	
}
