package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
@WebServlet("/update_profile")
public class UpdateProfile  extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			int uid= Integer.parseInt(req.getParameter("uid"));
//			System.out.println(name +" " +email+" "+password+" "+ phno);
			
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPassword(password);
			us.setPhno(phno);
			us.setId(uid);
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConnect());
			boolean f = dao.updateProfile(us);
			
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("sucessMsg", "Profile updated successfully");
				us = dao.userLogin(email, password);
				session.setAttribute("userobj", us);
				resp.sendRedirect("edit_profile.jsp");
			}else {
				session.setAttribute("failMsg", "Something Wrong With Server");
				resp.sendRedirect("edit_profile.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
