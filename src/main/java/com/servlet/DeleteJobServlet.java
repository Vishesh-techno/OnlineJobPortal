package com.servlet;

import java.io.IOException;

import com.dao.JobDao;
import com.db.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class DeleteJobServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			JobDao dao = new JobDao(DBConnect.getConn());
			boolean f = dao.deleteJobs(id);
			
			HttpSession session = req.getSession();
			if (f) {
				session.setAttribute("msg", "jobs Delete Successfully....");
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
