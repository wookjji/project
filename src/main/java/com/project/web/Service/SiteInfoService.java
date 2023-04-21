package com.project.web.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.web.Dao.SiteInfoDAO;
import com.project.web.Dto.SiteInDTO;

@Service
public class SiteInfoService {
	@Autowired
	private SiteInfoDAO siteinfoDAO;
	
	public List<SiteInDTO> siteList() {
		
		return siteinfoDAO.siteList();
	}

	public void change(SiteInDTO sinfoDTO) {
		
		siteinfoDAO.change(sinfoDTO);
	}

	public void lock(SiteInDTO sinfoDTO) {
		siteinfoDAO.lock(sinfoDTO);
		
	}

	public int confirm(SiteInDTO sinfoDTO) {
		
		return siteinfoDAO.confirm(sinfoDTO);
	}

}
