package com.project.web.Dto;

public class SiteInDTO {
	private String si_type;
	private int s_no, s_num, si_limit, count, s_active;

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

	public int getSi_limit() {
		return si_limit;
	}

	public void setSi_limit(int si_limit) {
		this.si_limit = si_limit;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getS_active() {
		return s_active;
	}

	public void setS_active(int s_active) {
		this.s_active = s_active;
	}

}
