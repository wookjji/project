package com.project.web.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.web.Dto.DateDTO;
import com.project.web.Service.DateService;

@Controller
public class DateController {
	@Autowired
	private DateService dateService;
	
	@PostMapping("/peak")
	public String Peak(HttpServletRequest request) {
		DateDTO dateDTO = new DateDTO();
		dateDTO.setStart_date(request.getParameter("start"));
		dateDTO.setEnd_date(request.getParameter("end"));
		dateService.peakUpdate(dateDTO);
		
		return "redirect:/siteinfo";
	}
	
	@PostMapping("/hpeak")
	public String Hpeak(HttpServletRequest request) {
		DateDTO dateDTO = new DateDTO();
		dateDTO.setStart_date(request.getParameter("start"));
		dateDTO.setEnd_date(request.getParameter("end"));
		dateService.hpeakUpdate(dateDTO);
		
		return "redirect:/siteinfo";
	}
}
