package org.YouReview.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.YouReview.Service.CategoryService;
import org.YouReview.Service.subcategoryService;

/**
 * Servlet implementation class modifySubCategoryServlet
 */
@WebServlet("/modifySubCategoryServlet")
public class modifySubCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modifySubCategoryServlet() {
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
		String old_scategory, new_scategory;
		
		old_scategory= request.getParameter("selected_scategory");
		new_scategory= request.getParameter("new_scategory");
		System.out.println(old_scategory+ ", "+ new_scategory);
		subcategoryService scs= new subcategoryService();
		System.out.println(old_scategory+ ", "+ new_scategory);
		String result = scs.updatesubCategory(old_scategory, new_scategory);
		if(result=="YES")
			System.out.println("category updated");
		
		if(result=="no")
			System.out.println("category not updated");
		//doGet(request, response);
		
		System.out.println("<a href= \"modify_subCategory.jsp\"> Updated, GO BACK.</a>");
		response.sendRedirect("modify_subCategory.jsp");
	}

}
