package org.YouReview.Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.YouReview.Service.LoginService;
import org.YouReview.dto.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName,passWord;
		boolean result = false;
		
		userName = request.getParameter("userName");
		passWord = request.getParameter("passWord");
		
		User user = null;
		
		LoginService loginService = new LoginService();
		try
		{
			if(!userName.isEmpty() || !passWord.isEmpty())
			{
				user = loginService.authenticate(userName, passWord);
			}
		}
		catch(Exception e)
		{
			System.out.println("login failed");
		}		
		
		if (user != null)
		{
			//User user = loginService.getuserDetails(userName);
			request.setAttribute("user", user);
			HttpSession newSession = request.getSession(true);
			newSession.setAttribute("userName", userName);
			newSession.setAttribute("userRole", user.getUser_Role());
			System.out.println("user role is :"+newSession.getAttribute("userRole"));			
			response.sendRedirect("MyAccount.jsp");
			return;
		}
		else
		{
			response.sendRedirect("Login.jsp");
			return;
		}
		
	}

}
