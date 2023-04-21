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
import org.springframework.web.servlet.ModelAndView;

import com.project.web.Dto.NoticeDTO;
import com.project.web.Service.NoticeService;

@Controller
public class NoticeController {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private NoticeService noticeService;
	
	// 공지사항 메인 페이지 불러오기
	@GetMapping("/notice")
	public ModelAndView getnotice() {
		ModelAndView mv = new ModelAndView("notice");	
		int board_div=15;
		int page_div=5;
		int page_number=1, screen_number=1;
		int board_num=sqlSession.selectOne("notice.notice_all");  
		List<HashMap<String,Object>> noticelist=sqlSession.selectList("notice.notice_init"); 
		int all_page_number=((board_num-1)/board_div)+1;
		for(int i=0;i<noticelist.size();i++) {
			noticelist.get(i).put("no", board_num-((page_number-1)*board_div)-i);
		}
		int max_screen_number=((all_page_number-1)/page_div)+1;	
		int last_page,start_page;
		if(screen_number<max_screen_number) { 
			start_page=((screen_number-1)*5)+1;
			last_page=screen_number*page_div;  
		}
		else {  
			last_page=all_page_number;  
			start_page=((screen_number-1)*5)+1;
		}
		int check=0; 
		if(screen_number!=1 && screen_number<max_screen_number) { 
			check=1; 
		}
		else if(screen_number==max_screen_number && max_screen_number!=1) {
			check=2;	 
		}
		else if(screen_number==1) {  
			check = max_screen_number > screen_number ? 0 : -1; 
		}
		mv.addObject("check",check);  
		mv.addObject("page_number",page_number); 
		mv.addObject("screen_number",screen_number); 
		mv.addObject("start",start_page); 
		mv.addObject("end",last_page);  
		mv.addObject("noticelist", noticelist);
		return mv;
	}
	
	// 글쓰기 화면 불러오기
	@GetMapping("/n_write")
	public String n_write() {
		return "n_write";
	}
		
		
	// 작성글 저장하기
	@PostMapping("/n_write")
	public String n_write(HttpServletRequest request) {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Map<String, String> notice = new HashMap<>();
		notice.put("title", title);
		notice.put("content", content);
		Integer success = sqlSession.insert("notice.write", notice);
		return "redirect:/notice";
	}
		
	// 작성한 글 불러오기
	@GetMapping("/n_detail")
	public ModelAndView n_detail(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView("n_detail");
		int rownumber = Integer.parseInt(req.getParameter("rownumber"));
		NoticeDTO detail = noticeService.detail(rownumber);
		sqlSession.update("notice.hitcheck",rownumber);
		mv.addObject("detail", detail);
		return mv;
	}
	
	// 페이징 
	@PostMapping("/notice")
	public ModelAndView log(HttpServletRequest requset) {
		ModelAndView mv = new ModelAndView("notice");	
		HashMap<String,Object> number= new HashMap<>();	
		String page=requset.getParameter("page_number"); 	
		String screen=requset.getParameter("screen_number");  
		String search=requset.getParameter("search"); 	 
		String sort=requset.getParameter("sort");  
		int board_div=15;
		int page_div=5; 
		int page_number, screen_number, board_num;   
		if(page==null || screen==null) {
			page_number=1;	 
			screen_number=1; 		
		}
		else {  
			page_number=Integer.parseInt(page);	 
			screen_number=Integer.parseInt(screen);
		}
		if(search!="" && sort!="") {
			number.put("sort",sort);
			number.put("search",search);
		}
		else {
			number.put("sort",null);
			number.put("search",null);
		}
		board_num=sqlSession.selectOne("notice.notice_count",number);  
		number.put("no", (page_number-1)*board_div);  
		number.put("board_num",board_div); 
		List<HashMap<String,Object>> noticelist=sqlSession.selectList("notice.notice_search",number);
		int all_page_number=((board_num-1)/board_div)+1;  
		for(int i=0;i<noticelist.size();i++) {
			noticelist.get(i).put("no", board_num-((page_number-1)*board_div)-i);
		}
		int max_screen_number=((all_page_number-1)/page_div)+1;		 
		int last_page,start_page;
		if(screen_number<max_screen_number) { 
			start_page=((screen_number-1)*5)+1;
			last_page=screen_number*page_div;   
			
		}
		else {  
			last_page=all_page_number;  
			start_page=((screen_number-1)*5)+1;
		}
		 
		int check=0; 
		if(screen_number!=1 && screen_number<max_screen_number) { 
			check=1; 
		}
		else if(screen_number==max_screen_number && max_screen_number!=1) {
			check=2;	 
		}
		else if(screen_number==1) { 
			check = max_screen_number > screen_number ? 0 : -1; 
		}
		mv.addObject("sort",sort);
		mv.addObject("search",search);
		mv.addObject("check",check); 
		mv.addObject("page_number",page_number);  
		mv.addObject("screen_number",screen_number);  
		mv.addObject("start",start_page);  
		mv.addObject("end",last_page); 
		mv.addObject("noticelist", noticelist); 
		return mv;
	}
	
	// 작성글 수정하기 페이지 불러오기 
	@GetMapping("/n_modify")
	public String modify() {
		return "n_modify";
	}
	
	// 작성글 수정
	@PostMapping("/modify")
	public ModelAndView noticeMod(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("n_modify");
		int rownumber = Integer.parseInt(request.getParameter("rownumber"));
		NoticeDTO detail = noticeService.detail(rownumber);
		mv.addObject("detail", detail);
		return mv;
	}

	
	// 수정한 글 저장하기
	@PostMapping("/n_modify")
	public String modify_save(HttpServletRequest req) { 
		int n_no = Integer.parseInt(req.getParameter("rownumber"));
		String title =req.getParameter("title");
		String content = req.getParameter("content");
		Map<String, Object> modSave = new HashMap<>();
		modSave.put("rownumber", n_no);
		modSave.put("title", title);
		modSave.put("content", content);
		sqlSession.update("notice.modify", modSave);
		return "redirect:/notice";
	}
	
	// 작성글 삭제하기
	@PostMapping("/noticeDel")
	public String noticeDel(HttpServletRequest req) {
		String num = req.getParameter("rownumber");
		int n_no = Integer.parseInt(num);
		Map<String, Object> Del = new HashMap<>();
		Del.put("rownumber", n_no);
		sqlSession.delete("notice.delete", Del);
		return "redirect:/notice";
	}

	
	
	// 관리자 로그인 페이지
	@GetMapping("/adminlogin")
	public String login() {
		return "adminlogin";
	}
	
	// 관리자 로그인
	@PostMapping("/adminlogin")
	public String adminlogin(HttpServletRequest request, HttpSession session) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		Map<String, String> log = new HashMap<>();
		log.put("id", id);
		log.put("pw", pw);
		log = sqlSession.selectOne("notice.login", log);
		if (log.get("id").equals(id) && log.get("pw").equals(pw)) {
			session.setAttribute("id", id);
			return "redirect:/home";
		} else {
			return "adminlogin";
		}
	}
	
	// 메인 홈페이지 
	@GetMapping("/home")
	public String home() {
		return "home";
	}
	
}
