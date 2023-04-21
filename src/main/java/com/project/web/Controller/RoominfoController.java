package com.project.web.Controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.web.Dto.ImageDTO;
import com.project.web.Dto.RoominfoDTO;
import com.project.web.Service.RoominfoService;
import com.project.web.util.Util;

@Controller
public class RoominfoController {

	@Autowired
	private Util util;

	@Autowired
	private ServletContext context;

	@Autowired
	private RoominfoService roominfoService;

	@GetMapping("roominfo")
	public ModelAndView roominfo() {
		ModelAndView mv = new ModelAndView("./roominfo/roominfo");
		List<RoominfoDTO> list = roominfoService.boardList();
		mv.addObject("list", list);
		return mv;
	}

	@GetMapping("roominfowrite")
	public ModelAndView roominfowrite() {
		ModelAndView mv = new ModelAndView("./roominfo/roominfowrite");
		List<RoominfoDTO> list = roominfoService.si_siteName();
		mv.addObject("list", list);
		return mv;
	}

	@PostMapping("roominfowrite")
	public String roominfowrire(HttpServletRequest request, @RequestParam("si_photo1") MultipartFile si_photo1,
			MultipartFile si_photo2, MultipartFile si_photo3, MultipartFile si_photo4) throws IOException {
		// 세션확인, 제목, 본문내용 오는지 확인
		HttpSession session = request.getSession();
		// DTO에 담기
		RoominfoDTO roominfoDTO = new RoominfoDTO();
		roominfoDTO.setSi_type(request.getParameter("si_type"));
		roominfoDTO.setSi_content(request.getParameter("si_content"));
		// 서비스에게 일 시키기
		roominfoService.roominfowrite(roominfoDTO);

		// 파일 오는지 확인해보기
		if (!si_photo1.isEmpty()) {
			String realPath = context.getRealPath("resources/");
			// 경로명, 파일명
			String fileName1 = util.fileSave(realPath + "upFile/", si_photo1);
			roominfoDTO.setSi_photo1(fileName1);

			// 저장하기
			roominfoService.fileSave(roominfoDTO);
		}
		if (!si_photo2.isEmpty()) {
			String realPath = context.getRealPath("resources/");
			// 경로명, 파일명
			String fileName2 = util.fileSave(realPath + "upFile/", si_photo2);
			roominfoDTO.setSi_photo2(fileName2);

			// 저장하기
			roominfoService.fileSave(roominfoDTO);
		}
		if (!si_photo3.isEmpty()) {
			String realPath = context.getRealPath("resources/");
			// 경로명, 파일명
			String fileName3 = util.fileSave(realPath + "upFile/", si_photo3);
			roominfoDTO.setSi_photo3(fileName3);

			// 저장하기
			roominfoService.fileSave(roominfoDTO);
		}
		if (!si_photo4.isEmpty()) {
			String realPath = context.getRealPath("resources/");
			// 경로명, 파일명
			String fileName4 = util.fileSave(realPath + "upFile/", si_photo4);
			roominfoDTO.setSi_photo4(fileName4);

			// 저장하기
			roominfoService.fileSave(roominfoDTO);
		}
		return "redirect:./roominfo";

	}

	@GetMapping("/roominfodetail")
	public ModelAndView roominfoDetail(HttpServletRequest request) {
		String si_type=request.getParameter("si_type");
		ModelAndView mv = new ModelAndView("./roominfo/roominfodetail");
		RoominfoDTO detail = roominfoService.detail(si_type);
		mv.addObject("detail", detail);
	
		return mv;
	}
}
