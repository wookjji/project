package com.project.web.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.web.Dto.StateDTO;
import com.project.web.Service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private SqlSession sqlSession;
	
	@GetMapping("/admin")
	public String Admin(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("id") != null) {
			return "admin";			
		}else {
			return "redirect:/login?error";
		}
	}
	
//	@GetMapping("/state")
//	public ModelAndView State(HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		if(session.getId() != null) {
//		ModelAndView mv = new ModelAndView("state");
//		List<StateDTO> list = adminService.stateList();
//		mv.addObject("list", list);
//		return mv;
//		}else {
//			ModelAndView mv = new ModelAndView();
//			mv.setViewName("login");
//			mv.addObject("error", "잘못된 접근입니다.");
//			return mv;
//		}
//	}
	
	@PostMapping("/permit")
	@ResponseBody
	public String permit(@RequestParam("rno") String rno, @RequestParam("num") String num, @RequestParam("name") String name) {
		StateDTO stateDTO = new StateDTO();
		stateDTO.setR_no(rno);
		adminService.permit(stateDTO);
		int result = adminService.result(stateDTO);
		System.out.println(result);
		message message = new message();
		String content = name+"님의 예약이 정상적으로 승인되었습니다.";
		message.sendSMS(num, content);
		return String.valueOf(result);
	}
	
	// 페이징  
	@PostMapping("/state")
	public ModelAndView log(HttpServletRequest requset) {
		HttpSession session = requset.getSession();
		if(session.getId() == null) {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("login");
			mv.addObject("error", "잘못된 접근입니다.");
			return mv;
	
		}else {
		ModelAndView mv = new ModelAndView("state");
		
		int board_div=15;	//한페이지당 들어가는 글의 갯수
		int page_div=5; 	// 나누려는 페이지의 갯수
		int page_number, screen_number, board_num; 	//현재 페이지 번호, 현재 페이지의 전체 번호, 조건에 맞는 글의총 갯수  
		//다른 페이지에서 진입할떄 값 잡아주기
		
		String page=requset.getParameter("page_number"); 	//현재 페이지의 번호
		String screen=requset.getParameter("screen_number"); 	//페이지 전체의 갯수 
		if(page==null || screen==null) {
			page_number=1;	//현재 페이지 번호 
			screen_number=1; 	//페이지의전체번호 		
		}
		else { //null 값이 아닌경우 
			page_number=Integer.parseInt(page);	//현제 페이지 번호 
			screen_number=Integer.parseInt(screen);
			//어떤검색이 되었을때
		}
		board_num=sqlSession.selectOne("state.state_count"); //게시글 총  selectOne이 사용된 이유는 한열만 가져올 거라서 
		List<StateDTO> list = adminService.stateList((page_number-1)*board_div);	 //게시글수 (10개씩만 불러옴0)
		int all_page_number=((board_num-1)/board_div)+1;//게시글이 10개 있는경우   총 페이지 숫자 1  11개있는경우 2  
		for(int i=0;i<list.size();i++) {
			list.get(i).setNo(board_num-((page_number-1)*board_div)-i);
		}//총갯수 -((현재 페이지 번호-1)*페이지당 글갯수)-현재 페이지의 글번호 해당 페이지당 글 숫자 출력
		// Ex 300개의 조건 1페이지의 경우  ((0)*10)-0,1,2,3,4,5,6,7,8,9
		// Ex 300개의 조건 2페이지의 경우 ((1)*10)-0,1,2,3,4,5,7,8,9 
		//딱 나눠지는곳에서 숫자 올라감 방지를 위해서 -1 
		int max_screen_number=((all_page_number-1)/page_div)+1;		// 총 페이지의 페이지  넘버  =(페이지의 총 갯수 / 나누려는 페이지의 갯수)+1 
		//Ex 10페이지 가있는경우엔 1페이지 가 나와야함 (11페이지-1)+1 총 페이지 넘버 2
		//ex 1페이지의 경우에는 1만 
		//현재 페이지가  같은경우 (마지막 페이지임 이놈의 페이지숫자 page_number 는 최대값  기본으로 설정된 값임 )
		//현재 페이지의 페이지가 총 페이지의 페이지  넘버보다 작은경우에는 나누려는 페이지의 갯수 만큼 보여줘야하기떄문에 
		// 1~10 | 11 ~20  | 21 ~23    maxpage 3인경우 
		//ex bigpage_no =1(현재페이지) maxpage 3인경우  (1~10) 출력  
		//편의성을 위해 시작 페이지와 끝페이지 제작 (원래 제작할필요없이 그냥 해도됨)
		int last_page,start_page;
		if(screen_number<max_screen_number) {//마지막이 아닌경우 bigpage_no =1(현재페이지) maxpage 3인경우 
			start_page=((screen_number-1)*5)+1;
			last_page=screen_number*page_div; // 1~10  11~20 까지인경우  
			
		}
		else { //마지막이 아닌경우 bigpage_no =3(현재페이지) maxpage 3인경우  21페이지부터 
			last_page=all_page_number; // 1~7 인경우 
			start_page=((screen_number-1)*5)+1;
		}
		//앞으로가기 뒤로가기 버튼 만들어주기 
		int check=0;//위에있는 조건문과 합쳐도 되나 가시성을 위해 따로작성 
		if(screen_number!=1 && screen_number<max_screen_number) {  //페이지의 중간 에있을떄 (뒤로가기 ,앞으로 가기버튼 모두있을떄)
			check=1; 
		}
		else if(screen_number==max_screen_number && max_screen_number!=1) {
			check=2;	//최대 페이지가 1페이지가 아니면서 끝인경우(뒤로가기버튼만 있는경우) 
		}
		else if(screen_number==1) { // 0번의 경우에는 앞으로 가기버튼만있는경우 ,-1번의 경우에는 아무버튼도 존재하지않음 
			check = max_screen_number > screen_number ? 0 : -1; 
		}
		mv.addObject("check",check); //앞으로가기 뒤로가기버튼 
		mv.addObject("page_number",page_number); //현재 페이지번호 
		mv.addObject("screen_number",screen_number); //현재 페이지의 페이지 번호 
		mv.addObject("start",start_page); //페이지 시작번호 
		mv.addObject("end",last_page); //페이지 끝번호 
		mv.addObject("list", list);
		return mv;
		}
	}
	
}
