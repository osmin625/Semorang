package login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import dto.UserDTO;
import util.Action;
import util.ActionForward;

public class SignUpAction implements Action{
	private static String TAG = "SignUpAction : ";
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		UserDTO userDTO = new UserDTO();
		UserDAO userDAO = new UserDAO();
		ActionForward forward = null;
		
		boolean result = false;
		// 1 -> login success , 0 -> login fail
		try {
			forward = new ActionForward();
			userDTO.setUser_id(request.getParameter("user_id"));
			userDTO.setPassword(request.getParameter("user_pw"));
			userDTO.setName(request.getParameter("user_name"));
			userDTO.setRegion(request.getParameter("user_region"));
			userDTO.setPhone_number(request.getParameter("user_phone_number"));
			
			result = userDAO.insert(userDTO);
			if(!result) {
				System.out.println(TAG +"signUp failed");
				return null;
			}
			System.out.println(TAG + "signUp success");
			forward.setIsRedirect(false);
			forward.setPath("LoginPage.lo");
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forward;
	}

}
