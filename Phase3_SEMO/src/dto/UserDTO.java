package dto;

public class UserDTO {
	private String user_id;
	private String password;
	private String name;
	private String region;
	private String phone_number;
	
	public UserDTO(){
		super();
		user_id = "";
		password = "";
		name = "";
		region = "";
		phone_number = "";
	}
	
	public UserDTO(String user_id, String password, String name, String region, String phone_number) {
		super();
		this.user_id = user_id;
		this.password = password;
		this.name = name;
		this.region = region;
		this.phone_number = phone_number;
	}

	@Override
	public String toString() {
		String result= String.format(" %-10s | %-10s | %-10s | %-10s | %-10s",
				user_id,password,name,region,phone_number);
		return result;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	
}
