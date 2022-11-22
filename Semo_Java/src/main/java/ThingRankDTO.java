import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

public class ThingRankDTO {
	private String thing_rank_id;
	private int thing_id;
	private String user_id;
	private int ranks;
	private LocalDateTime thingking_date;
	private LocalDateTime update_date;
	
	
	public ThingRankDTO() {
		super();
		this.thing_rank_id = ""; 
		this.thing_id = 0;
		this.user_id = "";
		this.ranks = 0;
		this.thingking_date = LocalDateTime.of(2000, 1, 1, 0, 0);
		this.update_date = LocalDateTime.of(2000, 1, 1, 0, 0);
	}

	public ThingRankDTO(int thing_id, String user_id, int ranks) {
		super();
//		this.thing_rank_id = 
		this.thing_id = thing_id;
		this.user_id = user_id;
		this.ranks = ranks;
		LocalDateTime now = LocalDateTime.now();
		this.thingking_date = now;
		this.update_date = now;
		
	}
	
	@Override
	public String toString() {
		String result= String.format(" %-10s | %-8d | %-15s | %-10d | %-20s | %-20s ",
				thing_rank_id,thing_id,user_id,ranks,thingking_date,update_date);
		return result;
	}
	
	public String getThing_rank_id() {
		return thing_rank_id;
	}
	public void setThing_rank_id(String thing_rank_id) {
		this.thing_rank_id = thing_rank_id;
	}
	public int getThing_id() {
		return thing_id;
	}
	public void setThing_id(int thing_id) {
		this.thing_id = thing_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getRanks() {
		return ranks;
	}
	public void setRanks(int ranks) {
		this.ranks = ranks;
	}
	public LocalDateTime getThingking_date() {
		return thingking_date;
	}
	public void setThingking_date(Date thingking_date) {
		this.thingking_date = thingking_date.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
	}
	public LocalDateTime getUpdate_daet() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
	}
	
}
