package com.mega.teamproject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TeamProjectController {
	
	@RequestMapping(value={"/","/home.do"})
	public String homePage() {
		return "/WEB-INF/views/home.jsp";
	}
}
