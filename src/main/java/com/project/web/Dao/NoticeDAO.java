package com.project.web.Dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.web.Dto.NoticeDTO;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSession sqlSession;

	public NoticeDTO detail(int rownumber) {
		return sqlSession.selectOne("notice.detail", rownumber);
	}



	
	
}
