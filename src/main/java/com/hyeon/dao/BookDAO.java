package com.hyeon.dao;

import java.util.List;

import com.hyeon.dto.Book;

public interface BookDAO {
	int insertBook(Book book);
	int updateBook(Book book);
	Book selectBook(String email);
	List<Book> selectBookList();
}
