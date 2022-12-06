<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*,java.sql.*,util.DBUtil" %>

<%
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
<meta charset="UTF-8">
<title>UserRankingPage</title>
</head>
<body>
	<h1>UserRankingPage입니다</h1>
	
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
</body>
</html>