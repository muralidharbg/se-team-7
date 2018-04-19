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
		<title>Add Sub Category</title>
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
	      		<li><a href="Register.jsp" style="color: white"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
	    		</ul>
  		</div><!-- /.navbar-collapse -->
	</nav>
	
		<div class="container">
			<div class="row main">
				<div class="panel-heading">
	               <div class="panel-title text-center">
	               		<h1 class="title">Add Sub Category</h1>
	               		<hr />
	               	</div>
	            </div> 
				<div class="main-login main-center" style="max-width: 830px;">
					<form class="form-horizontal" method="post" enctype='multipart/form-data' action="AddSubCategoryServlet">
						
						<div class="form-group">
							
						
									<label for="category" class="cols-sm-2 control-label">Category Name:</label>
									
									<select class="form-control" id="category" name="category">
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
									
													
									<label for="Sub_Category_Name" class="cols-sm-2 control-label">Sub-Category Name</label>
									<div class="cols-sm-5">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-book" aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="Sub_Category_Name" id="Sub_Category_Name"  placeholder="Enter Sub-Category Name"/>
										</div>
									</div>
									<label for="Question1" class="cols-sm-2 control-label">Question1</label>
									<div class="cols-sm-5">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-book" aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="Question1" id="Question1"  placeholder="Enter Question1"/>
										</div>
									</div>
									<label for="Question2" class="cols-sm-2 control-label">Question2</label>
									<div class="cols-sm-5">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-book" aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="Question2" id="Question2"  placeholder="Enter Question2"/>
										</div>
									</div>
									<label for="Question3" class="cols-sm-2 control-label">Question3</label>
									<div class="cols-sm-5">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-book" aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="Question3" id="Question3"  placeholder="Enter Question3"/>
										</div>
									</div>
									<label for="Question4" class="cols-sm-2 control-label">Question4</label>
									<div class="cols-sm-5">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-book" aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="Question4" id="Question4"  placeholder="Enter Question4"/>
										</div>
									</div>
									<label for="Question5" class="cols-sm-2 control-label">Question5</label>
									<div class="cols-sm-5">
										<div class="input-group">
											<span class="input-group-addon"><i class="fa fa-book" aria-hidden="true"></i></span>
											<input type="text" class="form-control" name="Question5" id="Question5"  placeholder="Enter Question5"/>
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