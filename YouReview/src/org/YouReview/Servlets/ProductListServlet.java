package org.YouReview.Servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.YouReview.Service.ProductListService;
import org.YouReview.dto.Products;

/**
 * Servlet implementation class ProductListServlet
 */
@WebServlet("/ProductList")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String Brand = request.getParameter("Brand");
		String Sub_Category_Name = request.getParameter("Sub_Category_Name");
		String Category_Name = request.getParameter("Category_Name");

		ProductListService pls = new ProductListService();
		ArrayList<Products> productList = new ArrayList<Products>();
		try {
			if (Brand != null && !Brand.equals("")) {
				productList = pls.getProductsByBrand(Brand);
			} else if (Sub_Category_Name != null && !Sub_Category_Name.equals("")) {
				productList = pls.getProductsBySubCategory(Sub_Category_Name);
			} else if (Category_Name != null && !Category_Name.equals("")) {
				productList = pls.getProductsByCategory(Category_Name);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("productList", productList);
		request.getRequestDispatcher("ProductList.jsp").forward(request, response);
	}

}
