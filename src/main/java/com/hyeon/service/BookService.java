package com.hyeon.service;

import java.util.List;

import com.hyeon.dto.Book;

public interface BookService {
	void addBooking(Book book);
	void modifyBooking(Book book);
	Book getBooking(String email);
	List<Book> getBookingList();
}
