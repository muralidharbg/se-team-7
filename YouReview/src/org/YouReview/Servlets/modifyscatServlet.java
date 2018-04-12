package org.YouReview.Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.YouReview.Service.subcategoryService;
import org.YouReview.dto.subCategory;

/**
 * Servlet implementation class modifyscatServlet
 */
@WebServlet("/modifyscatServlet")
public class modifyscatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modifyscatServlet() {
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
		String category, sub_category;
		category = request.getParameter("selected_category");
		sub_category= request.getParameter("selected_scategory");
		System.out.println(category+ ", "+sub_category);
		subcategoryService scs= new subcategoryService();
		subCategory sub_cat_data = scs.getsubCategory(category, sub_category);
		
		request.setAttribute("category", sub_cat_data.getCategory_name());
		request.setAttribute("sub_category", sub_cat_data.getSub_category_name());
		request.setAttribute("q1", sub_cat_data.getQ1());
		request.setAttribute("q2", sub_cat_data.getQ2());
		request.setAttribute("q3", sub_cat_data.getQ3());
		request.setAttribute("q4", sub_cat_data.getQ4());
		request.setAttribute("q5", sub_cat_data.getQ5());
		
		System.out.println(sub_cat_data.getCategory_name()+", "+sub_cat_data.getSub_category_name()+", "+ sub_cat_data.getQ1());
		//request.getRequestDispatcher("modify_subCategory.jsp").forward(request, response);
		
		
	}

}
