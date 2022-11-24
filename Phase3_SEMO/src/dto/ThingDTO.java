package dto;

import main.DBUtil;

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
	
	// 카테고리 코드로 받아와서 한글로 변환하여 저장
	public void setCategories(String category_id) {
		this.categories = DBUtil.cate_id_to_name(category_id);
	}
	@Override
	public String toString() {
//		String result="";
		String result= String.format(" %10d | %-8s | %-15s | %-10s | %-20.10f | %-20.10f | %-10s | %-10s| %-10s",
				thing_id,admin_id,thing_name,categories,latitude,longitude,sido,sigoongoo,bubjungdong);
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
