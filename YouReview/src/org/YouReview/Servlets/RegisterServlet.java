package org.YouReview.Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.YouReview.Service.LoginService;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName,passWord,fullName,email;
		boolean result = false;
		
		response.setContentType("text/html");
		PrintWriter printer = response.getWriter();
		
		userName = request.getParameter("userName");
		passWord = request.getParameter("passWord");
		fullName = request.getParameter("fullName");
		email = request.getParameter("email");
		
		  
		LoginService loginService = new LoginService();
		try
		{
			if(!userName.isEmpty() || !passWord.isEmpty() || !fullName.isEmpty() || !email.isEmpty())
			{
				result = loginService.register(fullName, email, userName, passWord);
			}
		}
		catch(Exception e)
		{
			System.out.println("Registration fail");
		}
		
		System.out.println("Register page");
		
		if(result)
		{
			response.sendRedirect("Login.jsp");
		}
		else
		{
			//printer.print("Username already exist");
			
			RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
			rd.include(request, response);
			printer.close();
			return;
		}
		
	}

}
