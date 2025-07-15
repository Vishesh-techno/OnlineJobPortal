<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@include file="all_components/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%
	User u = (User) session.getAttribute("userobj");
	if (u == null) {
		response.sendRedirect("Login.jsp");
		return;
	}
	request.setAttribute("userobj", u);
	%>
	<%@include file="all_components/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center mb-3">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<h5>Edit Profile</h5>

							<%
							String msg = (String) session.getAttribute("msg");
							if (msg != null) {
							%>
							<div class="alert alert-info text-center text-danger"
								role="alert">
								<%=msg%>
							</div>
							<%
							session.removeAttribute("msg");
							}
							%>
						</div>

						<form action="update_profile" method="post">
							<input type="hidden" value="${userobj.id }" name="id">

							<div class="form-group">
								<label>Enter Full Name</label> <input type="text"
									class="form-control" id="exampleInputEmail" name="name"
									value="${userobj.name }" aria-describedby="emailHelp"
									required="required">
							</div>

							<div class="form-group">
								<label>Enter Qualification</label> <input type="text"
									class="form-control" id="exampleInputEmail"
									name="qualification" value="${userobj.qualification }"
									aria-describedby="emailHelp" required="required">
							</div>

							<div class="form-group">
								<label>Enter Email</label> <input type="text"
									class="form-control" id="exampleInputEmail1" name="email"
									value="${userobj.email }" aria-describedby="emailHelp"
									required="required">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Enter Password</label> <input
									type="text" class="form-control" id="exampleInputPassword1"
									name="password" value="${userobj.password }"
									required="required">
							</div>

							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 50px">
		<%@include file="all_components/footer.jsp"%>
	</div>
</body>
</html>
