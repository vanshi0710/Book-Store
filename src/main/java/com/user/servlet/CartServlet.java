package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDaoImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet  extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bid = Integer.parseInt(req.getParameter("bid"));
			int uid = Integer.parseInt(req.getParameter("uid"));
			
			BookDaoImpl dao=new BookDaoImpl(DBConnect.getConnect());

			BookDetails b = dao.getBookById(bid);

			Cart c=new Cart();

			c.setBid(bid);

			c.setUserId(uid);

			c.setBookName(b.getBookName());

			c.setAuthor(b.getAuthor());

			c.setPrice(b.getPrice());

			c.setTotalPrice (b.getPrice());

			CartDAOImpl dao2=new CartDAOImpl(DBConnect.getConnect());

			boolean f = dao2.addCart(c);
			HttpSession session = req.getSession();

			if(f){
				
				session.setAttribute("addCart","Added to cart");
				resp.sendRedirect("checkOut.jsp");
			}else {
				
				session.setAttribute("failed","Error while adding to cart");
				resp.sendRedirect("index.jsp");
			}
			
		

			

			

			

			

			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
