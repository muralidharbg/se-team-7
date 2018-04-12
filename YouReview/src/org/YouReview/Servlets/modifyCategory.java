package org.YouReview.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.YouReview.Service.CategoryService;

/**
 * Servlet implementation class modifyCategory
 */
@WebServlet("/modifyCategory")
public class modifyCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modifyCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String old_category, new_category;
		
		old_category= request.getParameter("selected_category");
		new_category= request.getParameter("new_category");
		CategoryService cs= new CategoryService();
		System.out.println(old_category+ ", "+ new_category);
		String result = cs.updateCategory(old_category, new_category);
		if(result=="YES")
			System.out.println("category updated");
		
		if(result=="no")
			System.out.println("category not updated");
		
	
		//response.setContentType("text/html");
		System.out.println("<a href= \"Modify_categories.jsp\"> Updated, GO BACK.</a>");
		response.sendRedirect("Modify_categories.jsp");
	}

}
