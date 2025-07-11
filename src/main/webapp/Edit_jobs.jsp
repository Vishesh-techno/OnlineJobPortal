<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.db.DBConnect"%>
<%@ page import="com.dao.JobDao"%>
<%@ page import="com.entity.jobs"%>
<%@ page import="java.sql.Connection"%>
<%-- <%@ page import="java.util.List"%> --%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Jobs</title>
<%@ include file="all_components/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="all_components/navbar.jsp"%>

	<div class="container p-2">
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fas fa-user-friends fa-3x"></i>
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						JobDao dao = new JobDao(DBConnect.getConn());
						jobs j = dao.getJobById(id);
						%>

						<h5>Edit Jobs</h5>
						<%-- <%
						String msg = (String) session.getAttribute("msg");
						if (msg != null) {
						%>
						<div class="alert alert-info text-center" role="alert">
							<%=msg%>
						</div>
						<%
						session.removeAttribute("msg");
						}
						%> --%>

					</div>

					<form action="update" method="post">
						<input type="hidden" name="id" value="<%=j.getId()%>">
						<div class="form-group">
							<label>Enter Title</label> <input type="text"
								class="form-control" name="title" placeholder="Title"
								value="<%=j.getTitle()%>" required>
						</div>

						<div class="form-row">
							<div class="form-group col-md-4">
								<label>Location</label> <select name="location"
									class="custom-select">
									<option value="<%=j.getLocation()%>">
										<%=j.getLocation()%></option>
									<option>Andhra Pradesh</option>
									<option>Arunachal Pradesh</option>
									<option>Assam</option>
									<option>Bihar</option>
									<option>Chhattisgarh</option>
									<option>Delhi</option>
									<option>Goa</option>
									<option>Gujarat</option>
									<option>Haryana</option>
									<option>Himachal Pradesh</option>
									<option>Jharkhand</option>
									<option>Karnataka</option>
									<option>Kerala</option>
									<option>Madhya Pradesh</option>
									<option>Maharashtra</option>
									<option>Manipur</option>
									<option>Meghalaya</option>
									<option>Mizoram</option>
									<option>Nagaland</option>
									<option>Odisha</option>
									<option>Punjab</option>
									<option>Puducherry</option>
									<option>Rajasthan</option>
									<option>Sikkim</option>
									<option>Tamil Nadu</option>
									<option>Telangana</option>
									<option>Tripura</option>
									<option>Uttar Pradesh</option>
									<option>Uttarakhand</option>
									<option>West Bengal</option>
								</select>
							</div>

							<div class="form-group col-md-4">
								<label>Category</label> <select name="category"
									class="custom-select">
									<option value="<%=j.getCategory()%>"><%=j.getCategory()%></option>
									<option value="IT">IT</option>
									<option value="Developer">Developer</option>
									<option value="Banking">Banking</option>
									<option value="Engineer">Engineer</option>
									<option value="Teacher">Teacher</option>
									<option value="Sales">Sales</option>
									<option value="Salesforce">Salesforce</option>
								</select>
							</div>

							<div class="form-group col-md-4">
								<label>Status</label> <select name="status" class="form-control">
									<option value="<%=j.getStatus()%>"><%=j.getStatus()%></option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label>Enter Description</label>
							<textarea required rows="6" name="desc" class="form-control"
								placeholder="Job description..."><%=j.getDescription()%></textarea>
						</div>

						<button class="btn btn-success">Update Job</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
