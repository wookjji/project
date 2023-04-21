package com.project.web.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.web.Dao.QnaDAO;
import com.project.web.Dto.QnaDTO;

@Service
public class QnaService {

	@Autowired
	private QnaDAO qnaDAO;
	
	public QnaDTO detail(int rownumber) {
		return qnaDAO.detail(rownumber);
	}
}
