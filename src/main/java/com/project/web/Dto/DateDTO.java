package com.project.web.Dto;

public class DateDTO {
	
	private int type;
	private String name, start_date, end_date;
	public int gettype() {
		return type;
	}
	public void settype(int type) {
		this.type = type;
	}
	public String getname() {
		return name;
	}
	public void setname(String name) {
		this.name = name;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
}
