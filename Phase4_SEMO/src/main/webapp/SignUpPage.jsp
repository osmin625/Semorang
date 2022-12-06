<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join page</title>
<script type="text/javascript" src="script/member.js"></script>

</head>
<body>
	<h3>Join</h3>
	<form method="POST" action="${pageContext.request.contextPath }/join.do" name="joinform">
		<table>
			<thead>*표시 항목은 필수 입력 항목입니다.</thead>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name">*</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userid">*<input type="hidden" name="reid"><input type="button" value="중복확인" onclick="return idCheck()"></td>
			</tr>
			<tr>
				<td>암호</td>
				<td><input type="password" name="pwd">*</td>
			</tr>
			<tr>
				<td>암호확인</td>
				<td><input type="password" name="pwdpwd">*</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" placeholder="010-xxxx-xxxx"></td>
			</tr>
			<tr>
				<td>등급</td>
				<td><input type="radio" name="admin" value="0" checked="checked">일반회원<input type="radio" name="admin" value="1">관리자</td>
			</tr>
			<tr>
				<td><input type="submit" value="join" onclick="return joinCheck()"></td>
				<td><input type="reset" value="cancle"></td>
			</tr>
			<tr>
				<td colspan="2">${message }</td>
			</tr>
		</table>
	</form>
</body>
</html>