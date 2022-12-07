package login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Action;
import util.ActionForward;

/**
 * Servlet implementation class LoginFrontController
 */
@WebServlet("/LoginFrontController")
public class LoginFrontController extends HttpServlet implements Servlet{
	private static final long serialVersionUID = 1L;
	private static String TAG = "LoginFrontController : ";
       
    public LoginFrontController() {
        super();
    }
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	
    	String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());

		ActionForward forward = null;
		Action action = null;
		
		System.out.println("command: " +command);
		
		switch(command) {
		// 로그인 메인화면
		case "/LoginPage.lo":								
			forward = new ActionForward();
			forward.setIsRedirect(false);
			forward.setPath("./Page/LoginPage.jsp");
			break;
			
		case "/LoginPage2.lo":
			forward = new ActionForward();
			forward.setPath("./Page/LoginPage.jsp");
			forward.setMessage((String)request.getAttribute("message"));
			System.out.println("message : " +forward.getMessage());
			break;
			
		// 회원가입 화면
		case "/SignUpPage.lo":
			forward = new ActionForward();
			forward.setIsRedirect(false);
			forward.setPath("./Page/SignUpPage.jsp");
			break;
			
		// 로그인 버튼 클릭
		case "/LoginBtnClick.lo":
			action = new LoginAction();
//			System.out.println(TAG+"loginBtnClick 들어옴");
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		
		// 회원가입 버튼 클릭
		case "/SignUpBtnClick.lo":
			action = new SignUpAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
//		case  "/IdCheck.lo":
//			action = new IdCheckAction();
//			try {
//				forward = action.execute(request, response);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
			
			
		default :
			System.out.println(TAG +"잘못된 접근");
		}
		
		if(forward.getIsRedirect()){
			response.sendRedirect(forward.getPath());
		}
		else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
			request.setAttribute("message", forward.getMessage());
			dispatcher.forward(request, response);
		}
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
