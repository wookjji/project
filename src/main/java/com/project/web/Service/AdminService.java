package com.project.web.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.web.Dao.AdminDAO;
import com.project.web.Dto.StateDTO;


@Service
public class AdminService {
	
	@Autowired
	private AdminDAO adminDAO;

	public List<StateDTO> stateList(int number) {
		
		return adminDAO.stateList(number);
	}

	public void permit(StateDTO stateDTO) {
		adminDAO.permit(stateDTO);
		
	}

	public int result(StateDTO stateDTO) {
		
		return adminDAO.result(stateDTO);
	}

	


	

}
