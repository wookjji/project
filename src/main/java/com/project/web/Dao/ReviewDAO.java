package com.project.web.Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.web.Dto.ReviewDTO;

@Repository
public class ReviewDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public ReviewDTO detail(int rownumber) {
		return sqlSession.selectOne("review.detail", rownumber);
	}

	public void reviewWrite(ReviewDTO reviewDTO) {
//		System.out.println("제목 : " +reviewDTO.getRv_title());
//		System.out.println("내용 : " +reviewDTO.getRv_content());
//		System.out.println("번호 : " +reviewDTO.getR_no());
//		System.out.println("1 : " +reviewDTO.getRv_photo1());
//		System.out.println("2 : " +reviewDTO.getRv_photo2());
//		System.out.println("3 : " +reviewDTO.getRv_photo3());
//		System.out.println("=======r구분============");
		sqlSession.insert("review.reviewSave", reviewDTO);
	}



	

	
}
