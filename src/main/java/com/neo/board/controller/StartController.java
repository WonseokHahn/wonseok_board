package com.neo.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StartController {
	@RequestMapping("/")
	public String getMain() {
		return "index";
	}
}
