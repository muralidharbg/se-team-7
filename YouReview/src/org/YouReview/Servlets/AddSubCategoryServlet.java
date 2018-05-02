package org.YouReview.Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.YouReview.Service.AddProductService;
//import org.YouReview.Service.AddProductService;
import org.YouReview.dao.SubCategoryDAO;
import org.YouReview.dto.SubCategory;


/**
 * Servlet implementation class AddSubCategoryServlet
 */
@WebServlet("/AddSubCategoryServlet")
public class AddSubCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSubCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		String category = request.getParameter("category");
		String Sub_Category_Name = request.getParameter("Sub_Category_Name");
		String Question1 = request.getParameter("Question1");
		String Question2 = request.getParameter("Question2");
		String Question3 = request.getParameter("Question3");
		String Question4 = request.getParameter("Question4");
		String Question5 = request.getParameter("Question5");
						
		System.out.println("category"+category);
		System.out.println("Sub_Category_Name"+Sub_Category_Name);
		System.out.println("Question1"+Question1);
		System.out.println("Question2"+Question2);
		System.out.println("Question3"+Question3);
		System.out.println("Question4"+Question4);
		System.out.println("Question5"+Question5);
			
		AddProductService aps = new AddProductService();
		
		try {
			aps.AddSubCategory(category, Sub_Category_Name, Question1, Question2, Question3, Question4, Question5);
		} catch (Exception e) {
			System.out.println("Sex thai gayu");
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("MyAccount.jsp");
		rd.forward(request, response);		
	}

}
