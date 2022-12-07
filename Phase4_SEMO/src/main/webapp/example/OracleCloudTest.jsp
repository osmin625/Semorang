<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection con = null;
	String result = null;
	String id = null;
	String pw = null;
	Statement stmt = null;
	ResultSet rs = null;
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@SEMODB_high?TNS_ADMIN=C:\\\\OracleDBproject\\\\Wallet_SEMODB";
		String user = "ADMIN";
		String password = "Semorang1234";
		con = DriverManager.getConnection(url, user, password);
		stmt = con.createStatement();
		String sql = "SELECT * FROM ADMIN";
		rs = stmt.executeQuery(sql);
		while(rs.next()){
			id = rs.getString(1);
			pw = rs.getString(2);
		}
		result ="ok1 jdbc";
		rs.close();
		stmt.close();
		con.close();
		
	} catch(Exception e){
		e.printStackTrace();
	}
%>
<h1><%=result %></h1>
<h1>id : <%=id%></h1>
<h1>password : <%=pw%></h1>

</body>
</html>