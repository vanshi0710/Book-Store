package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;

public class CartDAOImpl  implements CartDAO{
	public List<Cart> getBookByUser(int userId) {
		List<Cart> list = new ArrayList<Cart>();
		
		
		double totalPrice=0;
		try {
			String sql="select * from cart where uid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Cart c=new Cart();
				c.setCid(rs.getInt (1));
				c.setBid(rs.getInt (2));
				c.setUserId(rs.getInt (3));
				c.setBookName (rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getDouble (6));
				totalPrice=totalPrice+rs.getDouble(7);
				c.setTotalPrice(totalPrice);
				list.add(c);
			}
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean deleteBook(int cid) {
		boolean b = false;
		String sql = "delete from cart where cid=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, cid);
			
			int a = ps.executeUpdate();
			if(a==1) {
				b = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	private Connection conn;
	public CartDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addCart(Cart c) {
		boolean f =false;
		try {
			String sql = "insert into cart (bid, uid, bookName,author, price, total_price) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, c.getBid());
			ps.setInt(2,c.getUserId());
			ps.setString(3,c.getBookName());
			ps.setString(4,c.getAuthor());
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6,c.getTotalPrice());
			
			int a = ps.executeUpdate();
			if(a==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}