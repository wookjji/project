package com.project.web.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.web.Dao.PriceDAO;
import com.project.web.Dto.PriceDTO;

@Service
public class PriceService {

	@Autowired
	private PriceDAO priceDAO;
	
	public List<PriceDTO> priceList() {

		return priceDAO.priceList();
	}

	public void priceChange(PriceDTO priceDTO) {
		priceDAO.priceChange(priceDTO);
		
	}

}
