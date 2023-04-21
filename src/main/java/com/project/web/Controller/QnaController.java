package com.project.web.Controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.web.Dto.QnaDTO;
import com.project.web.Service.QnaService;

@Controller
public class QnaController {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired 
	private QnaService qnaService;

	//Q&A 메인 페이지 불러오기 
	@GetMapping("/qna")
	public ModelAndView qna() {
		ModelAndView mv = new ModelAndView("qna");
		int board_div=15;
		int page_div=5;
		int page_number=1, screen_number=1;
		int board_num=sqlSession.selectOne("qna.qna_all");  
		List<HashMap<String,Object>> qlist=sqlSession.selectList("qna.qna_init");
		int all_page_number = ((board_num - 1) / board_div) + 1;
		for(int i=0; i<qlist.size(); i++) {
			qlist.get(i).put("rownumber", board_num - ((page_number - 1) * board_div) - i);
		}
		int max_screen_number = ((all_page_number - 1) / page_div) + 1;
		int last_page, start_page;
		if(screen_number<max_screen_number) {
			start_page = ((screen_number - 1) / page_div) + 1;
			last_page = screen_number * page_div;
		}
		else {
			last_page = all_page_number;
			start_page = ((screen_number - 1) * 5) + 1;
		}
		int check = 0;
		if(screen_number != 1 && screen_number < max_screen_number) {
			check = 1;
		}
		else if(screen_number == max_screen_number && max_screen_number != 1) {
			check = 2;
		}
		else if(screen_number == 1) {
			check = max_screen_number > screen_number ? 0 : -1;
		}
		mv.addObject("check", check);
		mv.addObject("page_number", page_number);
		mv.addObject("screen_number", screen_number);
		mv.addObject("start", start_page);
		mv.addObject("end", last_page);
		mv.addObject("qlist",qlist);
		return mv;
	}
	
	// Q&A 글쓰기 화면 불러오기 
	@GetMapping("/q_write")
	public String q_write() {
		return "q_write";
	}
	
	// Q&A 글 저장하기 
	@PostMapping("/q_write")
	public String qnaWrite(HttpServletRequest req) {
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String pw = req.getParameter("pw");
		Map<String, String> qna = new HashMap<>();
		qna.put("title", title);
		qna.put("content", content);
		qna.put("pw", pw);
		Integer qnaSuc = sqlSession.insert("qna.write", qna);
		return "redirect:/qna";
	}
	
	// 작성한 글 불러오기  
	@GetMapping("/q_detail")
	public ModelAndView q_detail(HttpSession session,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("q_detail");
		int rownumber;
		try {
			rownumber=Integer.parseInt(request.getParameter("rownumber"));
		}catch(Exception e) {
			rownumber=2;
		}
		QnaDTO detail = qnaService.detail(rownumber);
		mv.addObject("detail", detail);
		return mv;
	}
	
	// 글 수정하기 페이지 불러오기
	@GetMapping("/q_modify")
	public String modify() {
		return "q_modify";
	}
		
	// 수정하기 페이지에 데이터 출력되게 하기 
	@PostMapping("/q_modify/text")
	public ModelAndView q_write(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("q_modify");
		int q_no = Integer.parseInt(request.getParameter("no")); 
		Map<String,Object> qna = sqlSession.selectOne("qna.q_print",q_no);
		mv.addObject("qna", qna);
		return mv;
	} 
	
	// 글 수정하기 페이지로 넘기기 (비밀번호 받아서 불러오기 )
	@ResponseBody
	@PostMapping("/q_ajax")
	public String chk(HttpServletRequest request) {
		Map<String,Object> qna = new HashMap<>();
		String q_pw=request.getParameter("q_pw");
		String q_no=request.getParameter("q_no");
		qna.put("q_pw", q_pw);
		qna.put("q_no", q_no);
		String result=sqlSession.selectOne("qna.pw_check", qna);
		if(result!=null) {
			return "1";
		}else {
			return "0";
		}	
	}
	
	// detail페이지에 answer값 저장하기 
	@PostMapping("/reple")
	public String q_reqle(HttpServletRequest req) {
		String answer = req.getParameter("reple"); 
		String no = req.getParameter("q_no");
		System.out.println(answer);
		System.out.println(no);
		Map<String, Object> reple = new HashMap<>();
		reple.put("reple", answer);
		reple.put("q_no", Integer.parseInt(no));
		sqlSession.update("qna.rep_print", reple);
		return "redirect:/q_detail?rownumber="+no;
	}
	
	// qna 삭제하기
	@PostMapping("/qna_delete")
	public String qnaDel(HttpServletRequest request) {
		int q_no = Integer.parseInt(request.getParameter("qno"));
		Map<String, Object> delete = new HashMap<>();
		delete.put("qno", q_no);
		System.out.println(q_no);
		sqlSession.delete("qna.delete", delete);
		return "redirect:/qna";
	}
	
	// 수정글 저장하기
	@PostMapping("/q_detail")
	public String modSave(HttpServletRequest req) {
		int q_no = Integer.parseInt(req.getParameter("qno"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		Map<String, Object> modSave = new HashMap<>();
		modSave.put("qno", q_no);
		modSave.put("title", title);
		modSave.put("content", content);
		sqlSession.update("qna.modSave", modSave);
		return "redirect:/qna";
	}
	

	// 페이징 
	@PostMapping("/qna")
	public ModelAndView paging(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("qna");
		HashMap<String, Object> number = new HashMap<>();
		String page = request.getParameter("page_number");
		String screen = request.getParameter("screen_number");
		String search = request.getParameter("search");
		String sort = request.getParameter("sort");		
		int board_div = 15;
		int page_div = 5;
		int page_number, screen_number, board_num;
		if(page == null || screen == null) {
			page_number=1; 
			screen_number=1;
		}
		else {
			page_number = Integer.parseInt(page);
			screen_number = Integer.parseInt(screen);
		}
		if(search !="" && sort != "") {
			number.put("sort", sort);
			number.put("search", search);
		}
		else {
			number.put("sort", null);
			number.put("search", null);
		}
		board_num = sqlSession.selectOne("qna.qna_count", number);
		number.put("no", (page_number - 1) * board_div);
		number.put("board_num", board_div);
		List<HashMap<String, Object>> qnalist = sqlSession.selectList("qna.qna_search", number);
		int all_page_number = ((board_num - 1) / board_div) + 1;
		for(int i=0; i<qnalist.size(); i++) {
			qnalist.get(i).put("rownumber", board_num - ((page_number - 1) * board_div) - i);
		}
		int max_screen_number = ((all_page_number - 1) / page_div) + 1;
		int last_page, start_page;
		if(screen_number<max_screen_number) {
			start_page = ((screen_number - 1) * 5) + 1;
			last_page = screen_number * page_div;
		}
		else {
			last_page = all_page_number;
			start_page = ((screen_number - 1) * 5) +1;
		}
		int check = 0;
		if(screen_number != 1 && screen_number<max_screen_number) {
			check = 1;
		}
		else if(screen_number == max_screen_number && max_screen_number != 1) {
			check = 2;
		}
		else if(screen_number == 1) {
			check = max_screen_number > screen_number ?0 :-1 ;
		}
		mv.addObject("sort", sort);
		mv.addObject("search", search);
		mv.addObject("check", check);
		mv.addObject("page_number", page_number);
		mv.addObject("screen_number", screen_number);
		mv.addObject("start", start_page);
		mv.addObject("end", last_page);
		mv.addObject("qlist", qnalist);
		return mv;
	}
	
	
	
	
	
	
	
}
