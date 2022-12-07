<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*,util.DBUtil" %>

<%
 	String login_id = (String)session.getAttribute("login_id"); 	
	DBUtil dbUtil = DBUtil.getInstance();
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql = "SELECT u.name ,SUM(r.like_count) as sl"
			+ " FROM users u, ranking_snapshot r"
			+ " WHERE r.user_id = u.user_id"
			+ " GROUP BY u.name"
			+ " ORDER BY sl DESC";
%>
<!DOCTYPE html>
<html>
<head>
 	<title>UserRankingSnapshot</title>
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
                
                </div>
                <div id="rcontent">
                    <div id="rank_head">
                        <span class="head">순위</span>
                        <span class="head">상호명</span>
                        <span class="head">평점</span>
                    </div>
                    <div id="ranking">
					                        
						<%
							try {
								conn = dbUtil.getConnection();
								stmt = conn.createStatement();
								rs = stmt.executeQuery(sql);
								while(rs.next()) {
									out.print("<div class = tuple>");
									out.print("<span class = val>" + rs.getString(1)+ "</span>");
									out.print("<span class = val>" + rs.getInt(2)+ "</span>");
									System.out.printf("%-10s %-10d\n",rs.getString(1),rs.getInt(2));
									out.print("</div>");
								}
							}catch (SQLException e) {
								e.printStackTrace();
							}finally {
								dbUtil.close(rs,stmt,conn);
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