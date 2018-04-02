package org.YouReview.Servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.Part;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.YouReview.Service.AddProductService;

/**
 * Servlet implementation class AddProductServlet
 */
@WebServlet("/AddProductServlet")
@MultipartConfig
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		response.setContentType("text/html);charset=UTF-8");
    		try (PrintWriter out = response.getWriter()){
    			ArrayList<String> arr = new ArrayList<String>();
    			ArrayList<String> arr1 = new ArrayList<String>();
    			arr.add("Val 2");
    			arr.add("Val 22");
    			arr1.add("val 3");
    			arr1.add("val 32");
    			String valajax=request.getParameter("valajax");
    			System.out.println(valajax);
    			if(valajax.equals("Electronics"))
    			{
    				response.getWriter().write("Drop Down 1: <select>");
    				
    				for(int i=0;i<arr1.size();i++)
    				{
    					response.getWriter().write("<option>"+arr1.get(i)+"</option>");
    				}
    				
    				response.getWriter().write("</select>");
    			}
    			if(valajax.equals("Automobile"))
    			{
    				response.getWriter().write("Drop Down 1: <select>");
    				
    				for(int i=0;i<arr.size();i++)
    				{
    					response.getWriter().write("<option>"+arr.get(i)+"</option>");
    				}
    				
    				response.getWriter().write("</select>");
    			}
    		}
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AddProductService addProductService = new AddProductService();
		ArrayList<String> arrCatogery = new ArrayList<String>();
		ArrayList<String> arrSubCatogery = new ArrayList<String>();
		String valajax=request.getParameter("valajax");
		System.out.println(valajax);
		
		try {
			ResultSet rs = addProductService.getCategory();
			while(rs.next())
			{
				arrCatogery.add(rs.getString("Category_Name"));				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("Category", arrCatogery);
		arrSubCatogery.add("Select Sub Category");
		if(valajax!=null)
		{
			try {
				ResultSet rs_sub = addProductService.getSubCategory(valajax);
				while(rs_sub.next())
				{
					arrSubCatogery.add(rs_sub.getString("Sub_Category_Name"));				
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}				
		
		request.setAttribute("SubCategory", arrSubCatogery);
		RequestDispatcher rd = request.getRequestDispatcher("AddProduct.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String Sub_Categories = request.getParameter("subCategory");
		
		if(Sub_Categories.equals("one"))
		{
			System.out.println("havent selected yet");
		}
		else
		{
			String SubCategory = request.getParameter("subCategory");
			String ProductName = request.getParameter("productName");
			String ProductBrand = request.getParameter("productBrand");
			String ProductModel = request.getParameter("productModel");
			String ProductDescription = request.getParameter("productDescription");
			String User_Name = (String)request.getSession(false).getAttribute("userName");
			Part filePart = request.getPart("productImage");
			InputStream inputStream = filePart.getInputStream();

			AddProductService aps = new AddProductService();
			
			try {
				aps.AddProduct(ProductName,SubCategory,User_Name,ProductBrand,ProductModel,inputStream,ProductDescription);
			} catch (Exception e) {
				System.out.println("Sex thai gayu");
				e.printStackTrace();
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("MyAccount.jsp");
			rd.forward(request, response);
		}
		
		doGet(request, response);
	}

}
