package lifelineportal.beans;

import java.sql.Date;

public class EventBean {
	private int event_id;
	private String event_name,venue,description;
	private Date date;
	
	public EventBean(int event_id, String event_name, String venue, String description, Date date) {
		super();
		this.event_id = event_id;
		this.event_name = event_name;
		this.venue = venue;
		this.description = description;
		this.date = date;
	}
	public EventBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getEvent_id() {
		return event_id;
	}
	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}
	public String getEvent_name() {
		return event_name;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}
	public String getVenue() {
		return venue;
	}
	public void setVenue(String venue) {
		this.venue = venue;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
}
