package org.YouReview.Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.YouReview.Service.ApproveProductService;
import org.YouReview.dto.Products;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class ApproveProductServlet
 */
@WebServlet("/ApproveProduct")
public class ApproveProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		ApproveProductService aps = new ApproveProductService();
		ArrayList<Products> productList = new ArrayList<Products>();
		try {
			productList = aps.getApprovalPendingProducts();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("productList", productList);
		request.getRequestDispatcher("ApproveProducts.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		String Product_Name = request.getParameter("name");
		String status = request.getParameter("status");
		ApproveProductService aps = new ApproveProductService();
		boolean updateStatus = false;
		try {
			updateStatus = aps.approveProducts(Product_Name, status);
		
			request.setCharacterEncoding("utf8");
			response.setContentType("application/json");
			
			JSONObject responseData = new JSONObject();
			responseData.put("updateStatus", updateStatus);

			PrintWriter out;
			out = response.getWriter();
			out.print(responseData);
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO: handle exception
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
