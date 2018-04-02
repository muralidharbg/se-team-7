<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.sql.*" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head> 
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">

		<!-- Website CSS style -->
		<link rel="stylesheet" type="text/css" href="assets/css/main.css">

		<!-- Website Font style -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		
		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
		<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
		<script>
			function change(){				
				var text = $('#category').val();
			}
		</script>
		<title>AddProduct</title>
		<style>

body, html{
     height: 100%;
 	background-repeat: no-repeat;
 	background-color: #d3d3d3;
 	font-family: 'Oxygen', sans-serif;
}

.main{
 	margin-top: 70px;
}

h1.title { 
	font-size: 50px;
	font-family: 'Passion One', cursive; 
	font-weight: 400; 
}

hr{
	width: 10%;
	color: #fff;
}

.form-group{
	margin-bottom: 15px;
}

label{
	margin-bottom: 15px;
}

input,
input::-webkit-input-placeholder {
    font-size: 11px;
    padding-top: 3px;
}

.main-login{
 	background-color: #fff;
    /* shadows and rounded borders */
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);

}

.main-center{
 	margin-top: 30px;
 	margin: 0 auto;
 	max-width: 330px;
    padding: 40px 40px;

}

.login-button{
	margin-top: 5px;
}

.login-register{
	font-size: 11px;
	text-align: center;
}
		
		</style>
	</head>
	<body>
  	<nav class="navbar navbar-default" role="navigation" style="background-color: black; color: white">
  
  		<div class="navbar-header">
    			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
      			<span class="sr-only">Toggle navigation</span>
      			<span class="icon-bar"></span>
      			<span class="icon-bar"></span>
      			<span class="icon-bar"></span>
    			</button>
    			<a class="navbar-brand" href="index.html" style="color: white">YouReview</a>
  		</div>

  
	  	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	    		<div class="col-sm-8 col-md-8">
	        		<form class="navbar-form" role="search">
	        			<div class="input-group col-sm-8 col-md-8">
	            			<input type="text" class="form-control" placeholder="Search" name="q">
	            			<div class="input-group-btn">
	                			<button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
	            			</div>
	        			</div>
	        		</form>
	    		</div>
	    		<ul class="nav navbar-nav navbar-right">
	    			<li><a href="#" style="color: white">Home</a></li>
	    			<li><a href="#" style="color: white">Categories</a></li>
	      		<li><a href="MyAccount.jsp" style="color: white"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
	    		</ul>
  		</div><!-- /.navbar-collapse -->
	</nav>
	
		<div class="container">
			<div class="row main">
				<div class="panel-heading">
	               <div class="panel-title text-center">
	               		<h1 class="title">AddProduct</h1>
	               		<hr />
	               	</div>
	            </div> 
				<div class="main-login main-center" style="max-width: 830px;">
					<form class="form-horizontal" method="post" enctype='multipart/form-data' action="AddProductServlet">
						
						<div class="form-group">
							
						
									<label for="category" class="cols-sm-2 control-label">Category Name:</label>
									
									<select class="form-control" id="category" name="category" onchange="this.form.submit();">
										<option>Select Category</option>
										<%
											try{
												String Query="select * from Category";
					
												Connection conn = null;
												String url = "jdbc:mysql://localhost:3306/YouReview_DB?useSSL=false";
												String driver = "com.mysql.jdbc.Driver";
												try {
													Class.forName(driver).newInstance();
													conn = DriverManager.getConnection(url,"root","12345678");
												}
												catch(SQLException sqle) {
													System.out.println("SQLException: Unable to open connection to db: "+sqle.getMessage());
												
													throw sqle;
												}
												PreparedStatement psmt = conn.prepareStatement(Query);
												
												
												ResultSet rs = psmt.executeQuery();
												while(rs.next()){
												
												%>
										
										<option value="<%=rs.getString("Category_Name")%>"
										<%
											if(request.getParameter("category") != null)
											{
												if(request.getParameter("category").equals(rs.getString("Category_Name")))
												{
													out.print("selected");
												}
											}
										%>
																				
										><%=rs.getString("Category_Name")%></option>
										<%} 
											}
											catch(Exception e)
											{
												e.printStackTrace();
											}%>					
									</select>
									
									<label for="subCategory" class="cols-sm-2 control-label">Sub Category Name:</label>
									
										<select id="subCategory" name="subCategory" class="form-control">
											<option value="one">Select Sub-Category</option>					
										<%
											try{
												String Query="select * from Sub_Categories where Category_Name=?";
					
												Connection conn = null;
												String url = "jdbc:mysql://localhost:3306/YouReview_DB?useSSL=false";
												String driver = "com.mysql.jdbc.Driver";
												try {
													Class.forName(driver).newInstance();
													conn = DriverManager.getConnection(url,"root","12345678");
												}
												catch(SQLException sqle) {
													System.out.println("SQLException: Unable to open connection to db: "+sqle.getMessage());
												
													throw sqle;
												}
												PreparedStatement psmt = conn.prepareStatement(Query);
												psmt.setString(1, request.getParameter("category"));
												
												ResultSet rs = psmt.executeQuery();
												while(rs.next()){
												//System.out.print(rs.getString("Sub_Category_Name"));
												%>
												
												<option value="<%=rs.getString("Sub_Category_Name")%>"><%=rs.getString("Sub_Category_Name")%></option>
												<%}
												
											}
											catch(Exception e)
											{
												e.printStackTrace();
											}
										 
										 %>					
									</select>
									
									<label for="productName" class="cols-sm-2 control-label">Product Name</label>
									<div class="cols-sm-5">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-book" aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="productName" id="productName"  placeholder="Enter Product Name"/>
										</div>
									</div>
									<label for="productBrand" class="cols-sm-2 control-label">Product Brand</label>
									<div class="cols-sm-5">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-book" aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="productBrand" id="productBrand"  placeholder="Enter Product Brand"/>
										</div>
									</div>
									<label for="productModel" class="cols-sm-2 control-label">Product Model</label>
									<div class="cols-sm-5">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-book" aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="productModel" id="productModel"  placeholder="Enter Product Model"/>
										</div>
									</div>
									
									<label for="productImage" class="cols-sm-2 control-label">Product Image</label>
									<div class="cols-sm-5">
										<div class="input-group">
											 <span class="input-group-addon"><i class="fa fa-book" aria-hidden="true"></i></span>
											<input type="file" accept="image/*" class="form-control" name="productImage" id="productImage"/>
										</div>
									</div>
									
									<label for="productDescription" class="cols-sm-2 control-label">Product Description</label>
									<div class="cols-sm-5">
										<div class="input-group">											
											<textarea class="form-control" id="productDescription" name="productDescription" rows="3" placeholder="Enter Product Description" style="margin: 0px; width: 780px; height: 126px;"></textarea>
										</div>
									</div>
									<div class="form-group ">
										<input type="submit" class="btn btn-primary btn-lg btn-block login-button"/>
									</div>  		
														
				</div>
				</form>	
			</div>																
	</div>
</div>
	
</body>
</html>