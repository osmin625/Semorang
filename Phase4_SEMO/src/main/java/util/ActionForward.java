package util;

// 전송방식을 결정하는 클래스
public class ActionForward {
	
	private boolean isRedirect = false; 					// redirect vs forward 
	private String path = null;								// 실제 저장할 페이지 주소를 담는 변수 
	private String message = ""; 
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public boolean getIsRedirect() {
		return isRedirect;
	}
	public void setIsRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
}
