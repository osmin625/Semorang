
public class ThingDTO {
	private int thing_id;
	private String admin_id;
	private String thing_name;
	private String categories;
	private double latitude;
	private double longitude;
	private String sido;
	private String sigoongoo;
	private String bubjungdong;
	
	//default Constructor
	public ThingDTO() {
		super();
		thing_id = 0;
		admin_id = "";
		thing_name = "";
		categories = "";
		latitude = 0.0;
		longitude = 0.0;
		sido = "";
		sigoongoo = "";
		bubjungdong = "";
	}
	
	public void setCategories(String categories) {
		String temp;
		String c =categories.substring(0,3);
		switch(c) {
		case"Q01" : temp ="한식";break;
		case"Q02" : temp ="중식";break;
		case"Q03" : temp ="일식/수산물";break;
		case"Q04" : temp ="분식";break;
		case"Q05" : temp ="닭/오리요리";break;
		case"Q06" : temp ="양식";break;
		case"Q07" : temp ="패스트푸드";break;
		case"Q08" : temp ="제과제빵떡케익";break;
		case"Q09" : temp ="유흥주점";break;
		case"Q10" : temp ="별식/퓨전요리";break;
		case"Q12" : temp ="커피점/카페";break;
		case"Q13" : temp ="음식배달서비스";break;
		case"Q14" : temp ="기타음식업";break;
		case"Q15" : temp ="부페";break;
		default : temp = ""; break;
		}
		this.categories = temp;
	}
	@Override
	public String toString() {
//		String result="";
		String result= String.format(" %10d | %-8s | %-15s | %-10s | %-20.10f | %-20.10f | %-10s | %-10s| %-10s",
				thing_id,admin_id,thing_name,categories,latitude,longitude,sido,sigoongoo,bubjungdong);
//		result += thing_id +" | ";
//		result += admin_id +" | ";
//		result += thing_name +" | ";
//		result += categories +" | ";
//		result += latitude +" | ";
//		result += longitude +" | ";
//		result += sido +" | ";
//		result += sigoongoo +" | ";
//		result += bubjungdong;
		return result;
	}
	
	public int getThing_id() {
		return thing_id;
	}
	public void setThing_id(int thing_id) {
		this.thing_id = thing_id;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getThing_name() {
		return thing_name;
	}
	public void setThing_name(String thing_name) {
		this.thing_name = thing_name;
	}
	public String getCategories() {
		return categories;
	}

	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getSigoongoo() {
		return sigoongoo;
	}
	public void setSigoongoo(String sigoongoo) {
		this.sigoongoo = sigoongoo;
	}
	public String getBubjungdong() {
		return bubjungdong;
	}
	public void setBubjungdong(String bubjungdong) {
		this.bubjungdong = bubjungdong;
	}
}
