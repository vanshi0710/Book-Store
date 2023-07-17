package com.user.servlet;

import java.io.IOException;
import java.io.File;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.catalina.connector.Response;

import com.DAO.BookDaoImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;

@WebServlet("/addOldBook")
@MultipartConfig
public class AddOldBook extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String bookName = req.getParameter("BookName");
			String author = req.getParameter("author");
			Double price = Double.parseDouble(req.getParameter("price"));
			String category = req.getParameter("category");
			String type ="old";
			String status = "Active";
//			Part part = req.getPart("bimg");
//			String fileName = part.getSubmittedFileName();
			String fileName = req.getParameter("bimg");
			String user = req.getParameter("user");

			BookDetails b = new BookDetails(bookName, author, price, category, status, fileName, user);
			b.setType(type);

			BookDaoImpl dao = new BookDaoImpl(DBConnect.getConnect());

			Boolean f = dao.addBooks(b);

			HttpSession session = req.getSession();
			if (f) {
//				String path = getServletContext().getRealPath("") + "books";
//				File file = new File(path);
//				part.write(path + File.separator + fileName);
//				System.out.println(path);
				session.setAttribute("sucessMsg", "Book Added SuccessFully");
				resp.sendRedirect("sell_books.jsp");
			} else {

				session.setAttribute("failedMsg", "Something Went Wrong");
				resp.sendRedirect("sell_books.jsp");
			}
			System.out.print("\n" + b.toString() + "\n");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
