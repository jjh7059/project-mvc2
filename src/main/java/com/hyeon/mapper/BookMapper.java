package com.hyeon.mapper;

import java.util.List;

import com.hyeon.dto.Book;

public interface BookMapper {
	int insertBook(Book book);
	int updateBook(Book book);
	Book selectBook(String email);
	List<Book> selectBookList();
}
