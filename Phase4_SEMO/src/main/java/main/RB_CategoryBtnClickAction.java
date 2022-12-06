package main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.Action;
import util.ActionForward;

public class RB_CategoryBtnClickAction implements Action{
	private static String TAG = "RB_CategoryBtnClickAction : ";
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ActionForward forward = new ActionForward();
		String cate_name = (String)request.getParameter("category");
		int cate =0;
		switch(cate_name) {
		case"한식" : 			cate = 1;break;
		case"중식" : 			cate = 2;break;
		case"일식/수산물" : 	cate = 3;break;
		case"분식" : 			cate = 4;break;
		case"닭/오리요리" : 	cate = 5;break;
		case"양식" : 			cate = 6;break;
		case"패스트푸드" : 	cate = 7;break;
		case"제과제빵떡케익" : 	cate = 8;break;
		case"유흥주점" : 		cate = 9;break;
		case"별식/퓨전요리" : 	cate = 10;break;
		case"커피점/카페" : 	cate = 11;break;
		case"음식배달서비스" : 	cate = 12;break;
		case"기타음식업" : 	cate = 13;break;
		case"부페" : 			cate = 14;break;
		case"전체" : 			cate = 15;break;
		default : 
			System.err.println("category name-> id 변환 오류 ");
		}
		request.setAttribute("category",cate );
		forward.setIsRedirect(false);
		forward.setPath("RankingBoardPage.main");
		
		return forward;
	}

}
