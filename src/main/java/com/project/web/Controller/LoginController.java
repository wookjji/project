package com.project.web.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.web.Dto.LoginDTO;
import com.project.web.Service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@GetMapping("/login")
	public String Login() {
		
		return "login";
	}
	
	@PostMapping("/login")
	public String Login(HttpServletRequest request) {
		LoginDTO idDTO =  new LoginDTO();
		idDTO.setId(request.getParameter("id"));
		idDTO.setPw(request.getParameter("pw"));
		idDTO = loginService.login(idDTO);
		if(idDTO.getCount() == 0) {
			return "redirect:/login";
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("id", idDTO.getId());
			session.setAttribute("name", idDTO.getName());
		return "redirect:/admin";
		}
	}
	@GetMapping("/logout")
	public String Logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getId() != null) {
			session.invalidate(); 
		}
		return "redirect:/login";
	}
	
}
