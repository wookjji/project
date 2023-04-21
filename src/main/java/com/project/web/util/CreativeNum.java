package com.project.web.util;

import java.util.Random;

import org.springframework.stereotype.Component;

@Component
public class CreativeNum {
	public String reservationNum(String num,String in,String out) {
		int leftLimit = 97; // letter 'a'
	    int rightLimit = 122; // letter 'z'
	    int targetStringLength = 2;
	    Random random = new Random();
	    String generatedString = random.ints(leftLimit, rightLimit + 1)
	                                   .limit(targetStringLength)
	                                   .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
	                                   .toString();
	    
		num = num.substring(7);
		in =in.replaceAll("-", "");
		in = in.substring(6);
		out = out.replaceAll("-", "");
		out = out.substring(6);
		
		String plus= generatedString+num+in+out;
		
			return plus;
	}
}
