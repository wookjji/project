package com.project.web.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.web.Dao.LoginDAO;
import com.project.web.Dto.LoginDTO;

@Service
public class LoginService {
	
	@Autowired
	private LoginDAO loginDAO;

	public LoginDTO login(LoginDTO idDTO) {
		return loginDAO.login(idDTO);
	}
	
	
	
}
