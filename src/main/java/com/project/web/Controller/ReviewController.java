package com.project.web.Controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.web.Dto.ReviewDTO;
import com.project.web.Service.ReviewService;
import com.project.web.util.Util;

@Controller
public class ReviewController {
   
   @Autowired
   private Util util;
   
   @Autowired
   private SqlSession sqlSession;
   
   @Autowired
   private ReviewService reviewService;
   
   @Autowired
   private ServletContext context;
   
   
   // 이용후기 메인페이지 불러오기 
   @GetMapping("/review")
   public ModelAndView review(HttpSession session) {
      ModelAndView mv = new ModelAndView("review");
      int board_div = 15;
      int page_div = 5;
      int page_number = 1, screen_number = 1;
      int board_num = sqlSession.selectOne("review.review_all");
      List<Map<String, Object>> reviewlist;
      String chk=(String) session.getValue("id");
      if(chk==null) {
         reviewlist = sqlSession.selectList("review.review_init");
         //System.out.println("null"+chk);
      }
      else{
         reviewlist = sqlSession.selectList("review.admin_review_init");
         //System.out.println("not null"+chk);
      }

      int all_page_number = ((board_num - 1) / board_div) + 1;
      for(int i=0; i<reviewlist.size(); i++) {
         reviewlist.get(i).put("rownumber", board_num - ((page_number - 1) * board_div) - i);
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
      mv.addObject("reviewlist",reviewlist);
      return mv;
   }

   // 예약번호 확인하고 (글쓰기 페이지로 넘기기)
   @ResponseBody
   @PostMapping("/review_modal")   
   public String rnocheck(HttpServletRequest request) {
      String rno = request.getParameter("r_no");
      System.out.println(rno);
      Map<String, Object> rnocheck = sqlSession.selectOne("review.rno_check", rno);
      if(rnocheck !=  null) {
         Integer review_check = sqlSession.selectOne("review.review_check", rno);
         if(review_check==null){
            return "1";   
         }
         else {
            return "2";   
         }
      }else {
         System.out.println(rnocheck);
         return "0";
      }
   }
   
   // 이용후기 글쓰기 페이지 불러오기 
   @PostMapping("/r_write")
   public ModelAndView review_save(HttpServletRequest request) {
      ModelAndView mv = new ModelAndView("r_write");
      mv.addObject("r_no", request.getParameter("r_no"));
      return mv;
   }
   
   // 이용후기글 저장하기 기능(이미지 업로드)
   @PostMapping("/writePhotoSave")
   public String writeSave(HttpServletRequest request, @RequestParam("rv_photo1") MultipartFile rv_photo1,
         MultipartFile rv_photo2, MultipartFile rv_photo3) throws IOException {
      ReviewDTO reviewDTO = new ReviewDTO();
      LocalDate now = LocalDate.now();
      DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
      String FormatNow = now.format(dateFormat);
      
      reviewDTO.setRv_title(request.getParameter("rv_title"));
      reviewDTO.setRv_content(request.getParameter("rv_content"));
      reviewDTO.setR_no(request.getParameter("r_no"));
      reviewDTO.setRv_date(FormatNow);
      if(!rv_photo1.isEmpty()) {
         String realPath = context.getRealPath("resources/");
         String photoName1 = util.reviewSave(realPath + "upFile/", rv_photo1);
         reviewDTO.setRv_photo1(photoName1);
      }
      if(!rv_photo2.isEmpty()) {
         String realPath = context.getRealPath("resources/");
         String photoName2 = util.reviewSave(realPath + "upFile/", rv_photo2);
         reviewDTO.setRv_photo2(photoName2);
      }
      if(!rv_photo3.isEmpty()) {
         String realPath = context.getRealPath("resources/");
         String photoName3 = util.reviewSave(realPath + "upFile/", rv_photo3);
         reviewDTO.setRv_photo3(photoName3);
      }
      reviewService.reviewWrite(reviewDTO); 
      
      return "redirect:/review";
   }
   
   // 이용후기글 불러오기 페이지 
      @GetMapping("/r_detail")
      public ModelAndView r_detail(HttpServletRequest request) {
         System.out.println(request.getContextPath());
         ModelAndView mv = new ModelAndView("r_detail");
         int rownumber = Integer.parseInt(request.getParameter("rownumber"));
         ReviewDTO detail = reviewService.detail(rownumber);
         mv.addObject("detail", detail);
         return mv;
      }
      
   // 글 숨기기 기능
   @PostMapping("/r_hide")
   public String textHide(HttpServletRequest request) {
      int q_no=Integer.parseInt(request.getParameter("q_no"));
      if(request.getParameter("chk").equals("true")) {
         sqlSession.update("review.hide", q_no);
      }
      else {
         sqlSession.update("review.hide_cancel", q_no);
      }
      return "redirect:/review";
   }
      
   // 페이징 
   @PostMapping("/review")
   public ModelAndView paging(HttpServletRequest request) {
      ModelAndView mv = new ModelAndView("review");
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
      board_num = sqlSession.selectOne("review.review_count", number);
      number.put("no", (page_number - 1) * board_div);
      number.put("board_num", board_div);
      List<HashMap<String, Object>> reviewlist = sqlSession.selectList("review.review_search", number);
      int all_page_number = ((board_num - 1) / board_div) + 1;
      for(int i=0; i<reviewlist.size(); i++) {
         reviewlist.get(i).put("no", board_num - ((page_number - 1) * board_div) - i);
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
      mv.addObject("reviewlist", reviewlist);
      return mv;
   }
}