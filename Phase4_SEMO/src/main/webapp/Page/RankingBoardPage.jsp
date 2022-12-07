<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="main.RankingBoardPage,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<%
	String login_id = (String)session.getAttribute("login_id"); 
	RankingBoardPage rbp = new RankingBoardPage();
	int category;
	if (request.getAttribute("category") == null){
		category = 15;
	}else{
		category = (int)request.getAttribute("category");
	}
	ArrayList<String[]> result = rbp.display(category);
%>

<head>
    <title>RankingBoardPage</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel = "stylesheet" type ="text/css" href = "${pageContext.request.contextPath}/css/RankingBoardPage.css">
</head>

<body>
    <div id="wrapper">
        <div id="content">
            <div id="headline">
                <a id="main" href="main.html">
                    <img id="icon" src="${pageContext.request.contextPath }/image/semorang.png" />
                </a>
                <span id=r class="head_content">
                    <a class="link" href="${pageContext.request.contextPath }/RankingBoardPage.main">Ranking</a>
                </span>
                <span class="head_content">
                    <a class="link" href="${pageContext.request.contextPath }/UserRankingPage.main">User Ranking</a>
                </span>
                <span class="head_content">
                    <a class="link" href="${pageContext.request.contextPath }/SnapshotBoardPage.main">Ranking Snapshot</a>
                </span>
                <span class="head_content">
                    <a class="link" href="${pageContext.request.contextPath }/MyPage.main">My page</a>
                </span>
            </div>
            <div id=bodyline>
                <div id="lcontent">
                    <form method="POST" action="${pageContext.request.contextPath }/RB_CategoryBtnClick.main" id="category_form">
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
                        <span class="head">평점</span>
                    </div>
                    <div id="ranking">
                         <%
	                        for (String[] item : result) {
		                        out.print("<div class = tuple>");
		        				out.print("<span class = val>" + item[0]+ "</span>");
		        				out.print("<span class = val>" + item[1]+ "</span>");
		        				out.print("<span class = val>" + item[2]+ "</span>");
		                        out.print("</div>");
	            			}
                        		
                        %>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sidebar -->
        <div id="sidebar">
            <button id="close">≫</button>
            <div id="userinfo">
               <%=login_id %>님,<br>안녕하세요.
            </div>
            <button id="logout" onclick="location.href='/logout'">Logout</button>
        </div>
    </div>
</body>

</html>