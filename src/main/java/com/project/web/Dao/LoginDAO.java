package com.project.web.Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.web.Dto.LoginDTO;

@Repository
public class LoginDAO {
	
	@Autowired
	private SqlSession session;

	public LoginDTO login(LoginDTO idDTO) {

		return session.selectOne("login.login", idDTO);
	}
	
}
