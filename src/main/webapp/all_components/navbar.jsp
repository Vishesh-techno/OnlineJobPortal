<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.entity.User" %>
<%
    User user = (User) session.getAttribute("userobj");
    request.setAttribute("user", user); // make it available to all pages
%>


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse"
        data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false"
        aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>

            <% if (user != null) { %>
                <li class="nav-item">
                    <a class="nav-link" href="view_job.jsp"><i class="fas fa-eye mr-2"></i>View Jobs</a>
                </li>
            <% } %>

            <% if (user != null && "admin".equals(user.getRole())) { %>
                <li class="nav-item">
                    <a class="nav-link" href="add_job.jsp"><i class="fas fa-plus-circle mr-2"></i>Post Jobs</a>
                </li>
            <% } %>
        </ul>

        <form class="form-inline my-2 my-lg-0">
            <% if (user == null) { %>
                <a href="Login.jsp" class="btn btn-light mr-2"><i class="fas fa-sign-in-alt mr-2"></i>Login</a>
                <a href="SignUp.jsp" class="btn btn-light"><i class="fa-solid fa-user mr-2"></i>Sign-Up</a>
            <% } else {
                String role = user.getRole();
                String name = user.getName(); // Assuming getName() returns the user’s full name
        %>
            <% if ("admin".equals(role)) { %>
                <a href="admin.jsp" class="btn btn-light mr-2" style="background-color: red;">
                    Admin
                </a>
            <% } else { %>
                <a href="Home.jsp" class="btn btn-light mr-2" style="background-color: white;">
                    <%= name %>
                </a>
            <% } %>
            <a href="logout" class="btn btn-light">
                <i class="fas fa-sign-out-alt mr-2"></i>Logout
            </a>
        <%
            }
        %>
    </form>
    </div>
</nav>
