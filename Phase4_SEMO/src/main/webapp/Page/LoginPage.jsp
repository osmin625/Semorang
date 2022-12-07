<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Semorang</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel = "stylesheet" type ="text/css" href = "${pageContext.request.contextPath}/css/LoginPage.css">
</head>

<body>
    <div id="wrapper">
        <div id="content">
            <div id="headline">
            </div>
            <div id="bodyline">
                <a id="main" href="main.html">
                    <img id="icon" src="${pageContext.request.contextPath }/image/semorang.png" />
                </a>
                <div id="register">로그인</div>
                <form method="POST" action="${pageContext.request.contextPath }/LoginBtnClick.lo" id="login_form">
                    <div id="input_label">ID</div>
                    <input type="text" name="user_id" placeholder="사용자 ID를 입력하세요" required />
                    <div id="input_label">Password</div>
                    <input type="password" name="user_pw" placeholder="비밀번호를 입력하세요" required />
                    <input type="submit" id="join" value="로그인"/>
                    <span id="log_message">${message}</span>
                    <div id="login_option">
                        <a class="link" href="SignUpPage.lo">회원가입</a>
                        <!--<a class="link" href="./find_idpw.html">아이디/비밀번호 찾기</a> -->
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>

</html>