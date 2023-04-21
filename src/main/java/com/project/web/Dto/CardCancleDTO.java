package com.project.web.Dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CardCancleDTO {
	private String r_no;
	
	public CardCancleDTO() {}
	public CardCancleDTO(String r_no) {
	this.r_no = r_no;
	}
}
