package com.servlet;

import java.io.IOException;

import com.DB.DBConnect;
import com.dao.JobDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/delete")
public class DeleteJobServlet extends HttpServlet

{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			JobDao dao = new JobDao(DBConnect.getConn());
			boolean f = dao.deleteJobs(id);
			HttpSession session = req.getSession();
			if(f) {
				
				session.setAttribute("succMsg", "Job Deleted Successfully...");
				resp.sendRedirect("view_jobs.jsp");
				
				
			}else{
				session.setAttribute("succMsg", "Something Went Wrong!!!");
				resp.sendRedirect("view_jobs.jsp");
				
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
	
}
