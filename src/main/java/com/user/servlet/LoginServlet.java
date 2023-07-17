package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			 UserDAOImpl dao= new UserDAOImpl(DBConnect.getConnect());
			 HttpSession session = req.getSession();
			
			try {
				String  email = req.getParameter("email");
				String password = req.getParameter("password");
				
				if(email.equalsIgnoreCase("admin@gmail.com") && password.equals("admin@123")) {
					User us = new User();
					us.setName("Admin");
					session.setAttribute("userobj", us);
					resp.sendRedirect("admin/home.jsp");
				}
				else {
					User us = dao.userLogin(email, password);
					if(us != null) {
						session.setAttribute("userobj", us);
						resp.sendRedirect("index.jsp");
					}else {
						
						session.setAttribute("failedMsg", "Email or password error");
						resp.sendRedirect("login.jsp");
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	
}
