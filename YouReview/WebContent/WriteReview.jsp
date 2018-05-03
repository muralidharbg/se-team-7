<html>
<head>
<title>Write Review</title>
<!-- <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">  -->

<!-- Website CSS style -->
<!--  <link rel="stylesheet" type="text/css" href="assets/css/main.css">  -->

<!-- Website Font style -->
<link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css">

<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Passion+One'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Oxygen'
	rel='stylesheet' type='text/css'>
<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="css/jquery-ui.min.css" rel="stylesheet">
<link href="css/master.css" rel="stylesheet">
</head>

<body style="background-color: #d3d3d3;">
	<nav class="navbar navbar-default" role="navigation"
		style="background-color: black; color: white">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html" style="color: white">YouReview</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<div class="col-sm-8 col-md-8">
				<form class="navbar-form" role="search">
					<div class="input-group col-sm-8 col-md-8">
						<input type="text" class="form-control" placeholder="Search"
							name="q">
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#" style="color: white">Home</a></li>
				<li><a href="#" style="color: white">About</a></li>
				<li><a href="Register.jsp" style="color: white"><span
						class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				<li><a href="Login.jsp" style="color: white"><span
						class="glyphicon glyphicon-log-in"></span> Login</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</nav>
	<div class="container">
		<div class="row">
			<h2><%=request.getAttribute("Product_Name")%>
				<small>Hover and click on a star</small>
			</h2>
			<div class="col-xs-3 item-photo ">
				<img style="max-width: 50%;"
					src="http://img1.cellibrity.net/wp-content/uploads/2017/12/09165700/Apple-iPhone-X-Silver-ATT-Device-CELLibrity.png" />
			</div>
			<div class="col-3"></div>
		</div>
		<div class="row lead">
			<h2>
				How is the
				<%=request.getAttribute("Q1")%>?
			</h2>
			<div id="stars1" class="starrr"></div>
			You gave a rating of <span id="count1">0</span> star(s)
		</div>
		<div class="row lead">
			<h2>
				How is the
				<%=request.getAttribute("Q2")%>?
			</h2>
			<div id="stars2" class="starrr"></div>
			You gave a rating of <span id="count2">0</span> star(s)
		</div>
		<div class="row lead">
			<h2>
				How is the
				<%=request.getAttribute("Q3")%>?
			</h2>
			<div id="stars3" class="starrr"></div>
			You gave a rating of <span id="count3">0</span> star(s)
		</div>
		<div class="row lead">
			<h2>
				How is the
				<%=request.getAttribute("Q4")%>?
			</h2>
			<div id="stars4" class="starrr"></div>
			You gave a rating of <span id="count4">0</span> star(s)
		</div>
		<div class="row lead">
			<h2>
				How is the
				<%=request.getAttribute("Q5")%>?
			</h2>
			<div id="stars5" class="starrr"></div>
			You gave a rating of <span id="count5">0</span> star(s)
		</div>

		<form action="WriteReviewServlet" method="POST">
			<input type="hidden" name="A1" id="A1" value="" /> <input
				type="hidden" name="A2" id="A2" value="" /> <input type="hidden"
				name="A3" id="A3" value="" /> <input type="hidden" name="A4"
				id="A4" value="" /> <input type="hidden" name="A5" id="A5" value="" />
			<input type="hidden" name="Product_Name" id="Product_Name"
				value="<%=request.getAttribute("Product_Name")%>" />
			<div class="form-group">
				<label for="exampleFormControlTextarea2">Write Comment</label>
				<textarea class="form-control rounded-0" id="Comment" name="Comment"
					rows="3"></textarea>
			</div>
			<input type="submit"
				class="btn btn-primary btn-lg btn-block login-button"
				style="width: 250px; margin-left: 0px;" />
		</form>
		<!--<a href="ProductDetail.jsp">
		<button id="myButton" class="btn btn-primary btn-lg btn-block login-button" style="width: 250px;margin-left:0px;">Submit</button>
	</a>
    
    <div class="row lead">
        <p>Also you can give a default rating by adding attribute data-rating</p>
        <div id="stars-existing" class="starrr" data-rating='4'></div>
        You gave a rating of <span id="count-existing">4</span> star(s)
     </div>-->
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>