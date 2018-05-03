package org.YouReview.Servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.YouReview.Service.SubCategoryListService;

/**
 * Servlet implementation class SubCategoryListServlet
 */
@WebServlet("/SubCategoryList")
public class SubCategoryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubCategoryListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Category_Name = request.getParameter("Category_Name");
		ArrayList<String> subCategories = new ArrayList<>();
		if (Category_Name != null && !Category_Name.equals("")) {
			SubCategoryListService scls = new SubCategoryListService();
			try {
				subCategories = scls.getSubCategory(Category_Name);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		request.setAttribute("subCategories", subCategories);
		request.getRequestDispatcher("SubCategoryList.jsp").forward(request, response);
	}

}
