package com.lma.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/movie")
public class MovieController {

	@RequestMapping(value="/{name}", method = RequestMethod.GET)
	public String getMovie(@PathVariable String name, ModelMap model) {
		System.out.println("Inside movie");

		model.addAttribute("movie", name);
		return "hello";

	}
	
	
	@RequestMapping(value="/nullpointerpath")
	  public String throwNullPointer() {
	    throw new NullPointerException();
	  }
	
}