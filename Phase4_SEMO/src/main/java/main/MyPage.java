package main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import dao.ThingDAO;
import dao.ThingRankDAO;
import dao.UserDAO;
import util.DBUtil;

public class MyPage extends UserPage{
	private DBUtil dbUtil = DBUtil.getInstance();
	

	//나(로그인한 user)에 대한 정보 보여줌
	public void myInfo() {
		try {
			System.out.println(UserDAO.get_userInfo(getUser_id()).toString());
		} catch (SQLException e) {
			System.err.println("Mypage : myInfo 오류");
			e.printStackTrace();
		}
	}
	
	// 1개의 thing에 대해서 Rank 매기고 INSERT
	public void insertRanking(Scanner keyboard) {
		// 음식점을 선택하는 과정이 필요함 -> GUI로 구현 -> 지금은 음식점 이름이 unique하다고 가정하고 진행
			
		ThingDAO thingDAO = new ThingDAO();
		ThingRankDAO trDAO = new ThingRankDAO();
		int thing_id = 0;
		try {
			thingDAO.printTotalList();
			System.out.println("랭크를 추가할 음식점(thing)의 이름을 입력하세요");
			String thing_name = keyboard.nextLine();
			thing_id = thingDAO.search_id_by_name(thing_name);
			if(trDAO.valid_thing(getUser_id(),thing_id)==0) {  //중복 -> 무결성  위반
				System.out.println("이미 랭크를 등록한 Thing입니다");
			}else {		
				System.out.println("Rank를 입력하세요");
				int rank  = keyboard.nextInt();
				keyboard.nextLine();
				trDAO.insert(thing_id, getUser_id(), rank);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		thingDAO = null;
		trDAO = null;
	}
	
	public void deleteRanking(Scanner keyboard) {
		
		ThingDAO thingDAO = new ThingDAO();
		ThingRankDAO trDAO = new ThingRankDAO();
		int thing_id = 0;
		try {
			thingDAO.printTotalList();
			System.out.println("랭크를 삭제할 음식점(thing)의 이름을 입력하세요");
			String thing_name = keyboard.nextLine();
			thing_id = thingDAO.search_id_by_name(thing_name);
			trDAO.delete(thing_id, this.getUser_id());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		thingDAO = null;
		trDAO = null;
		
	}
	
	public void updateRanking(Scanner keyboard) {
	
		ThingDAO thingDAO = new ThingDAO();
		ThingRankDAO trDAO = new ThingRankDAO();
		int thing_id = 0;
		try {
			thingDAO.printTotalList();
			System.out.println("랭크를 수정할 음식점(thing)의 이름을 입력하세요");
			String thing_name = keyboard.nextLine();
			System.out.println("새로운 랭크를 입력하세요");
			int rank  = keyboard.nextInt();
			keyboard.nextLine();
			thing_id = thingDAO.search_id_by_name(thing_name);
			trDAO.update(thing_id, getUser_id(), rank);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		thingDAO = null;
		trDAO = null;
	}
	
	//내가 작성한 snapshot의 좋아요 수 합계를 출력
	public void print_snapshot_like_count() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "SELECT u.name , SUM(r.like_count)"
					+ " FROM users u, ranking_snapshot r"
					+ " WHERE r.user_id = u.user_id"
					+ "    AND u.user_id = ?"
					+ " GROUP BY u.name";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, this.getUser_id());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				System.out.printf("%-10s %-10d\n",rs.getString(1),rs.getInt(2));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			dbUtil.close(rs,pstmt,conn);
		}
	
	}
	// 내가 팔로우하는 사람 확인
	public void print_my_following() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			String sql = "SELECT fu.user_id, fu.name "
					+ "FROM"
					+ "    follow f,"
					+ "    users  u,"
					+ "    users  fu "
					+ "WHERE"
					+ "        fu.user_id = f.follower_uid"
					+ "    AND f.following_uid = u.user_id"
					+ "    AND  u.user_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, getUser_id());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				System.out.printf("%-10s %-10s\n",rs.getString(1),rs.getString(2));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			dbUtil.close(rs,pstmt,conn);
		}
	}
}
