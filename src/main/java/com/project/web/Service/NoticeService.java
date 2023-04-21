package com.project.web.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.web.Dao.NoticeDAO;
import com.project.web.Dto.NoticeDTO;

@Service
public class NoticeService {
	@Autowired
	private NoticeDAO noticeDAO;
	

	public NoticeDTO detail(int rownumber) {
		return noticeDAO.detail(rownumber);
	}
	
	



	

	
	
}
