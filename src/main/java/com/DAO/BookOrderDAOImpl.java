package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookOrder;

public class BookOrderDAOImpl implements BookOrderDAO {

	private Connection conn;


	public boolean save_order(List<BookOrder> bList) {
		boolean f = false;
		try {
			String sql = "insert into book_order(order_id, userName, email, address, phone, book_name, author, price, paymentType) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			for (BookOrder b : bList) {
				ps.setString(1, b.getOrder_id());
				ps.setString(2, b.getUserName());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getAddress());
				ps.setString(5, b.getPhone());
				ps.setString(6, b.getBook_name());
				ps.setString(7, b.getAuthor());
				ps.setDouble(8, b.getPrice());
				ps.setString(9, b.getPaymentType());
				ps.addBatch();
				
			}
			int[] count = ps.executeBatch();

			conn.setAutoCommit(false);
			conn.commit();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	

	public List<BookOrder> getOrderDetails(String email){
		BookOrder o ;
		List<BookOrder> list = new ArrayList<BookOrder>();
		String sql = "Select * from book_order where email =?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				o = new BookOrder();
				o.setId(rs.getInt(1));
				o.setOrder_id(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setAddress(rs.getString(5));
				o.setPhone(rs.getString(6));
				o.setBook_name(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getDouble(9));
				o.setPaymentType(rs.getString(10));
				list.add(o);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}

	public BookOrderDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	

	public List<BookOrder> getAllOrderDetails(){
		BookOrder o ;
		List<BookOrder> list = new ArrayList<BookOrder>();
		String sql = "Select * from book_order";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				o = new BookOrder();
				o.setId(rs.getInt(1));
				o.setOrder_id(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setAddress(rs.getString(5));
				o.setPhone(rs.getString(6));
				o.setBook_name(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getDouble(9));
				o.setPaymentType(rs.getString(10));
				list.add(o);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}


}
