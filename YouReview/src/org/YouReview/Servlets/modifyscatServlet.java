package org.YouReview.Servlets;

import java.io.IOException;
import java.io.PrintWriter;

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
		if(request.getParameter("fetch_data")!=null) {
			
		
		String category, sub_category;
		category = request.getParameter("selected_category");
		sub_category= request.getParameter("selected_scategory");
		System.out.println("data sent : "+category+ ", "+sub_category);
		subcategoryService scs= new subcategoryService();
		subCategory sub_cat_data = scs.getsubCategory(category, sub_category);
		
		request.setAttribute("category", sub_cat_data.getCategory_name());
		request.setAttribute("sub_category", sub_cat_data.getSub_category_name());
		request.setAttribute("q1", sub_cat_data.getQ1());
		request.setAttribute("q2", sub_cat_data.getQ2());
		request.setAttribute("q3", sub_cat_data.getQ3());
		request.setAttribute("q4", sub_cat_data.getQ4());
		request.setAttribute("q5", sub_cat_data.getQ5());
		
		System.out.println("sub cat details are : "+sub_cat_data.getCategory_name()+", "+sub_cat_data.getSub_category_name()+", "+ sub_cat_data.getQ1());
		request.getRequestDispatcher("modify_subCategory.jsp").forward(request, response);
		
		}
		if(request.getParameter("commit")!=null) {
			String category, scategory;
			
			category= request.getParameter("selected_category");
			
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
			request.getRequestDispatcher("modify_subCategory.jsp").forward(request, response);
			//System.out.println("<a href= \"modify_subCategory.jsp\"> Updated, GO BACK.</a>");
			//response.sendRedirect("modify_subCategory.jsp");
			
		}
	}

}
