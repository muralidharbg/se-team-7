package org.YouReview.Service;

import java.util.HashMap;

import org.YouReview.dto.User;

public class LoginService {
	HashMap<String,String> users = new HashMap<String,String>();
	
	public LoginService(){
		users.put("karan", "karan Upadhyay");
		users.put("jinesh", "jinesh Shah");
	}
	
	public boolean authenticate(String userName,String passWord)
	{
		if(passWord == null || passWord.trim() == "")
		{
			return false;
		}
		return true;
	}
	public User getuserDetails(String userName) {
		User user = new User();
		user.setUserName(userName);
		user.setFullName(users.get(userName));
		return user;
		
	}
}
