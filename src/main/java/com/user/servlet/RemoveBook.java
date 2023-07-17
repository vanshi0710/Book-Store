package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

@WebServlet("/remove_book")
public class RemoveBook extends HttpServlet  {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int cid = Integer.parseInt(req.getParameter("cid"));
		CartDAOImpl dao = new CartDAOImpl(DBConnect.getConnect());
		boolean b = dao.deleteBook(cid);
		
		
		HttpSession session = req.getSession();
		if (b) {
			session.setAttribute("successMsg", "Book Deleted SuccessFully");
			resp.sendRedirect("checkOut.jsp");
		} else {
			session.setAttribute("failMsg", "Something Went Wrong");
			resp.sendRedirect("checkOut.jsp");
	}

}
}