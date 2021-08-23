package kr.ac.hansung.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String listPage(@RequestParam(value = "brand", required = false) String brand,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "gender", required = false) String gender,
			@RequestParam(value = "accord", required = false) String accord,
			@RequestParam(value = "power", required = false) String power,
			@RequestParam(value = "note", required = false) String note) {

		return "listpage";
	}

	@RequestMapping(value = "/detailpage", method = RequestMethod.GET)
	public String detailPage(@RequestParam(value = "brand") String brand,
			@RequestParam(value = "name", required = false) String name) {

		return "detailpage";
	}
	
	@RequestMapping(value = "/errorpage", method = RequestMethod.GET)
	public String errorPage(@RequestParam(value = "keyword") String keyword) {

		return "errorpage";
	}
}
