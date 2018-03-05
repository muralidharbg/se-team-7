package com.in28minutes.login;

import org.springframework.stereotype.Service;

//new Login service
@Service
public class LoginService {
	public boolean validateUser(String user, String password) {
		return user.equalsIgnoreCase("karan") && password.equals("karan");
	}

}