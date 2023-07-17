package com.entity;

public class BookDetails {
	public BookDetails() {
		super();
		
	}
	private int BookId;
	private String BookName;
	private String author;
	private Double price;
	private String BookCategory;
	private String status;
	private String photoName;
	private String email;
	private String type;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public BookDetails( String bookName, String author, Double price, String bookCategory, String status,
			String photoName, String email) {
		super();
		BookName = bookName;
		this.author = author;
		this.price = price;
		BookCategory = bookCategory;
		this.status = status;
		this.photoName = photoName;
		this.email = email;
	}
	@Override
	public String toString() {
		return "BookDetails [BookId=" + BookId + ", BookName=" + BookName + ", author=" + author + ", price=" + price
				+ ", BookCategory=" + BookCategory + ", status=" + status + ", photoName=" + photoName + ", email="
				+ email + "]";
	}
	public int getBookId() {
		return BookId;
	}
	public void setBookId(int bookId) {
		BookId = bookId;
	}
	public String getBookName() {
		return BookName;
	}
	public void setBookName(String bookName) {
		BookName = bookName;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getBookCategory() {
		return BookCategory;
	}
	public void setBookCategory(String bookCategory) {
		BookCategory = bookCategory;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	

}
