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

import com.project.web.Dto.RefndDTO;

@Controller
public class RefundController {
   @Autowired
   private SqlSession sqlSession;
   
   @GetMapping("/refund")
   public ModelAndView refund(HttpServletRequest request) {
      HttpSession session = request.getSession();
      if(session.getAttribute("id") == null) {
         ModelAndView mv = new ModelAndView();
         mv.setViewName("login");
         mv.addObject("error", "잘못된 접근입니다.");
         return mv;
      }else {
      
      ModelAndView mv = new ModelAndView("refund");
      List<RefndDTO> list = sqlSession.selectList("refund.list");
      mv.addObject("list", list);
      return mv;
      }
   }
   
   @PostMapping("/fund")
   @ResponseBody
   public String fund(@RequestParam("rno") String rno, @RequestParam("tel") String tel, @RequestParam("name") String name) {
      RefndDTO refundDTO = new RefndDTO();
      refundDTO.setR_no(rno);
      sqlSession.update("refund.refund", refundDTO);
      int result = sqlSession.selectOne("refund.result", refundDTO);
      
      String content = name + "님 환불이 완료되었습니다.";
      //message message = new message();
      //message.sendSMS(tel, content);

      return String.valueOf(result);
   }
}