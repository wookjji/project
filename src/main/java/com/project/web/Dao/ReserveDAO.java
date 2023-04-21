package com.project.web.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.web.Dto.ReserveDTO;

@Repository
public class ReserveDAO {

	@Autowired
	private SqlSession session;
	
	public List<ReserveDTO> reservationlist() {
		
		
		return session.selectList("reservaion.reservationlist");
	}

}
