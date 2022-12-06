<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Semorang</title>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <style>
    #content {
      background-color: #fffefb;
      display: flex;
      flex-direction: column;
    }

    #headline {
      display: flex;
      align-items: center;
      justify-content: flex-start;
    }

    #bodyline {
      height: 100%;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
    }

    .head_content {
      padding: 5px 15px;
    }

    .head_content:hover {
      background-color: #f7f6f3;
      text-decoration: underline;
    }

    body {
      margin: 0px;
    }

    a {
      text-decoration: none;
      color: black;
    }

    .link:hover {
      text-decoration: underline;
    }

    #wrapper {
      display: flex;
      align-content: space-between;
      justify-content: space-between;
      min-height: 100vh;
    }

    #content {
      width: 100%;
    }

    form {
      display: flex;
      align-items: flex-start;
      justify-content: center;
      flex-direction: column;
    }

    button {
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 10px;
      min-width: 400px;
      margin: 10px;
      font-size: 18px;
      background-color: white;
      border: solid 1px rgb(225, 225, 225);
      border-radius: 5px;
    }

    input[type="text"] {
      padding: 10px 20px;
      margin: 5px 10px 10px 10px;
      background-color: #f7f6f3;
      border: solid 1px rgb(225, 225, 225);
      border-radius: 5px;
      min-width: 355px;
      font-size: 20px;
    }

    input[type="text"]:hover {
      border: solid 1px rgb(201, 201, 201);
      ;
    }

    input[type="text"]:focus {
      outline: solid 3px #abdcef;
      border: solid 1px #00a2e3;
    }

    input[type="text"]:active {
      outline: none;
      border: solid 1px #00a2e3;
    }

    #input_label {
      color: #bbbbbb;
      font-size: 13px;
      margin-left: 10px;
    }

    input[type="password"] {
      padding: 10px 20px;
      margin: 5px 10px 10px 10px;
      background-color: #f7f6f3;
      border: solid 1px rgb(225, 225, 225);
      border-radius: 5px;
      min-width: 355px;
      font-size: 20px;
    }

    input[type="password"]:hover {
      border: solid 1px rgb(201, 201, 201);
    }

    input[type="password"]:focus {
      outline: solid 3px #abdcef;
      border: solid 1px #00a2e3;
    }

    input[type="password"]:active {
      outline: none;
      border: solid 1px #00a2e3;
    }

    #password {
      display: none;
      color: #bbbbbb;
      font-size: 13px;
    }

    #join {
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 10px;
      min-width: 400px;
      margin: 10px;
      font-size: 18px;
      border: solid 1px rgb(225, 225, 225);
      border-radius: 5px;
      color: #ec625b;
      background-color: #fdf5f2;
      border: solid 1px #ec625b;
    }

    #join:hover {
      background-color: #feece5;
    }

    #join:active {
      background-color: #fee3d9;
    }

    #register {
      font-size: 65px;
      padding: 20px;
      font-weight: bold;
    }

    .bold {
      font-weight: bold;
    }

    hr {
      width: 400px;
      color: #bbbbbb;
    }

    #google_img {
      width: 30px;
      margin-right: 10px;
    }

    #icon {
      min-width: 300px;
    }
    #log_message{
            margin-left: 10px;
            margin-bottom: 15px;
            color: red;
            /* display: none; */
        }
  </style>
</head>

<script>
function SignUp(){
	if(document.SignUp_form.reid.value == ""){
		alert("아이디 중복확인이 필요합니다");
		return false;
	}
	return true;
}
function IdCheck() {
	// 사용자 아이디가 입력되었는지 확인 루틴 구현
	if (document.SignUp_form.user_id.value == "") {
		alert("사용자 아이디를 입력해주세요.");
		document.SignUp_form.user_id.focus();
		return false;
	}
	// 아이디 중복 체크를 위한 페이지는 새로운 창에 출력한다.(idcheck.jsp)
	var url = "IdCheck.lo?userid=" + document.joinform.user_id.value;
	window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
}
</script>
<body>
  <div id="wrapper">
    <div id="content">
      <div id="headline">
      </div>
      <div id="bodyline">
        <a id="main" href="main.html">
          <img id="icon" src="image/semorang.png" />
        </a>
        <div id="register">회원가입</div>
        <!-- 
        <button id="google">
          <img id='google_img' src="google.png"></img><span class="bold">Google</span>로 계속하기
        </button>
         -->
        <hr id="line" />
        <form action="${pageContext.request.contextPath }/SignUpBtnClick.lo" method="POST" id="SignUp_form">
       	<span id="log_message">${message}</span>
          <div id="input_label">ID</div>
          <input type="text" name="user_id" placeholder="사용자 ID를 입력하세요" required />
          <!--  <input type="button" value="중복확인" onclick="return IdCheck()"> -->
          <div id="input_label">Password</div>
          <input type="password" name="user_pw" placeholder="비밀번호를 입력하세요" required />
          <div id="input_label">성함</div>
          <input type="text" name="user_name" placeholder="ex) 홍길동" required />
          <div id="input_label">거주 지역</div>
          <input type="text" name="user_region" placeholder="ex) 대구 수성구" required />
          <div id="input_label">핸드폰 번호</div>
          <input type="text" name="user_phone_number" placeholder="ex) 01012345678" required />
          <input type="submit" id="join" value="가입하기" onclick="return SignUp()" />
        </form>
      </div>
    </div>
  </div>
</body>

</html>
