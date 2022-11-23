package DTO;

import java.sql.Timestamp;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

public class CommentDTO {
	private String comment_id;
	private String snapshot_id;
	private String user_id;
	private String comment;
	private LocalDateTime write_date;
	private LocalDateTime update_date;
	
	CommentDTO(){
		super();
		this.comment_id = "";
		this.snapshot_id = "";  
		this.user_id = "";
		this.comment = "";  
		this.write_date = LocalDateTime.of(2000, 1, 1, 0, 0); 
		this.update_date = LocalDateTime.of(2000, 1, 1, 0, 0);
	}
	
	public CommentDTO(String comment_id, String snapshot_id, String user_id, String comment) {
		super();
		this.comment_id = comment_id;
		this.snapshot_id = snapshot_id;  
		this.user_id = user_id;
		this.comment = comment;  
		LocalDateTime now = LocalDateTime.now();
		this.write_date = now;
		this.update_date = now;
	}

	@Override
	public String toString() {
		String result= String.format(" %-10s | %-10s | %-10s | %-20s | %-20s |\r\n | %s |",
				comment_id, snapshot_id, user_id, write_date, update_date,comment);
		return result;
	}

	public String getComment_id() {
		return comment_id;
	}

	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}

	public String getSnapshot_id() {
		return snapshot_id;
	}

	public void setSnapshot_id(String snapshot_id) {
		this.snapshot_id = snapshot_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Timestamp getWrite_date() {
		return Timestamp.valueOf(write_date);
	}

	public void setWrite_date(Date write_date) {
		this.update_date = write_date.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();;
	}
	public Timestamp getUpdate_date() {
		return Timestamp.valueOf(update_date);
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();;
	}

	
}
