package login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import dto.UserDTO;
import util.Action;
import util.ActionForward;

public class LoginAction implements Action{
	private static String TAG = "LoginAction : ";
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		// 로그인 정보 유지를 위한 session
		HttpSession session = request.getSession();
		UserDTO userDTO = new UserDTO();
		UserDAO userDAO = new UserDAO();
		ActionForward forward = new ActionForward();
		
		// 1 -> login success , 0 -> login fail
		int valid_check = 0;
		try {
			userDTO.setUser_id(request.getParameter("user_id"));
			userDTO.setPassword(request.getParameter("user_pw"));
			System.out.println(userDTO.getUser_id() + userDTO.getPassword());
			valid_check = userDAO.valid_login(userDTO.getUser_id(), userDTO.getPassword());
			
			if (valid_check == 0) {
				System.out.println(TAG + "Login Fail");
				forward.setIsRedirect(false);
				forward.setPath("LoginPage2.lo");											// 로그인 실패 했을 때 이동하는 페이지
				forward.setMessage("로그인 실패");
				return forward;
			}else {
				System.out.println(TAG + "Login success");
				session.setAttribute("login_id", userDTO.getUser_id());
				forward.setIsRedirect(true);
				forward.setPath("./main.jsp");												// 로그인 성공 했을 때 이동하는 페이지
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return forward;
	}

}
