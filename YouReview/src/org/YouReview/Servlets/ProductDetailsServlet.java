package org.YouReview.Servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.YouReview.Service.ApproveProductService;
import org.YouReview.Service.ProductDetailsService;
import org.YouReview.dto.Products;

/**
 * Servlet implementation class ProductDetailsServlet
 */
@WebServlet("/ProductDetails")
public class ProductDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Product_Name = (String) request.getParameter("Product_Name");
		
		ProductDetailsService pds = new ProductDetailsService();
		Products productDetails = new Products();
		try {
			productDetails = pds.getProductByName(Product_Name);
			System.out.println("productDetails: " + productDetails.getProduct_Name());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("productDetails", productDetails);
		request.getRequestDispatcher("ProductDetails.jsp").forward(request, response);

	}

}
