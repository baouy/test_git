package com.lantu.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/** 
 * 地图控制器
 * @author:chenhua
 * @since:2018年3月21日  上午10:22:43 
 * 
 */
@Controller
@RequestMapping(value = "/map", produces = MediaType.APPLICATION_JSON_VALUE)
public class MapController {
	
	@RequestMapping(value="/toMap")
	public ModelAndView login() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("map");
		return mv;
	}

}
