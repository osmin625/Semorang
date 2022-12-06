package main;

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

@WebServlet("/MainFrontController")
public class MainFrontController extends HttpServlet implements Servlet{
	private static final long serialVersionUID = 1L;
	private static String TAG = "MainFrontController : ";
       
    public MainFrontController() {
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
		case "/RankingBoardPage.main":								
			forward = new ActionForward();
			forward.setIsRedirect(false);
			forward.setPath("./Page/RankingBoardPage.jsp");
			break;
			
		// 로그인 버튼 클릭
		case "/RB_CategoryBtnClick.main":
			action = new RB_CategoryBtnClickAction();
//			System.out.println(TAG+"loginBtnClick 들어옴");
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		default :
			System.out.println(TAG +"잘못된 접근");
		}
		
		if(forward.getIsRedirect()){
			response.sendRedirect(forward.getPath());
		}
		else {
			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
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
