package com.admin.servlet;

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

@WebServlet("/addBook")
@MultipartConfig
public class BookAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String bookName = req.getParameter("BookName");
			String author = req.getParameter("author");
			Double price = Double.parseDouble(req.getParameter("price"));
			String category = req.getParameter("category");
			String status = req.getParameter("bstatus");
//			Part part = req.getPart("bimg");
//			String fileName = part.getSubmittedFileName();\
			String fileName =req.getParameter("bimg");
			String type = req.getParameter("type");

			BookDetails b = new BookDetails(bookName, author, price, category, status, fileName, "admin");
			b.setType(type);
			BookDaoImpl dao = new BookDaoImpl(DBConnect.getConnect());

			Boolean f = dao.addBooks(b);

			HttpSession session = req.getSession();
			if (f) {
//				String path = getServletContext().getRealPath("") + "books";?
//				File file = new File(path);?
//				part.write(path + File.separator + fileName);?
//				System.out.println(path);?
				session.setAttribute("sucessMsg", "Book Added SuccessFully");
				resp.sendRedirect("admin/addBook.jsp");
			} else {

				session.setAttribute("sucessMsg", "Something Went Wrong");
				resp.sendRedirect("admin/addBook.jsp");
			}
			System.out.print("\n" + b.toString() + "\n");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
