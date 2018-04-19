<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
    <head> 
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">

		
		<link rel="stylesheet" type="text/css" href="assets/css/main.css">

		
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		
		
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
	color: #ffffff;
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
	               		<h1 class="title">Change PassWord</h1>
	               		<hr />
	               	</div>
	            </div> 
				<div class="main-login main-center">
					<form class="form-horizontal" method="post" action="ChangePassword">
												
						<div class="form-group">
							<label for="oldpassWord" class="cols-sm-2 control-label">Current Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="oldpassWord" id="oldpassWord"  placeholder="Enter your Password"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="newpassWord" class="cols-sm-2 control-label">New Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="newpassWord" id="newpassWord"  placeholder="Enter your Password"/>
								</div>
							</div>
						</div>
							
							
						<div class="form-group">
							<label for="conpassWord" class="cols-sm-2 control-label">Confirm Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="conpassWord" id="conpassWord"  placeholder="Enter your Password"/>
								</div>
							</div>
						</div>
						

						<div class="form-group ">
							<input type="submit" class="btn btn-primary btn-lg btn-block login-button"/>
						</div>
				        <div class="login-register" >
				         	<a href="MyAccount.jsp">Home</a>
				         </div>
					</form>
				</div>
			</div>
		</div>

		<script type="text/javascript" src="assets/js/bootstrap.js"></script>
	</body>
</html>