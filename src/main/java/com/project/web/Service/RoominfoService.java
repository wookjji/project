package com.project.web.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import com.project.web.Dao.RoominfoDAO;
import com.project.web.Dto.ImageDTO;
import com.project.web.Dto.RoominfoDTO;


@Service
public class RoominfoService {

		@Autowired
		private RoominfoDAO roominfoDAO;


		public List<RoominfoDTO> boardList() {

			return roominfoDAO.boardList();
		}


		public void roominfowrite(RoominfoDTO roominfoDTO) {
			roominfoDAO.roominfowrite(roominfoDTO);
			
		}


		public List<RoominfoDTO> si_siteName() {
			return roominfoDAO.si_siteName();
		}


		public void fileSave(RoominfoDTO roominfoDTO) {
			roominfoDAO.fileSave(roominfoDTO);		
		}


		public RoominfoDTO detail(String si_type) {
			return roominfoDAO.detail(si_type);
		}


}

