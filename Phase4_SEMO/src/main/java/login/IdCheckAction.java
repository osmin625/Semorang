package login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import dto.UserDTO;
import util.Action;
import util.ActionForward;

public class IdCheckAction implements Action{
	private static String TAG = "IdCheck : ";
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// 로그인 정보 유지를 위한 session
		UserDAO userDAO = new UserDAO();
		ActionForward forward = new ActionForward();
		String user_id;
		boolean valid = false;
		try {
			user_id = request.getParameter("user_id");
			System.out.println(TAG +user_id);
			valid = userDAO.idCheck(user_id);
			
			if (!valid) {
				System.out.println(TAG + "중복된 아이디입니다");
				request.setAttribute("result", 0);
				return forward;
			}else {
				System.out.println(TAG + "유효한 아이디입니다");
				request.setAttribute("result", 1);
			}
			
			forward.setIsRedirect(false);
			forward.setPath("idcheck.jsp");											
			request.setAttribute("user_id", user_id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return forward;
	}

}
