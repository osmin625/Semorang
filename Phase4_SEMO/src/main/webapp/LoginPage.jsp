<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log In page</title>

<!-- 입력정보 유효성 검사 javascript -->
<script type="text/javascript" src="login_valid_check.js"></script>

</head>
<body>
	<h3>Log In</h3>
	<form  method="POST" action="${pageContext.request.contextPath }/LoginBtnClick.lo" name="loginform" >
		<table>
			<tr>
				<td>아이디</td>
				<td colspan="2"><input type="text" name="user_id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td colspan="2"><input type="password" name="user_pw"></td>
			</tr>
			<tr>
				<td><input type="submit" value="Log In" onclick="return loginCheck()"></td>
				<td style="text-align: center"><input type="reset" value="cancle"></td>
				<td style="text-align: right"><input type="button" value="SignUp" onclick="location.href='${pageContext.request.contextPath }/SignUpPage.lo'">
				<td>
			</tr>
			<tr>
				<td colspan="3" style="text-align: center"><span style="color: red;">${message}</span></td>
			</tr>
		</table>
	</form>
</body>
</html>