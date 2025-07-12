<%@page import="com.dao.JobDao"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.entity.jobs"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Job Profile</title>
<%@include file="all_components/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="all_components/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<%
				try {
					int id = Integer.parseInt(request.getParameter("id"));
					JobDao dao = new JobDao(DBConnect.getConn());
					jobs j = dao.getJobById(id);

					if (j != null) {
				%>

				<div class="card mt-4 shadow">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>

						<h4 class="text-center text-dark"><%=j.getTitle()%></h4>
						<hr>
						<p><%=j.getDescription()%></p>

						<div class="form-row mt-3">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm" value="Location: <%=j.getLocation()%>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm" value="Category: <%=j.getCategory()%>" readonly>
							</div>
						</div>

						<h6>Publish Date: <%=j.getPdate().toString()%></h6>
					</div>
				</div>

				<%
					} else {
				%>
					<div class="alert alert-danger text-center mt-4">Job not found or may have been removed.</div>
				<%
					}
				} catch (Exception e) {
				%>
					<div class="alert alert-danger text-center mt-4">Invalid job ID.</div>
				<%
				}
				%>
			</div>
		</div>
	</div>
</body>
</html>
