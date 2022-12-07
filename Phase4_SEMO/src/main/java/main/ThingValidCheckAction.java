package main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ThingDAO;
import dao.ThingRankDAO;
import util.Action;
import util.ActionForward;

public class ThingValidCheckAction implements Action{
	private static String TAG = "ThingValidCheckAction : ";
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		ThingRankDAO trDAO = new ThingRankDAO();
		ThingDAO tDAO = new ThingDAO();
		
		int result = 0;
		String thing_name = (String) request.getParameter("thing_name");
		System.out.println(TAG + thing_name);
		if(thing_name != null) {
			// result = 1 Thing 테이블 안에 없는 Thing일 경우
			int thing_id = tDAO.search_id_by_name(thing_name);
			if (thing_id == 0) {
				result = 1;
			}else {
				// result = 2 유저가 랭크를 매긴 적 있는 Thing일 경우
				int user_valid_check = trDAO.user_valid_check((String)session.getAttribute("login_id"),thing_id);
				if(user_valid_check == 1) {
					// 유저가 이미 랭크를 매긴 Thing
					result = 2;
				}else {
					// result = 3 랭크를 매길 수 있는 Thing
					result = 3;
				}
			}
		}
		forward.setIsRedirect(false);
		forward.setPath("InsertThingDialog.main");
		request.setAttribute("result", result);
		request.setAttribute("thing_name", thing_name);
		return forward;
	}

}