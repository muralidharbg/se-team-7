package org.YouReview.Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.YouReview.Service.CategoryService;
import org.YouReview.Service.subcategoryService;
import org.YouReview.dto.subCategory;

/**
 * Servlet implementation class modifySubCategoryServlet
 */
@WebServlet("/modifySubCategoryServlet")
public class modifySubCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       //somechange
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
		String category, scategory;
		
		category= request.getParameter("selected_category");
		//changes made
		scategory= request.getParameter("selected_scategory");
		System.out.println(category+ ", "+ scategory);
		subcategoryService scs= new subcategoryService();
		//System.out.println(category+ ", "+ new_scategory);
		//subCategory sub_cat= new subCategory();
		
		PrintWriter out = response.getWriter();
		subCategory sub_cat= new subCategory();
				//scs.getsubCategory(category, scategory);
		
		sub_cat.setCategory_name(request.getParameter("category"));
		sub_cat.setSub_category_name(request.getParameter("sub_category"));
		sub_cat.setQ1(request.getParameter("q1"));
		sub_cat.setQ2(request.getParameter("q2"));
		sub_cat.setQ3(request.getParameter("q3"));
		sub_cat.setQ4(request.getParameter("q4"));
		sub_cat.setQ5(request.getParameter("q5"));
		//out.println("<table><tr>"+ " "+ sub_cat.getCategory_name() + "</tr></table>");
		
		
		String result = scs.updatesubCategory(sub_cat, scategory);
		if(result=="YES")
			System.out.println("category updated");
		
		if(result=="no")
			System.out.println("category not updated");
		//doGet(request, response);
		
		//System.out.println("<a href= \"modify_subCategory.jsp\"> Updated, GO BACK.</a>");
		//response.sendRedirect("modify_subCategory.jsp");
	}

}
