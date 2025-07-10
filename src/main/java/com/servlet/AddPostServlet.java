package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import com.dao.*;
import com.db.*;
import com.entity.*;

@WebServlet("/addjob")
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String title = req.getParameter("title");
			String description = req.getParameter("desc");
			String category = req.getParameter("Category");
			String status = req.getParameter("status");
			String location = req.getParameter("location");
			
			jobs j= new jobs();
			j.setTitle(title);
			j.setDescription(description);
			j.setCategory(category);
			j.setStatus(status);
			j.setLocation(location);
			
			HttpSession session = req.getSession();
			
			JobDao dao = new JobDao(DBConnect.getConn());
			boolean f = dao.addJobs(j);
			if(f) {
				session.setAttribute("msg", "jobs post Successfully....");
				resp.sendRedirect("add_job.jsp");
				
			}else {
				session.setAttribute("msg", "Error! Something Wrong...");
				resp.sendRedirect("add_job.jsp");
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
