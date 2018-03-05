package com.in28minutes.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.in28minutes.login.LoginService;

@Controller
public class LoginController {
	
	// Set the login Service - AUto wiring
	@Autowired
	LoginService service;
	
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String sayHello()
	{	
		return "login";
	}
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String handleLoginRequest(@RequestParam String name,@RequestParam String password,ModelMap model)
	{
		System.out.println("post called");
		if(!service.validateUser(name, password))
		{
			model.put("errorMessage", "invalid cccc");
			return "login";
		}
		model.put("name", name);
		model.put("password", password);
		return "welcome";
	}
}
