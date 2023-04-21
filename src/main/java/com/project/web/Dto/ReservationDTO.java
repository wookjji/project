package com.project.web.Dto;



import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReservationDTO {
	private String r_name,r_tel,r_no,r_in,r_out,p_method;
	private int can,s_no,p_amount;
	
	
	
	
//	private LocalDate r_in,r_out;
	private int r_count;
	public ReservationDTO() {
		
	}
	
	public ReservationDTO(String r_name,String r_tel,String r_in,String r_out, String r_no, int r_count,int s_no) {
		this.r_name = r_name;
		this.r_tel = r_tel;
		this.r_count = r_count;
		this.r_in = r_in;
		this.r_out = r_out;
		this.r_no = r_no;
		this.s_no = s_no;
	}	
	
}
