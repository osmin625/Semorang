/**
 * 로그인 처리 현황
1. 아이디와 암호 모두 입력되었을 때만 로그인 인증 처리 수행
2. 입력이 안되면 알림창으로 에러 메시지 출력
 */

function loginCheck(){
	if (document.loginform.user_id.value == ""){
		alert("아이디를 입력해 주세요.");
		document.loginform.user_id.focus();
		return false;
	} else if (document.loginform.user_pw.value == ""){
		alert("비밀번호를 입력해주세요.");
		document.loginform.user_pw.focus();
		return false;
	} else {
		return true;
	}
}