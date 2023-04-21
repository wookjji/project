package com.project.web.Dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CancelDTO {
	private String ref_name, ref_bank, ref_number,r_no;
	private int ref_check;
	
	public CancelDTO() {}
	public CancelDTO(String ref_name, String ref_bank, String ref_number,String r_no,int ref_check) {
		this.ref_bank = ref_bank;
		this.ref_name = ref_name;
		this.ref_number = ref_number;
		this.r_no =r_no;
		this.ref_check=ref_check;
		
		
	}
}
