package com.project.web.Controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;



@Controller
public class HomeController {
		

	@GetMapping("/")
	public String home() {

		return "/home/home";
	}	
	 @GetMapping("introduction")
	    public String introduction() {
		 
	        return "./introduction/introduction";
	   }
	 @GetMapping("map")
	 public String map() {
		 
		 return "./map/map";
	 }

	 @GetMapping("arrangement")
	 public String arrangement() {
		 
		 return "./arrangement/arrangement";
	 }
	 @GetMapping("useinfo")
	 public String useinfo() {
		 
		 return "./useinfo/useinfo";
	 }
}
