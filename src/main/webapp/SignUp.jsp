<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp Page</title>
<%@include file="all_components/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_components/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center mb-3">
							<i class="fa fa-user fa-2x" aria-hidden="true"></i>
							<h5>Registration Page</h5>
						</div>
						<%
						String msg = (String) session.getAttribute("msg");
						if (msg != null) {
						%>
						<div class="alert alert-info text-center" role="alert">
							<%=msg%>
						</div>
						<%
						session.removeAttribute("msg");
						}
						%>

						<form action="add_user" method="post">
							<div class="form-group">
								<label for="name">Full Name</label> <input type="text"
									class="form-control" id="name" name="name"
									placeholder="Enter your full name" required>
							</div>

							<div class="form-group">
								<label for="qualification">Qualification</label> <input
									type="text" class="form-control" id="qualification"
									name="qualification" placeholder="Enter your qualification"
									required>
							</div>

							<div class="form-group">
								<label for="email">Email address</label> <input type="email"
									class="form-control" id="email" name="email"
									placeholder="Enter email" required>
							</div>

							<div class="form-group">
								<label for="password">Password</label> <input type="password"
									class="form-control" id="password" name="password"
									placeholder="Password" required>
							</div>

							<button type="submit" class="btn btn-success btn-block">Register</button>
						</form>

						<div class="dropdown-divider mt-3"></div>
						<a class="dropdown-item" href="Login.jsp">Already have an
							account? Login</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
