package com.project.web.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.web.Dto.SiteInDTO;

@Repository
public class SiteInfoDAO {
	@Autowired
	private SqlSession session;
	
	public List<SiteInDTO> siteList() {
		
		return session.selectList("info.list");
	}

	public void change(SiteInDTO sinfoDTO) {
		session.update("info.change", sinfoDTO);
		
	}
	public void lock(SiteInDTO sinfoDTO) {
		session.update("info.lock", sinfoDTO);
	}

	public int confirm(SiteInDTO sinfoDTO) {
		
		return session.selectOne("info.confirm", sinfoDTO);
	}


}
