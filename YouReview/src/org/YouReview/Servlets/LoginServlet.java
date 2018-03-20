package org.YouReview.Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.YouReview.Service.LoginService;
import org.YouReview.dto.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName,passWord;
		
		userName = request.getParameter("userName");
		passWord = request.getParameter("passWord");
		
		LoginService loginService = new LoginService();
		boolean result = loginService.authenticate(userName, passWord);
		
		System.out.println("result is"+result);
		
		if (result)
		{
			User user = loginService.getuserDetails(userName);
			request.setAttribute("user", user);
			//response.sendRedirect("Home.jsp");
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.html");			
			dispatcher.forward(request, response);			
			return;
		}
		else
		{
			response.sendRedirect("Login.jsp");
			return;
		}
		
	}

}
