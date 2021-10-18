package com.hyeon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyeon.dao.BookDAO;
import com.hyeon.dto.Book;

@Service
public class BookServiceImpl implements BookService {
	@Autowired
	private BookDAO bookDAO;

	@Override
	public void addBooking(Book book) {
		bookDAO.insertBook(book);
	}

	@Override
	public void modifyBooking(Book book) {
		bookDAO.updateBook(book);
	}
	
	@Override
	public Book getBooking(String email) {
		return bookDAO.selectBook(email);
	}
	
	@Override
	public List<Book> getBookingList() {
		return bookDAO.selectBookList();
	}
}
