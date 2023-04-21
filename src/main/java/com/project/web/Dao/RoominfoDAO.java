 package com.project.web.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.web.Dto.ImageDTO;
import com.project.web.Dto.RoominfoDTO;

@Repository
public class RoominfoDAO {
	@Autowired
	private SqlSession sqlsession;
	
	public List<RoominfoDTO> boardList() {

		return sqlsession.selectList("board.selectBoardList");
	}

	public void roominfowrite(RoominfoDTO roominfoDTO) {
		sqlsession.update("board.write", roominfoDTO);
		
	}

	public List<RoominfoDTO> si_siteName() {
		return sqlsession.selectList("board.si_siteName");
	}

	public void fileSave(RoominfoDTO roominfoDTO) {
		sqlsession.insert("board.filesave", roominfoDTO);
		
	}

	public List<ImageDTO> img(String si_type) {
		return sqlsession.selectList("board.img", si_type);
	}

	public RoominfoDTO detail(String si_type) {
		return sqlsession.selectOne("board.detail", si_type);
	}

}
