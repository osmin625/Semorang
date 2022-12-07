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
		
		// .main으로 끝나는 경우 처리
		switch(command) {
		// RankingBoardPage로 이동
		case "/RankingBoardPage.main":								
			forward = new ActionForward();
			forward.setIsRedirect(false);
			forward.setPath("./Page/RankingBoardPage.jsp");
			break;
			
		// RankingBoardPage의 카테고리 버튼 클릭시 수행하는 Action
		case "/RB_CategoryBtnClick.main":
			action = new RB_CategoryBtnClickAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/UserRankingPage.main":
			forward = new ActionForward();
			forward.setIsRedirect(false);
			forward.setPath("./Page/UserRankingPage.jsp");
			break;
		
		case "/SnapshotBoardPage.main":
			forward = new ActionForward();
			forward.setIsRedirect(false);
			forward.setPath("./Page/SnapshotBoardPage.jsp");
			break;
			
		// MyPage로 이동
		case "/MyPage.main":
			forward = new ActionForward();
			forward.setIsRedirect(false);
			forward.setPath("./Page/MyPage.jsp");
			break;
			
		// MyPage의 카테고리 버튼 클릭 시 수행하는 Action
		case "/MP_CategoryBtnClick.main":
			forward = new ActionForward();
			forward.setIsRedirect(false);
			forward.setPath("./Page/MyPage.jsp");
			request.setAttribute("category", request.getParameter("category"));
			break;
		
		case "/InsertThingDialog.main":
			forward = new ActionForward();
			forward.setIsRedirect(false);
			forward.setPath("./Page/InsertThingDialog.jsp");
			break;
			
		case "/UpdateThingDialog.main":
			forward = new ActionForward();
			forward.setIsRedirect(false);
			forward.setPath("./Page/UpdateThingDialog.jsp");
			break;
			
		case"/DeleteThingDialog.main":
			forward = new ActionForward();
			forward.setIsRedirect(false);
			forward.setPath("./Page/DeleteThingDialog.jsp");
			break;
		
		
		// InsertDialog ValidCheck 버튼 클릭 시 수행하는 Action
		case "/ThingValidCheck.main":
			action = new ThingValidCheckAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		// InsertDialog에서 추가하기 버튼 클릭 시 수행하는 Action
		case "/InsertThingAction.main":
			action = new InsertThingAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/UpdateThingAction.main":
			action = new UpdateThingAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "DeleteThingAction.main":
			action = new DeleteThingAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		
			
		// 로그아웃 버튼 클릭 시 이동
		case "/Logout.main":
			forward = new ActionForward();
			forward.setIsRedirect(true);
			forward.setPath("LoginPage.lo");
			request.getSession().removeAttribute("login_id");
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
