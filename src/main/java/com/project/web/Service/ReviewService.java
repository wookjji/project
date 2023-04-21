package com.project.web.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.web.Dao.ReviewDAO;
import com.project.web.Dto.ReviewDTO;

@Service
public class ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;
	
	public ReviewDTO detail(int rownumber) {
		return reviewDAO.detail(rownumber);
	}

	public void reviewWrite(ReviewDTO reviewDTO) {
		reviewDAO.reviewWrite(reviewDTO);
	}


	

	
	
}
