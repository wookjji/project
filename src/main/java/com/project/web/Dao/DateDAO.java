package com.project.web.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.web.Dto.DateDTO;

@Repository
public class DateDAO {

	@Autowired
	private SqlSession session;
	
	public List<DateDTO> dateList() {
		
		return session.selectList("date.list");
	}

	public void peakUpdate(DateDTO dateDTO) {
		session.update("date.peak", dateDTO);
		
	}

	public void hpeakUpdate(DateDTO dateDTO) {
		session.update("date.hpeak", dateDTO);
		
	}

}
