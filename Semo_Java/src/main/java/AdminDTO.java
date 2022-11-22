
public class AdminDTO {
	private String admin_id;
	private String password;
	
	public AdminDTO() {
		super();
		admin_id = "";
		password = "";
	}

	public AdminDTO(String admin_id, String password) {
		super();
		this.admin_id = admin_id;
		this.password = password;
	}

	@Override
	public String toString() {
		return String.format(" %-10s | %-10s",admin_id,password);
	}
	
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
