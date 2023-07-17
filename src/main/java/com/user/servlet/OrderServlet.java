package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrderDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;
import com.entity.BookOrder;
import com.entity.Cart;
@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phno");
		String address = req.getParameter("address");
		String landmark = req.getParameter("landmark");
		String city  = req.getParameter("city");
		String state = req.getParameter("state");
		String pincode = req.getParameter("pincode");
		String paymentType = req.getParameter("paymentType");
		int id = Integer.parseInt(req.getParameter("id"));
		String fullAddress = address + ", " + city + ", " + state + "," + pincode + ", near " + landmark;
		HttpSession sess = req.getSession();
		
		CartDAOImpl dao = new CartDAOImpl(DBConnect.getConnect());
		
		List<Cart> b = dao.getBookByUser(id);
		
		if(b.isEmpty()) {
			
			sess.setAttribute( "failedMsg","Please add items to cart");
			resp.sendRedirect("order_success.jsp");
			
		}else {
			BookOrderDAOImpl dao2= new BookOrderDAOImpl(DBConnect.getConnect());
			ArrayList<BookOrder> order_list = new ArrayList<BookOrder>();
			for(Cart c: b) {
				int i = 0;
				Random r = new Random();
				int a1 = r.nextInt(10);
				int b1 = r.nextInt(10);
				int c1 = r.nextInt(10);
				i = 100 * a1 + 10 * b1 + c1;
				BookOrder o = new BookOrder();
				o.setOrder_id("Order_No._"+id+i);
				o.setAuthor(c.getAuthor());
				o.setBook_name(c.getBookName());
				o.setUserName(name);
				o.setAddress(fullAddress);
				o.setEmail(email);
				o.setId(id);
				o.setPaymentType(paymentType);
				o.setPrice(c.getPrice());
				o.setPhone(phone);
				
				order_list.add(o);
			}
			boolean a =dao2.save_order(order_list);
			if(a) {
				resp.sendRedirect("order_success.jsp");
			}
			else {
				sess.setAttribute( "failedMsg","Order Failed");
				resp.sendRedirect("order_success.jsp");
			}
		}
		
		
		

	}
	
}
