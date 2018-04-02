<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
		<title>Login</title>
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
	      		<li><a href="Login.jsp" style="color: white"><span class="glyphicon glyphicon-user"></span>Logout</a></li>
	    		</ul>
  		</div><!-- /.navbar-collapse -->
	</nav>

	<h1> Hello, <%=session.getAttribute("userName") %></h1>
	
	<a href="AddProductServlet">
		<button id="myButton" class="btn btn-primary btn-lg btn-block login-button" style="width: 250px;margin-left:0px;">AddProduct</button>
	</a>
	<a href="AddSubCategory.jsp">
		<button id="myButton" class="btn btn-primary btn-lg btn-block login-button" style="width: 250px;margin-left:0px;">AddCategory</button>
	</a>
	<a href="ApproveProducts.jsp">
		<button id="myButton" class="btn btn-primary btn-lg btn-block login-button" style="width: 250px;margin-left:0px;">Approve Products</button>
	</a>

</body>
</html>