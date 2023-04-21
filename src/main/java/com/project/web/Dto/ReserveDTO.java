package com.project.web.Dto;


public class ReserveDTO {
	private int s_no;
	private String r_no, r_in,r_out;
	public String getR_no() {
		return r_no;
	}
	public void setR_no(String r_no) {
		this.r_no = r_no;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getR_in() {
		return r_in;
	}
	public void setR_in(String r_in) {
		this.r_in = r_in;
	}
	public String getR_out() {
		return r_out;
	}
	public void setR_out(String r_out) {
		this.r_out = r_out;
	}
}
