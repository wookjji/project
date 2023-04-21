package com.project.web.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.web.Dto.DateDTO;
import com.project.web.Dto.PriceDTO;
import com.project.web.Dto.SiteInDTO;
import com.project.web.Service.DateService;
import com.project.web.Service.PriceService;
import com.project.web.Service.SiteInfoService;

@Controller
public class SiteInfoController {
	@Autowired
	private SiteInfoService siteinfoService;
	@Autowired
	private PriceService priceService;
	@Autowired
	private DateService dateService;
	
	@GetMapping("/siteinfo")
	public ModelAndView SiteInfo(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("id") == null) {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("login");
			mv.addObject("error", "잘못된 접근입니다.");
			return mv;
		} else {
		ModelAndView mv = new ModelAndView("siteinfo");
		List<SiteInDTO> list = siteinfoService.siteList();
		List<PriceDTO> list1 = priceService.priceList();
		List<DateDTO> datelist = dateService.dateList();
		mv.addObject("list", list);
		mv.addObject("pricelist", list1);
		mv.addObject("datelist", datelist);
		return mv;
		}
	}
	
	@PostMapping("/siteinfo")
	public String Change(HttpServletRequest request) {
		SiteInDTO sinfoDTO = new SiteInDTO();
		sinfoDTO.setSi_type(request.getParameter("chtype"));
		sinfoDTO.setSi_limit(Integer.parseInt(request.getParameter("chlimit")));
		
		siteinfoService.change(sinfoDTO);
		
		return "redirect:/siteinfo";
	}
	
	@PostMapping("/lock")
	@ResponseBody
	public String Lock(@RequestParam("type") String type, @RequestParam("num") int num) {
		SiteInDTO sinfoDTO = new SiteInDTO();
		sinfoDTO.setSi_type(type);
		sinfoDTO.setS_num(num);
		siteinfoService.lock(sinfoDTO);
		int result = siteinfoService.confirm(sinfoDTO);
		return String.valueOf(result);
	}
	@PostMapping("/select")
	@ResponseBody
	public String Select(@RequestParam("type") String type, @RequestParam("num") int num) {
		SiteInDTO sinfDTO = new SiteInDTO();
		sinfDTO.setSi_type(type);
		sinfDTO.setS_num(num);
		int result = siteinfoService.confirm(sinfDTO);
		
		return String.valueOf(result);
	}
}








