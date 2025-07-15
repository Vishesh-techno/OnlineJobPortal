<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
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
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<h5>Login Page</h5>
							
							<%
						String msg = (String) session.getAttribute("msg");
						if (msg != null) {
						%>
						<div class="alert alert-info text-center text-danger" role="alert">
							<%=msg%>
						</div>
						<%
						session.removeAttribute("msg");
						}
						%>
						</div>

						<form action="login" method="post">
							<div class="form-group">
								<label for="email">Enter Email address</label> <input
									type="email" class="form-control" id="email" name="email"
									placeholder="Email" required>
							</div>

							<div class="form-group">
								<label for="password">Enter Password</label> <input
									type="password" class="form-control" id="password"
									name="password" placeholder="Password" required>
							</div>

							<button type="submit" class="btn btn-primary btn-block">Login</button>
						</form>

						<div class="dropdown-divider mt-3"></div>
						<a class="dropdown-item" href="SignUp.jsp">New around here?
							Sign up</a> <a class="dropdown-item" href="#">Forgot password?</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
