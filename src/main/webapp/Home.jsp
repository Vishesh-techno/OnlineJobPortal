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
<title>Home User</title>
<%@include file="all_components/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@ include file="all_components/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="text-center text-primary">All Jobs</h5>

				<%
				String msg = (String) session.getAttribute("msg");
				if (msg != null) {
				%>
				<div class="alert alert-info text-center" role="alert"><%=msg%></div>
				<%
				session.removeAttribute("msg");
				}
				%>

				<div class="card">
					<div class="card-body">
						<form class="form-inline" action="more_view.jsp" method="get">
							<div class="form-group col-md-5 mt-1">
								<h5>Location</h5>
							</div>

							<div class="form-group col-md-5 mt-1">
								<h5>Category</h5>
							</div>

							<div class="form-group col-md-5">
								<select name="location"
									class="custom-select">
									<option selected>Choose...</option>
									<option value="Andhra Pradesh">Andhra Pradesh</option>
									<option value="Arunachal Pradesh">Arunachal Pradesh</option>
									<option value="Assam">Assam</option>
									<option value="Bihar">Bihar</option>
									<option value="Chhattisgarh">Chhattisgarh</option>
									<option value="Delhi">Delhi</option>
									<option value="Goa">Goa</option>
									<option value="Gujarat">Gujarat</option>
									<option value="Haryana">Haryana</option>
									<option value="Himachal Pradesh">Himachal Pradesh</option>
									<option value="Jharkhand">Jharkhand</option>
									<option value="Karnataka">Karnataka</option>
									<option value="Kerala">Kerala</option>
									<option value="Madhya Pradesh">Madhya Pradesh</option>
									<option value="Maharashtra">Maharashtra</option>
									<option value="Manipur">Manipur</option>
									<option value="Meghalaya">Meghalaya</option>
									<option value="Mizoram">Mizoram</option>
									<option value="Nagaland">Nagaland</option>
									<option value="Odisha">Odisha</option>
									<option value="Punjab">Punjab</option>
									<option value="Puducherry">Puducherry</option>
									<option value="Rajasthan">Rajasthan</option>
									<option value="Sikkim">Sikkim</option>
									<option value="Tamil Nadu">Tamil Nadu</option>
									<option value="Telangana">Telangana</option>
									<option value="Tripura">Tripura</option>
									<option value="Uttar Pradesh">Uttar Pradesh</option>
									<option value="Uttarakhand">Uttarakhand</option>
									<option value="West Bengal">West Bengal</option>
								</select>
							</div>

							<div class="form-group col-md-5">
								<select name="category"
									class="custom-select">
									<option selected>Choose...</option>
									<option value="IT">IT</option>
									<option value="Developer">Developer</option>
									<option value="Banking">Banking</option>
									<option value="Engineer">Engineer</option>
									<option value="Teacher">Teacher</option>
									<option value="Sales">Sales</option>
									<option value="Salesforce">Salesforce</option>
								</select>
							</div>
							<div>
								<button class="btn btn-success">Submit</button>
							</div>
						</form>
					</div>
				</div>

				<%
				JobDao dao = new JobDao(DBConnect.getConn());
				List<jobs> list = dao.getAllJobsForUser();
				for (jobs j : list) {
				%>
				<div class="card mt-2">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x" aria-hidden="true"></i>
						</div>

						<h6><%=j.getTitle()%></h6>
						<%
						String desc = j.getDescription();
						if (desc != null && desc.length() < 120) {
						%>
						<p><%=desc%></p>
						<%
						} else if (desc != null) {
						%>
						<p><%=desc.substring(0, 120)%>...
						</p>
						<%
						}
						%>

						<div class="form-row">
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Location: <%=j.getLocation()%>" readonly>
							</div>
							<div class="form-group col-md-3">
								<input type="text" class="form-control form-control-sm"
									value="Category: <%=j.getCategory()%>" readonly>
							</div>
						</div>

						<h6>
							Publish Date:
							<%=j.getPdate().toString()%></h6>

						<div class="text-center">
							<a href="one_view.jsp?id=<%=j.getId()%>"
								class="btn btn-sm bg-danger text-white">View More</a>
						</div>
					</div>
				</div>
				<%
				}
				%>

			</div>
			<!-- End col-md-12 -->
		</div>
		<!-- End row -->
	</div>
	<!-- End container -->

</body>
</html>
