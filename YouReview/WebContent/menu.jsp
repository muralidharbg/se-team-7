
<%
	String userRole = (String) session.getAttribute("userRole");
	
%>
<nav class="navbar navbar-default" role="navigation"
	style="background-color: black; color: white">

	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target="#bs-example-navbar-collapse-1">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="index.html" style="color: white">YouReview</a>
	</div>


	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<div class="col-sm-8 col-md-8">
			<form class="navbar-form" role="search">
				<div class="input-group col-sm-8 col-md-8">
					<input type="text" class="form-control" placeholder="Search"
						name="q" id="search">
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
			<li><a href="#" style="color: white">Categories</a></li>
			<%
				if (userRole != null) {
			%>
			<li><a href="MyAccount.jsp" style="color: white"><span
					class="glyphicon glyphicon-user"></span> My Account</a></li>
			<li><form action="Logout" method="post"><button style="color: white"><span
					class="glyphicon glyphicon-log-in"></span> Logout</button></form></li>
			<%
				} else {
			%>
			<li><a href="Register.jsp" style="color: white"><span
					class="glyphicon glyphicon-log-in"></span> Register</a></li>
			<li><a href="Login.jsp" style="color: white"><span
					class="glyphicon glyphicon-log-in"></span> Login</a></li>
			<%
				}
			%>
		</ul>
	</div>
	<!-- /.navbar-collapse -->
</nav>