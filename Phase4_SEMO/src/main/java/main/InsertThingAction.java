package main;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ThingDAO;
import dao.ThingRankDAO;
import util.Action;
import util.ActionForward;

public class InsertThingAction implements Action{
	private static String TAG = "InsertThingAction : ";
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		ThingRankDAO trDAO = new ThingRankDAO();
		ThingDAO tDAO = new ThingDAO();
		int insert_result = 0;
		String thing_name = (String)request.getParameter("thing_name");
		System.out.println(TAG + "thing_name : "+thing_name);
		
		int thing_id = tDAO.search_id_by_name(thing_name);
		System.out.println(TAG + "thing_id : "+thing_id);
		
		insert_result = trDAO.insert(thing_id,(String)session.getAttribute("login_id"), Integer.parseInt(request.getParameter("thing_rank")));
		
		
		forward.setIsRedirect(false);
		forward.setPath("InsertThingDialog.main");
		request.setAttribute("thing_name", request.getParameter("thing_name"));
		request.setAttribute("insert_result", insert_result);
		return forward;
	}

}