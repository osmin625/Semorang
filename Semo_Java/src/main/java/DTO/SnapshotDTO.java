package DTO;

import java.sql.Timestamp;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

public class SnapshotDTO {
	private String snapshot_id;
	private String thing_rank_id;
	private String user_id;
	private LocalDateTime taken_date;
	private LocalDateTime update_date;
	private int like_count;
	private int dislike_count;
	
	SnapshotDTO(){
		super();
		this.snapshot_id = "";
		this.thing_rank_id = "";
		this.user_id = "";
		this.taken_date = LocalDateTime.of(2000, 1, 1, 0, 0); 
		this.update_date = LocalDateTime.of(2000, 1, 1, 0, 0);
		this.like_count = 0;
		this.dislike_count = 0;
	}
	
	public SnapshotDTO(String snapshot_id, String thing_rank_id, String user_id, int like_count, int dislike_count) {
		super();
		this.snapshot_id = snapshot_id;
		this.thing_rank_id = thing_rank_id;
		this.user_id = user_id;
		LocalDateTime now = LocalDateTime.now();
		this.taken_date = now;
		this.update_date = now;
		this.like_count = like_count;
		this.dislike_count = dislike_count;
	}

	@Override
	public String toString() {
		String result= String.format(" %-10s | %-10s | %-10s | %-20s | %-20s | %-8d | %-8d",
				snapshot_id, thing_rank_id, user_id, taken_date, update_date, like_count, dislike_count);
		return result;
	}

	public String getSnapshot_id() {
		return snapshot_id;
	}

	public void setSnapshot_id(String snapshot_id) {
		this.snapshot_id = snapshot_id;
	}

	public String getThing_rank_id() {
		return thing_rank_id;
	}

	public void setThing_rank_id(String thing_rank_id) {
		this.thing_rank_id = thing_rank_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public LocalDateTime getTaken_date() {
		return taken_date;
	}

	public void setTaken_date(Date taken_date) {
		this.taken_date = taken_date.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();;
	}

	public Timestamp getUpdate_date() {
		return Timestamp.valueOf(update_date);
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();;
	}

	public int getLike_count() {
		return like_count;
	}

	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}

	public int getDislike_count() {
		return dislike_count;
	}

	public void setDislike_count(int dislike_count) {
		this.dislike_count = dislike_count;
	}
	
	
}
