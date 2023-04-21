package com.project.web.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.web.Dto.StateDTO;

@Repository
public class AdminDAO{
	
	@Autowired
	private SqlSession session;

	public List<StateDTO> stateList(int number) {
		
		return session.selectList("state.list",number);
	}

	public void permit(StateDTO stateDTO) {
		session.update("state.permit", stateDTO);
		
	}

	public int result(StateDTO stateDTO) {
		
		return session.selectOne("state.result", stateDTO);
	}
	
	

}
