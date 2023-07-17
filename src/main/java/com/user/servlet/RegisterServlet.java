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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
//			System.out.println(name +" " +email+" "+password+" "+phno);
			
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPassword(password);
			us.setPhno(phno);
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConnect());
			
			HttpSession session = req.getSession();
			
			boolean f2 = dao.checkUser(email);
			if(f2) {
				boolean f = dao.userRegister(us);
				if(f) {
					session.setAttribute("sucessMsg", "Registration sucess");
					resp.sendRedirect("register.jsp");
				}
				else {
					session.setAttribute("failMsg", "Something Wrong With Server");
					resp.sendRedirect("register.jsp");
				}
				
			}else {
				session.setAttribute("failMsg", "User Already Exists, Please Login to Explore");
				resp.sendRedirect("register.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
