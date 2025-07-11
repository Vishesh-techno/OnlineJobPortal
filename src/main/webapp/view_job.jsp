<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.db.DBConnect"%>
<%@ page import="com.dao.JobDao"%>
<%@ page import="com.entity.jobs"%>
<%@ page import="com.entity.User"%>
<%@ page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: View Jobs</title>
<%@include file="all_components/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="all_components/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary">All Jobs</h5>

				<%-- Show session message if available --%>
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

				<%-- Load all jobs from database --%>
				<%
				JobDao dao = new JobDao(DBConnect.getConn());
				List<jobs> list = dao.getAllJobs();
				for (jobs j : list) {
				%>

				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x" aria-hidden="true"></i>
						</div>

						<h6><%=j.getTitle()%></h6>
						<p><%=j.getDescription()%></p>

						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location: <%=j.getLocation()%>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Category: <%=j.getCategory()%>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Status: <%=j.getStatus()%>" readonly>
							</div>
						</div>

						<h6>
							Publish Date:
							<%=j.getPdate()%></h6>

						<div class="text-center">
							<%
							if (request.getAttribute("user") != null && "admin".equals(((User) request.getAttribute("user")).getRole())) {
							%>

							<!-- Show admin-only buttons -->
							<a href="Edit_jobs.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-success text-white">Edit</a> <a
								href="delete?id=<%=j.getId()%>"
								class="btn btn-sm bg-danger text-white">Delete</a>

							<%
							}
							%>

						</div>
					</div>
				</div>

				<%
				}
				%>
			</div>
		</div>
	</div>
</body>
</html>
