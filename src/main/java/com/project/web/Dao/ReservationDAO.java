package com.project.web.Dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.web.Dto.CancelDTO;
import com.project.web.Dto.CardCancleDTO;
import com.project.web.Dto.PayaccountDTO;
import com.project.web.Dto.ReservationDTO;
import com.project.web.Dto.SiteinfoDTO;



@Repository
public class ReservationDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	public int reservation (ReservationDTO dto) {
		return sqlSession.insert("reservation.reser", dto);
	}

	public int cancel(CancelDTO dto) {
		return sqlSession.insert("reservation.cancel", dto);
	}

	public int check(String r_no) {
		return sqlSession.selectOne("reservation.check",r_no);
	}

	public ReservationDTO r_List(String r_no) {
		return sqlSession.selectOne("reservation.r_List",r_no);
	}

	public List<SiteinfoDTO> site_t() {

		return sqlSession.selectList("reservation.site_t");
	}
	public List<SiteinfoDTO> site_List() {

		return sqlSession.selectList("reservation.site_List");
	}
	public List<HashMap<String,Object>> limit(int p_num) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reservation.limit",p_num);
	}

	public List<HashMap<String,Integer>> r_inout(Map<String,String> inout) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reservation.r_inout",inout);
	}

	public List<HashMap<String, String>> all() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("reservation.all");
	}

	public int account(PayaccountDTO dto) {
		return sqlSession.insert("reservation.account",dto);
	}

	public PayaccountDTO pay(String r_no) {
		return sqlSession.selectOne("reservation",r_no);
	}

	public String paym(String r_no) {
		return sqlSession.selectOne("reservation.pay_select",r_no);
	}

	public void cardcancel(CardCancleDTO cdto) {
		sqlSession.insert("reservation.CardCancel",cdto);
	}

	public String cancel_check(String r_no) {
		return sqlSession.selectOne("reservation.cancel_check",r_no);
	}



}
