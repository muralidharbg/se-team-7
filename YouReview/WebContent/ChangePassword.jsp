<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<title>Login</title>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>

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
						<label for="oldpassWord" class="cols-sm-2 control-label">Current
							Password</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
									type="password" class="form-control" name="oldpassWord"
									id="oldpassWord" placeholder="Enter your Password" />
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="newpassWord" class="cols-sm-2 control-label">New
							Password</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
									type="password" class="form-control" name="newpassWord"
									id="newpassWord" placeholder="Enter your Password" />
							</div>
						</div>
					</div>


					<div class="form-group">
						<label for="conpassWord" class="cols-sm-2 control-label">Confirm
							Password</label>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
									type="password" class="form-control" name="conpassWord"
									id="conpassWord" placeholder="Enter your Password" />
							</div>
						</div>
					</div>


					<div class="form-group ">
						<input type="submit"
							class="btn btn-primary btn-lg btn-block login-button" />
					</div>
					<div class="login-register">
						<a href="MyAccount.jsp">Home</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>