<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.JobDao"%>
<%@page import="com.entity.jobs"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User: View Jobs</title>
    <%@include file="all_components/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
<% User u = (User) session.getAttribute("userobj");
if (u == null) {
        response.sendRedirect("Login.jsp");
        return;
    }%>
    <%@ include file="all_components/navbar.jsp"%>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h5 class="text-center text-primary">All Jobs</h5>

                <%
                    String location = request.getParameter("location");
                    String category = request.getParameter("category");
                    String msg = "";

                    JobDao dao = new JobDao(DBConnect.getConn());
                    List<jobs> list = null;

                    if ((location == null || "lo".equals(location)) && (category == null || "ca".equals(category))) {
                        list = new ArrayList<jobs>();
                    } else if ((location == null || "lo".equals(location)) || (category == null || "ca".equals(category))) {
                        list = dao.getJobsORLocationnAndCategory(location, category);
                    } else {
                        list = dao.getJobsANDLocationnAndCategory(location, category);
                    }


                    if (list != null && !list.isEmpty()) {
                        for (jobs j : list) {
                %>
                <div class="card mt-2">
                    <div class="card-body">
                        <div class="text-center text-primary">
                            <i class="far fa-clipboard fa-2x" aria-hidden="true"></i>
                        </div>

                        <h6><%= j.getTitle() %></h6>
                        <p><%= j.getDescription() %></p>

                        <div class="form-row">
                            <div class="form-group col-md-3">
                                <input type="text" class="form-control form-control-sm"
                                       value="Location: <%= j.getLocation() %>" readonly>
                            </div>
                            <div class="form-group col-md-3">
                                <input type="text" class="form-control form-control-sm"
                                       value="Category: <%= j.getCategory() %>" readonly>
                            </div>
                        </div>

                        <h6>Publish Date: <%= j.getPdate().toString() %></h6>

                        <div class="text-center">
                            <a href="one_view.jsp?id=<%= j.getId() %>" class="btn btn-sm bg-danger text-white">View More</a>
                        </div>
                    </div>
                </div>
                <%
                        }
                    } else {
                %>
                <h4 class="text-center text-danger">Job Not Available</h4>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</body>
</html>
