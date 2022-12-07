<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="main.RankingBoardPage,java.util.*,java.text.*,java.sql.*,util.DBUtil"%>
<%
	String login_id = (String)session.getAttribute("login_id"); 	
	DBUtil dbUtil = DBUtil.getInstance();
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql = "SELECT s.snapshot_id, s.content, u.user_id, s.like_count, s.taken_date"
			+ " FROM USERS u, RANKING_SNAPSHOT s"
			+ " WHERE u.user_id = s.user_id"
			+ " ORDER BY taken_date DESC";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>RankingSnapshot</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel = "stylesheet" type ="text/css" href = "${pageContext.request.contextPath}/css/SnapshotRanking.css">
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
               <span id=r class="head_content">
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
                        <span class="head">SnapshotID</span>
                        <span class="head">게시글 내용</span>
                        <span class="head">작성자</span>
                        <span class="head">받은 좋아요 수</span>
                        <span class="head">작성 시기</span>
                    </div>
                    <div id="ranking">
                    <%
                    try {
						conn = dbUtil.getConnection();
						stmt = conn.createStatement();
						rs = stmt.executeQuery(sql);
						while(rs.next()) {
							out.print("<div class = tuple>");
							out.print("<span class = unit1>" + rs.getString(1)+ "</span>");
							out.print("<span class = unit2>" + rs.getString(2)+ "</span>");
							out.print("<span class = unit3>" + rs.getString(3)+ "</span>");
							out.print("<span class = unit4>" + rs.getInt(4)+ "</span>");
							out.print("<span class = unit5>" + rs.getString(5)+ "</span>");
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
            <button id="logout" onclick="location.href='${pageContext.request.contextPath }/Logout.main'">Logout</button>
        </div>
    </div>
</body>

</html>