package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnect;
import com.entity.BookDetails;

public class BookDaoImpl implements BooksDao {

	public List<BookDetails> getSearchBook(String ch) {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails book = null;

		try {
			Connection con = DBConnect.getConnect();
			String sql ="select * from book_details where status = ? and bookname like ? or author like ? or category like ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "active");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "%"+ch+"%");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				book = new BookDetails();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getDouble(4));
				book.setBookCategory(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhotoName(rs.getString(7));
				book.setEmail(rs.getString(8));
				list.add(book);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDetails> getBookByOld(String email) {
		List<BookDetails> list = new ArrayList<BookDetails>();

		BookDetails b = null;
		try {
			String sql = "Select * from book_details where userEmail=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDetails(rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5), rs.getString(6),
						rs.getString(7), rs.getString(8));
				b.setBookId(rs.getInt(1));
				list.add(b);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean editBooks(BookDetails b) {
		boolean f = false;
		try {
			String sql = "Update book_details set bookname=? , author=?, price=? , category=? , status=? where BookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setDouble(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setInt(6, b.getBookId());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean deleteBook(int id) {
		boolean b = false;
		try {
			String sql = "Delete from book_details where BookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int a = ps.executeUpdate();
			if (a == 1) {
				b = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	public List<BookDetails> getAllBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		try {
			String sql = "Select * from book_details";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDetails(rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5), rs.getString(6),
						rs.getString(7), rs.getString(8));
				b.setBookId(rs.getInt(1));
				list.add(b);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public BookDetails getBookById(int id) {
		BookDetails b = null;
		try {
			String sql = "Select * from book_details where bookId = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				b = new BookDetails(rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getString(5), rs.getString(6),
						rs.getString(7), rs.getString(8));

				b.setType(rs.getString(9));
				b.setBookId(id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	private Connection conn;

	public boolean addBooks(BookDetails b) {
		boolean f = false;
		try {
			String sql = "insert into book_details(bookname, author  ,price  ,category ,status,photo ,userEmail,type) values(?,?,?,?,?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setDouble(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhotoName());
			ps.setString(7, b.getEmail());

			ps.setString(8, b.getType());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}

	public BookDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public List<BookDetails> getNewBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails book = null;

		try {
			Connection con = DBConnect.getConnect();
			PreparedStatement ps = con.prepareStatement(
					"select * from book_details where type=? order by bookId DESC");
			ps.setString(1, "new");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				book = new BookDetails();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getDouble(4));
				book.setBookCategory(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhotoName(rs.getString(7));
				book.setEmail(rs.getString(8));

				book.setType(rs.getString(9));
				list.add(book);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDetails> getRecentBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails book = null;

		try {
			Connection con = DBConnect.getConnect();
			PreparedStatement ps = con
					.prepareStatement("select * from book_details order by bookId DESC");
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				book = new BookDetails();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getDouble(4));
				book.setBookCategory(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhotoName(rs.getString(7));
				book.setEmail(rs.getString(8));

				book.setType(rs.getString(9));
				list.add(book);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<BookDetails> getOldBook() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails book = null;

		try {
			Connection con = DBConnect.getConnect();
			PreparedStatement ps = con.prepareStatement(
					"select * from book_details where type=? order by bookId DESC");
			ps.setString(1, "old");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				book = new BookDetails();
				book.setType(rs.getString(9));
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getDouble(4));
				book.setBookCategory(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhotoName(rs.getString(7));
				book.setEmail(rs.getString(8));
				list.add(book);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
