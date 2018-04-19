package org.YouReview.Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.YouReview.Service.*;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
//    public ChangePassword() {
//        super();
//        // TODO Auto-generated constructor stub
//    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String oldpassWord, newpassWord, conpassWord, userName;
		boolean result = false;
		
		response.setContentType("text/html");
		PrintWriter printer = response.getWriter();
		
		oldpassWord = request.getParameter("oldpassWord");
		newpassWord = request.getParameter("newpassWord");
	    conpassWord = request.getParameter("conpassWord");
	    HttpSession newSession = request.getSession(false);
		userName = (String) newSession.getAttribute("userName");
	   
	    
	    //LoginService ls = new LoginService();
	    ChangePservice cp = new ChangePservice();
	    try
		{
			if((!oldpassWord.isEmpty() || !newpassWord.isEmpty() || !conpassWord.isEmpty()) && (newpassWord.equals(conpassWord)) && !(oldpassWord.equals(newpassWord)))
			{	
				if(cp.authenticate(userName, oldpassWord))
				{
				result = cp.changePassword(newpassWord, userName);
				}
			}
			else
			{
				RequestDispatcher rd = request.getRequestDispatcher("ChangePassword.jsp");
				   printer.println("<font color=red>Please fill all the fields</font>");
				   rd.include(request, response);
				   
			}
			
		}
		catch(Exception e)
		{	
			System.out.println("Error");;
		}
	    
	    
	    
	    if(result)
		{
			response.sendRedirect("MyAccount.jsp");
		}
		else
		{
			RequestDispatcher rd = request.getRequestDispatcher("ChangePassword.jsp");
			rd.include(request, response);
			printer.close();
			return;
		}
	}

}
