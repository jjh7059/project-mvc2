package com.hyeon.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyeon.dto.Book;
import com.hyeon.mapper.BookMapper;

@Repository
public class BookDAOImpl implements BookDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertBook(Book book) {
		return sqlSession.getMapper(BookMapper.class).insertBook(book);
	}

	@Override
	public int updateBook(Book book) {
		return sqlSession.getMapper(BookMapper.class).updateBook(book);
	}

	@Override
	public Book selectBook(String email) {
		return sqlSession.getMapper(BookMapper.class).selectBook(email);
	}

	@Override
	public List<Book> selectBookList() {
		return sqlSession.getMapper(BookMapper.class).selectBookList();
	}
}
