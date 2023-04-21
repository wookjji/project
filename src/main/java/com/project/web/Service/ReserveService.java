package com.project.web.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import org.springframework.stereotype.Service;


@Service
public class ReserveService {

	public HashMap<String,Object> search(String s_date, String search) {
		// TODO Auto-generated method stub
		HashMap<String,Object> filter = new HashMap<>();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		int number=0;//초기 진입상태 일떄
		Date start=null;
		Date end=null;
		String start_str=null;
		String end_str=null;
		if(s_date!=null && s_date!="") {
			number=Integer.parseInt(s_date);
		}
		if(search==null || search=="") {
			start = new Date();
			end = new Date();
		}
		else {
			try {
				start=format.parse(search);
				end=format.parse(search);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		start.setMonth(start.getMonth()+number);
		start.setDate(1);
		end.setMonth(end.getMonth()+1+number);
		end.setDate(0);
		start_str=format.format(start);
		end_str=format.format(end);
		filter.put("start",start_str);
		filter.put("end",end_str);
		return filter;
		
		
		
		
	}

}