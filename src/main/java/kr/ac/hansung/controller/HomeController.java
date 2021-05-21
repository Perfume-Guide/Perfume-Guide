package kr.ac.hansung.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homePage(Locale locale, Model model) {
		
		return "homepage";
	}
		
	@RequestMapping(value = "/listpage", method = RequestMethod.GET)
	public String listPage(Locale locale, Model model) {
		
		return "listpage";
	}
	
	@RequestMapping(value = "/template", method = RequestMethod.GET)
	public String template(Locale locale, Model model) {
		
		return "template";
	}
}
