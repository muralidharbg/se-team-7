package org.YouReview.Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.YouReview.Service.WriteReviewService;
import org.YouReview.dto.SubCategory;

/**
 * Servlet implementation class WriteReviewServlet
 */
@WebServlet("/WriteReviewServlet")
public class WriteReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = request.getRequestDispatcher("WriteReview.jsp");		
		request.setAttribute("Product_Name", request.getParameter("Product_Name"));
		WriteReviewService wrs = new WriteReviewService();
		try {
			SubCategory subCategory = wrs.getSubCategory(request.getParameter("Product_Name"));		
			request.setAttribute("Q1", subCategory.getQuestion1());
			request.setAttribute("Q2", subCategory.getQuestion2());
			request.setAttribute("Q3", subCategory.getQuestion3());
			request.setAttribute("Q4", subCategory.getQuestion4());
			request.setAttribute("Q5", subCategory.getQuestion5());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		WriteReviewService wrs = new WriteReviewService();
		HttpSession session = request.getSession();
		String Product_Name = request.getParameter("Product_Name");
		String User_UserName = (String)session.getAttribute("userName");
		int Answer1 = Integer.parseInt(request.getParameter("A1"));
		int Answer2 = Integer.parseInt(request.getParameter("A2"));
		int Answer3 = Integer.parseInt(request.getParameter("A3"));
		int Answer4 = Integer.parseInt(request.getParameter("A4"));
		int Answer5 = Integer.parseInt(request.getParameter("A5"));
		String Comment = request.getParameter("Comment");
		
		
		wrs.writeReview(Product_Name, User_UserName, Answer1, Answer2, Answer3, Answer4, Answer5, Comment);
		
		RequestDispatcher rd = request.getRequestDispatcher("ProductDetails?Product_Name="+Product_Name);
		rd.forward(request, response);
		doGet(request, response);
	}

}
