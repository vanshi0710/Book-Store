package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDaoImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;

@WebServlet("/editBook")
public class EditBooksServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bookName = req.getParameter("BookName");
		String author = req.getParameter("author");
		Double price = Double.parseDouble(req.getParameter("price"));
		String category = req.getParameter("category");
		String status = req.getParameter("bstatus");
		int bookId = Integer.parseInt(req.getParameter("bookId"));
		
		BookDetails b = new BookDetails();
		b.setBookName(bookName);
		b.setAuthor(author);
		b.setPrice(price);
		b.setBookCategory(category);
		b.setStatus(status);
		b.setBookId(bookId);

		BookDaoImpl dao = new BookDaoImpl(DBConnect.getConnect());

		Boolean f = dao.editBooks(b);

		HttpSession session = req.getSession();
		if (f) {
			System.out.println("eddited yeahhhhhhhhhhhhh");
			session.setAttribute("sucessMsg", "Book Edited SuccessFully");
			resp.sendRedirect("admin/allBooks.jsp");
		} else {
			System.out.println("nooooooooooooooonoooooooooonoooooooooooo");
			session.setAttribute("sucessMsg", "Something Went Wrong");
			resp.sendRedirect("admin/allBooks.jsp");
		}
		
	
		
	}

}
