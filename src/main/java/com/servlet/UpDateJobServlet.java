package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import com.dao.*;
import com.db.DBConnect;
import com.entity.*;

@WebServlet("/update")
public class UpDateJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String title = req.getParameter("title");
			String description = req.getParameter("desc");
			String category = req.getParameter("category");
			String status = req.getParameter("status");
			String location = req.getParameter("location");

			jobs j = new jobs();
			j.setId(id);
			j.setTitle(title);
			j.setDescription(description);
			j.setCategory(category);
			j.setStatus(status);
			j.setLocation(location);

			HttpSession session = req.getSession();

			JobDao dao = new JobDao(DBConnect.getConn());
			boolean f = dao.updateJob(j);
			if (f) {
				session.setAttribute("msg", "jobs post Successfully....");
				resp.sendRedirect("view_job.jsp");

			} else {
				session.setAttribute("msg", "Error! Something Wrong...");
				resp.sendRedirect("view_job.jsp");

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
