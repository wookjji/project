package com.project.web.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.web.Dto.PriceDTO;
import com.project.web.Service.PriceService;

@Controller
public class ReinfoController {

	@Autowired
	PriceService priceService;
	
	@GetMapping("/reinfo")
	public ModelAndView ReInfo() {
		ModelAndView mv = new ModelAndView("./reinfo/reinfo");
		List<PriceDTO> list = priceService.priceList();
		mv.addObject("pricelist", list);
		return mv;
	}
}
