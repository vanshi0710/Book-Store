package com.DAO;

import java.util.List;

import com.entity.BookDetails;

public interface BooksDao {
	public boolean addBooks(BookDetails b);
	public  List<BookDetails> getAllBooks();
	public BookDetails getBookById(int id);
	public boolean editBooks(BookDetails b);
	public boolean deleteBook(int id);
	public List<BookDetails> getNewBook();
	public List<BookDetails> getRecentBook();
	public List<BookDetails> getOldBook();
	public List<BookDetails> getBookByOld(String email);
	public List<BookDetails> getSearchBook(String ch);
}
