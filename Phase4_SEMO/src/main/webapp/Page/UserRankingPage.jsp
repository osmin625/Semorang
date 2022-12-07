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
<%--     <link rel = "stylesheet" type ="text/css" href = "${pageContext.request.contextPath}/css/RankingBoardPage.css"> --%>
	<style>
        #content {
            background-color: #fffefb;
            width: 100%;
        }

        #headline {
            display: flex;
            align-items: center;
            margin-right: 20px;
            justify-content: space-between;
            height: 10vh;
        }

        .head_content {
            padding: 35px 55px;
            font-size: 30px;
            text-align: center;
            font-family: "inter";
            font-weight: bold;
            background-color: #dfeaff;
            border-radius: 40px 40px 0px 0px;
        }

        .head_content:hover {
            background-color: #c4d9ff;
            text-decoration: underline;
        }

        .head_content:active {
            background-color: #a1c2ff;
            text-decoration: underline;
        }

        #start {
            margin-left: auto;
            margin-right: 30px;
            background-color: #E16259;
            color: white;
            padding: 8px 15px 8px 15px;
            border: 0px;
            border-radius: 5px;
        }

        input[type="text"],
        input[type="password"] {
            padding: 1em;
            margin: 3px 0px;
            border-radius: 8px;
            border: solid 1px #bbbbbb;
        }

        input[type="text"]:hover,
        input[type="password"]:hover {
            border: solid 1px rgb(97, 97, 97);
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: solid 2px #abdcef;
            border: solid 1px #bbbbbb;
        }

        body {
            margin: 0px;
            height: 100vh;
        }

        input[type="submit"] {
            padding: 1em;
            border-radius: 16px;
            border: solid 1px #B591D1;
            margin: 5px;
            background-color: #B591D1;
            color: black;
            font-weight: bold;
            font-size: 15px;
            box-shadow: 2px 2px 2px 1px #c2aad4;
        }

        input[type="submit"]:hover {
            background-color: #a76ed3;
        }

        input[type="submit"]:active {
            background-color: #9745d6;
        }

        a {
            text-decoration: none;
            color: black;
        }

        #main {
            display: flex;
            padding: 10px 30px 10px 80px;
            align-items: center;
        }

        #login_option {
            display: flex;
            justify-content: space-between;
            font-size: 13px;
            font-weight: bold;
        }

        .link:hover {
            text-decoration: underline;
        }
        #userinfo {
          margin-left: 20px;
          color: #878785;
          font-size:20px;
          width: 200px;
          line-break: anywhere;
        }
        #sidebar {
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-content: flex-start;
            align-items: flex-start;
            width: 18%;
            min-width: fit-content;
            overflow: auto;
            background-color: #f7f6f3;
        }
        #close{
            border: transparent;
            background-color: transparent;
            font-size: 25px;
            padding: 10px;
        }
        #close:hover{
            background-color:#dfdfdf;
        }
        #logout {
            margin: 20px;
            background-color: transparent;
            border: solid 1px #bbbbbb;
            border-top: 1px solid #e8e7e4;
            font-size: 18px;
            padding: 5px 15px;
            color: #b6b4b0;
            text-align: left;
            border-radius: 10px;
        }

        #logout:hover {
            background-color: #e8e7e4;
        }

        #sections {
            display: flex;
            align-items: center;
            font-size: 25px;
            max-width: 99%;
        }

        #sections:hover {
            background-color: #fcf9f2;
        }

        #wrapper {
            display: flex;
            align-content: space-between;
            justify-content: space-between;
            min-height: 100vh;
        }

        #bodyline {
            display: flex;
            margin-bottom: auto;
            height: 90vh;
        }

        #lcontent {
            display: flex;
            width: 0%;
            flex-direction: column;
            margin-top: 10%;
            padding: 6%;
        }

        #rcontent {
            display: flex;
            flex-direction: column;
            width: 82%;
        }
        #rank_head{
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            margin-right: 50px;
        }
        .head{
            margin-top: 40px;
            border: #000000 solid 2px;
            border-radius: 20px;
            font-size: 30px;
            padding: 10px;
            background-color: white;
            font-weight: bold;
        }
        #ranking {
            display:flex;
            overflow: auto;
            flex-direction: column;
            padding: 1em;
            border-radius: 16px;
            margin-right: 50px;
            margin-top: 10px;
            border: solid 2px #000000;
            background-color: #ffffff;
            color: black;
            font-weight: bold;
            font-size: 20px;
            margin-bottom: 30px;
        }
        .tuple{
            display:flex;
            justify-content: space-between;
            border-bottom: solid 2px #b4b4b4;
        }
        .unit {
            /* border-bottom: solid 2px #b4b4b4; */
            /* margin: 10px; */
            font-size: 30px;
        }
        #r{
            background-color: #a1c2ff;
            
        }
    </style>
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
                <span  id=r class="head_content">
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
                        <span class="head">사용자ID</span>
                        <span class="head">좋아요 수</span>
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
            <button id="logout" onclick="location.href='${pageContext.request.contextPath }/Logout.main'">Logout</button>
        </div>
    </div>
</body>
</html>