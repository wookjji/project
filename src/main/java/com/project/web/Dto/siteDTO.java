package com.project.web.Dto;

import java.util.ArrayList;
import java.util.List;

public class siteDTO {
	private String si_type;
	private int s_no,s_num, can;
	private List<String> reservation_n =new ArrayList<>();
	private List<String> start_date= new ArrayList<>();
	private List<String> end_date= new ArrayList<>();
	public void plusn(String r_n) {
		this.reservation_n.add(r_n);
	}
	public List<String> getReservation_n() {
		return reservation_n;
	}
	public String getSi_type() {
		return si_type;
	}
	public void setSi_type(String si_type) {
		this.si_type = si_type;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public List<String> getStart_date() {
		return start_date;
	}

	public List<String> getEnd_date() {
		return end_date;
	}
	public void plusstart(String start) {
		this.start_date.add(start);
	}
	public void plusend(String end) {
		this.end_date.add(end);
	}
	public int getCan() {
		return can;
	}
	public void setCan(int can) {
		this.can = can;
	}
	
	
	
	
}
