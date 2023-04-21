package com.project.web.Controller;




import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.web.Dto.CancelDTO;
import com.project.web.Dto.CardCancleDTO;
import com.project.web.Dto.PayaccountDTO;
import com.project.web.Dto.ReservationDTO;
import com.project.web.Dto.SiteinfoDTO;
import com.project.web.Dto.datetypeDTO;
import com.project.web.Dto.siteDTO;
import com.project.web.Service.ReservationService;
import com.project.web.util.CreativeNum;





@Controller
public class ReservationController {
			
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private CreativeNum create;
	
	@Autowired
	private SqlSession sqlSession;
		
		@PostMapping("/reservation_end")
		public String reservation(HttpServletRequest request) {
//예약정보 가져오기
			String si_type = request.getParameter("si_type");	
			String r_name = request.getParameter("name2");
			String r_tel = request.getParameter("tel");
			String r_in = request.getParameter("start2");
			String r_out = request.getParameter("end2");
			int r_count = Integer.parseInt(request.getParameter("per_num"));
			int s_no = Integer.parseInt(request.getParameter("s_no"));
//			카드정보
			String In_per = request.getParameter("installment_period");
			String card_come = request.getParameter("card_company");
			String card_num = request.getParameter("card_num"); 
//결제정보
			String p_method =request.getParameter("method_check");			
			int p_amount =Integer.parseInt(request.getParameter("sum"));
			int p_check =Integer.parseInt(request.getParameter("p_check"));
			
//예약번호를 생성하는 메서드
			String r_no = create.reservationNum(r_tel,r_in,r_out);
			String comment;
			if(p_check==1) {
				comment=r_name+"님 아이고캠핑 \n예약완료 문자입니다"
						+"\n예약번호 :"+r_no
						+"감사합니다.";
//						
//						+"\n예약인원 :"+r_count+"명"
//						+"\n입실일~퇴실일 :"+r_in+"~"+r_out
//						+"\n결제최종금액 :"+p_amount;
			}
			else {
				comment =r_name+"님 아이고캠핑 \n예약완료 문자입니다"
						+"\n예약번호:"+r_no
//						+"\n사이트종류/사이트번호:"+si_type+"/"+s_no
//						+"\n예약인원:"+r_count+"명"
//						+"\n입실일~퇴실일"
//						+"\n"+r_in+"~"+r_out
//						+"\n결제최종금액:"+p_amount+"원"
						+"\n신한 01230450103 장욱재";
						
			}
//예약정보 생성자
			
			ReservationDTO dto = new ReservationDTO(r_name,r_tel,r_in,r_out,r_no,r_count,s_no);
			PayaccountDTO pdto = new PayaccountDTO(r_no,p_method,p_amount,p_check);
	
			reservationService.reservation(dto);
			reservationService.account(pdto);
//문자보내는 클래스
			message m1 = new message();
			m1.sendSMS(r_tel,comment);		
			return "redirect:/";
		}
		
//예약취소 매핑
		@GetMapping("/cancel")
		public String cancel() {
			return "cancel";
		}
		@PostMapping("/cancel")
		public String cancel(HttpServletRequest request) {
			String ref_name = request.getParameter("a_name");
			String ref_bank = request.getParameter("a_bank");
			String ref_number = request.getParameter("a_number");
			String r_no = request.getParameter("r_no");
			String ref_money = request.getParameter("money");
			int ref_check;
			String err=null;
			
			String pay_type =reservationService.paym(r_no);
//결제방식이 카드라면
			if(pay_type.equals("카드")) {
				ref_check = 1;
				CardCancleDTO cdto = new CardCancleDTO(r_no);
	
				try{
					reservationService.cardcancel(cdto);
					return "redirect:/";
				}catch(Exception e) {
					err="cancel";
					return "redirect:/?err="+err;
				}
//결제방식이 무통장이라면
				}else {
				ref_check = 0;
				CancelDTO dto = new CancelDTO(ref_name,ref_bank,ref_number,r_no,ref_check);
				System.out.println(ref_check);
				try{
					reservationService.cancel(dto);
					return "redirect:/";
				}catch(Exception e) {
					err="cancel";
					return "redirect:/?err="+err;
				}
			}
		}
//예약정보확인을 위해 예약정보를 가져오는 매핑
		@PostMapping("/checkok")
		public ModelAndView checkok(HttpServletRequest requset) {
			
			ModelAndView mv = new ModelAndView("check");
			String r_no=requset.getParameter("r_no");
			ReservationDTO r_List = null;
			r_List=reservationService.r_List(r_no);
			mv.addObject("r_List",r_List);
			return mv;
		}
		@GetMapping("/check")
		public String check() {
			return"redirect:/";
		}
//예약번호가 있는지 확인하는 매핑 	
		@ResponseBody
		@PostMapping(value = "/check",produces = "application/json;charset=UTF-8")
		public String check(HttpServletRequest request) {
			String r_no =request.getParameter("r_no");
			String check = reservationService.cancel_check(r_no);
			
			if(check == null) {
				int result = reservationService.cheak(r_no);
				System.out.println(result);
				return result+"";	
			}else {
				return "2";
			}
		
		}
//예약하는 매핑
		@GetMapping("/reservation")
		public ModelAndView room_test() {
			ModelAndView mv = new ModelAndView("reservation");	
//예약정보불러오기
			List<siteDTO> site = sqlSession.selectList("reservation.siteno_all");
			List<SiteinfoDTO> site_info = sqlSession.selectList("reservation.site_all");
			List<datetypeDTO> price_data=sqlSession.selectList("reservation.search_price");
//사이트 정보	
			JSONObject site_json = new JSONObject();
			JSONArray array = new JSONArray(site);	
			site_json.put("site", array);
			mv.addObject("site", site_json.toString());
//사이트 예약금액 정보
			array = new JSONArray(site_info);
			JSONObject site_info_json = new JSONObject();
			site_info_json.put("site_info", array);
			mv.addObject("site_info", site_info_json.toString());
//사이트 성수기 정보
			JSONObject date_json = new JSONObject();
			array = new JSONArray(price_data);
			date_json.put("peak_date",array);
			mv.addObject("peak_date", date_json);
			return mv;
		}
//예약가능한 사이트띄우는 매핑
		@ResponseBody
		@PostMapping(value = "/reservation",produces = "application/json;charset=UTF-8")
		public String search_room(HttpServletRequest req) {
			HashMap<String,String> reservation_date= new HashMap<>();
			reservation_date.put("start",req.getParameter("start"));
			reservation_date.put("end",req.getParameter("end"));
			List<Integer> reservation=sqlSession.selectList("reservation.search_s_no", reservation_date);
			JSONObject json = new JSONObject();
			JSONArray reservation_json = new JSONArray(reservation);
			json.put("reservation",reservation_json);
			return json.toString();
		}

}
