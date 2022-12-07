<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InsertThingDialog</title>
</head>
<body>
	<h4>Insert 할 Thing의 이름을 입력하시오</h4>
	<input type = "text" name="thing_name">
	<input type = "submit" value = "valid_check" name = "thing_valid_check">
	<h4>랭크를 입력하세요</h4>
	<input type = "text" name="thing_rank">
	<h4></h4>
	<input type = "submit" value = "추가하기" name = "thing_insert">
	<input type = "submit" value = "닫기" name = "close">
</body>
</html>