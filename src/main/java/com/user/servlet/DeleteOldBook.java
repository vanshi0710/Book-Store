package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDaoImpl;
import com.DB.DBConnect;

@WebServlet("/delete_old")
public class DeleteOldBook extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		BookDaoImpl dao = new BookDaoImpl(DBConnect.getConnect());

		Boolean f = dao.deleteBook(id);

		HttpSession session = req.getSession();
		if (f) {
			session.setAttribute("sucessMsg", "Book Deleted SuccessFully");
			resp.sendRedirect("old_book.jsp");
		} else {
			session.setAttribute("failedMsg", "Something Went Wrong");
			resp.sendRedirect("old_book.jsp");
		}
	}
}
