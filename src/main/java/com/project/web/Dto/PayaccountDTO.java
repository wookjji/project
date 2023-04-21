package com.project.web.Dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PayaccountDTO {

	private String r_no,p_method;
	private int p_amount,p_check;
	
	public PayaccountDTO() {}
	
	public PayaccountDTO(String r_no,String p_method,int p_amount,int p_check) {
		this.r_no = r_no;
		this.p_method = p_method;
		this.p_amount = p_amount;
		this.p_check = p_check;
	}

}
