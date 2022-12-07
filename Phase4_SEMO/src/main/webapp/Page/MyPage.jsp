<%@page import="dao.User_TR_Board_DAO"%>
<%@page import="main.MyPage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="main.MyPage,dto.User_TR_Board_DTO,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<%
	String login_id = (String)session.getAttribute("login_id"); 
	MyPage mp = new MyPage();
	// 카테고리는 cate_name (String)으로 넘겨준다
	String category ="";
	if (request.getAttribute("category") == null){
		category = "전체";
	}else{
	 category= (String)request.getAttribute("category");
	}
	
	List<User_TR_Board_DTO> result = new ArrayList<>();
	if (category.equals("전체")){
		result = mp.print_total_trBoard(login_id);
	}else{
		result = mp.print_category_trBoard(login_id, category);
	}
	
%>

<script>
	function InsertThing(){
		<!-- 팝업창 중앙정렬 하고 싶다..
		var width = 430;
		var height = 500;
		var popupX = (document.body.offsetWidth / 2) - (width / 2);
		var popupY=  (document.body.offsetWidth / 2) - (height / 2);
		-->
		window.open("${pageContext.request.contextPath }/InsertThingDialog.main",
		'InsertThing', 'width='+width+ ', height='+ height + ', status=no, scrollbars=yes ,left=' + popupX + ',top='+ popupY);
	}
</script>
<head>
    <title>Mypage</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel = "stylesheet" type ="text/css" href = "${pageContext.request.contextPath}/css/MyPage.css">
</head>
<body>
    <div id="wrapper">
        <div id="content">
            <div id="headline">
                <a id="main" href="main.html">
                    <img id="icon" src="${pageContext.request.contextPath }/image/semorang.png" />
                </a>
                <span class="head_content">
                    <a class="link" href="${pageContext.request.contextPath }/RankingBoardPage.main">Ranking</a>
                </span>
                <span class="head_content">
                    <a class="link" href="${pageContext.request.contextPath }/UserRankingPage.main">User Ranking</a>
                </span>
                <span class="head_content">
                    <a class="link" href="${pageContext.request.contextPath }/SnapshotBoardPage.main">Ranking Snapshot</a>
                </span>
                <span id=r class="head_content">
                    <a class="link" href="${pageContext.request.contextPath }/MyPage.main">My page</a>
                </span>
            </div>
            <div id=bodyline>
                <div id="lcontent">
                    <form method="POST" action="${pageContext.request.contextPath }/MP_CategoryBtnClick.main" id="category_form">
                        <div>
                            <input type="submit" name=category value="전체">
                        </div>
                        <div>
                            <span>
                                <input type="submit" name=category value="한식">
                                <input type="submit" name=category value="중식">
                                <input type="submit" name=category value="일식/수산물">
                                <input type="submit" name=category value="분식">
                                <input type="submit" name=category value="닭/오리요리">
                            </span>
                        </div>
                        <div>
                            <span>
                                <input type="submit" name=category value="양식">
                                <input type="submit" name=category value="패스트푸드">
                                <input type="submit" name=category value="제과제빵떡케익">
                                <input type="submit" name=category value="유흥주점">
                            </span>
                        </div>
                        <div>
                            <span>
                                <input type="submit" name=category value="별식/퓨전요리">
                                <input type="submit" name=category value="커피점/카페">
                                <input type="submit" name=category value="음식배달서비스">
                                <input type="submit" name=category value="기타음식업">
                                <input type="submit" name=category value="부페">
                            </span>
                        </div>
                    </form>
                </div>
                <div id="rcontent">
                    <div id="rank_head">
                        <span class="head">순위</span>
                        <span class="head">상호명</span>
                    </div>
                    <div id="ranking">
                         <%
                         	int new_rank = 1;
                         	boolean first_check = true;
	                        for (User_TR_Board_DTO item : result) {
	                        	if(new_rank != item.getTr_ranks()&& first_check== false) {
	        						new_rank++;
	        					}
		                        out.print("<div class = tuple>");
		        				out.print("<span class = val>" + new_rank+ "</span>");
		        				out.print("<span class = val>" + item.getT_categories()+ "</span>");
		        				out.print("<span class = val>" + item.getT_thing_name()+ "</span>");
		                        out.print("</div>");
		                        first_check = false;
	            			}
                        		
                        %>
                    </div>
                </div>
                <div id="rrcontent">
	                    <input type="submit" value="추가"onclick = "return InsertThing()">
	                    <input type="submit" value="수정">
	                    <input type="submit" value="삭제">
                </div>
            </div>

        </div>
        <!-- Sidebar -->
        <div id="sidebar">
            <button id="close">≫</button>
            <div id="userinfo">
               <%=login_id %>님,<br>안녕하세요.
            </div>
            <button id="logout" onclick="location.href='${pageContext.request.contextPath }/Logout.main'">Logout</button>
        </div>
    </div>
</body>

</html>