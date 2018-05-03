package org.YouReview.Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Logout() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = null;	
		
		
		HttpSession session = request.getSession();
		if(session.getAttribute("userName") != null){
			session.removeAttribute("userName");
		} 
		
		if(session.getAttribute("userRole") != null){
			session.removeAttribute("userRole");
		}
		
        session.invalidate();
		
        response.sendRedirect("index.html");
		}

}
