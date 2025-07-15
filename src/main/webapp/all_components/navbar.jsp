<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="com.entity.User"%>
<%
User user = (User) session.getAttribute("userobj");
request.setAttribute("user", user); // make it available to all pages
%>


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#">Job Portal</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>

			<%
			if (user != null) {
			%>
			<li class="nav-item"><a class="nav-link" href="view_job.jsp"><i
					class="fas fa-eye mr-2"></i>View Jobs</a></li>
			<%
			}
			%>

			<%
			if (user != null && "admin".equals(user.getRole())) {
			%>
			<li class="nav-item"><a class="nav-link" href="add_job.jsp"><i
					class="fas fa-plus-circle mr-2"></i>Post Jobs</a></li>
			<%
			}
			%>
		</ul>

		<form class="form-inline my-2 my-lg-0">
			<%
			if (user == null) {
			%>
			<a href="Login.jsp" class="btn btn-light mr-2"><i
				class="fas fa-sign-in-alt mr-2"></i>Login</a> <a href="SignUp.jsp"
				class="btn btn-light"><i class="fa-solid fa-user mr-2"></i>Sign-Up</a>
			<%
			} else {
			String role = user.getRole();
			String name = user.getName();
			%>
			<%
			if ("admin".equals(role)) {
			%>
			<a href="admin.jsp" class="btn btn-light mr-2"
				style="background-color: white;"> Admin </a>
			<%
			} else {
			%>
			<a href="#" class="btn btn-light mr-2"
				style="background-color: white;" data-toggle="modal" data-target="#exampleModal"> <%=name%>
			</a>
			<%
			}
			%>
			<a href="logout" class="btn btn-light"> <i
				class="fas fa-sign-out-alt mr-2"></i>Logout
			</a>
			<%
			}
			%>
		</form>
	</div>
</nav>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Profile</h5>
				<button type="button" class="close" data-bs-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="card">
					<div class="card-body">
						<div class="text-center mb-3">
							<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
						</div>
						<table class="table">
							<tbody>
								<tr>
									<th scope="row">Name</th>
									<th>${user.name}</th>
								</tr>
								<tr>
									<th scope="row">Qualification</th>
									<th>${user.qualification}</th>
								</tr>
								<tr>
									<th scope="row">Email</th>
									<th>${user.email}</th>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<a href="edit_profile.jsp" class="btn btn-primary">Edit</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>