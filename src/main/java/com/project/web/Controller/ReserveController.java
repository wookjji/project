package com.project.web.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.web.Dto.ReserveDTO;
import com.project.web.Dto.siteDTO;
import com.project.web.Service.ReserveService;


@Controller
public class ReserveController {
	@Autowired
	private ReserveService reserveService;
	@Autowired
	private SqlSession sqlSession;
	
	
	@GetMapping("/reserve")	
	public ModelAndView today(HttpServletRequest req) {
		HttpSession session = req.getSession();
		if(session.getAttribute("id") == null) {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("login");
			mv.addObject("error", "잘못된 접근입니다.");
			return mv;
		}else {
			ModelAndView mv = new ModelAndView("reserve");

			List<ReserveDTO> reser=null;
			String start_s;
			String end_s;
			HashMap<String,Object> filter=reserveService.search(req.getParameter("s_date"),req.getParameter("search"));
			start_s=(String) filter.get("start");
			end_s=(String) filter.get("end");
			List<siteDTO> site = sqlSession.selectList("reserve.test2");
			reser=sqlSession.selectList("reserve.test",filter);
			for(int i=0;i<site.size();i++) {
				for(int j=0;j<reser.size();j++) {
					if(site.get(i).getS_no()==reser.get(j).getS_no()) {
						//반복문이 몇번 나온느지?
						site.get(i).plusstart(reser.get(j).getR_in());
						site.get(i).plusend(reser.get(j).getR_out());
						site.get(i).plusn(reser.get(j).getR_no());
						reser.remove(j);
						j=j-1;
					}
					else {
						break;
					}
				}
			}
			String month = start_s.substring(0,7);
			JSONObject json = new JSONObject();
			JSONArray array = new JSONArray(site);
			json.put("site",array);
			mv.addObject("month",month);
			mv.addObject("start", start_s);
			mv.addObject("end", end_s);
			if(req.getParameter("s_date")==null) {
				mv.addObject("num", 0);
			}
			else {
				mv.addObject("num", req.getParameter("s_date"));		
			}
		
			mv.addObject("json", json);
			mv.addObject("standard", req.getParameter("search"));
			return mv;

		}
	}
	
	@ResponseBody
	@PostMapping(value = "/modal",produces = "application/json;charset=UTF-8")
	public String modal(HttpServletRequest req) {
		String rno=req.getParameter("rno");
		System.out.println(rno);
		Map<String,Object> ob= new HashMap<>();
		ob=sqlSession.selectOne("reserve.test3",rno);
		JSONObject json = new JSONObject();
		json.put("json", ob);
		return json.toString();
		
	}
	
	
	
}
