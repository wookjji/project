package com.project.web.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.web.Dao.DateDAO;
import com.project.web.Dto.DateDTO;

@Service
public class DateService {
	
	@Autowired
	private DateDAO dateDAO;
	
	public List<DateDTO> dateList() {
		
		return dateDAO.dateList();
	}

	public void peakUpdate(DateDTO dateDTO) {
		dateDAO.peakUpdate(dateDTO);
		
	}

	public void hpeakUpdate(DateDTO dateDTO) {
		dateDAO.hpeakUpdate(dateDTO);
		
	}

}
