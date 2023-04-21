package com.project.web.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.web.Dto.PriceDTO;

@Repository
public class PriceDAO {

	@Autowired
	private SqlSession session;
	
	public List<PriceDTO> priceList() {
		
		return session.selectList("price.list");
	}

	public void priceChange(PriceDTO priceDTO) {
		session.update("price.change", priceDTO);
		
	}

}
