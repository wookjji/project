package com.project.web.Service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.web.Dao.ReservationDAO;
import com.project.web.Dto.CancelDTO;
import com.project.web.Dto.CardCancleDTO;
import com.project.web.Dto.PayaccountDTO;
import com.project.web.Dto.ReservationDTO;
import com.project.web.Dto.SiteinfoDTO;



@Service
public class ReservationService {
	
	@Autowired
	private ReservationDAO reservationdao;
	
	public int reservation(ReservationDTO dto) {
		return reservationdao.reservation(dto);
	}
	public int cancel(CancelDTO dto) {
		return reservationdao.cancel(dto);
	}
	public int cheak(String r_no) {
		return reservationdao.check(r_no);	
}
	public ReservationDTO r_List(String r_List){
		return reservationdao.r_List(r_List);
	}
	public List<SiteinfoDTO> site_t() {
		return reservationdao.site_t();
	}
	public List<SiteinfoDTO> site_List() {
		return reservationdao.site_List();
	}
	public List<HashMap<String,Object>> limt(int p_num) {
		return reservationdao.limit(p_num);
	}
	
	public List<HashMap<String,Integer>> r_inout(Map<String,String> inout) {
		return reservationdao.r_inout(inout);
	}
	public List<HashMap<String, String>> all() {
		// TODO Auto-generated method stub
		return reservationdao.all();
	}
	public int account(PayaccountDTO dto) {
		return reservationdao.account(dto);
		
	}
	public String paym(String r_no) {	
		return reservationdao.paym(r_no);
	}
	public void cardcancel(CardCancleDTO cdto) {
		reservationdao.cardcancel(cdto);
	}
	public String cancel_check(String r_no) {
		return reservationdao.cancel_check(r_no);
		
	}



}
