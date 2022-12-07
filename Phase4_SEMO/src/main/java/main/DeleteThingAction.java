package main;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ThingDAO;
import dao.ThingRankDAO;
import util.Action;
import util.ActionForward;

public class DeleteThingAction implements Action{
	private static String TAG = "DeleteThingAction : ";
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		ThingRankDAO trDAO = new ThingRankDAO();
		ThingDAO tDAO = new ThingDAO();
		int delete_result = 0;
		String thing_name = (String)request.getParameter("thing_name");
		System.out.println(TAG + "thing_name : "+thing_name);
		
		int thing_id = tDAO.search_id_by_name(thing_name);
		System.out.println(TAG + "thing_id : "+thing_id);
		
		delete_result = trDAO.delete(thing_id,(String)session.getAttribute("login_id"));
		
		
		forward.setIsRedirect(false);
		forward.setPath("DeleteThingDialog.main");
		request.setAttribute("thing_name", request.getParameter("thing_name"));
		request.setAttribute("delete_result", delete_result);
		return forward;
	}

}