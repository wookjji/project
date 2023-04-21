package com.project.web.Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.web.Dto.QnaDTO;

@Repository
public class QnaDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public QnaDTO detail(int rownumber) {
		return sqlSession.selectOne("qna.detail", rownumber);
	}
}
