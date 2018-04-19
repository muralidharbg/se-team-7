package org.YouReview.Servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.YouReview.Service.*;
import org.YouReview.dto.Products;

/**
 * Servlet implementation class AllProductsServlet
 */
@WebServlet("/AllProductsServlet")
public class AllProductsServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
       
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		AllProductsServices ap = new AllProductsServices();
		ArrayList<Products> productList = new ArrayList<Products>();
		try {
			productList = ap.getAllProducts();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("productList", productList);
		request.getRequestDispatcher("ProductsAdded.jsp").forward(request, response);
	}

}
