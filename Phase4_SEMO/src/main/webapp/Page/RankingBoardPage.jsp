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
                            <input type="submit" name=category value="??????">
                        </div>
                        <div>
                            <span>
                                <input type="submit" name=category value="??????">
                                <input type="submit" name=category value="??????">
                                <input type="submit" name=category value="??????/?????????">
                                <input type="submit" name=category value="??????">
                                <input type="submit" name=category value="???/????????????">
                            </span>
                        </div>
                        <div>
                            <span>
                                <input type="submit" name=category value="??????">
                                <input type="submit" name=category value="???????????????">
                                <input type="submit" name=category value="?????????????????????">
                                <input type="submit" name=category value="????????????">
                            </span>
                        </div>
                        <div>
                            <span>
                                <input type="submit" name=category value="??????/????????????">
                                <input type="submit" name=category value="?????????/??????">
                                <input type="submit" name=category value="?????????????????????">
                                <input type="submit" name=category value="???????????????">
                                <input type="submit" name=category value="??????">
                            </span>
                        </div>
                    </form>
                </div>
                <div id="rcontent">
                    <div id="rank_head">
                        <span class="head">??????</span>
                        <span class="head">?????????</span>
                        <span class="head">??????</span>
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
            <button id="close">???</button>
            <div id="userinfo">
               <%=login_id %>???,<br>???????????????.
            </div>
            <button id="logout" onclick="location.href='${pageContext.request.contextPath }/Logout.main'">Logout</button>
        </div>
    </div>
</body>

</html>