package com.project.web.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.web.Dto.PriceDTO;
import com.project.web.Service.PriceService;

@Controller
public class PriceController {
	
	@Autowired
	private PriceService priceService;
	
	@PostMapping("/price")
	public String PriceChange(HttpServletRequest request) {
		PriceDTO priceDTO = new PriceDTO();
		priceDTO.setSi_type(request.getParameter("type"));
		priceDTO.setSi_price(Integer.parseInt(request.getParameter("price")));
		priceDTO.setSi_pfs(Integer.parseInt(request.getParameter("pfs")));
		priceDTO.setSi_pwe(Integer.parseInt(request.getParameter("pwe")));
		priceDTO.setSi_hfs(Integer.parseInt(request.getParameter("hfs")));
		priceDTO.setSi_hwe(Integer.parseInt(request.getParameter("hwe")));
		priceDTO.setSi_lfs(Integer.parseInt(request.getParameter("lfs")));
		
		priceService.priceChange(priceDTO);
		
		return "redirect:/siteinfo";
	}
	
}
