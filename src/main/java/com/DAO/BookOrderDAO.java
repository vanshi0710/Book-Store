package com.DAO;

import java.util.List;

import com.entity.BookOrder;

public interface BookOrderDAO {
	public boolean save_order(List<BookOrder> bList) ;
	public List<BookOrder> getOrderDetails(String email);
	public List<BookOrder> getAllOrderDetails();

}
